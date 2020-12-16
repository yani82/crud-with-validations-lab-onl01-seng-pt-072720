class Song < ApplicationRecord
    # or ActiveRecord::Base
    validates :title, presence: true, uniqueness: { scope: [:release_year, :artist_name], message: 'cannot be repeated by the same artist in the same year' }
    validates :released, inclusion: { in: [true, false] }
    validates :artist_name, presence: true 

    with_options if: :released? do |song| 
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: { allow_nil: true, less_than_or_equal_to: Date.current.year }
    end 

    def released?
        released 
    end 

    # validates :release_year, presence: true, if: :released?
    # validate :release_year_cannot_be_in_future
    # validate :artist_cannot_release_same_song_twice_per_year 
    # validates :title, uniqueness: { scope: :release_year } 
    # validates :title, uniqueness: { scope: :artist_name }
    # validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released?
    # validate :no_repeated_title 
    # validate :date_not_possible

    # def release_year_cannot_be_in_future
    #     if release_year.present? && release_year > Date.today.year
    #         errors.add(:release_year, "can't be released after today")
    #     end 
    # end 

    # def artist_cannot_release_same_song_twice_per_year
    # end 

    # def no_repeated_title
    #     if Song.any? {|s| s.title == title && s.artist_name == artist_name && s.release_year == release_year}
    #         errors.add(:title, "can't add the same song twice")
    #     end 
    # end 

    # def date_not_possible
    #     if release_year.present? && release_year > Date.today.year 
    #         errors.add(:release_year, "release year can't be in the future")
    #     end
    # end 
end 