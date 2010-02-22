class Mailer < ActionMailer::Base
  

  def ad_creation(ad)
    subject    "Importante - Anúncio '#{ad.title}' criado"
    recipients ad.email
    from       "no-reply@example.org"
    sent_on    Time.now
    
    @ad = ad
    
  end

end
