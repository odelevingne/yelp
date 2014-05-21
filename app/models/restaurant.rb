class Restaurant < ActiveRecord::Base
	validates :name, :cuisine, :address, presence: true
	validates :name, format: { with: /\A[A-Z]/, message: 'must begin with capital letter' }
	has_many :reviews
end
