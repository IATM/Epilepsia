require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'dm-validations'
require File.join(File.dirname(__FILE__), 'environment')


configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

error do
  e = request.env['sinatra.error']
  Kernel.puts e.backtrace.join("\n")
  'Application error'
end

helpers do
  # add your helpers here
end

get '/' do
  erb:form
end

post '/confirmacion' do
  
  begin
   
    #pat=Patient.where(params[:patient]).first_or_create!
    pat=Patient.first_or_create(params[:patient])
   # puts pat.valid_for_default?
   puts pat.inspect
    
      #pat = Patient.create(params[:patient])
      rep = pat.reportes.new(params[:reporte])
      rep.esclerosi = Esclerosi.new(params[:esclerosi])
      rep.displasia = Displasia.new(params[:displasia])
      rep.malformacion = Malformacion.new(params[:malformacion])
      rep.tumor = Tumor.new(params[:tumor])
      rep.conclusion = Conclusion.new(params[:conclusion])
      pat.save

    puts "*******************Patient Saved!"
    erb:confirmation, locals: {patient: pat, reporte:rep, esclerosi:rep.esclerosi, displasia:rep.displasia, malformacion:rep.malformacion, tumor:rep.tumor, conclusion:rep.conclusion}
  rescue DataMapper::SaveFailureError => e
    puts "*******************Patient not saved!...reason: "
    puts e.resource.errors.inspect
  end

  # if pat.save
  #   puts "*******************Patient Saved!"
  #   erb:confirmation, locals: {patient: pat}
  # else
  #   puts "*******************ERROR - Patient not saved!"
  #   redirect '/'
  # end
end

post '/Buscar' do 

erb:search




 end
