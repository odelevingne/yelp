require 'spec_helper'

describe ReviewsHelper do
	describe '#star_rating' do
		it 'returns 5 filled stars for a rating of 5' do
			expect(star_rating(5)).to eq '★★★★★'
		end

		it 'returns x filled stars, with the remainder white stars, if x < 5' do
		end

		specify 'if value is not a number, return it unchanged' do
		end

		it 'rounds to the nearest whole star' do
		end
	end
end



# ★★★☆☆
