class ThirdPartiesController < ApplicationController
  before_filter :set_third_party, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @third_parties = ThirdParty.order(:name).all
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
    if !params[:third_party][:merge_id].blank?
      #On merge les données
      to_update = AccountLine.where(third_party_id: params[:id])
      to_update.each do |update|
        update.third_party_id = params[:third_party][:merge_id]
        update.save
      end
      #on supprime l'ancien enregistrement
      @third_party.delete
      @third_party = ThirdParty.find(params[:third_party][:merge_id])
    else
      @third_party.update_attributes(params[:third_party])
    end   
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
