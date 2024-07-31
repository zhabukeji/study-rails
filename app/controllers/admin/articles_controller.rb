class Admin::ArticlesController < ApplicationController
  layout "admin/layouts/main"
  def index
    @articles = Article.admin_list params[:page]
  end

  def edit
    @article = Article.find params[:id]
  end
  
  def new
    @article = Article.new
    render :edit, locals: {article: @article }
  end
end
