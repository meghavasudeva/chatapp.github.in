class User < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :part_number
  
  #def self.to_csv
   # CSV.generate do |csv|
     #csv << cols
       #cols=["name","part_number"]
      #all.each do |user|
       # csv << user.attributes.values_at(*cols)
     # end
    #end
 # end
end
