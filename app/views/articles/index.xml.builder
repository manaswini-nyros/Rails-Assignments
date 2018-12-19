xml.instruct!
xml.articles do
  @articles.each do |article|
    xml.article do
      xml.name article.name
      xml.description article.description
      xml.author article.author.name
      xml.category article.category.name
      xml.tag article.tag_id
    
    end
  end
end