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
  validates(:director_id, presence: true)
  validates(:title, uniqueness: true)

  #belongs_to(:director, class_name: "Director", foreign_key: "director_id")
#  def director
#    d_id = self.director_id
#
#    matching_directors = Director.where({ :id => d_id })
#
#    the_director = matching_directors.first
#
#    return the_director
#  end

  #has_many(:characters, :class_name: "Character", :foreign_key: "movie_id")

  # burada actor association'un adi, table adi degil.
  # soyle dusun: actor yonu one to many yonunde (normal yonunde gidiyor), sonra characters'in ters yonunde gidiyor
  #has_many(:cast, through: :characters, source: :actor)
  belongs_to(:director, :class_name => "Director", :foreign_key => "director_id")

  has_many(:characters, :class_name => "Character", :foreign_key => "movie_id")
  
  has_many(:cast, :through => :characters, :source => :actor)
end
