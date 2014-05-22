class Restaurant < ActiveRecord::Base
	validates :name, :cuisine, :address, presence: true
	validates :name, format: { with: /\A[A-Z]/, message: 'must begin with capital letter' }
	has_many :reviews

	def average_rating
		if reviews.any?
			reviews.inject(0) do |total, review|
				total + review.rating
			end
		else
			'N/A'
		end
	end
end
