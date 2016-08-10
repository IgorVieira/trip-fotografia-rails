class ArticlesController < ApplicationController
  before_action :find_article, only:[:show, :edit, :update, :destroy]


  def index
    @articles = Article.order("created_at DESC").paginate(page: params[:page], per_page: 3)
  end

  def show
   
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new article_params
    if @article.save
      redirect_to articles_path, notice: "The article has been successfully created."
    else
      render action: "new"
    end
  end

  def edit
   
  end

  def update
    if @article.update_attributes(article_params)
      redirect_to articles_path, notice: "The article has been successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy   
    @article.destroy
    redirect_to articles_path
  end

private

  def article_params
    params.require(:article).permit(:title, :body,:image, :slug)
  end


  def find_article
    @article = Article.friendly.find(params[:id])
  end
end
