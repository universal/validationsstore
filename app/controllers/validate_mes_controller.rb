class ValidateMesController < ApplicationController
  # GET /validate_mes
  # GET /validate_mes.xml
  def index
    @validate_mes = ValidateMe.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @validate_mes }
    end
  end

  # GET /validate_mes/1
  # GET /validate_mes/1.xml
  def show
    @validate_me = ValidateMe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @validate_me }
    end
  end

  # GET /validate_mes/new
  # GET /validate_mes/new.xml
  def new
    @validate_me = ValidateMe.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @validate_me }
    end
  end

  # GET /validate_mes/1/edit
  def edit
    @validate_me = ValidateMe.find(params[:id])
  end

  # POST /validate_mes
  # POST /validate_mes.xml
  def create
    @validate_me = ValidateMe.new(params[:validate_me])

    respond_to do |format|
      if @validate_me.save
        flash[:notice] = 'ValidateMe was successfully created.'
        format.html { redirect_to(@validate_me) }
        format.xml  { render :xml => @validate_me, :status => :created, :location => @validate_me }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @validate_me.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /validate_mes/1
  # PUT /validate_mes/1.xml
  def update
    @validate_me = ValidateMe.find(params[:id])

    respond_to do |format|
      if @validate_me.update_attributes(params[:validate_me])
        flash[:notice] = 'ValidateMe was successfully updated.'
        format.html { redirect_to(@validate_me) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @validate_me.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /validate_mes/1
  # DELETE /validate_mes/1.xml
  def destroy
    @validate_me = ValidateMe.find(params[:id])
    @validate_me.destroy

    respond_to do |format|
      format.html { redirect_to(validate_mes_url) }
      format.xml  { head :ok }
    end
  end
end
