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
  validates_format_of :permalink, with: /\A\w[\w|\-]+\w\z/

  def main?
    permalink == 'main'
  end

  def path
    parent_path + '/' + permalink
  end

  def parent_path
    '/' + ancestors.pluck(:permalink).join('/')
  end
end
