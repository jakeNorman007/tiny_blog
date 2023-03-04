class ArticlesController < ApplicationController
  def show
    # has to be an instance variable @
    @article = Article.find(params[:id])
  end

  def index
    # grabs and displays all articles in article path
    @articles = Article.all
  end

  def new
    # when you create a new article it prevents the loop in controller from throwing an error on first iteration
    @article = Article.new
  end

  def edit
    # similar to show, finds the article you're editing by id
    @article = Article.find(params[:id])
  end

  def create
    # saves created article the redirects you to article show page, white list
    @article = Article.new(params.require(:article).permit(:title, :description))
    if  @article.save
      flash[:notice] = "Article was created sucessfully."
      redirect_to @article
    else
      render 'new'
   end
  end

  def update
    # updates the current article by id, white list
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was created sucessfully."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    # shit blows up and you go to the articles page
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
end