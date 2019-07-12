require 'application_system_test_case'

class SessionsTest < ApplicationSystemTestCase

  test 'log_in' do
    visit '/'
    fill_in 'session[email]', with: 'mel@mel.com'
    fill_in 'session[password]', with: '1234567'
    click_on('Log In')
    assert_text 'Posts'
  end

  test 'log in and out' do
    visit '/'
    fill_in 'session[email]', with: 'mel@mel.com'
    fill_in 'session[password]', with: '1234567'
    click_on('Log In')
    assert_text 'Posts'
    click_on('Log Out')
    assert_text 'Sign up here!'
  end

end
