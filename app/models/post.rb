class Post < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :replies
  has_many :menus
end
