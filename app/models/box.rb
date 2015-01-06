# == Schema Information
#
# Table name: boxes
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  item_id         :integer
#  ea              :integer
#  format          :string(255)
#  equip_locations :integer
#  price           :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Box < ActiveRecord::Base

  def self.chance(monster, user, item)
    if rand(0.01..100) < Monster.find(monster).equip_chance
      self.create(
        user_id: user.id,
        item_id: item.id,
        ea:      1,
        format:  item.format,
        equip_locations: nil,
        price: item.price_sell)
    end
  end
end
