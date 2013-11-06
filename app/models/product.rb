class Product < ActiveRecord::Base
  belongs_to :store
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "135x135>" }, :default_url => "/assets/:style/missing.png"
  def user
    self.store.user
  end
end
