class StoresController < InheritedResources::Base
  protect_from_forgery :except => [:edit]
  def index
    @stores=Store.all
    render
  end
  def show
    @store=params[:id].nil? ? current_user.store : Store.find(params[:id])
    @products=@store.products
    @container='hide'
    render
  end
  def edit
    @store=params[:id].nil? ? current_user.store : Store.find(params[:id])
    @modal=OpenStruct.new({:title=>'Edit'})
    render
  end

  def update
    @store=Store.find(params[:id])
    @store.update_attributes!(store_params)
    redirect_to stores_path
  end

  private
  def store_params
    params.require(:store).permit(:name, :description,:url)
  end
end
