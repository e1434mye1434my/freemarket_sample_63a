class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :set_categories

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :first_name, :last_name, :first_furigana, :last_furigana, 
    :birthday, :post_number, :prefecture_id, :municipality, :house_number, :tel, :icon])
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == '63_mercari_wa' && password == '63wa'
    end
  end

  def set_categories
    @parents = Category.where(ancestry: nil)
  end
end
