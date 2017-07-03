require 'csv'

desc "Import data from csv file"
task :import => [:environment] do

  # categories
  Category.delete_all
  file = "vendor/categories.csv"
  CSV.foreach(file, :headers => false) do |row|
    Category.create ({
      :id => row[0],
      :name => row[1]
    })
  end

  # goods
  Good.delete_all
  file = "vendor/goods.csv"
  CSV.foreach(file, :headers => false) do |row|
    Good.create ({
      :category_id => row[0],
      :name => row[2],
      :gst => row[3]
    })
  end

  # services
  Service.delete_all
  file = "vendor/services.csv"
  CSV.foreach(file, :headers => false) do |row|
    Service.create ({
      :name => row[0],
      :gst => row[1]
    })
  end

end