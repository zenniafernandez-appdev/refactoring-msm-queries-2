# == Schema Information
#
# Table name: directors
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :date
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Director < ApplicationRecord

  # cannot be abbreviated to has_many(:movies) because the method is called filmography, so you need more specification

  has_many(:filmography, { :class_name => "Movie", :foreign_key => "director_id" })


  # def filmography
  #   key = self.id

  #   the_many = Movie.where({ :director_id => key })

  #   return the_many
  # end
end
