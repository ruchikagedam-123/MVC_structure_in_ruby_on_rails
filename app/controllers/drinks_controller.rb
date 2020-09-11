class DrinksController < ApplicationController

    def index
        #will have template
        @drinks = Drink.all
    end

    def show
         #will have template
         @drink = Drink.find(params[:id])
    end

    def new
         #will have template
         @drink = Drink.new
    end

    def create
        #will save and redirect
        @drink = Drink.new(allowed_param)

        if @drink.save
            #If data saved then redirect to drink controller
            redirect_to drinks_path
        else
            renderer 'new'
        end

    end

    def edit
         #will have template
         @drink = Drink.find(params[:id])
    end

    def update
         #will save and redirect
         @drink = Drink.find(params[:id])

        if @drink.update_attributes(allowed_param)
            #If data saved then redirect to drink controller
            redirect_to drinks_path
        else
            renderer 'index'
        end

    end

    def destroy
        #will save and redirects
        @drink = Drink.find(params[:id])

        @drink.destroy
        redirect_to drinks_path
    end

    #Just to make sure that data should be present at the time of Insertion 
    private
        def allowed_param
                params.require(:drink).permit(:name,:size)
        end
end
