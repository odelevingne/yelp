module ReviewsHelper
	def star_rating(number)
		filled_stars = '★' * number
		empty_stars = '☆' * (5 - number) 

		filled_stars + empty_stars
	end
end
