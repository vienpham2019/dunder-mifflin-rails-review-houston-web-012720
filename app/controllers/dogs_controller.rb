class DogsController < ApplicationController

    before_action :current_dog, only: [:show, :edit, :update, :delete]
    
    def index
        @dogs = Dog.all 
    end

    def show
        
    end

    private 
        def current_dog
            @dog = Dog.find(params[:id])
        end
end
