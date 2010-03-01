ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => "ads"
  
  map.resources :categories

  map.resources :ads, :collection => ["ajax_results_summary", "search"]
  
  map.email_edit_ad "edit_ad/:id/:secret_code", :controller => "ads", :action => "edit"

  map.admin "admin", :controller => "admin", :action => "signin"
  map.reset "reset", :controller => "admin", :action => "signoff"

  map.connect ':controller/:action'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.ads_in_category ':category_id', :controller => 'ads', :action => 'list_in_category'
end
