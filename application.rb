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

  begin
    pat = Patient.create(params[:patient])
      rep = pat.reportes.new(params[:reporte])
      rep.esclerosi = Esclerosi.new(params[:esclerosi])
      rep.displasia = Displasia.new(params[:displasia])
    pat.save

    puts "*******************Patient Saved!"
    erb:confirmation, locals: {patient: pat}
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
