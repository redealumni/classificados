module AdsHelper
  def ads_summary_as_sentence
    strings = [ 
      t(:number_of_ads_by_type, :count => @selling.size , :type => t(:sell)) ,
      t(:number_of_ads_by_type, :count => @buying.size , :type => t(:buy)) ,
      t(:number_of_ads_by_type, :count => @exchanging.size , :type => t(:exchange))
    ].compact
    if strings.empty?
      t(:no_results_for_you)
    else
       strings.to_sentence
    end
  end
end
