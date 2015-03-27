class QuestionsController < ApplicationController
  
  before_action :set_question, only: [:edit, :update, :destroy]
  before_action :set_poll

  def index
    @questions = @poll.questions
  end
  
  def new
    @question = @poll.questions.build
  end

  
  def edit
  end

  
  def create
    @question = @poll.questions.build(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to poll_path(@poll), notice: 'Question was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to poll_path(@poll), notice: 'Question was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to poll_path(@poll), notice: 'Question was successfully destroyed.' }
    end
  end

  private
    
    def set_question
      @question = Question.find(params[:id])
    end

    def set_poll
      @poll = Poll.find(params[:poll_id])
    end

    def question_params
      params.require(:question).permit(:title, :kind, :poll_id)
    end
end
