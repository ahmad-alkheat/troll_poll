class PollsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_poll, only: [:show, :edit, :update, :destroy]
  before_action :authorized, only: [:edit, :update, :destroy]

  def index
    @polls = Poll.all
  end

  def show
  end

  def new
    @poll = current_user.polls.build
  end

  def edit
  end

  def create
    @poll = current_user.polls.build(poll_params)

    respond_to do |format|
      if @poll.save
        format.html { redirect_to @poll, notice: 'Poll was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @poll.update(poll_params)
        format.html { redirect_to @poll, notice: 'Poll was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  
  def destroy
    @poll.destroy
    respond_to do |format|
      format.html { redirect_to polls_url, notice: 'Poll was successfully destroyed.' }
    end
  end

  private
   
    def set_poll
      @poll = Poll.find(params[:id])
    end

    def poll_params
      params.require(:poll).permit(:title)
    end

    def authorized 
      unless @poll.user == current_user
        flash[:error] = "You are not the owner of this poll."
        redirect_to root_path
      end
    end
end
