require 'rubygems'
require 'bundler/setup'
require 'sinatra'
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
	puts params
 

  #patient=Patient.new
  #displasia=Displasia.create(params[:displasia])
  #displasia.patient=Patient.new(params[:patient])
  #esclerosi=Esclerosi.new(params[:esclerosi]) 
  #esclerosi.save
  
 
  pat = Patient.create(params[:patient])
  #patient.save

  rep = pat.reportes.new(params[:reporte], esclerosi: params[:esclerosi])
  #reporte.patient=patient
  #reporte.save
  #puts rep.methods
  #esc = rep.esclerosi.new(params[:esclerosi])
  #esclerosi.reporte=reporte
  pat.save


    
	if patient.save
		puts "*******************Patient Saved!"
		erb:confirmation, locals: {patient: patient}
	else
		puts "*******************ERROR - Patient not saved!"
		redirect '/'
	end
end