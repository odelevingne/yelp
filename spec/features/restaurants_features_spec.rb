require 'spec_helper'

describe 'restaurant index page' do
	context 'no restaurants have been added' do
		it 'should display a message' do
			visit '/restaurants'
			expect(page).to have_content 'No restaurants yet'
			end
		end
end


describe 'creating a restaurant' do
	it 'added it to the restaurants index' do
		visit 'restaurants/new'
		fill_in 'Name', with: 'McDonalds'
		fill_in 'Address', with: '1 City Road, London'
		click_button 'Create Restaurant'

		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'McDonalds'
	end
end

describe 'editing a restaurant' do
	before { Restaurant.create(name: 'Franco Manca', address: 'Brixton Village')}

	it 'saves the changes to the restaurant' do
		visit '/restaurants'
		click_link 'Edit Franco Manca' 

		fill_in 'Name', with: 'Franco Manca Pizza' 
		click_button 'Update Restaurant'

		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'Franco Manca Pizza'
	end
end

