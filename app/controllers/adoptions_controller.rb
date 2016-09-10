class AdoptionsController < ApplicationController
  before_action :set_adoption, only: [:show, :edit, :update, :destroy]

  # GET /adoptions
  # GET /adoptions.json
  def index
    @adoptions = Adoption.all
  end

  # GET /adoptions/1
  # GET /adoptions/1.json
  def show
    @adoption_image = AdoptionsImage.new
  end

  # GET /adoptions/new
  def new
    @adoption = Adoption.new
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
    def set_adoption
      @adoption = Adoption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adoption_params
      params.require(:adoption).permit(:title, :description, :animal_id, :breed_id, :price, :age, :user_creator, :adoptions_images_id)
    end

    def image_params
      params.require(:adoption).permit(:avatar)
    end
end
