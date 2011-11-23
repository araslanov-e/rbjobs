module HtmlGenerator
  def self.render(source, strategy = Markdown.new)
    strategy.render(source)
  end
  
  class Markdown
    @@renderer = Redcarpet::Render::HTML.new(:hard_wrap => true, :autolink => true)
    @@markdown = Redcarpet::Markdown.new(@@renderer)
    
    def render(source)
      @@markdown.render(source)
    end
  end
end