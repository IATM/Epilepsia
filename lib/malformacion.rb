class Malformacion
    include DataMapper::Resource
    property :id, Serial
    property :centro_hipert, Boolean
    property :senal_peri, Boolean
    property :anillo_hipo, Boolean
    property :vaso, Boolean
    property :hallazgo_mv, Text
    property :circunvolucion, Text
    property :lobulo, Text
    property :hemisferio, Text
   
    belongs_to :reporte
    
end


