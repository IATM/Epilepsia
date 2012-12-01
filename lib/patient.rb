class Patient
  include DataMapper::Resource
  has n, :reportes

  property :id, Serial
  property :patid, String, :unique_index => true
  property :name, String, :unique_index => true
  property :age, Integer
  property :sex, String
  
  
  #validates_uniqueness_of :patid, :scope => :name
  
   
end
