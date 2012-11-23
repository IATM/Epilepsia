class Displasia
  include DataMapper::Resource
  belongs_to :reporte

  property :id, Serial
  property :hiperintensidad, Boolean
  property :diferenciacion_grisblanca, Boolean
  property :engrosamiento, Boolean
  property :transmato, Boolean
  property :circunvoluciones, Boolean
  property :reformateo, Boolean
  property :discircunvolucion, Text
  property :dislobulo, Text
  property :dishemisferio, Text
end
