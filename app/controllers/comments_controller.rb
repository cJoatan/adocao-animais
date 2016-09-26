class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.where(adoption_id: params[:adoption_id])
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.adoption_id = params[:adoption_id]

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.adoption }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render @comment.adoption }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    adotion = @comment.adoption
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to adotion }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :adoption_id, :user_id)
    end
end
