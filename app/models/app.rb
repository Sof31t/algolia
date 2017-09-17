class App < ActiveRecord::Base
  include AlgoliaSearch
  validates_with AppsValidator

  algoliasearch per_environment: true do
    attribute :name, :image, :link, :category, :rank
  end

  def name
    data['name']
  end

  def image
    data['image']
  end

  def email
    data['email']
  end

  def link
    data['link']
  end

  def category
    data['category']
  end

  def rank
    data['rank']
  end
end
