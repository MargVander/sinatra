require 'csv'

class Gossip
	attr_accessor :author, :content

	def initialize(author, content)
		@author = author
		@content = content
	end

	def save
		CSV.open("./db/gossip.csv", "ab") do |csv|
			csv << [@author, @content]
		end
	end

	def self.all
		all_gossips = []
		CSV.read("./db/gossip.csv").each do |csv_line|
			all_gossips << Gossip.new(csv_line[0],csv_line[1])
		end
		return all_gossips
	end

	def self.find(id)
		return Gossip.all[id-1]
	end

	def self.update(id, content)
		lines = File.readlines("./db/gossip.csv")
		lines[params[id]] = "#{params["gossip_author"]},content"  << $/
		File.open('./db/gossip.csv', 'w') { |f| f.write(lines.join) }
	end

end