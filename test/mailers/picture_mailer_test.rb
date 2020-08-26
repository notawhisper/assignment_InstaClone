require 'test_helper'

class PictureMailerTest < ActionMailer::TestCase
  test "picture_mail" do
    mail = PictureMailer.picture_mail
    assert_equal "Picture mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
