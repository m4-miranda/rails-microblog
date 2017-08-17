require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "check persistence of flash" do
    get login_path
    assert_select "form[action='/login']"
    post login_path, params: { session: { email: "user@example.com",
                                          password: "gibberish" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end
