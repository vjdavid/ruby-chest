class ItemsController < ApplicationController
require 'axlsx'
  
  def genxlsx
#  @items = Item.all

  p = Axlsx::Package.new
  wp = p.workbook
  items = Item.all
  wp.add_worksheet(:name=> "Inventory") do |sheet|
    sheet.add_row ["Serial", "Site", "Location", "Stockable", "Type"]
    items.each do |item|
      sheet.add_row [item.serial, item.site.name, item.location.name, item.stockable, item.itype.name]
    end
  end
  #Large file support using XSendFile via Apache: http://www.therailsway.com/2009/2/22/file-downloads-done-right/
  #mime list: http://reference.sitepoint.com/html/mime-types-full
     p.serialize("inventory.xlsx")
     #s = p.to_stream()
     #file = File.open('inventory.xlsx','w'){|f| f.write(s.read)}
     #send_file file, :type=> 'text/plain', :x_sendfile=>true
     send_file './inventory.xlsx', :type=> 'text/plain', :x_sendfile=>true
  end
  
  # GET /items
  # GET /items.json
  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
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
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])

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
    @item = Item.find(params[:id])

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
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end
end
