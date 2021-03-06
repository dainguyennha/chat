require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
    user = User.first 
    user.activation_token = User.new_token
    mail = UserMailer.account_activation user, user.activation_token
    assert_equal "Account activation!", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["dainguyenblabla@gmail.com"], mail.from
    assert_match user.name, mail.body.encoded
    assert_match user.id.to_s, mail.body.encoded
    assert_match user.activation_token, mail.body.encoded
  end

  test "password_reset" do
    mail = UserMailer.password_reset
    assert_equal "Password reset", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["dainguyenblabla@gmail.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
