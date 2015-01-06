class MainController < ApplicationController

  # Demand , authorization for any action 
    before_action :authenticate_user!

  # Page for fight
    def fight
      @str = current_user.str # 
    end

  # New monster in JSON format
    def monster
      # find in Map model   user, location and monsters
      @monster = Map.find_by_name(current_user.location).monsters.sample

      # render json params  for user and monster (search at main/fight.slim)
      respond_to do |format|
        format.json {render json: {user: current_user, monster: @monster}}
      end

    end

  # Специальный тестовый экшен для Лиса =D
    def fox
      current_user.update(str: 15, exp: 640)
      redirect_to root_path
    end

end