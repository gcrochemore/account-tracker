class ThirdPartiesController < ApplicationController
  before_filter :set_third_party, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @third_parties = ThirdParty.all
    respond_with(@third_parties)
  end

  def show
    respond_with(@third_party)
  end

  def new
    @third_party = ThirdParty.new
    respond_with(@third_party)
  end

  def edit
  end

  def create
    @third_party = ThirdParty.new(params[:third_party])
    @third_party.save
    respond_with(@third_party)
  end

  def update
    @third_party.update_attributes(params[:third_party])
    respond_with(@third_party)
  end

  def destroy
    @third_party.destroy
    respond_with(@third_party)
  end

  private
    def set_third_party
      @third_party = ThirdParty.find(params[:id])
    end
end
