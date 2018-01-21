class RestaurantsController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]
  #before_action :set_restaurant, only: [:edit, :update, :destroy]
  after_action :verify_authorized, except: [:index, :show] 
  #after_action :verify_policy_scoped, only: :index

  def index
   # @restaurants = policy_scope(Restaurant).reverse
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = current_user.restaurants.new
    #authorize @restaurant
    authorize @user
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = current_user.restaurants.create(restaurant_params)
    #authorize @restaurant
     authorize @user
    flash[:notice] = "Restaurant Added Successfully"
    if @restaurant.save
      redirect_to(restaurants_path)
    else 
      render('new')
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
    if @restaurant.update_attributes(restaurant_params)

    flash[:notice] = "Restaurant Updated Successfully"
    #redirect_to(pages_path)
    redirect_to(restaurants_path(@restaurant))
    else
      render('edit')
    end
  end


  def delete
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
    @restaurant.destroy
    flash[:notice] = "Restaurant Deleted Successfully"
    redirect_to(restaurants_path)

  end

  private
  def set_restaurant
    @resturant = Restaurant.find(params[:id])
    authorize @restaurant
  end

  def restaurant_params
  params.require(:restaurant).permit(:name, :location, :cuisine, :service_charge, :vat, :contact)

  end



end
