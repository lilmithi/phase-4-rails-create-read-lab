class PlantsController < ApplicationController
    def index
        render json: Plant.all, except:[:created_at, :updated_at], status: :ok
    end

    def show
        plant=Plant.find_by(id: params[:id])
        render json: plant, except: [:created_at, :updated_at]
    end

    def create
        plant=Plant.create(plants_params)
        render json: plant, except: [:created_at, :updated_at], status: :created
    end

    private

    def plants_params
        params.permit(:name, :image, :price)
    end
end
