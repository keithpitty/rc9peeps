class PeepsController < ApplicationController
  before_filter :require_user
  
  # GET /peeps
  # GET /peeps.xml
  def index
    @peeps = Peep.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @peeps }
    end
  end

  # GET /peeps/1
  # GET /peeps/1.xml
  def show
    @peep = Peep.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @peep }
    end
  end

  # GET /peeps/new
  # GET /peeps/new.xml
  def new
    @peep = Peep.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @peep }
    end
  end

  # GET /peeps/1/edit
  def edit
    @peep = Peep.find(params[:id])
  end

  # POST /peeps
  # POST /peeps.xml
  def create
    @peep = Peep.new(params[:peep])

    respond_to do |format|
      if @peep.save
        format.html { redirect_to(@peep, :notice => 'Peep was successfully created.') }
        format.xml  { render :xml => @peep, :status => :created, :location => @peep }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @peep.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /peeps/1
  # PUT /peeps/1.xml
  def update
    @peep = Peep.find(params[:id])

    respond_to do |format|
      if @peep.update_attributes(params[:peep])
        format.html { redirect_to(@peep, :notice => 'Peep was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @peep.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /peeps/1
  # DELETE /peeps/1.xml
  def destroy
    @peep = Peep.find(params[:id])
    @peep.destroy

    respond_to do |format|
      format.html { redirect_to(peeps_url) }
      format.xml  { head :ok }
    end
  end
  
  # GET /peeps/find_by_email?email=joe@example.com
  # GET /peeps/find_by_email.xml?email=joe@example.com
  def find_by_email
    @peep = Peep.find_by_email(params[:email])
    
    respond_to do |format|
      if @peep
        format.html { render :action => "show"}
        format.xml { render :xml => @peep }
      else
        format.html { render :text => "No peep found for #{params[:email]}." }
        format.xml { render :xml => "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<error>No peep found for #{params[:email]}.</error>" }
      end
    end
  end
end
