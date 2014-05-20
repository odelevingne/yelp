require 'spec_helper'

describe 'restaurant index page' do
	context 'no restaurants have been added' do
		it 'should display a message' do
			visit '/restaurants'
			expect(page).to have_content 'No restaurants yet'
			end

		it 'should have a link to add a new restaurant' do
			visit '/restaurants'
			expect(page).to have_link 'Add restaurant'
		end
	end
end

describe 'creating a restaurant' do
	it 'added it to the restaurants index' do
		visit 'restaurants/new'
		fill_in 'Name', with: 'McDonalds'
		fill_in 'Address', with: '1 City Road, London'
		fill_in 'Cuisine', with: 'Burgers'
		click_button 'Create Restaurant'

		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'McDonalds'
	end

	it 'raises an error if any of the fields are invalid' do
		visit 'restaurants/new'

		fill_in 'Name', with: nil
		fill_in 'Address', with: nil
		fill_in 'Cuisine', with: nil
		click_button 'Create Restaurant'

		expect(page).to have_content 'errors'
	end
end

describe 'editing a restaurant' do
	before { Restaurant.create(name: 'Franco Manca', address: 'Brixton Village', cuisine: 'Pizza')}

	it 'saves the changes to the restaurant' do
		visit '/restaurants'
		click_link 'Edit Franco Manca' 

		fill_in 'Name', with: 'Franco Manca Pizza' 
		click_button 'Update Restaurant'

		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'Franco Manca Pizza'
	end
end

describe 'deleting a restaurant' do
	before { Restaurant.create(name: 'Franco Manca', address: 'Brixton Village', cuisine: 'Pizza')}

	it 'removes the restaurant from the index' do
		visit '/restaurants'
		click_link 'Delete Franco Manca'

		expect(page).not_to have_content 'Franco Manca'	
		expect(page).to have_content 'Deleted successfully'

	end
end

