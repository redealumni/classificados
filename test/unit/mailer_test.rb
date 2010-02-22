require 'test_helper'

class MailerTest < ActionMailer::TestCase
  test "ad_creation" do
    @expected.subject = 'Mailer#ad_creation'
    @expected.body    = read_fixture('ad_creation')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Mailer.create_ad_creation(@expected.date).encoded
  end

end
