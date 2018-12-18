xml.instruct!
xml.articles do
  @articles.each do |article|
    xml.article do
      xml.title article.title
      xml.body article.body
    
    end
  end
end