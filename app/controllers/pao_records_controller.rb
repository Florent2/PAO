class PaoRecordsController < ApplicationController
  before_filter :authenticate

  def index
    @pao_records = PaoRecord.by_pao_number
  end

  def new
    @pao_record = PaoRecord.new
  end

  def create
    @pao_record = PaoRecord.new pao_record_params
    if @pao_record.save
      redirect_to :pao_records, notice: "PAO successfully created"
    else
      flash.now[:error] = "One or more errors prevented the PAO creation: #{@pao_record.errors.full_messages.join ', '}"
      render :new
    end
  end

  def show
    @pao_record = PaoRecord.find params[:id]
  end

  def edit
    @pao_record = PaoRecord.find params[:id]
  end

  def update
    @pao_record = PaoRecord.find params[:id]
    if @pao_record.update_attributes pao_record_params
      redirect_to :pao_records, notice: "PAO successfully updated"
    else
      flash.now[:error] = "One or more errors prevented the PAO update: #{@pao_record.errors.full_messages.join ', '}"
      render :edit
    end
  end

  def random
    @pao_record = PaoRecord.order('random()').first
    @displayed_info = @pao_record[%w(pao_number pao_person pao_action pao_object).sample]
  end

  private

  def authenticate
    authenticate_or_request_with_http_basic('PAO') do |login, password|
      login == ENV['LOGIN']
    end
  end

  def pao_record_params
    params.require(:pao_record).permit!
  end
end
