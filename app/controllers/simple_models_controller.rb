class SimpleModelsController < ApplicationController
  # GET /simple_models
  # GET /simple_models.xml
  def index
    @simple_models = SimpleModel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @simple_models }
    end
  end

  # GET /simple_models/1
  # GET /simple_models/1.xml
  def show
    @simple_model = SimpleModel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @simple_model }
    end
  end

  # GET /simple_models/new
  # GET /simple_models/new.xml
  def new
    @simple_model = SimpleModel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @simple_model }
    end
  end

  # GET /simple_models/1/edit
  def edit
    @simple_model = SimpleModel.find(params[:id])
  end

  # POST /simple_models
  # POST /simple_models.xml
  def create
    @simple_model = SimpleModel.new(params[:simple_model])

    respond_to do |format|
      if @simple_model.save
        flash[:notice] = 'SimpleModel was successfully created.'
        format.html { redirect_to(@simple_model) }
        format.xml  { render :xml => @simple_model, :status => :created, :location => @simple_model }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @simple_model.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /simple_models/1
  # PUT /simple_models/1.xml
  def update
    @simple_model = SimpleModel.find(params[:id])

    respond_to do |format|
      if @simple_model.update_attributes(params[:simple_model])
        flash[:notice] = 'SimpleModel was successfully updated.'
        format.html { redirect_to(@simple_model) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @simple_model.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /simple_models/1
  # DELETE /simple_models/1.xml
  def destroy
    @simple_model = SimpleModel.find(params[:id])
    @simple_model.destroy

    respond_to do |format|
      format.html { redirect_to(simple_models_url) }
      format.xml  { head :ok }
    end
  end
end
