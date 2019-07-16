require 'application_system_test_case'

class PostsTest < ApplicationSystemTestCase

  test 'new post' do
    visit '/'
    fill_in 'session[email]', with: 'mel@mel.com'
    fill_in 'session[password]', with: '1234567'
    click_on('Log In')
    click_on('+')
    fill_in 'post[body]', with: 'Content'
    click_on('Save Post')
    assert_text 'Content'
  end
  test 'failed new post' do
    visit '/'
    fill_in 'session[email]', with: 'mel@mel.com'
    fill_in 'session[password]', with: '1234567'
    click_on('Log In')
    click_on('+')
    fill_in 'post[body]', with: ' '
    click_on('Save Post')
    assert_text 'My Post'
  end

  test 'update post' do
    visit '/'
    fill_in 'session[email]', with: 'mel@mel.com'
    fill_in 'session[password]', with: '1234567'
    click_on('Log In')
    click_on('+')
    fill_in 'post[body]', with: 'Content'
    click_on('Save Post')
    assert_text 'Content'
    click_link('Update', :match => :first)
    fill_in 'post[body]', with: 'Test update'
    click_on 'Save Post'
    assert_text 'Test update'
  end

  test 'failed update post' do
    visit '/'
    fill_in 'session[email]', with: 'mel@mel.com'
    fill_in 'session[password]', with: '1234567'
    click_on('Log In')
    click_on('+')
    fill_in 'post[body]', with: 'Content'
    click_on('Save Post')
    assert_text 'Content'
    click_link('Update', :match => :first)
    fill_in 'post[body]', with: 'te'
    click_on 'Save Post'
    assert_text 'My Post'
  end

  test 'delete post' do
    visit '/'
    fill_in 'session[email]', with: 'mel@mel.com'
    fill_in 'session[password]', with: '1234567'
    click_on('Log In')
    click_on('+')
    fill_in 'post[body]', with: 'Content'
    click_on('Save Post')
    assert_text 'Content'
    click_link('Delete', :match => :first)
    page.driver.browser.switch_to.alert.accept
    refute_text 'Content'
  end

end
