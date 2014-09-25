class User < ActiveRecord::Base
	has_many :movies, dependent: :destroy
  has_many :movie_votes
	has_secure_password

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

validates :password,  length: { minimum: 3 }, :on => :create

  validates :first_name, :presence => true,
                         :length => { :maximum => 25 }
  validates :last_name, :presence => true,
                        :length => { :maximum => 50 }
 
 validates :email, :presence => true,
                    :length => { :maximum => 100 },
                    :uniqueness => { :case_sensitive => false },
                    :format => EMAIL_REGEX
end
