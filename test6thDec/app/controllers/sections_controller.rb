class SectionsController < ApplicationController
  
  layout "admin"

    before_action :confirm_logged_in
    before_action :find_page
  
  
  
  def index
    #@sections = Section.sorted
    @sections = @page.sections.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(:page_id => @page.id)
    @pages = @page.subject.pages.sorted
    @section_count = Section.count + 1 
  end

  def create
    @section = Section.new(section_params)
    if @section.save 
      flash[:notice]= "Section created successfully."
      redirect_to(:action =>'index', :page_id =>@page.id)
    else
      @pages = @page.subject.pages.sorted
      @section_count = Section.count + 1 
      render('new')
    end

  end

    
  def edit
    @section = Section.find(params[:id])
    @pages = @page.subject.pages.sorted
    @section_count = Section.count 
  end

  def update
    @section = Section.find(params[:id])

    
    #@pages = @page.subject.pages.sorted
    if @section.update_attributes(section_params)
      @a=@section_id
      flash[:notice]= "Section updated successfully."
      redirect_to({:action => 'show',:section_id=>@a, :page_id =>@page.id})
    else
      @pages = @page.subject.pages.sorted
      @section_count = Section.count
      #@pages = Page.order('position ASC')
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end


  def destroy
     section = Section.find(params[:id]).destroy
     flash[:notice]= "Section '#{section.name}' destroyed successfully."
     redirect_to(:controller=>'section',:page_id =>params[:page_id])
     #redirect_to(:action => 'index', :page_id => @page.id)
  end
  
  
  def find_page
    if params[:page_id]
      @page=Page.find(params[:page_id])
    end
  end

  private

  def section_params
    params.require(:section).permit(:page_id,:name, :position, :visibel, :content_type, :content)
  end 


  

  


end