require 'capybara/dsl'

class BBC_Registration
  include Capybara::DSL

  #Constants

CONFIRM_BIRTHDAY_LINK = '#submit-button'
DUMMY_PASSWORD = 'Sparta2018'
INPUT_POSTCODE = 'TW10 6TF'
REGISTRATION_SUBMIT = '#submit-button'

  def click_13_or_over
    click_link('13 or over')
    sleep 1
  end

  def input_dob
    fill_in('day-input', with: '16')
    fill_in('month-input', with: '06')
    fill_in('year-input', with: '1986')
  end

  def click_dob_button
    click_button 'Continue'
    sleep 1
  end

  def fill_in_email(email)
    fill_in('user-identifier-input', with: email)
    sleep 1
  end

  def fill_in_password
    fill_in('password-input', with: DUMMY_PASSWORD)
    sleep 1
  end

  def fill_in_postcode
    fill_in('postcode-input', with: INPUT_POSTCODE)
    sleep 1
  end

  def choose_gender
    select 'Female', from: 'Gender'
    sleep 1
  end

  def click_email_updates
    all('.button__text-wrapper')[1].click
    sleep 1
  end

  def click_register
    find(REGISTRATION_SUBMIT).click
    sleep 1
  end

  #
  def verify_registration
    has_content?('You\'re now signed in')
  end

end
