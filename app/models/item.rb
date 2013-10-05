class Item < ActiveRecord::Base

	has_attached_file :avatar , {
		:styles => {
			:thumb => ["64x64#","png"],
			:small => ["128x128>" , "png"],
			:medium => ["256x256>" , "png"],
			:large => ["512x512>" , "png"]
		},
		:convert_options => {
			:thumb => "-gravity Center -crop 64x64+0+0",
		}
	}

	attr_accessible :author, :id, :name , :point , :avatar,:tag_txt
	attr_accessor :tag_txt #tag初期化用データベースにはカラムなし

	acts_as_taggable

end
