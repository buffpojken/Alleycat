task :cron => :environment do 
  fq = Foursquare2::Client.new(:client_id => configatron.fq_id, :client_secret => configatron.fq_sec)
  fq.venue_categories.each do |main_category|    
     location = Location.find_or_create_by_name(main_category.name, :icon_url => main_category.icon)     
     main_category.categories.each do |category|
       sub_location = Location.find_or_create_by_foursquare_id(:foursquare_id => category.id, :name => category.name, :icon_url => category.icon, :parent_location_id => location.id)
       puts sub_location.inspect
     end    
  end
end