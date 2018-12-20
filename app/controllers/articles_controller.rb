class ArticlesController < ApplicationController
  def index
  	@articles=Article.take(3)
    @articles=Article.last(2)
    @articles=Article.first(1)
    @articles=Article.where.not(author_id:2)
    @articles=Article.where(name:"The crown")
    @articles=Article.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    @articles=Article.where(name:["The crown","The old man and the sea"])
    @articles=Article.where(category_id:36).or(Article.where(tag_id:20))
    @articles=Article.order("name")
    @articles=Article.find_by name:"The crown"
    @articles=Article.limit(2).offset(3)
    @articles=Tag.joins(:articles).includes(:articles) .group('tag_id').having('COUNT(*) >= ?', 4) .order('COUNT(*) desc')
    @all_articles_count = Article.count :all
    @articles=Article.order(created_at: :desc)
    @articles=Article.joins("INNER JOIN tags ON tags.article_id = articles.id AND tags.name = 't'")
    @articles=Article.joins(:tags) 
    # @articles=Article.left_outer_joins(:tags).distinct.select('articles.*, COUNT(tags.*) AS tags_count').group('articles.id')
    @articles=Article.includes(:category, :tags)
    @articles=Article.includes(:category).limit(5)
    # @articles=Article.group(:name).count
    @articles=Article.all
    respond_to do |format| 
     format.html # index.html.erb 
     format.xml # index.builder
    end
  end
  def new
  	 @article = Article.new
     @article.image = params[:file]

     # File.open('Documents')  do |f|
     #   @article.image = f
     # end  
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
  # def upload
  # uploaded_io = params[:article][:picture]
  #   File.open(Rails.root.join('public', 'uploads',
  # uploaded_io.original_filename), 'wb') do |file|
  #   file.write(uploaded_io.read)
  # end
  # def download_pdf
  #   client = Client.find(params[:id])
  #   send_data generate_pdf(client),
  #             filename: "#{client.name}.pdf",
  #             type: "application/pdf"
  # end

  # private

  # def generate_pdf(image)
  #   Prawn::Document.new do
  #     text client.name, align: :center
  #     text "Address: #{client.address}"
  #     text "Email: #{client.email}"
  #   end.render
  # end
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
      params.require(:article).permit(:name, :description,:content , :checkbox, :category_id, :category_name, :tag_id, :tag_name, :image, :author_id, :author_name)
    end
end
