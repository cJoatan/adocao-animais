class AdoptionsImagesController < ApplicationController
  before_action :set_image, only: [:update, :destroy]
  load_and_authorize_resource

  # POST /adoptions
  # POST /adoptions.json
  def create
    @adoption_image = AdoptionsImage.new(adoptions_image_params)
    @adoption_image.adoption_id = params[:adoption_id]

    respond_to do |format|
      if @adoption_image.save
        format.html { redirect_to @adoption_image.adoption, notice: 'Adoption was successfully created.' }
      else

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
        format.html { render :edit }
        format.json { render json: @adoption.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adoptions/1
  # DELETE /adoptions/1.json
  def destroy
    image = @adoption_image
    @adoption_image.destroy
    respond_to do |format|
      format.html { redirect_to image.adoption, notice: 'Adoption was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @adoption_image = AdoptionsImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adoptions_image_params
      params.require(:adoptions_image).permit(:avatar, :adoption_id)
    end
end
