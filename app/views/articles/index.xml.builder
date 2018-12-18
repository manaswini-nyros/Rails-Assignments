xml.instruct!
xml.articles do
  @articles.each do |article|
    xml.article do
      xml.name article.name
      xml.description article.description
      xml.author article.author_id
      xml.category article.category_id
      xml.tag article.tag_id
    
    end
  end
end