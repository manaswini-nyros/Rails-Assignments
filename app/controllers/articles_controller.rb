class ArticlesController < ApplicationController
	def index
  	@articles=Article.take(3)
    @articles=Article.last(2)
    @articles=Article.first(1)
    @articles=Article.where.not(author_id:2)
    @articles=Article.where(name:"The crown")
    @articles =Article.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    @articles=Article.where(name:["The crown","The old man and the sea"])
    @articles=Article.where(category_id:36).or(Article.where(tag_id:20))
    @articles=Article.order("name")
    # @articles=Article.find_by name:"The crown"
  end
  def new
  	 @article = Article.new
  end
  def show
  	@article = Article.find(params[:id])
  end
  def edit
  	  @article = Article.find(params[:id])
  end
  def create
  	@article = Article.new(article_params)
    if @article.save
      redirect_to @article,notice:'article was successfully created.'
    else
      render 'new'
    end
  end
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
  private
    def article_params
      params.require(:article).permit(:name, :description, :checkbox, :category_id, :category_name, :tag_id, :tag_name, :author_id, :author_name)
    end
end
