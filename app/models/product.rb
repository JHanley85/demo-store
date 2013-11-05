class Product < ActiveRecord::Base
  belongs_to :store

  def user
    self.store.user
  end
end
