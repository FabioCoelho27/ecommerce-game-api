module Admin::V1
  class CategoriesController < ApiController
    before_action :load_category, only: [:show, :update, :destroy]

    def index
      game_licenses = License.where(game_id: params[:game_id])
      @loading_service = Admin::ModelLoadingService.new(game_licenses, searchable_params)
      @loading_service.call
    end

    def create
      @license = License.new(game_id: params[:game_id])
      @license.attributes = license_params
      save_license!
    end

    def show; end

    def update
      @license.attributes = license_params
      save_license!
    end

    def destroy
      @license.destroy!
    rescue
      render_error(fields: @license.errors.messages)
    end

    private

    def load_license
      @license = License.find(params[:id])
    end

    def searchable_params
      params.permit({ search: :name }, { order: {} }, :page, :length)
    end

    def category_params
      return {} unless params.has_key?(:license)
      params.require(:license).permit(:id, :key)
    end

    def save_license!
      @license.save!
      render :show
    rescue
      render_error(fields: @license.errors.messages)
    end
  end
end