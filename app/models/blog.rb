class Blog < ApplicationRecord
  # extends ...................................................................
  # includes ..................................................................
  # security (i.e. attr_accessible) ...........................................
  # relationships .............................................................
  has_many :articles, dependent: :destroy
  has_many :user_blog_interfaces
  has_many :users, through: :user_blog_interfaces

  # validations ...............................................................
  validates :name, presence: true
  # callbacks .................................................................
  # scopes ....................................................................
  # additional config .........................................................
  # class methods .............................................................
  # public instance methods ...................................................
  # protected instance methods ................................................
  def user_names
    users.map(&:name)
  end
  # private instance methods ..................................................
end
