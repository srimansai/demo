class User < ApplicationRecord
  paginates_per 3
  include PgSearch::Model
  pg_search_scope :search_doc,
                  against: %i[first_name last_name email]

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true 

  def self.search(query)
    docs = Document.search_doc(query)
    docs.map(&:to_api)
  end

  def to_api
    {
      first_name: first_name,
      last_name: last_name,
      email: email
    }
  end

end
