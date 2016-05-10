class ChangesController < ApplicationController
  def index
    @changes = Change.order("id DESC")
  end

  def show
    @change = Change.find(params[:id])
  end
end
