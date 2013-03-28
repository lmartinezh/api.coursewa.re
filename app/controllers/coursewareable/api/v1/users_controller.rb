module Coursewareable::Api::V1
  # [Coursewareable::User] API controller
  class UsersController < ApplicationController

    # Handles user profile
    def me
      render :json => current_user
    end

  end
end
