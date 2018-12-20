class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]

    def index
      @items = Item.all
      #implicit index render
    end

    def new
      @item = Item.new
      #implicit new render
    end

    def create
      # byebug
      #create new instance
      @item = Item.new(item_params)
      #if valid, save to db, if not render new page again with fields still filled out
      if @item.save
        # byebug
        render :show
      else
        # byebug
        # flash[:errors] = @item.errors.full_messages
        @errors = @item.errors.full_messages
        render :new
      end
    end

    def edit
      #implicit edit render
    end

    def update
      #if valid, save to db, if not render new page again with fields still filled out
      if @item.update(item_params)
        # byebug
        redirect_to @item
      else
        @errors = @item.errors.full_messages
        render :edit
      end
    end

    def destroy
      @item.destroy
      redirect_to items_path
    end


  private
    ###private methods
    def item_params
      params.require(:item).permit(:name, :cost, :attendee_id)
    end

    def find_item
      @item = Item.find(params[:id])
    end

end
