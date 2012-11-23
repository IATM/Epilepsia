class Tumor
  include DataMapper::Resource
  belongs_to :reporte

  property :id, Serial
  property :hiperintensidad, Boolean
  property :lesion, Boolean
  property :efecto_masa, Boolean
  property :nodulo, Integer
  property :calsificaciones, Boolean
  property :hallazgos, Text
  property :circunvolucion, Text
  property :lobulo, Text
  property :hemisferio, Text
end
