class Patient
  include DataMapper::Resource
  has n, :reportes

  property :id, Serial
  property :patid, String, :unique => true
  property :name, String
  property :age, Integer
  property :sex, String
  validates_uniqueness_of :patid
end
