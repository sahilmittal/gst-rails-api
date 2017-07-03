require 'csv'

desc "Import data from csv file"
task :import => [:environment] do

  # categories
  file = "vendor/categories.csv"
  CSV.foreach(file, :headers => false) do |row|
    Category.create ({
      :name => row[1]
    })
  end

  # goods
  file = "vendor/goods.csv"
  CSV.foreach(file, :headers => false) do |row|
    Good.create ({
      :category_id => row[0],
      :name => row[1],
      :gst => row[2]
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