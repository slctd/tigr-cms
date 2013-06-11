class Page
  include Mongoid::Document
  include Mongoid::Orderable

  orderable

  scope :all_without_main, asc(:position).ne(permalink: 'main')

  field :permalink
  field :title
  field :content

  validates_uniqueness_of :permalink
end
