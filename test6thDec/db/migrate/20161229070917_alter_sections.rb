class AlterSections < ActiveRecord::Migration
  
  def up
  rename_column("sections", "visibel", "visible")
  end


  def down
  	rename_column("sections", "visible", "visibel")
  end

end
