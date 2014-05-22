class Restaurant < ActiveRecord::Base
	validates :name, :cuisine, :address, presence: true
	validates :name, format: { with: /\A[A-Z]/, message: 'must begin with capital letter' }
	has_many :reviews


	def average_rating
		if reviews.any?
			 reviews.average(:rating)
			# reviews.inject(0) {|total, review|
			# 	total + review.rating
			# 	} / reviews.count.to_f 
			# the three lines above are equivalent to line 9. Line 9 is a rails method. Handy.
		else
			'N/A'
		end
	end
end
