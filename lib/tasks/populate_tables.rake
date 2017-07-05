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
      :category_id => row[0],
      :name => row[2],
      :gst => row[3]
    })
  end

  # services
  file = "vendor/services.csv"
  CSV.foreach(file, :headers => false) do |row|
    Service.create ({
      :name => row[0],
      :gst => row[1]
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