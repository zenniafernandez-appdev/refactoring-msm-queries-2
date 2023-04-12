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

  # has_many(:characters)
  has_many(:characters, { :class_name => "Character", :foreign_key => "actor_id" })
  has_many(:filmography, { :through => :characters, :source => :movie })

  # def characters
  #   key = self.id

  #   the_many = Character.where({ :actor_id => key })

  #   return the_many
  # end

  # def filmography
  #   the_many = Array.new

  #   self.characters.each do |joining_record|
  #     destination_record = joining_record.movie

  #     the_many.push(destination_record)
  #   end

  #   return the_many
  # end

  
  # if you want to find the directors of the movies an actor has been in:
  #   has_many(:directors, { :through => :filmography, :source => :director })

end
