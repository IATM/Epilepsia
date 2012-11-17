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
	patient = Patient.new(params[:patient])

	if patient.save
		puts "*******************Patient Saved!"
		erb:confirmation, locals: {patient: patient}
	else
		puts "*******************ERROR - Patient not saved!"
		redirect '/'
	end
end