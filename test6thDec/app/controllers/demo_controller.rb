class DemoController < ApplicationController
 
  layout 'application'

  def index
  	render('index')
  end

  def hello
  	@abc = [1,2,3,4,5]
  	#render('hello')
  	@id = params[:id].to_i
  	@page = params['page'].to_i
  end
  
  def other_hello
  	redirect_to(:controller =>'demo', :action =>'index')
  	#render('index')
  	#redirect_to("http://google.com")
  end

  def text_helpers
  end

  def escape_output
  end

end
