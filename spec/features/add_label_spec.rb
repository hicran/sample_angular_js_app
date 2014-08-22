require 'spec_helper'

feature 'adding a label' do
  scenario 'happy path' do
    visit("/")
    click_link("Labels")
    click_button("New Label")
    fill_in 'Label name', :with => 'label1'
    fill_in 'Description', :with => 'Label1 Description'
    click_button("Submit")
    expect(page).to have_content('label1')
    hang
  end
end
