class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    # grabs and displays all articles in article path
    @articles = Article.paginate(page: params[:page], per_page: 1)
  end

  def new
    # when you create a new article it prevents the loop in controller from throwing an error on first iteration
    @article = Article.new
  end

  def edit
  end

  def create
    # saves created article the redirects you to article show page
    @article = Article.new(article_params)
    @article.user = User.first
    if  @article.save
      flash[:notice] = "Article was created sucessfully."
      redirect_to @article
    else
      render 'new'
   end
  end

  def update
    # updates the current article by id, white list
    if @article.update(article_params)
      flash[:notice] = "Article was created sucessfully."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    # shit blows up and you go to the articles page
    @article.destroy
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end