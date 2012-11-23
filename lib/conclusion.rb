class Conclusion
    include DataMapper::Resource
    property :id, Serial
    property :rm, String
    property :hemisferio, String
    property :sospecha, String
    property :correlacion, String
    
    belongs_to :reporte
end