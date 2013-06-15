class Page
  include Mongoid::Document
  include Mongoid::Versioning

  include Mongoid::Orderable
  orderable

  include Mongoid::Ancestry
  has_ancestry

  default_scope asc(:position)
  scope :all_without_main, asc(:position).ne(permalink: 'main')

  field :permalink
  field :title
  field :content

  validates_uniqueness_of :permalink

  def main?
    permalink == 'main'
  end

  def path
    '/' + (ancestors.pluck(:permalink) + [permalink]).join('/')
  end
end
