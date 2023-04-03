require 'rails_helper'

RSpec.describe 'Visiting website', type: :system do
  let(:user) { create(:user, password: 'qwerty') }

  scenario 'Smoke test for application' do
    visit root_path
    expect(page).to have_content('You need to sign in or sign up before continuing.')
    sign_in user
    visit root_path
    click_on 'File Upload'
    expect(page).to have_content('Upload file')
    page.attach_file('upload[uploaded_file]', 'spec/fixtures/files/test.txt')
    click_on 'Save'
    expect(page).to have_content('test.txt')
    click_on 'Generate Report'
    fill_in 'start_date', with: DateTime.current.strftime("/%d/%m/%Y")
    fill_in 'end_date', with: DateTime.current.strftime("/%d/%m/%Y")
    click_on 'Generate PDF report'
  end
end
