class ArticlesController < ApplicationController
	def index
  	@articles=Article.all
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
    # @article.skip_name_validation = true

    if @article.save
      redirect_to @article,notice:'article was successfully created.'
    else
      render 'new'
    end
  end
  def update
    @article = Article.find(params[:id])
    @article.skip_name_validation = true
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
      params.require(:article).permit(:name, :description,:checkbox , :category_id, :category_name, :author_id, :author_name)
    end
end
