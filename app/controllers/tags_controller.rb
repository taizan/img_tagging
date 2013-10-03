class TagsController < ApplicationController

  def index
	if params[:key]
		
	else
		@tags = ActsAsTaggableOn::Tag.all
	end

	respond_to do |format|
      		format.html
      		format.json { render json: @tags }
	end
  end

end

