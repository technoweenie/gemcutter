require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  
  context "when logged in" do
    setup do
      @user = Factory(:email_confirmed_user)
      sign_in_as(@user)
    end

    context "on GET to show" do
      setup do
        get :show
      end

      should_respond_with :success
      should_render_template :show
      should_assign_to(:user) { @user }
    end
  end  
  
  context "On GET to show without being signed in" do
    setup { get :show }
    should_respond_with :redirect
    should_redirect_to('the homepage') { root_url }
  end

end

