class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!

  def render404
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end
end
