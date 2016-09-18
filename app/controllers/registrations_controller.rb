class RegistrationsController < Devise::RegistrationsController
	before_action :set_user, only: [:show, :edit, :update, :edit_password, :new_password, :destroy]
  skip_authorization_check
  
  def index
    @users = User.all
  end

  def show
  end

  # GET /users/sign_up
  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_url, notice: 'O cadastro foi realizado com sucesso, pode ser logar' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_password
    @user = User.find(current_user.id)

    if @user.update(password_params)
      # Sign in the user by passing validation in case their password changed
      # sign_in @user, :bypass => true
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy

    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:full_name, :user_name, :adress, :adress_number, :number, :neighborhood,
        :complement, :tel_1, :tel_2, :cep, :state, :gender, :age, :email, :password, :password_confirmation)
    end

    def password_params
      # NOTE: Using `strong_parameters` gem
      params.require(:user).permit(:password, :password_confirmation)
    end

    def update_user
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
end