class CrudController < ApplicationController
  before_filter :set_entity, only: [:edit, :update, :deactivate, :activate]

  def initialize
    super
    @entity_class = controller_name.singularize.camelize.constantize
  end

  def index
    params[:q] ||= {activated_true: 1}
    #@q = @entity_class.ransack(params[:q])
    @q = @entity_class
    #@q.sorts = get_default_sorting if @q.sorts.empty?
    #instance_variable_set("@#{controller_name}", @q.result(distinct: false).includes(get_includes).page(params[:page]))
    instance_variable_set("@#{controller_name}", @q.all)
    instance_variable_set("@q", @q)
  end

  def edit
    instance_variable_set("@#{controller_name.singularize}", @entity)
  end

  def new
    instance_variable_set("@#{controller_name.singularize}", @entity_class.new)
  end

  def create
    @entity = @entity_class.new(entity_params)

    if @entity.save
      redirect_to action: :index, notice: t(:record_saved)
    else
      instance_variable_set("@#{controller_name.singularize}", @entity) 
      render :new
    end
  end

  def update
    if @entity.update(entity_params)
      redirect_to action: :index, notice: t(:record_updated)
    else
      instance_variable_set("@#{controller_name.singularize}",@entity)
      render :edit
    end
  end

  def deactivate
    @entity.update_attribute(:activated, false)
    redirect_to action: :index, notice: t(:record_deactivated)
  end

  def activate
    @entity.update_attribute(:activated, true)
    redirect_to action: :index, notice: t(:record_activated)
  end

  private
    def set_entity
      @entity = @entity_class.find(params[:id])
    end

    def entity_params
      params.require(controller_name.singularize).permit(@entity_class.attribute_names)
    end

    def get_default_sorting
      instance_variable_get("@default_sorting_attributes").collect {|x| "#{x.to_s} asc"}
    end

    def get_includes
      instance_variable_get("@include_attributes")
    end
end