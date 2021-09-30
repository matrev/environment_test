# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K Rowling'
    fill_in 'Price', with: '12.99'
    fill_in 'book[published_date]', with: '2021-09-03'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end

  scenario 'valid inputs except for title' do
    visit new_book_path
    fill_in 'Author', with: 'Seth Rogan'
    fill_in 'Price', with: '14.99'
    fill_in 'book[published_date]', with: '2021-09-03'
    click_on 'Create Book'
    visit books_path
    expect(page).to_not have_content('Yearbook')
  end

  scenario 'valid inputs except for author' do
    visit new_book_path
    fill_in 'Title', with: 'Watchmen'
    fill_in 'Price', with: '29.99'
    fill_in 'book[published_date]', with: '2021-09-03'
    click_on 'Create Book'
    visit books_path
    expect(page).to_not have_content('Alan Moore')
  end

  scenario 'valid inputs except for price' do
    visit new_book_path
    fill_in 'Title', with: 'Project Hail Mary'
    fill_in 'Author', with: 'Andy Weir'
    fill_in 'book[published_date]', with: '2021-09-03'
    click_on 'Create Book'
    visit books_path
    expect(page).to_not have_content('19.99')
  end

  scenario 'valid inputs except for published date' do
    visit new_book_path
    fill_in 'Title', with: 'what are you going through'
    fill_in 'Author', with: 'sigrid nunez'
    fill_in 'Price', with: '13.99'
    click_on 'Create Book'
    visit books_path
    expect(page).to_not have_content('2021-09-03')
  end
end
