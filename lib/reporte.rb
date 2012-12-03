class Reporte
  include DataMapper::Resource
  belongs_to :patient
  has 1, :esclerosi
  has 1, :displasia
  has 1, :malformacion
  has 1, :tumor
  has 1, :conclusion

  property :id, Serial
  property :accession, String # Ciego
  property :equipo, String # 1.5T o 3.0T
  property :fecha, String # Buscar para poner automatico
  property :radiologo, String # Select
end
