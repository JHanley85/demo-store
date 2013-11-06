class ProductsController < InheritedResources::Base
  respond_to :js,:html,:json
  protect_from_forgery :except => [:edit,:new]

  include ActionView::Helpers::TextHelper

  def show
    @product=Product.find(params[:id])
    render
  end
  def edit
    @product=Product.find(params[:id])
    @modal=OpenStruct.new({:title=>"Edit"})

  end

  def new
    @product=Product.new
    @modal=OpenStruct.new({:title=>"New Product"})

    render 'edit', :format=>:js
  end

  def update
    @product=Product.find(params[:id])
    @product.update_attributes!(product_params)
    redirect_to :back
  end
  def index
    redirect_to store_index_path
  end


  private
  def product_params
    params.require(:product).permit(:title, :description,:price,:count,:image)
  end
end
