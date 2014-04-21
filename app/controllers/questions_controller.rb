require 'rqrcode'

class QuestionsController < ApplicationController

  def index
    @question = Question.new
    @questions = Question.all
  end

  def create
    @question = Question.new(question_params)
    answers = params[:answers]

    if !check_answer_num
      @questions = Question.all
      render :index
      flash[:alert] = 'At least two answers!'
      return
    end

    answers.each do |answer|
      if !answer.blank?
        @answer = Answer.new
        @answer.answer = answer
        @answer.check_count = 0
        @answer.question = @question
        @question.answers << @answer
      end
    end

    if @question.save
      redirect_to question_path(@question)
    else
      @questions = Question.all
      flash[:alert] = 'Create Error!'
      render :index  
    end
  end

  def show
    begin
      @question = Question.find(params[:id])
      @data = @question.answersJSON
      @qr = RQRCode::QRCode.new(question_url(@question).to_s, :size => 6)

      respond_to do |format|
        format.html
        format.json { 
          render :json => answers 
        }
        format.xml { render :xml => @question.to_xml }
      end  
    rescue ActiveRecord::RecordNotFound
      redirect_to root_url, :flash => { :alert => "Record not found." }
    end
   
  end

  def vote
    @answer = Answer.find(params[:answer_id]) 
    @answer.check_count = @answer.check_count + 1
    if @answer.save
      
    else
        
    end
    redirect_to :action => 'show'
  end

  def home
    @question = Question.new
  end

  private
  def question_params
    params.require(:question).permit(:title)
  end

  def check_answer_num
    answers = params[:answers]
    count = 0
    answers.each do |answer|
      if !answer.blank?
        count = count + 1
      end
    end
    p count
    if count >= 2
      true
    else
      false
    end

  end
end
