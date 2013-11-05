class ProductsController < InheritedResources::Base
  respond_to :js,:html,:json
  include ActionView::Helpers::TextHelper
  def show
    @product=Product.find(params[:id])
    render
  end
  def edit
    @product=Product.find(params[:id])
    @modal=OpenStruct.new({:title=>"Edit"})

    render
  end

  def new
    @product=Product.new
    @modal=OpenStruct.new({:title=>"New Product"})
    render 'edit'
  end

  def update
    @product=Product.find(params[:id])
    @product.update_attributes(params[:product])
    if @product.save?
      render :html=>products_path, :notice=>"Item successfully updated"
    else
      render :html=>products_path, :error=>"Error!"
    end
  end
  def index
    redirect_to store_index_path
  end
end
