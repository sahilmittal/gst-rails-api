require 'csv'

desc "Populate tables in db"

task :import => [:environment] do

  Good.delete_all
  Category.delete_all
  Service.delete_all

  # categories
  file = "vendor/categories.csv"
  CSV.foreach(file, :headers => false) do |row|
    Category.create ({
      :id => row[0],
      :name => row[1]
    })
  end

  # goods
  file = "vendor/goods.csv"
  CSV.foreach(file, :headers => false) do |row|
    Good.create ({
      :id => row[0],
      :category_id => row[1],
      :name => row[3],
      :gst => row[4]
    })
  end

  # services
  file = "vendor/services.csv"
  CSV.foreach(file, :headers => false) do |row|
    Service.create ({
      :id => row[0],
      :name => row[1],
      :gst => row[2]
    })
  end

end

task :import_codes => [:environment] do

  Code.delete_all

  # Code
  file = "vendor/codes.csv"
  CSV.foreach(file, :headers => false) do |row|
    Code.create ({
      :id => row[0],
      :name => row[2],
      :code => row[1],
      :code_type => row[3]
    })
  end

end

task :update_resource_library => [:environment] do

  Resource.delete_all
  ResourceLibrary.delete_all
  
  rlcount = 0; rcount = 0
  Dir['vendor/Resource Library/*'].each do |rlname|
    rlcount += 1
    ResourceLibrary.create!(id: rlcount, name: rlname[/([^\/]+)$/])
    Dir["vendor/Resource Library/#{ rlname[/([^\/]+)$/] }/*"].each do |rname|
      rcount += 1
      Resource.create!(id: rcount, resource_library_id: rlcount, name: rname[/([^\/]+)$/].split(".pdf")[0])
    end
  end

end