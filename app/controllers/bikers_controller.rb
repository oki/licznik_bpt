class BikersController < ApplicationController
	
	# GET /bikers
  # GET /bikers.xml
  def index
	
		if params[:nick]
      @bikers = Biker.find :all, :conditions => ['nick = ?', params[:nick]] 
    else
      @bikers = Biker.find(:all)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bikers }
    end
  end

  # GET /bikers/1
  # GET /bikers/1.xml
  def show
    @biker = Biker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @biker }
    end
  end

  # GET /bikers/new
  # GET /bikers/new.xml
  def new
    @biker = Biker.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @biker }
    end
  end

  # GET /bikers/1/edit
  def edit
    @biker = Biker.find(params[:id])
  end

  # POST /bikers
  # POST /bikers.xml
  def create
    @biker = Biker.new(params[:biker])

    respond_to do |format|
      if @biker.save
        flash[:notice] = 'Biker was successfully created.'
        format.html { redirect_to(@biker) }
        format.xml  { render :xml => @biker, :status => :created, :location => @biker }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @biker.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bikers/1
  # PUT /bikers/1.xml
  def update
    @biker = Biker.find(params[:id])

    respond_to do |format|
      if @biker.update_attributes(params[:biker])
        flash[:notice] = 'Biker was successfully updated.'
        format.html { redirect_to(@biker) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @biker.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bikers/1
  # DELETE /bikers/1.xml
  def destroy
    @biker = Biker.find(params[:id])
    @biker.destroy

    respond_to do |format|
      format.html { redirect_to(bikers_url) }
      format.xml  { head :ok }
    end
  end
  
end
