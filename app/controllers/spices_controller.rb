class SpicesController < ApplicationController
    def index
        render json: Spice.all, status: :ok
    end
    
    def show
        spice = Spice.find(params[:id])
        render json: spice, status: :ok
    end

#Create a spice
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    #Update an existing spice
    def update
        spice = Spice.find(params[:id])
        if spice.update(spice_params)
            render json: spice
        else
            render json: spice.errors, status: :no_good
        end
    end

#Delete a spice
    def destroy
        spice = Spice.find(params[:id])
        spice.destroy

        head :no_content
    end

    private

    #Strong paramaters
    def spice_params
        params.require(:spice).permit(:title, :image, :description, :notes, :rating)
    end
end
