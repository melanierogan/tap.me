require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
   test 'signup' do
     visit '/'
     click_on('Sign up here!')
     fill_in 'user[username]', with: 'Jayda'
     fill_in 'user[email]', with: 'jay@jay.com'
     fill_in 'user[password]', with: '1234567890'
     click_on('Sign Up')
     assert_text 'Posts'
   end
   test 'fail signup' do
    visit '/'
    click_on('Sign up here!')
    fill_in 'user[username]', with: 'Jayda'
    fill_in 'user[email]', with: 'jay@jay.com'
    fill_in 'user[password]', with: '12'
    click_on('Sign Up')
    assert_text 'Log in here!'
  end

  test 'delete user account' do
   visit '/'
   click_on('Sign up here!')
   fill_in 'user[username]', with: 'Jayda'
   fill_in 'user[email]', with: 'jay@jay.com'
   fill_in 'user[password]', with: '1234567890'
   click_on('Sign Up')
   assert_text 'Posts'
   click_on('Settings')
   click_on('Delete Account')
   page.driver.browser.switch_to.alert.accept
   assert_text 'Sign up here!'
 end

end
