class Tumor
    include DataMapper::Resource
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
    
    
    belongs_to :reporte
    
end