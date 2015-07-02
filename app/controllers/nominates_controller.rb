class NominatesController < ApplicationController
  before_action :set_nominate, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_admin, only: :index

  # GET /nominates
  # GET /nominates.json
  def index
    @nominates = Nominate.all
  end


  # GET /nominates/1
  # GET /nominates/1.json
  def show
  end

  # GET /nominates/new
  def new
    @nominate = Nominate.new
  end

  # GET /nominates/1/edit
  def edit
  end

def us_states
    [
      ['Alabama', 'AL'],
      ['Alaska', 'AK'],
      ['Arizona', 'AZ'],
      ['Arkansas', 'AR'],
      ['California', 'CA'],
      ['Colorado', 'CO'],
      ['Connecticut', 'CT'],
      ['Delaware', 'DE'],
      ['District of Columbia', 'DC'],
      ['Florida', 'FL'],
      ['Georgia', 'GA'],
      ['Hawaii', 'HI'],
      ['Idaho', 'ID'],
      ['Illinois', 'IL'],
      ['Indiana', 'IN'],
      ['Iowa', 'IA'],
      ['Kansas', 'KS'],
      ['Kentucky', 'KY'],
      ['Louisiana', 'LA'],
      ['Maine', 'ME'],
      ['Maryland', 'MD'],
      ['Massachusetts', 'MA'],
      ['Michigan', 'MI'],
      ['Minnesota', 'MN'],
      ['Mississippi', 'MS'],
      ['Missouri', 'MO'],
      ['Montana', 'MT'],
      ['Nebraska', 'NE'],
      ['Nevada', 'NV'],
      ['New Hampshire', 'NH'],
      ['New Jersey', 'NJ'],
      ['New Mexico', 'NM'],
      ['New York', 'NY'],
      ['North Carolina', 'NC'],
      ['North Dakota', 'ND'],
      ['Ohio', 'OH'],
      ['Oklahoma', 'OK'],
      ['Oregon', 'OR'],
      ['Pennsylvania', 'PA'],
      ['Puerto Rico', 'PR'],
      ['Rhode Island', 'RI'],
      ['South Carolina', 'SC'],
      ['South Dakota', 'SD'],
      ['Tennessee', 'TN'],
      ['Texas', 'TX'],
      ['Utah', 'UT'],
      ['Vermont', 'VT'],
      ['Virginia', 'VA'],
      ['Washington', 'WA'],
      ['West Virginia', 'WV'],
      ['Wisconsin', 'WI'],
      ['Wyoming', 'WY']
    ]
end
  # POST /nominates
  # POST /nominates.json
  def create
    @nominate = Nominate.new(nominate_params)

    respond_to do |format|
      if @nominate.save
        format.html { redirect_to @nominate, notice: 'You have successfully nominated #{@nominate.referralbiz}.' }
        format.json { render :show, status: :created, location: @nominate }   
  require 'mandrill'
  begin 
   mandrill = Mandrill::API.new "JZITQf3nJBSKkU34v5krHA"
    message = {
     :subject=> "You have been Nominated by #{@nominate.yourname} #{@nominate.lastname}!", 
     :from_name=> "Goldman Sachs 10KSB",
      :from_email=> "10ksb@icic.org",
      :to=> [{
            "email"=> @nominate.referralemail,
            "name"=> @nominate.referralname }],
      :cc=> [{
            "email"=> @nominate.youremail,
            "name"=> @nominate.yourname}],
      :html=> render_to_string('emails/nominate', :locals => {:nominate => @nominate}, :layout => false),        
      # #:attachments=>
      #   [{"type"=>"text/plain",
      #       "content"=>"ZXhhbXBsZSBmaWxl",
      #      "name"=>"myfile.txt"}],
     :preserve_recipients => false
     }
   
  result = mandrill.messages.send message

  rescue Mandrill::Error => e
     # Mandrill errors are thrown as exceptions
     puts "A mandrill error occurred: #{e.class} - #{e.message}"
     # A mandrill error occurred: Mandrill::UnknownSubaccountError - No subaccount exists with the id 'customer-123'    
     raise
 end
      else  
       format.html { render :new }
        format.json { render json: @nominate.errors, status: :unprocessable_entity }
      end
   end
  end

  # PATCH/PUT /nominates/1
  # PATCH/PUT /nominates/1.json
  def update
    respond_to do |format|
      if @nominate.update(nominate_params)
        format.html { redirect_to @nominate, notice: 'Nominate was successfully updated.' }
        format.json { render :show, status: :ok, location: @nominate }
      else
        format.html { render :edit }
        format.json { render json: @nominate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nominates/1
  # DELETE /nominates/1.json
  def destroy
    @nominate.destroy
    respond_to do |format|
      format.html { redirect_to nominates_url, notice: 'Nominate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nominate
      @nominate = Nominate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nominate_params
      params.require(:nominate).permit(:yourname, :lastname, :yourbiz, :youremail, :referralname, :referrallastname, :referralbiz, :referralemail, :referralstate)
    end
end