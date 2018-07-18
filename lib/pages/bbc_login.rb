require 'capybara/dsl'

class BBC_Login
  include Capybara::DSL

  #Constants
  USERNAME = 'username'
  DUMMY_EMAIL = 'saphira.lachelle@lm0k.com'
  WRONG_DUMMY_EMAIL = 'saphira.lachelle@lm0k'
  PASSWORD_INPUT = 'password'
  DUMMY_PASSWORD = 'Sparta2018'
  WRONG_DUMMY_PASSWORD = 'Sparta'
  ERROR_MSG = '.form-message__text'

  def fill_email
    fill_in USERNAME, with: DUMMY_EMAIL
    sleep 1
  end

  def fill_wrong_email
    fill_in USERNAME, with: WRONG_DUMMY_EMAIL
    sleep 1
  end

  def fill_password
    fill_in PASSWORD_INPUT, with: DUMMY_PASSWORD
    sleep 1
  end

  def fill_wrong_password
    fill_in PASSWORD_INPUT, with: WRONG_DUMMY_PASSWORD
    sleep 1
  end

  def click_submit
    click_button 'Sign in'

  end

  def verify_login
    page.has_content?('')
  end

  def error_text
    find(ERROR_MSG).text
  end

  def method_name

  end

  def click_account
    click_link 'Your account'
  end

  def click_sign_out_button
    click_link 'Sign out'
  end

  def click_email_box
    find('user-identifier-input').click
  end

  def click_page
    find('#signin-page').click
  end
end
