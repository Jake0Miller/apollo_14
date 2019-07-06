class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job
  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  def self.average_age(astronauts)
    tot = astronauts.sum {|astro| astro.age}.to_f
    (tot / astronauts.length).round(1)
  end
end
