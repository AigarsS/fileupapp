class UploadsController < ApplicationController
  def index
    @uploads = Upload.for_current_user(current_user.id)
  end

  def create
    @upload = Upload.new(user_id: current_user.id)
    @upload.uploaded_file.attach(upload_params[:uploaded_file])

    if @upload.uploaded_file.attached? && @upload.save
      redirect_to action: :index
    else
      render partial: 'error', comment: @comment, status: :bad_request
    end
  end

  def destroy
    if Upload.find(params[:id]).destroy
      redirect_to action: :index
    else
      render partial: 'error', comment: @comment, status: :bad_request
    end
  end

  private

  def upload_params
    params.require(:upload).permit(:uploaded_file)
  end
end
