class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :login_required
  private
  def login_required
    redirect_to new_session_path unless logged_in?
  end
end