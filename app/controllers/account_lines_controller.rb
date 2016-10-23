class AccountLinesController < ApplicationController
  before_filter :set_account_line, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @account_lines = AccountLine.all
    respond_with(@account_lines)
  end

  def show
    respond_with(@account_line)
  end

  def new
    @account_line = AccountLine.new
    respond_with(@account_line)
  end

  def edit
  end

  def create
    @account_line = AccountLine.new(params[:account_line])
    if @account_line.label.nil? && !@account_line.third_party.label.nil?
      @account_line.label = @account_line.third_party.label
    end
    @account_line.save
    respond_with(@account_line)
  end

  def update
    @account_line.update_attributes(params[:account_line])
    if @account_line.label.nil? && !@account_line.third_party.label.nil?
      @account_line.label = @account_line.third_party.label
      @account_line.save
    end
    respond_with(@account_line)
  end

  def destroy
    @account_line.destroy
    respond_with(@account_line)
  end

  private
    def set_account_line
      @account_line = AccountLine.find(params[:id])
    end
end
