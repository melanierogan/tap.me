require 'application_system_test_case'

class SessionsTest < ApplicationSystemTestCase
   test 'signup' do
     visit '/'
     click_on('Sign up here!')
     fill_in 'user[username]', with: 'Jayda'
     fill_in 'user[email]', with: 'jay@jay.com'
     fill_in 'user[password]', with: '1234567890'
     click_on('Sign Up')
     assert_text 'Posts'
   end
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
