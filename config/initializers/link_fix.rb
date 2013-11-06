module ActionView
  module Helpers #:nodoc:
    module UrlHelper
      BUTTON_TAG_METHOD_VERBS = %w{patch put delete}
      def link_to(name = nil, options = nil, html_options = nil, &block)
        html_options, options, name = options, name, block if block_given?
        options ||= {}

        html_options = convert_options_to_data_attributes(options, html_options)

        url = url_for(options)
        html_options['href'] ||= url

        content_tag(:a, name || url, html_options, &block)
      end
      def url_for(options = nil) # :nodoc:
        case options
          when String
            root_url+options
          when :back
            _back_url
          else
            raise ArgumentError, "arguments passed to url_for can't be handled. Please require " +
                "routes or provide your own implementation"
        end
      end
      def button_to(name = nil, options = nil, html_options = nil, &block)
        html_options, options = options, name if block_given?
        options      ||= {}
        html_options ||= {}

        html_options = html_options.stringify_keys
        convert_boolean_attributes!(html_options, %w(disabled))

        url    = options.is_a?(String) ? root_url+options : root_url+url_for(options)
        remote = html_options.delete('remote')
        params = html_options.delete('params')

        method     = html_options.delete('method').to_s
        method_tag = BUTTON_TAG_METHOD_VERBS.include?(method) ? method_tag(method) : ''.html_safe

        form_method  = method == 'get' ? 'get' : 'post'
        form_options = html_options.delete('form') || {}
        form_options[:class] ||= html_options.delete('form_class') || 'button_to'
        form_options.merge!(method: form_method, action: url)
        form_options.merge!("data-remote" => "true") if remote

        request_token_tag = form_method == 'post' ? token_tag : ''

        html_options = convert_options_to_data_attributes(options, html_options)
        html_options['type'] = 'submit'

        button = if block_given?
                   content_tag('button', html_options, &block)
                 else
                   html_options['value'] = name || url
                   tag('input', html_options)
                 end

        inner_tags = method_tag.safe_concat(button).safe_concat(request_token_tag)
        if params
          params.each do |param_name, value|
            inner_tags.safe_concat tag(:input, type: "hidden", name: param_name, value: value.to_param)
          end
        end
        content_tag('form', content_tag('div', inner_tags), form_options)
      end
    end
    module FormHelper





      def form_for(record, options = {}, &block)
        raise ArgumentError, "Missing block" unless block_given?
        html_options = options[:html] ||= {}

        case record
          when String, Symbol
            object_name = record
            object      = nil
          else
            object      = record.is_a?(Array) ? record.last : record
            raise ArgumentError, "First argument in form cannot contain nil or be empty" unless object
            object_name = options[:as] || model_name_from_record_or_class(object).param_key
            apply_form_for_options!(record, object, options)
        end

        html_options[:data]   = options.delete(:data)   if options.has_key?(:data)
        html_options[:remote] = options.delete(:remote) if options.has_key?(:remote)
        html_options[:method] = options.delete(:method) if options.has_key?(:method)
        html_options[:authenticity_token] = options.delete(:authenticity_token)

        builder = instantiate_builder(object_name, object, options)
        output  = capture(builder, &block)
        html_options[:multipart] ||= builder.multipart?

        form_tag(root_url+options[:url] || {}, html_options) { output }
      end


    end
  end
end