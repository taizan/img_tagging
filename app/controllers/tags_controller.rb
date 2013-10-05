class TagsController < ApplicationController

  def index
		if params[:q]
			@tags = ActsAsTaggableOn::Tag.where('name like ?',"%"+params[:q]+"%")
		else
			@tags = ActsAsTaggableOn::Tag.all
		end

		respond_to do |format|
    	format.html
    	format.json { render json: @tags }
		end
  end

end

