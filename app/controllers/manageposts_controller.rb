# frozen_string_literal: true

class ManagepostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @articles = Article.all
  end
end
