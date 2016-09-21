class AdoptionsController < ApplicationController
  before_action :set_adoption, only: [:show, :edit, :update, :destroy]
  before_action :set_adoption_id, only: [:to_enabled, :to_disabled]
  load_and_authorize_resource
  
  # GET /adoptions
  # GET /adoptions.json
  def index
    @search = Adoption.enabled.ransack(params[:q])
    @adoptions = @search.result.includes(:location).page(params[:page])
    @breeds = Breed.all
    @animals = Animal.all
  end

  def adoptions_of_a_created_user
    @adoptions = Adoption.where(user_creator_id: params[:user_id])
  end

  def adopted
    @adoptions = Adoption.where(user_adopted_id: params[:user_id])
  end

  def adopt
    @adoption = Adoption.find(params[:adoption_id])
    @adoption.user_adopted_id = params[:user_id]
    @adoption.save
    
    redirect_to @adoption
  end
  # GET /adoptions/1
  # GET /adoptions/1.json
  def show
    @adoption_image = AdoptionsImage.new
  end

  # GET /adoptions/new
  def new
    @adoption = Adoption.new
    @adoption.location = Location.new
    @animals = Animal.all
    @breeds = Breed.all
  end

  # GET /adoptions/1/edit
  def edit
    @animals = Animal.all
    @breeds = Breed.all
  end

  # POST /adoptions
  # POST /adoptions.json
  def create

    @adoption = Adoption.new(adoption_params)
    @adoption.adoptions_images = []
    @adoption.user_creator = current_user

    if params[:use_my_info_location]
      @adoption.location_id = current_user.location_id
      p "ENTROOW #{@adoption.location_id}"
    end

    respond_to do |format|
      if @adoption.save
        format.html { redirect_to @adoption, notice: 'Adoption was successfully created.' }
        format.json { render :show, status: :created, location: @adoption }
      else
        @animals = Animal.all
        @breeds = Breed.all
        format.html { render :new }
        format.json { render json: @adoption.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adoptions/1
  # PATCH/PUT /adoptions/1.json
  def update
    respond_to do |format|
      if @adoption.update(adoption_params)
        format.html { redirect_to @adoption, notice: 'Adoption was successfully updated.' }
        format.json { render :show, status: :ok, location: @adoption }
      else
        @animals = Animal.all
        @breeds = Breed.all
        format.html { render :edit }
        format.json { render json: @adoption.errors, status: :unprocessable_entity }
      end
    end
  end

  def to_enabled
    @adoption.status = "enabled"
    @adoption.save

    redirect_to @adoption, notice: "Sua adoção foi publicada com sucesso"
  end

  def to_disabled
    @adoption.status = "disabled"
    @adoption.save

    redirect_to @adoption, notice: "Sua adoção foi desabilitada com sucesso"
  end

  # DELETE /adoptions/1
  # DELETE /adoptions/1.json
  def destroy
    @adoption.destroy
    respond_to do |format|
      format.html { redirect_to adoptions_url, notice: 'Adoption was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adoption_id
      @adoption = Adoption.find(params[:adoption_id])
    end

    def set_adoption
      @adoption = Adoption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adoption_params
      params.require(:adoption).permit(:title, :description, :animal_id, :breed_id, :price, :age, :adoptions_images_id)
    end

    def image_params
      params.require(:adoption).permit(:avatar)
    end
end
