class Item < ActiveRecord::Base
  belongs_to :category
  has_many :orders, dependent: :restrict_with_error
end
