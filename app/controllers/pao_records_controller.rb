class PaoRecordsController < ApplicationController
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

  private

  def pao_record_params
    params.require(:pao_record).permit!
  end
end