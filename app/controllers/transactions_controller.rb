class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all.sort_by(&:store_name)
  end

  def import

    errors = []
    file = params["txt"].tempfile.path
    File.open(file).each do |row|
      begin

        kind = row[0].strip rescue row[0]
        transaction_date = row[1..8].strip rescue row[1..8]
        value = row[9..18].strip.to_f/100 rescue row[9..18]
        cpf = row[19..29].strip rescue row[19..29]
        card_number = row[30..41].strip rescue row[30..41]
        hour = row[42..47].strip
        transaction_hour = convert_time(hour) rescue row[42..47]
        store_owner = row[48..61].strip rescue row[48..61]
        store_name = row[62..80].strip rescue row[62..80]

        Transaction.create(kind: kind, transaction_date: transaction_date, value: value, cpf: cpf,
                           card_number: card_number, transaction_hour: transaction_hour, store_owner: store_owner,
                           store_name: store_name)
      rescue Exception => err
        errors << err.message
      end
    end

    if errors.blank?
      flash[:succees] = "Importado com sucesso"
    else
      flash[:error] = errors.join(", ")
    end
    redirect_to "/transactions"
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def balance
    @transactions = Transaction.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:kind, :transaction_date, :value, :cpf, :card_number, :transaction_hour, :store_owner, :store_name)
    end

  def convert_time(time)
    time[0,2]+":"+time[2,2]+":"+time[4,4]
  end
end
