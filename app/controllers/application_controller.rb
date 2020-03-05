class ApplicationController < ActionController::Base
  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == '63_mercari_wa' && password == '63wa'
    end
  end
end
