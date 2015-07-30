class Category < ActiveRecord::Base
  has_many :items, dependent: :restrict_with_exception
end
