class AdsController < ApplicationController
  
  before_filter :get_categories_for_display
  before_filter :enforce_privileges, :only => [:edit, :update, :destroy]
    
  # GET /ads
  # GET /ads.xml
  def index
    
    @title = I18n.t("ads.latest_ads")
    
    scoped_ads = Ad.created_after(date_to_display_ads_after[:all]).ordered_by_creation
    @selling = scoped_ads.of_kind Ad::KINDS[:sell]
    @buying = scoped_ads.of_kind Ad::KINDS[:buy] 
    @exchanging = scoped_ads.of_kind Ad::KINDS[:exchange] 

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => {"selling" => @selling, "buying" => @buying, "exchanging" => @exchanging} }
    end
  end
  
  def list_in_category
    @category = Category.find_by_permalink(params[:category_id])
    @title = I18n.t("ads.ads_from", :category_name => @category.name)
    
    scoped_ads = @category.ads.created_after(date_to_display_ads_after[:category]).ordered_by_creation
    @selling = scoped_ads.of_kind Ad::KINDS[:sell]
    @buying = scoped_ads.of_kind Ad::KINDS[:buy] 
    @exchanging = scoped_ads.of_kind Ad::KINDS[:exchange]
    
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
        format.html { redirect_to(ads_path) }
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
        format.html { redirect_to(ads_path) }
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
    @categories_for_display = Category.find(:all, :order =>"name ASC").map { |c| [c, c.ads.created_after(date_to_display_ads_after[:category]).count] }
  end
  
  #Before Filter
  def enforce_privileges
    unless can_edit?
      flash[:error] = I18n.t(:access_denied)
      redirect_to ads_path 
    end
  end
  
  def can_edit?
    session[:admin_user]
  end
  helper_method :can_edit?
  
  def date_to_display_ads_after
    {:all => 10.days.ago, :category => 30.days.ago}
  end

end
