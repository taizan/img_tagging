class ItemsController < ApplicationController
	before_filter :get_model, :only => [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
		if params[:tag]
			@items = Item.tagged_with( params[:tag] )
			set_ini_tag
		else
			@items = Item.all
			set_ini_tag
		end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit

  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])
		@item.tag_list= params[:item][:ini_tag]

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

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end
	
	private
		
	def get_model
		@item = Item.find(params[:id])
		@item[:ini_tag] = @item.tag_list.join(',')
	end

	def set_ini_tag
		@items.each do |item|
			item[:ini_tag] = item.tag_list.join(',')
		end
	end
end
