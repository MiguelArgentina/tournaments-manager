module DryController
  extend ActiveSupport::Concern

  included do
    before_action :set_resource_class
    before_action :set_index, only: :index
    before_action :set_show, only: [:show, :edit, :update, :destroy, :update_registration]
  end

  def index
  end

  def show; end

  def new
    @resource = resource_class.new
  end

  def edit; end

  def create
    @resource = resource_class.new(resource_params)
    if @resource.save
      flash[:notice] = I18n.t('views.common.created.success', name: resource_class.model_name.human)
      redirect_to("/" + controller_path)
    else
      flash.now[:error] = I18n.t('views.common.created.error', name: resource_class.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @resource.update(resource_params)
      flash[:notice] = I18n.t('views.common.updated.success', name: resource_class.model_name.human)
      redirect_to("/" + controller_path)
    else
      flash.now[:error] = I18n.t('views.common.updated.error', name: resource_class.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @resource.destroy
      flash[:notice] = I18n.t('views.common.destroyed.success', name: resource_class.model_name.human)
      redirect_to("/" + controller_path)
    else
      flash.now[:error] = I18n.t('views.common.destroyed.error', name: resource_class.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def resource_class
    if controller_path == 'users'
      'Account'.classify.constantize
    else
      controller_path.classify.constantize
    end
  end

  def set_index
    # params[:order] = :created_at, :updated_at
    # params[:sort] = :asc, :desc
    order = params[:order].present? ? params[:order].to_s : "updated_at"
    sort  = params[:sort].present? ? params[:sort].to_s : "desc"

    @resources = @resource_class.all
    # @resources = @resource_class.all.page(params[:page])
    # @resources = @resources.unscope(:order).order("#{order} #{sort}") if params[:order].present?
  end

  def set_show
    @resource = resource_class.find(params[:id])
  end

  def set_resource_class
    @resource_class = resource_class
  end
end
