# == Schema Information
#
# Table name: characters
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  actor_id   :integer
#  movie_id   :integer
#
class Character < ApplicationRecord
  def movie
    foreign_key = self.movie_id

    matching_set = Movie.where({ :id => foreign_key })

    result = matching_set.at(0)

    return result
  end
end
