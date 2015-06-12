class Admin::ClientsController < ApplicationController
  http_basic_authenticate_with :name => "panama", :password => "coffee", :only => [:index, :show]
  def index
    @clients = Client.all

    respond_to do |format|
      format.html
      format.json { render json: @clients }
    end
  end

  def new
    @client = Client.new

    respond_to do |format|
      format.html
      format.json { render json: @client }
    end
  end

  def create
    @client = Client.create(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to thanks_path, success: 'Client was successfully created.' }
        format.json { render json: @client, status: :created, location: @client }
      else
        format.html { render action: 'new' }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @client }
    end
  end

  def edit
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @client }
    end
  end

  def update
    @client = Client.find(params[:id]) rescue nil

    unless @client
      redirect_to root_url, :error => 'You cannot update this client!'
    end

    respond_to do |format|
      if @client.update_attributes(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @client = Client.find(params[:id]) rescue nil

    unless @client
      redirect_to root_url, :error => 'You cannot delete this client!'
    end

    @client.destroy

    respond_to do |format|
      format.html { redirect_to_client_url }
      format.json { head :no_content }
    end
  end

  private

  def client_params
    params.require(:client).permit(:first_name, :last_name, :full_street_address, :email, :coffee_method_used, :coffee_grind, :coffee_selected)
  end

end
