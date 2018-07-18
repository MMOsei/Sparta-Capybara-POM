require 'spec_helper'

describe 'Testing the BBC Site' do
  #context to test the Login user journey
  context 'testing Login' do

    xit "should respond with success when we log in with a valid email and password" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.fill_email
      @bbc_site.bbc_login.fill_password
      @bbc_site.bbc_login.click_submit
      expect(@bbc_site.bbc_login.verify_login).to be true
    end

    xit "should show an error message when email is not formatted correctly" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_login.click_account
      @bbc_site.bbc_login.click_sign_out_button
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.fill_wrong_email
      @bbc_site.bbc_login.fill_password
      expect(@bbc_site.bbc_login.error_text).to eq "Sorry, that email doesn’t look right. Please check it's a proper email."
    end

    xit "should show an error message when a correct email and a wrong password is entered" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.fill_email
      @bbc_site.bbc_login.fill_wrong_password
      @bbc_site.bbc_login.click_page
      expect(@bbc_site.bbc_login.error_text).to eq "Sorry, that password is too short. It needs to be eight characters or more."
    end

    xit "should show an error if the username or password field is empty" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      # expect(@bbc_site.bbc_login.).to raise_error("Sorry, those details don't match")

    end

    xit "should redirect you to login page after pressing enter if details are incorrect" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
    end

    xit "should show an error if password does not meet validation requirements" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
    end

    it "should show an error message when an invalid email and valid password is entered" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      expect(@bbc_site.bbc_login.).to eq("Sorry, those details don't match")
    end
  end

end
