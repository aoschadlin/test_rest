require('ParallelRESTComms')

class PagesController < ApplicationController
  def home
  	# Retrieve information from the backend server
		comms = ParallelRESTComms.new({ :user_data => "http://localhost:4080/simplefi/user/1",
     		                            :account_data => "http://localhost:4080/simplefi/user/1" } )
		comms.run

  	jsonData = comms.get_result(:user_data).get_json
  	@id = jsonData[:id]
  	@firstName = jsonData[:firstName]
  	@lastName = jsonData[:lastName]
  	@url = jsonData[:url]
  end
end
