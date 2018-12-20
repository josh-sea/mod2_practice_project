class AttendeesController < ApplicationController
before_action :find_attendee, only: [:show, :edit, :update, :destroy]


  def index
    if Attendee.where('name LIKE ?', "%#{params[:search]}%").length > 0
      @attendees  = Attendee.where('name LIKE ?', "%#{params[:search]}%")
    else
      @attendees = Attendee.all
    #implicit index render
    end
  end

  def new
    @attendee = Attendee.new
    #implicit new render
  end

  def create
    @attendee = Attendee.create(attendee_params)
    if @attendee.valid?
      redirect_to @attendee
    else
      @errors = @attendee.errors.full_messages
      render :edit
    end
  end

  def edit
    #implicit edit render
  end

  def update
    if @attendee.update(attendee_params)
      redirect_to @attendee
    else
      @errors = @attendee.errors.full_messages
      render :edit
    end
  end

  def destroy
    @attendee.destroy
    redirect_to attendees_path
  end


private
  ###private methods
  def attendee_params
    params.require(:attendee).permit(:name, :email, :phone_number, :search)
  end

  def find_attendee
    @attendee = Attendee.find(params[:id])
  end

end
