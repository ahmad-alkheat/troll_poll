class RepliesController < ApplicationController

  def new
    @poll = Poll.find(params[:poll_id])
    @reply = @poll.replies.build
    @poll.questions.each do |question|
      @reply.answers.build question: question
  end

  def create
    @poll = Poll.find(params[:poll_id])
    @reply = @poll.replies.build(reply_params)
    respond_to do |format|
      if @reply.save
        format.html {redirect_to @poll, notice: "Thanks for take the poll, your answers have been submitted."}
      else
        format.html { render :new }
      end
    end
  end

  private 

  def reply_params
    params.require(:reply).pemrit(:poll_id, {answers_attributes: [:id, :value, :question_id, :possible_answer_id]})
  end
end
