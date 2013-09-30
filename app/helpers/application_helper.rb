module ApplicationHelper
	
	def tag_cloud(tags,classes)
		max = tags.sortbay(&:count).last
		tag.each do |tag|
			index = tag.count.to_f / max.count * (classes.size - 1)
			yield(tag, classes[index.round])
		end
	end

end
