class Menu < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :post
end
