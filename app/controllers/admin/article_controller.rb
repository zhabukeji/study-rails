class Admin::ArticleController < ApplicationController
  layout "admin/layouts/main"
  def index
    @articles = Article.admin_list
  end
end
