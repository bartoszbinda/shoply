# frozen_string_literal: true

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'commenter should be present' do
    comment = Comment.new
    comment.body = 'a' * 3
    assert_not comment.valid?
  end
  test 'commenter should not be nil' do
    comment = Comment.new
    comment.commenter = nil
    comment.body = 'a' * 3
    assert_not comment.valid?
  end
  test 'commenter should be not be lesser than 3 chars' do
    comment = Comment.new
    comment.commenter = 'a' * 2
    comment.body = 'a' * 3
    assert_not comment.valid?
  end
  test 'commenter should be not higher than 60 chars' do
    comment = Comment.new
    comment.commenter = 'a' * 61
    comment.body = 'a' * 3
    assert_not comment.valid?
  end
  test 'body of comment should be present' do
    comment = Comment.new
    comment.commenter = 'a' * 59
    comment.body = ''
    assert_not comment.valid?
  end
  test 'body of comment should not be lesser than 3 chars' do
    comment = Comment.new
    comment.commenter = 'a' * 59
    comment.body = 'a' * 2
    assert_not comment.valid?
  end
  test 'body of comment should not be lesser than 301 chars' do
    comment = Comment.new
    comment.commenter = 'a' * 59
    comment.body = 'a' * 301
    assert_not comment.valid?
  end
  test 'body of comment should be between 3 and 300' do
    comment = Comment.new
    comment.commenter = 'a' * 59
    comment.body = 'a' * 30
    assert comment.valid?
  end
  test 'body of comment should be between 3 and 300 and commenter length should be between 3 and 60' do
    comment = Comment.new
    comment.commenter = 'a' * 59
    comment.body = 'a' * 30
    assert comment.valid?
  end
end
