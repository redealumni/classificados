class AdsController < ApplicationController
  # GET /ads
  # GET /ads.xml
  def index
    
    @title = "Classificados Recentes"
    
    scoped_ads = Ad.created_after(30.days.ago).ordered_by_creation
    @selling = scoped_ads.of_kind Ad::KINDS[:sell]
    @buying = scoped_ads.of_kind Ad::KINDS[:buy] 
    @exchanging = scoped_ads.of_kind Ad::KINDS[:exchange] 

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ads }
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
        flash[:notice] = 'Classificado criado com sucesso.'
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
        flash[:notice] = 'Classificado alterado com sucesso.'
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
end
