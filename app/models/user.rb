class User

  include DataMapper::Resource

  property :id, Serial
  property :name, Text

  # has n, :peeps, :through => Resource

end