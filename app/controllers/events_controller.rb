class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new 
    @event = Event.new
  end 

  def create 
    @event = Event.new(title: params[:title],
    description: params[:description],
    duration: params[:duration])
    # user: User.find(session[:auth]['id']))
    # User.find(params[:user])
    if @event.save
    redirect_to root_path
    else 
      render 'new'
    end
  end
end
