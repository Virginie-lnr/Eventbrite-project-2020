class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  # order by most recents first
  def index
    @events = Event.all.order('created_at DESC')
  end

  def new 
    @event = Event.new
  end 

  def show 
    @event = Event.find(params['id'])
  end

  def create
    @event = Event.new(admin: current_user,
                       title: params[:event][:title],
                       start_date: params[:event][:start_date],
                       duration: params[:event][:duration],
                       description: params[:event][:description],
                       price: params[:event][:price],
                       location: params[:event][:location]
                       )
    if @event.save
      flash[:success] = "L'évènement a été créé avec succès!"
      redirect_to root_path
    else
      flash[:error] = "L'évènement n'a pas pu être créé..."
      render 'new'
    end
  end
end
