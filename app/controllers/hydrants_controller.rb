class HydrantsController < ApplicationController
  # GET /hydrants
  # GET /hydrants.xml
  def index
    @hydrants = Hydrant.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :partial => 'index_xml' }
    end
  end

  # GET /hydrants/1
  # GET /hydrants/1.xml
  def show
    @hydrant = Hydrant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :partial => 'show_xml' }
    end
  end

  # GET /hydrants/new
  # GET /hydrants/new.xml
  def new
    @hydrant = Hydrant.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hydrant }
    end
  end

  # GET /hydrants/1/edit
  def edit
    @hydrant = Hydrant.find(params[:id])
  end

  # POST /hydrants
  # POST /hydrants.xml
  def create
    @hydrant = Hydrant.new(params[:hydrant])

    respond_to do |format|
      if @hydrant.save
        flash[:notice] = 'Hydrant was successfully created.'
        format.html { redirect_to(@hydrant) }
        format.xml  { render :xml => @hydrant, :status => :created, :location => @hydrant }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hydrant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hydrants/1
  # PUT /hydrants/1.xml
  def update
    @hydrant = Hydrant.find(params[:id])

    respond_to do |format|
      if @hydrant.update_attributes(params[:hydrant])
        flash[:notice] = 'Hydrant was successfully updated.'
        format.html { redirect_to(@hydrant) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hydrant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hydrants/1
  # DELETE /hydrants/1.xml
  def destroy
    @hydrant = Hydrant.find(params[:id])
    @hydrant.destroy

    respond_to do |format|
      format.html { redirect_to(hydrants_url) }
      format.xml  { head :ok }
    end
  end
end
