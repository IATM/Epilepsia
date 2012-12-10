require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/flash'
require 'dm-validations'
require File.join(File.dirname(__FILE__), 'environment')

enable :sessions

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

helpers do
  # add your helpers here
end

get '/' do
  @patients = Patient.all
  erb:select_study, locals: {patients: @patients}
  end
  
get '/search' do
  puts "parametros search"
  puts params[:id].inspect
  erb:search
end
  
post '/form' do
  puts params[:reporte]
  puts params[:patient]
  @old=Reporte.first(:equipo=>params[:reporte][:equipo], :patient_id=>params[:patient][:id].to_i)
  puts @old.inspect
  if @old.nil?
    $pat=Patient.get(params[:patient][:id].to_i)
    $rep=$pat.reportes.new(params[:reporte])
    puts "paciente nuevo"
    erb:form, locals: {patient: $pat, reporte: $rep} 
  else 
    puts "El paciente ya ha sido creado"
    @pati=Patient.get(@old.patient_id.to_i)
    erb:update, locals:{report: @old, patient: @pati}
  end
end

post '/confirmacion' do
  puts $rep.inspect
  @rep = Reporte.create($rep.attributes)
  @rep.attributes=(params[:reporte])

  puts @rep.inspect
  @rep.esclerosi = Esclerosi.new(params[:esclerosi])
  @rep.displasia = Displasia.new(params[:displasia])
  @rep.malformacion = Malformacion.new(params[:malformacion])
  @rep.tumor = Tumor.new(params[:tumor])
  @rep.conclusion = Conclusion.new(params[:conclusion])
  @rep.save

  if @rep.save
    puts "*******************Report Saved!"
    flash[:notice] = "El reporte se ha guardado satisfactoriamente"
    erb:confirmation, locals: {patient: $pat,reporte: @rep, esclerosi: @rep.esclerosi, displasia: @rep.displasia, malformacion: @rep.malformacion, tumor: @rep.tumor, conclusion: @rep.conclusion}
  else
    puts "*******************Patient not saved! "
    flash[:error] = @rep.errors.full_messages.join(",")
    redirect '/'
  end
end

