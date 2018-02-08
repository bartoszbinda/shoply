require 'test_helper'
#  validates :name, length: {minimum: 5, maximum:100}
class ListTest < ActiveSupport::TestCase
  test 'list should not be blank' do
    list = List.new
    assert_not list.valid?
  end
  test 'name should not be nil' do
    list = List.new
    list.name = ''
    assert_not list.valid?
  end
  test 'name should be at least 5 chars' do
    list = List.new
    list.name= 'a' * 4
    list.save
    assert_not list.valid?
  end
  test 'name should be string' do
    list = List.new
    list.name = 0
    assert_not list.valid?
  end
  test 'name should not be over 100 chars' do
    list = List.new
    list.name = 'a' * 101
    assert_not list.valid?
  end
  
end