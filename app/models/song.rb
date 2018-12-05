class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  before_save 

  

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
     self.artist ? self.artist.name : nil
  end

  def genre_id=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_id
     self.genre ? self.genre.name : nil
  end

  def note_contents=(notes)
    notes.each {|n| self.notes << Note.new(content: n) if n != ""}
  end

  def note_contents
    self.notes.collect { |n| n.content }
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
     self.genre ? self.genre.name : nil
  end

  # def song_notes=(notes)
  #   notes.each {|n| self.notes << n}
  # end

  # def song_notes
  #   self.notes
  # end
end
