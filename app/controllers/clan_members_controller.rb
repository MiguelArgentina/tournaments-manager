class ClanMembersController < ApplicationController
  before_action :only_leaders_allowed

  def index
    @clan_members = User.all.where.not(id: current_user.id).order(:created_at)
  end

  def new
    @new_clan_member = User.new
  end

  def create
    @new_member = User.new(clan_member_params)
    if @new_member.save
      redirect_to clan_member_path @new_member
    else
      render :new
    end
  end

  def show
    @clan_member = User.find(params[:id])
  end

  def update
    @clan_member = User.find(params[:id])
    binding.pry
    @clan_member.update(clan_member_params)
    redirect_to clan_member_path @clan_member
  end

  def toggle_active
    @clan_member = User.find(params[:clan_member_id])
    @clan_member.update(is_active: !@clan_member.is_active)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update(
          @clan_member,
          partial: "toggle_active",
          locals: {clan_member: @clan_member})
      end
      format.html {}
    end
  end

  def destroy
    @clan_member = User.find(params[:id])
    @clan_member.update(clan_member_params)
    redirect_to root_path
  end

  private
  def only_leaders_allowed
    unless current_clan_leader
      flash[:error] = "Only clan leaders can add clan members"
      redirect_to root_path
    end
  end

  def clan_member_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :is_active, :type)
  end
end
