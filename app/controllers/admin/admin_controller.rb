class Admin::AdminController < ApplicationController
  before_filter :check_if_admin
  layout 'layouts/admin'

  def check_if_admin
    unless current_user_is_admin?
      flash[:error] = "Not Allowed"
      redirect_to root_url
    end
  end
end