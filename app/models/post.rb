class Post < ApplicationRecord
  validates :title, :content, presence: true
end

# presence(存在)がtrue