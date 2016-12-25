class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # =link_to .. reviews_path
  def index
    @reviews = Review.all
  end
  # Automatically render 'index' (views/review/index.html.haml)

  # GET /reviews/new
  # =link_to .. new_review_path
  def new
    @review = Review.new
  end
  # Automatically render 'new' (which renders _form)

  # POST /reviews
  # =form_for @review ..       .new_record? == true => url: '/reviews', method: :post
  def create
    @review = Review.new( review_params )

    if @review.save
      redirect_to @review, notice:'Review was successfully created.'
    else
      render :new
    end
  end

  # GET /reviews/:id
  # =link_to .. @review | review_path( @review )
  def show
  end
  # Automatically render 'show'

  # GET /reviews/:id/edit
  # =link_to .. edit_review_path( @review )
  def edit
  end
  # Automaticall render 'edit' (which renders _form)

  # PATCH|PUT /reviews/:id
  # =form_for @review ..       .new_record? == false => url: '/reviews/:id', method: :patch
  def update
    if @review.update( review_params )
      redirect_to @review, notice:'Review was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reviews/:id
  # =link_to .. @review | review_path( @review ), method: :delete
  def destroy
    @review.destroy
    redirect_to reviews_url, notice:'Review was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find( params[:id] )
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require( :review ).permit( :rating, :comment )
    end
end
