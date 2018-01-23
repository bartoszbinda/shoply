# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @articles = Article.order(created_at: :desc)
    @user = current_user
    @counter = 0
  end
end
