class Patient
  include DataMapper::Resource
  has n, :reportes

  property :id, Serial
  property :patid, String, unique: true # Ciego
  property :name, String # Ciego
  property :code, String
  property :age, Integer
  property :sex, String

end
