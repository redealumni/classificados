class AdsController < ApplicationController
  
  before_filter :get_categories_for_display
  before_filter :enforce_privileges, :only => [:edit, :update, :destroy]
    
  # GET /ads
  # GET /ads.xml
  def index
    
    @title = I18n.t("ads.latest_ads")
    
    ads_by_types(Ad.created_after(date_limit_for_ads_from(:latest)))

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => {"selling" => @selling, "buying" => @buying, "exchanging" => @exchanging} }
    end
  end
  
  def list_in_category
    @category = Category.find_by_permalink(params[:category_id])
    @title = I18n.t("ads.ads_from", :category_name => @category.name)
    
    ads_by_types(@category.ads.created_after(date_limit_for_ads_from(:category)))
    
    respond_to do |format|
      format.html { render :action => 'index' }
      format.xml  { render :xml => {"selling" => @selling, "buying" => @buying, "exchanging" => @exchanging} }
    end
  end
  
  def search
    @title = I18n.t("ads.search_for", :query => params[:query])
    
    ads_by_types( Ad.created_after(date_limit_for_ads_from(:search)).search(params[:query]) )
    
    respond_to do |format|
      format.html { render :action => 'index' }
      format.xml  { render :xml => {"selling" => @selling, "buying" => @buying, "exchanging" => @exchanging} }
    end
  end

  # GET /ads/new
  # GET /ads/new.xml
  def new
    @ad = Ad.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ad }
    end
  end

  # GET /ads/1/edit
  def edit
    @ad = Ad.find(params[:id])
  end

  # POST /ads
  # POST /ads.xml
  def create
    @ad = Ad.new(params[:ad])

    respond_to do |format|
      if @ad.save
        flash[:notice] = I18n.t("ads.created_with_success")
        format.html { redirect_to(ads_path(:anchor =>@ad.id)) }
        format.xml  { render :xml => @ad, :status => :created, :location => @ad }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ads/1
  # PUT /ads/1.xml
  def update
    @ad = Ad.find(params[:id])

    respond_to do |format|
      if @ad.update_attributes(params[:ad])
        flash[:notice] = I18n.t("ads.changed_with_success") 
        format.html { redirect_to(ads_in_category_path(@ad.category, :anchor =>@ad.id)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ads/1
  # DELETE /ads/1.xml
  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy

    respond_to do |format|
      format.html { redirect_to(ads_url) }
      format.xml  { head :ok }
    end
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
    @selling = scoped_ads.of_kind Ad::KINDS[:sell]
    @buying = scoped_ads.of_kind Ad::KINDS[:buy] 
    @exchanging = scoped_ads.of_kind Ad::KINDS[:exchange]
  end

end
