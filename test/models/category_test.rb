require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'restrict options' do
    category = Category.create!(name: '本')
    item = category.items.create!(name: 'Ruby入門')
    order = item.orders.create!(customer: 'Alice')

    item.destroy
    assert item.errors.present?

    assert_raises(ActiveRecord::DeleteRestrictionError) { category.destroy }
  end
end
