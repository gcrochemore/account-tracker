class ImportsController < ApplicationController
  before_filter :set_import, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @imports = Import.all
    respond_with(@imports)
  end

  def show
    respond_with(@import)
  end

  def new
    @import = Import.new
    respond_with(@import)
  end

  def edit
  end

  def create
    @import = Import.new
    @import.name = params[:import][:name]
    @import.file = params[:import][:file].read().force_encoding("UTF-8")
    @import.save
    respond_with(@import)
  end

  def update
    @import.name = params[:import][:name]
    @import.file = params[:import][:file].read()
    @import.save
    respond_with(@import)
  end

  def destroy
    @import.destroy
    respond_with(@import)
  end

  private
    def set_import
      @import = Import.find(params[:id])
    end
end
