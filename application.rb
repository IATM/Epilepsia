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

post '/form' do
  @pat=Patient.get(params[:patient][:id].to_i)
  rep=@pat.reporte.new(params[:reporte])
  erb:form, locals: {patient: @pat, reporte: rep}
end

post '/confirmacion' do

  @rep = rep
  @rep.esclerosi = Esclerosi.new(params[:esclerosi])
  @rep.displasia = Displasia.new(params[:displasia])
  @rep.malformacion = Malformacion.new(params[:malformacion])
  @rep.tumor = Tumor.new(params[:tumor])
  @rep.conclusion = Conclusion.new(params[:conclusion])

  if @rep.save
    puts "*******************Report Saved!"
    flash[:notice] = "El reporte se ha guardado satisfactoriamente"
    erb:confirmation, locals: {reporte: @rep, esclerosi: @rep.esclerosi, displasia: @rep.displasia, malformacion: @rep.malformacion, tumor: @rep.tumor, conclusion: @rep.conclusion}
  else
    puts "*******************Patient not saved! "
    flash[:error] = @rep.errors.full_messages.join(",")
    redirect '/'
  end
end

post '/Buscar' do
  erb:search
end