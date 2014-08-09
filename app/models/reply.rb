class Reply
 include DataMapper::Resource

  property :id, Serial
  property :message, Text, required: true, length: 140
  property :created_at, DateTime

  belongs_to :user
  belongs_to :peep
end