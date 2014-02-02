class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      #format.csv { render text: @users.to_csv }
    end
  end
  
  def months
    book = Spreadsheet::Workbook.new
    sheet = book.create_worksheet
    spreadsheet = StringIO.new
    
    book.write "months.xls"
    
    book.write spreadsheet
    send_data spreadsheet.string, :filename => "months.xls", :type =>  "application/vnd.ms-excel"   
  end
  
  def createCSV
    book = Spreadsheet::Workbook.new
    sheet = book.create_worksheet
    spreadsheet = StringIO.new 
    sheet.row(0).concat %w{id Name}
    bold = Spreadsheet::Format.new :weight => :bold
    
    User.all.each_with_index do |user, i|
    sheet.row(i+1).push user.id, user.name
    sheet.row(0).set_format(1, bold)
    #sheet.row(0).height = 20
    #Spreadsheet::Format.new :color => :blue,:weight => :bold,:size => 20
    #sheet.column(2).hidden = true
    #sheet.column(3).hidden = true
    #sheet.column(2).outline_level = 1
    #sheet.column(3).outline_level = 1
    
    # row
    #sheet.row(2).hidden = true
    #sheet.row(3).hidden = true
    #sheet.row(2).outline_level = 1
    #sheet.row(3).outline_level = 1
    # save file
   
    
    end
    #bold = Spreadsheet::Format.new :weight => :bold
    book.write "out.xls"
    
    book.write spreadsheet
    send_data spreadsheet.string, :filename => "out.xls", :type =>  "application/vnd.ms-excel"
  end
  
  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end
  
  def new_user
    @user = User.new

    respond_to do |format|
      format.html { render html: "new.html.erb" }
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
