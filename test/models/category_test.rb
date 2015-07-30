require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'restrict options' do
    category = Category.create!(name: '本')
    item = category.items.create!(name: 'Ruby入門')
    order = item.orders.create!(customer: 'Alice')

    # 子レコードがあると削除できない
    assert_nothing_raised { item.destroy }
    assert_equal ["Cannot delete record because dependent orders exist"], item.errors.messages[:base]

    assert_raises(ActiveRecord::DeleteRestrictionError) { category.destroy }

    # 子レコードがなければ削除可能
    order.destroy
    assert_difference 'Item.count', -1 do
      item.reload.destroy
    end
    assert_difference 'Category.count', -1 do
      category.reload.destroy
    end
  end
end
