class Esclerosi
    include DataMapper::Resource
    property :id, Serial
    property :atrofia_subj, Boolean
    property :hiperintensidad, Boolean
    property :estructura_anormal, Boolean
    property :volumen, Integer
    property :esclerosis_derecha, Boolean
    property :esclerosis_izquierda, Boolean
    property :esclerosis_bilateral, Boolean
    
    
     belongs_to :reporte
     belongs_to :patient
    
end