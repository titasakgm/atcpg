class AtccodesController < ApplicationController
  # GET /atccodes
  # GET /atccodes.json
  def index
    @x = params[:x] if (params[:x])
    @atccodes = Atccode.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @atccodes }
    end
  end

  # GET /atccodes/1
  # GET /atccodes/1.json
  def show
    @atccode = Atccode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @atccode }
    end
  end

  # GET /atccodes/new
  # GET /atccodes/new.json
  def new
    @atccode = Atccode.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @atccode }
    end
  end

  # GET /atccodes/1/edit
  def edit
    @atccode = Atccode.find(params[:id])
  end

  # POST /atccodes
  # POST /atccodes.json
  def create
    @atccode = Atccode.new(params[:atccode])

    respond_to do |format|
      if @atccode.save
        format.html { redirect_to @atccode, :notice => 'Atccode was successfully created.' }
        format.json { render :json => @atccode, :status => :created, :location => @atccode }
      else
        format.html { render :action => "new" }
        format.json { render :json => @atccode.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /atccodes/1
  # PUT /atccodes/1.json
  def update
    @atccode = Atccode.find(params[:id])

    respond_to do |format|
      if @atccode.update_attributes(params[:atccode])
        format.html { redirect_to @atccode, :notice => 'Atccode was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @atccode.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /atccodes/1
  # DELETE /atccodes/1.json
  def destroy
    @atccode = Atccode.find(params[:id])
    @atccode.destroy

    respond_to do |format|
      format.html { redirect_to atccodes_url }
      format.json { head :no_content }
    end
  end
end
