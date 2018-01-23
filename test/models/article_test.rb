# frozen_string_literal: true

require 'test_helper'
class ArticleTest < ActiveSupport::TestCase
  test 'should not be blank' do
    article = Article.new
    assert_not article.valid?
  end
  test 'title should not be nil' do
    article = Article.new
    article.title = ''
    assert_not article.valid?
  end
  test 'title should be at least 5 chars' do
    article = Article.new
    article.title = 'a' * 4
    assert_not article.valid?
  end
  test 'title should be string' do
    article = Article.new
    article.title = 0
    assert_not article.valid?
  end
  test 'title should not be over 200 chars' do
    article = Article.new
    article.title = 'a' * 201
    assert_not article.valid?
  end

  test 'for at least 5 chars title should be allowed' do
    article = Article.new
    article.title = 'a' * 5
    assert article.valid?
  end
  test 'for at max 200 chars title should be allowed' do
    article = Article.new
    article.title = 'a' * 200
    assert article.valid?
  end
end
