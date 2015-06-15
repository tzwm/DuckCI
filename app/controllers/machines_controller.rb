class MachinesController < ApplicationController
  before_action :authenticate_user!

  def index
    load_machines
  end

  def new
    build_machine
  end

  def create
    build_machine
    save_machine or render :new
  end

  def destroy
    load_machine
    @machine.destroy
    redirect_to machines_path
  end

  private

  def load_machines
    @machines ||= Machine.all
  end

  def load_machine
    @machine ||= Machine.find(params[:id])
  end

  def build_machine
    @machine ||= Machine.new
    @machine.attributes = machine_params
  end

  def save_machine
    if @machine.save
      redirect_to machines_path
    end
  end

  def machine_params
    machine_params = params[:machine]
    machine_params ? machine_params.permit(:name, :url, :login_user) : {}
  end
end
