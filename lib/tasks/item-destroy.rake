task :aging => :environment do
	@items = Item.all
	before_count = @items.count
	@items.each do |item|
		item.destroy if ( ((Time.zone.now - item.created_at) / 3600) >= 168)
	end
	puts "#{before_count - @items.count} items deleted"
end