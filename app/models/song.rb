class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_ids=(ids)
    ids.each do |id|
      note = Note.find_or_create_by(content: id)
      self.notes << note
    end
  end

  def note_contents=(content)
    #binding.pry
    content.delete("")
    content.each {|note_content| self.notes << Note.find_or_create_by(content: note_content)}
  end

  def note_contents
    #binding.pry
    a = self.notes.map {|note| note.content}
  end

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end
end
