class LayoutsController < ApplicationController
  before_action :set_layout, only: [:show, :edit, :update, :destroy]

  # GET /layouts
  # GET /layouts.json
  def index
    @layouts = Layout.all
  end

  # GET /layouts/1
  # GET /layouts/1.json
  def show
  end

  # GET /layouts/new
  def new
    @layout = Layout.new
  end

  # GET /layouts/1/edit
  def edit
  end

  # POST /layouts
  # POST /layouts.json
  def create
    @layout = Layout.new(layout_params)

    respond_to do |format|
      if @layout.save
        format.html { redirect_to layouts_url, notice: 'Layout was successfully created.' }
        format.json { render :show, status: :created, location: @layout }
      else
        format.html { render :new }
        format.json { render json: @layout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /layouts/1
  # PATCH/PUT /layouts/1.json
  def update
    respond_to do |format|
      if @layout.update(layout_params)
        format.html { redirect_to layouts_url, notice: 'Layout was successfully updated.' }
        format.json { render :show, status: :ok, location: @layout }
      else
        format.html { render :edit }
        format.json { render json: @layout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /layouts/1
  # DELETE /layouts/1.json
  def destroy
    @layout.destroy
    respond_to do |format|
      format.html { redirect_to layouts_url, notice: 'Layout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_layout
      @layout = Layout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def layout_params
      params.require(:layout).permit(:name, :sections)
    end
end
