require 'spec_helper'

describe 'Testing the BBC Registration' do
  #context to test the Login user journey

  context 'initial user journer signing up' do

    xit "should take us through the correct registration process with valid details" do
      @bbc_site = BBC_Site.new
      #Go and get new email
      @bbc_site.get_temp_email.visit_minute_inbox
      # @bbc_site.get_temp_email.refresh_email
      email = @bbc_site.get_temp_email.get_email
      # Start the registration process
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_homepage.click_go_to_register
      @bbc_site.bbc_registration.click_13_or_over
      @bbc_site.bbc_registration.input_dob
      @bbc_site.bbc_registration.click_dob_button
      # Pass in the email stored in the method
      @bbc_site.bbc_registration.fill_in_email(email)
      @bbc_site.bbc_registration.fill_in_password
      @bbc_site.bbc_registration.fill_in_postcode
      @bbc_site.bbc_registration.choose_gender
      @bbc_site.bbc_registration.click_email_updates
      @bbc_site.bbc_registration.click_register
      expect(@bbc_site.bbc_registration.verify_registration).to be true
    end

  end

end
