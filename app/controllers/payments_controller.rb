class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :destroy]
  before_action :require_user, except: [:show]
  before_action :require_same_user, only: [:destroy]
  before_action :define_payment, only: [:completePayment, :approvePayment, :uncompletePayment]

  def show
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.createdBy = session[:user_id]
    @payment.house = current_user.house

    if @payment.recurring == false
      if @payment.save
        redirect_to @payment and return
      else
        render 'new'
      end


    else

      if @payment.save
        @payment.occurences.times do |i|
          if i > 0
            @payment = Payment.new(payment_params)
            @payment.createdBy = session[:user_id]
            @payment.house = current_user.house
            i.times do |g|
              @payment.startDate += 1.month
              @payment.dueDate += 1.month
            end
            @payment.save
          end
        end
        redirect_to houseStatus_path
      else
        render 'new'
      end


    end

  end

  def createManypayments

  end

  def destroy
    @payment.destroy
    redirect_to houseStatus_path
  end

  def completePayment
    @payment.completed = true
    @payment.save
    redirect_to payment_path(@payment)
  end

  def uncompletePayment
    @payment.completed = false
    @payment.save
    redirect_to payment_path(@payment)
  end

  def approvePayment
    @payment.approved = true
    @payment.save
    redirect_to payment_path(@payment)
  end


  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:title, :amount, :startDate, :dueDate, :assignedUser, :recurring, :occurences)
  end

  def define_payment
    @payment = Payment.find(params[:payment])
  end


  def require_same_user
      if current_user.id != @payment.createdBy
        flash[:alert] = "You can only edit or delete your own article"
        redirect_to houseStatus
      end
    end

end
