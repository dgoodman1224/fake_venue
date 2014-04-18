class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]


  def index
    @events = Event.all.order(:date)
  end


  def show
  end

  def new
    @event = Event.new
    @errors = @errors
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to "/events"
     else
      @errors = @event.errors.messages
      render 'new'
    end
  end


  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :artist, :artist_second, :artist_third, :artist_fourth, :date, :price)
    end
end
