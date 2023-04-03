# frozen_string_literal: true

class UploadsController < ApplicationController
  def index
    @uploads = Upload.for_current_user(current_user.id)
  end

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(user_id: current_user.id)
    @upload.uploaded_file.attach(upload_params[:uploaded_file])

    if @upload.save
      redirect_to action: :index
    else
      flash.now[:alert] = 'Invalid file upload'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    Upload.find(params[:id]).destroy!
    redirect_to action: :index
  end

  def pdf_printout
    if request.format.pdf?
      @start_date = Date.parse(params[:start_date])
      @end_date = Date.parse(params[:end_date])
      @uploads = Upload.for_current_user(current_user.id).between_dates(@start_date, @end_date)
    end
  rescue ArgumentError
  end

  private

  def upload_params
    params.require(:upload).permit(:uploaded_file)
  end
end
