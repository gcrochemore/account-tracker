class LabelsController < ApplicationController
  before_filter :set_label, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @labels = Label.order(:name).all
    respond_with(@labels)
  end

  def show
    respond_with(@label)
  end

  def new
    @label = Label.new
    respond_with(@label)
  end

  def edit
  end

  def create
    @label = Label.new(params[:label])
    @label.save
    respond_with(@label)
  end

  def update
    @label.update_attributes(params[:label])
    respond_with(@label)
  end

  def destroy
    @label.destroy
    respond_with(@label)
  end

  private
    def set_label
      @label = Label.find(params[:id])
    end
end
