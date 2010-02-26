module AdsHelper
  def ads_summary_as_sentence
    [ 
      t(:number_of_ads_by_type, :count => @selling.size , :type => t(:sell)) ,
      t(:number_of_ads_by_type, :count => @buying.size , :type => t(:buy)) ,
      t(:number_of_ads_by_type, :count => @exchanging.size , :type => t(:exchange))
    ].compact.to_sentence
  end
end
