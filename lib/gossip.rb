require 'csv'

class Gossip
	attr_accessor :author, :content

	def initialize(author, content)
		@author = author
		@content = content
	end

	def save
		CSV.open("./db/gossip.csv", "ab") do |csv|
			csv << [@id, @author, @content]
		end
	end

	def self.all
		all_gossips = []
		CSV.read("./db/gossip.csv").each do |csv_line|
			all_gossips << Gossip.new(csv_line[1],csv_line[2])
		end
		return all_gossips
	end

	def self.find(id)
		return Gossip.all[id-1]
	end

end