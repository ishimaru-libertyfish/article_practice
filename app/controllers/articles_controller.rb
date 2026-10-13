class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    
    if @article.save
      redirect_to articles_path, notice: '新規投稿しました。'
    else
      render :new
    end

  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id]) 
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update    
    if params[:back].present?
      render :edit
    else
      @article = Article.find(params[:id])
      if @article.update(article_params)
        redirect_to articles_path, notice: '投稿を更新しました。'
      else
        render :edit
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, alert: '投稿を削除しました。'
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
