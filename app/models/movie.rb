# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord
  # Director has many -> Movies
  # Actor has many -> Characters
  # Movie has many -> Characters
  # These are three one to many (direct associations) in MSM -- supported by foreign key column in one of these tables
  # Many to many (indirect relationship) -- between Actors and Movies because you need to go through the joining table of Characters
  # Since there are 6 direct associations, we should define 6 association accessor methods to support the three one to manys

  # Director#filmography
  # Movie#director

  # Actor#characters
  # Character#actor

  # Movie#characters
  # Character#movie

  # has_many(:characters)
  has_many(:characters, { :class_name => "Character", :foreign_key => "movie_id" })

  # belongs_to(:director)
  belongs_to(:director, { :class_name => "Director", :foreign_key => "director_id" })


  # def characters
  #   my_id = self.id

  #   return Character.where({ :movie_id => my_id })
  # end

  # def director
  #   key = self.director_id

  #   matching_set = Director.where({ :id => key })

  #   the_one = matching_set.at(0)

  #   return the_one
  # end
end
