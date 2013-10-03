class ItemsController < ApplicationController
	before_filter :get_model, :only => [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
		if params[:tag]
			@items = Item.tagged_with( params[:tag] )
		#else if params[:search_word]
		else
			@items = Item.all
		end
		get_tag_all
		

    @item = Item.new
		set_format
  end

  # GET /items/1
  # GET /items/1.json
  def show
		get_tag
		set_format
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new
		set_format
  end

  # GET /items/1/edit
  def edit
		get_tag
  end

  # POST /items
  # POST /items.json
  def create
		@item = Item.new(params[:item])
		set_tag

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
		set_tag
    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
		@item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end
	
	private
		
	def get_model
		@item = Item.find(params[:id])
	end

	def get_tag
		@item[:tag_txt] = @item.tag_list.join(',')
	end

	def set_tag
		@item.tag_list= params[:item][:tag_txt]
	end

	def get_tag_all
		@items.each do |item|
			item[:tag_txt] = item.tag_list.join(',')
		end
	end

	def set_format
		respond_to do |format|
      format.html
      format.json { render json: @item }
    end
	end
end
