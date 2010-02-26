class AdsController < ApplicationController
  
  before_filter :get_categories_for_display
  before_filter :enforce_privileges, :only => [:edit, :update, :destroy]
    
  # GET /ads
  def index
    @title = I18n.t(:latest_ads)
    
    ads_by_types(Ad.created_after(date_limit_for_ads_from(:latest)))
  end
  
  # GET /:category_name
  def list_in_category
    @category = Category.find_by_permalink(params[:category_id])  
    @title = I18n.t(:ads_from, :category_name => @category.name)

    ads_by_types(@category.ads.created_after(date_limit_for_ads_from(:category)))
    render :action => 'index'   
  end
  
  # GET /search
  def search
    @title = I18n.t(:search_for, :query => params[:query])
    
    ads_by_types( Ad.created_after(date_limit_for_ads_from(:search)).search(params[:query]) )
    render :action => 'index' 
  end
  
  # GET /ajax_
  
  def ajax_results_summary
    if params[:query].size >=3
      ads_by_types( Ad.created_after(date_limit_for_ads_from(:search)).search(params[:query]) )
    else
      render :nothing => true
    end
  end

  # GET /ads/new
  def new
    @ad = Ad.new
  end

  # GET /ads/1/edit
  def edit
    @ad = Ad.find(params[:id])
  end

  # POST /ads
  def create
    
    @ad = Ad.new(params[:ad])

    if @ad.save
      flash[:notice] = I18n.t(:ads_created_with_success)
      redirect_to(root_path(:anchor =>@ad.id))
    else
      render :action => "new" 
    end

  end

  # PUT /ads/1
  def update
    @ad = Ad.find(params[:id])

    if @ad.update_attributes(params[:ad])
      flash[:notice] = I18n.t(:ads_changed_with_success) 
      redirect_to(ads_in_category_path(@ad.category, :anchor =>@ad.id))
    else
      render :action => "edit"
    end
  end

  # DELETE /ads/1
  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy

    redirect_to(root_path)    
  end
  
  
  private
  
  # Before Filter
  def get_categories_for_display
    @categories_for_display = Category.find(:all, :order =>"name ASC").map do |c| 
      [c, c.ads.created_after(date_limit_for_ads_from(:category)).count]
    end
  end

  def can_edit?
    super || Ad.find(params[:id]).secret_code == params[:secret_code]
  rescue
    false
  end
  
  def date_limit_for_ads_from(type)
    {:latest => 10.days.ago, :category => 30.days.ago, :search => 30.days.ago}[type]
  end

  def ads_by_types(scoped_ads)
    scoped_ads = scoped_ads.ordered_by_creation
    @selling = scoped_ads.of_kind :sell
    @buying = scoped_ads.of_kind :buy 
    @exchanging = scoped_ads.of_kind :exchange
  end

end
