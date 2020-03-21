class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :set_category

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == '63_mercari_wa' && password == '63wa'
    end
  end

  def set_category
    @parents = Category.where(ancestry: nil)
  end
end
