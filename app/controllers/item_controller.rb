class ItemController < ApplicationController
  skip_before_action :verify_authenticity_token

  respond_to :json

  def all
    @items = Item.all
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      @message = "Created item #{@item.name} succesfully!"
    else
      @message = "Error during item creation!"
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item
      if @item.update!(item_params)
        @message = "Updated item succesfully!"
      else
        @message = "Updating item failed!"
      end
    else
      @message = "Item not found!"
    end
  end

  def show
    @item = Item.find(params[:id])
    @message = "Found #{@item.name}"
  end

  def delete
    item = Item.find(params[:id])
    @message = "Deleted item #{item.name}"
    item.destroy
  end

  private
    def item_params
      params.require(:item).permit(:name)
    end
end
