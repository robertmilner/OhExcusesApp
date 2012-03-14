class ExcusesController < ApplicationController

  # filters
  before_filter :current_user

  # GET /excuses
  # GET /excuses.json
  def index
    @excuses = Excuse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @excuses }
    end
  end

  # GET /excuses/1
  # GET /excuses/1.json
  def show
    @excuse = Excuse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @excuse }
    end
  end

  # GET /excuses/new
  # GET /excuses/new.json
  def new
    @excuse = Excuse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @excuse }
    end
  end

  # GET /excuses/1/edit
  def edit
    @excuse = Excuse.find(params[:id])
  end

  # POST /excuses
  # POST /excuses.json
  def create
    @user = @current_user
    @excuse = Excuse.new(params[:excuse])
    @excuse.user = @user
    @excuse.location_id = @user.location_id

    respond_to do |format|
      if @excuse.save!
        format.html { redirect_to @excuse, notice: 'Excuse was successfully created.' }
        format.json { render json: @excuse, status: :created, location: @excuse }
      else
        format.html { render action: "new" }
        format.json { render json: @excuse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /excuses/1
  # PUT /excuses/1.json
  def update
    @excuse = Excuse.find(params[:id])

    respond_to do |format|
      if @excuse.update_attributes(params[:excuse])
        format.html { redirect_to @excuse, notice: 'Excuse was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @excuse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /excuses/1
  # DELETE /excuses/1.json
  def destroy
    @excuse = Excuse.find(params[:id])
    @excuse.destroy

    respond_to do |format|
      format.html { redirect_to excuses_url }
      format.json { head :no_content }
    end
  end
end
