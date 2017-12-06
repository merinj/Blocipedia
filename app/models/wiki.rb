class Wiki < ApplicationRecord
  belongs_to :user
  has_many :users, through: :collaborators
  has_many :collaborators

  def markdown_body
  	markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
  	markdown.render(body)
  end
end
