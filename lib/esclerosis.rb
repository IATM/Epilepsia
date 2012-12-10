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
  property :hallazgos_extrahipo, Boolean
  property :descripcion_hallazgos, Text
  

  belongs_to :reporte

end
