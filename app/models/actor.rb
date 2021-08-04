# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :date
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Actor < ApplicationRecord
  def characters
    foreign_key = self.id

    matching_set = Character.where({ :actor_id => foreign_key })

    return matching_set
  end

  def filmography
    results_array = Array.new

    self.characters.each do |joining_record|
      results_array.push(joining_record.movie)
    end

    return results_array
  end

end
