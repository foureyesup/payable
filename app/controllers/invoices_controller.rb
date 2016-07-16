class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  autocomplete :customer, :company, :extra_data => [:id, :email, :given_name, :family_name, :address_line1, :address_line2, :city, :zip, :region, :phone, :vat_number, :country]

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.all
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @invoice.build_customer
    @invoice.lines.build
    @invoice.build_payee
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def address_lookup
    domain = params[:domain]
    Clearbit.key = 'eda07a859233a7919f6929e9dcc57ca2'
    company = Clearbit::Enrichment::Company.find(domain: domain, stream: true)
    if company
      line1 = company.geo["streetNumber"] + " " + company.geo["streetName"]
      line2 = company.geo["subPremise"]
      city = company.geo["city"]
      zip = company.geo["postalCode"]
      company.geo["stateCode"]
      country = company.geo["country"]
    end
  end
    

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:user_id, :customer_id, :invoice_number, :invoice_date, :due_date, :terms, :message, customer_attributes: [:id, :company, :email, :email, :given_name, :family_name, :address_line1, :address_line2, :city, :zip, :region, :phone, :vat_number, :country], lines_attributes: [:id, :quantity, :description, :unit_price, :vat, :total], payee_attributes: [:first_name, :last_name, :email])
    end
end
