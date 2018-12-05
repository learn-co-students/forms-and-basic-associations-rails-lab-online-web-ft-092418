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

  def genre_id=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_id
    self.genre ? self.genre.name : nil
  end

  def note_contents=(content)
    content.each do |c|
      unless c == ""
        n = Note.find_or_create_by(content: c)
        self.notes << n
      end 
    end
  end

  def note_contents
    self.notes.map {|n| n.content}
  end

  def note_ids=(notes)
    notes.each do |n|
      note = Note.find_or_create_by!(content: n)
      self.notes << note if note
      self.notes.delete {|c| c.content == ""}
    end
  end

  def note_ids
    self.notes ? self.notes.content : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_by(name: name)
  end

  def genre_name
    self.genre.name
  end

end
