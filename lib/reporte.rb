class Reporte
  include DataMapper::Resource
  belongs_to :patient
  has 1, :esclerosi
  has 1, :displasia
  has 1, :malformacion
  has 1, :tumor
  has 1, :conclusion

  property :id, Serial
  property :codigo, Integer
  property :fecha, String
  property :firma, String
end
