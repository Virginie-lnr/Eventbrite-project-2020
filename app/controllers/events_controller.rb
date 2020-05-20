class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  skip_before_action :verify_authenticity_token

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
                       location: params[:event][:location])
      # @event.avatar_event.attach(params[:avatar_event])
                       
    if @event.save
      flash[:success] = "L'évènement a été créé avec succès!"
      redirect_to root_path
    else
      flash[:error] = "L'évènement n'a pas pu être créé..."
      render 'new'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

  def edit 
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    event_params = params.require(:event).permit(:title, :description, :avatar)
    if @event.update(event_params)
      flash[:success] = "L'évènement a été modifié avec succès!"
      redirect_to events_path
    else
      flash[:error] = "L'évènement n'a pas pu être modifié..."
      render :edit
    end
  end

  def subscribe 
   
    @event = Event.find(params[:id])
    if @event.users.include? current_user 
      flash[:error] = "Vous participez déjà à l'évènement"
      redirect_to event_path
      return
    end  

    @amount = @event.price

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })
 
    @event.users << current_user
    flash[:success] = "Vous participez à l'évènement"
    redirect_to event_path

    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to event_path
  end
end
