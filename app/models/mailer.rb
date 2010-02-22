class Mailer < ActionMailer::Base
  

  def ad_creation(sent_at = Time.now)
    subject    'Mailer#ad_creation'
    recipients ''
    from       ''
    sent_on    sent_at
    
    body       :greeting => 'Hi,'
  end

end
