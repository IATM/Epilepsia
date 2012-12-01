class Conclusion
  include DataMapper::Resource
  belongs_to :reporte

  property :id, Serial
  property :rm, String
  property :hemisferio, String
  property :sospecha, Text
  property :correlacion, String
end
