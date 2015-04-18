class Chirp < ActiveRecord::Base
  belongs_to(:user)
  def to_s
    self.to_s
  end
end
