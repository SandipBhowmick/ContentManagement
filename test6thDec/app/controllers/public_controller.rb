class PublicController < ApplicationController
  
	layout 'public'

    before_action :setup_nevigation

  	def index
  	end



  	def show
  		@page = Page.where(:parmalink =>params[:permalink], :visible =>true).first
  		if @page.nil?
  			redirect_to(:action => 'index')

  		else
  		end
  	
  	end

    private

    def setup_nevigation
      @subjects = Subject.visible.sorted
    end
end
