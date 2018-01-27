class DowngradeController < ApplicationController
  def new
  end

  def create
    current_user.downgrade_user!

    flash[:notice] = "You have successfully downgraded your account."
    redirect_to root_path
  end
end
