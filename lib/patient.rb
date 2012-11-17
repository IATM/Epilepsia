class Patient
    include DataMapper::Resource
    property :id, Serial
    property :patid, String
    property :name, String
    property :age, Integer
    property :sex, String
end