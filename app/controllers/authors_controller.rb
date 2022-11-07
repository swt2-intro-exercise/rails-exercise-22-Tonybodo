class AuthorsController < ApplicationController

    def index
        @authors = Author.all 
    end
    
    def new
        @author = Author.new
    end

    def show
        @author = Author.find(author_id_params)
    end

    def create
        @author = Author.new(author_params)
        if @author.save
            redirect_to @author, notice: 'Success!'
        else
            render 'new'
        end
    end

    private
        def author_params
            params.require(:author).permit(:first_name, :last_name, :homepage)
        end
    
    private 
        def author_id_params
            params.require(:id)
        end
end
