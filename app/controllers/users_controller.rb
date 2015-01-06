class UsersController < ApplicationController

  def exp 

    item = Item.find(Monster.find(params[:monster_id]).equip_drop) # looking items in monster

    Box.chance(params[:monster_id], user, item) # HZ sho eto za nah

    exp_for_lvl = [0, 660, 1080, 1800, 2640, 3840, 4560, 5040, 5460, 6000, 6600, 7200, 7320, 7620, 8040, 8820, 9600, 10080, 10560, 11040] # array with exp ponts per lvl 
    render nothing: true # ????????????
    user.update(exp: user.exp + params[:exp].to_i) # update user params and make in integer 
    if user.exp > user.next  # if user EXP more then 100% per lvl  add points 
      user.update(next: exp_for_lvl[user.lvl + 1], statpoint: user.statpoint + 1, lvl: user.lvl + 1) # update user params if LVL UP (work with counts. add +1 lvl and + 1 free point)
    end

  end

  def location
    render nothing: true
    user.update(location: params[:location]) # nothing to do there now
  end


  def show
  end


  def stats
    render nothing: true
    if user.statpoint > 0 
      if params[:str]
        user.update(str: user.str + 1, statpoint: user.statpoint - 1) # loop with points. if add 1 point in STR or LUX , then remove 1 point in general counter
      elsif params[:luk]
        user.update(luk: user.luk + 1, statpoint: user.statpoint - 1)
      end
    end
  end

  private

    def user
      current_user
    end


end