class ImportLinesController < ApplicationController
  before_filter :set_import_line, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @import_lines = ImportLine.all
    respond_with(@import_lines)
  end

  def show
    respond_with(@import_line)
  end

  def new
    @import_line = ImportLine.new
    respond_with(@import_line)
  end

  def edit
  end

  def create
    @import_line = ImportLine.new(params[:import_line])
    @import_line.save
    respond_with(@import_line)
  end

  def update
    @import_line.update_attributes(params[:import_line])
    respond_with(@import_line)
  end

  def destroy
    @import_line.destroy
    respond_with(@import_line)
  end

  private
    def set_import_line
      @import_line = ImportLine.find(params[:id])
    end
end
