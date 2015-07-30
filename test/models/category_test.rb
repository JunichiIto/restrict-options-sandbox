require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'restrict options' do
    category = Category.create!(name: '本')
    item = category.items.create!(name: 'Ruby入門')
    order = item.orders.create!(customer: 'Alice')

    assert_nothing_raised { item.destroy }
    assert_equal ["Cannot delete record because dependent orders exist"], item.errors.messages[:base]

    assert_raises(ActiveRecord::DeleteRestrictionError) { category.destroy }
  end
end
