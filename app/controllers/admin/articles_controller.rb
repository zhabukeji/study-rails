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

  def update
    @article = Article.find params[:id]
    if @article.update(article_params)
      redirect_to admin_articles_path
    end
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to admin_articles_path
    else
      render :edit, locals: {article: @article }
    end
  end

  private

    def article_params
      params.require(:article).permit(:title, :author, :context, :status)
    end
end
