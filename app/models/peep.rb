class Peep
include DataMapper::Resource

  property :id, Serial
  property :content, Text, required: true, length: 1..140
  property :created_at, DateTime

  has n, :replies
  belongs_to :user

end