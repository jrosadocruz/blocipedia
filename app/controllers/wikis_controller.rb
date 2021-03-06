class WikisController < ApplicationController
  before_action :set_wiki, only: [:show, :edit, :update, :destroy]

  # GET /wikis
  # GET /wikis.json
  def index
    if user_signed_in?
      # @wikis = Wiki.visible_to(current_user)
      @wikis = Wiki.all
    else
      @wikis = Wiki.where(private: false)
    end
    authorize @wikis
  end

  def all
    if user_signed_in?
      @wikis = current_user.wikis.all
    end
  end

  # GET /wikis/1
  # GET /wikis/1.json
  def show
    authorize @wiki
  end

  # GET /wikis/new
  def new
    @wiki = Wiki.new
    @wiki.user = current_user
    authorize @wiki
  end

  # GET /wikis/1/edit
  def edit
    authorize @wiki
  end

  # POST /wikis
  # POST /wikis.json
  def create
    @wiki = current_user.wikis.build(wiki_params)
    authorize @wiki
    respond_to do |format|
      if @wiki.save
        format.html { redirect_to @wiki, notice: 'Wiki was successfully created.' }
        format.json { render :show, status: :created, location: @wiki }
      else
        format.html { render :new }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wikis/1
  # PATCH/PUT /wikis/1.json
  def update
    authorize @wiki
    respond_to do |format|
      if @wiki.update(wiki_params)
        format.html { redirect_to @wiki, notice: 'Wiki was successfully updated.' }
        format.json { render :show, status: :ok, location: @wiki }
      else
        format.html { render :edit }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wikis/1
  # DELETE /wikis/1.json
  def destroy
    authorize @wiki
    @wiki.destroy
    respond_to do |format|
      format.html { redirect_to wikis_url, notice: 'Wiki was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wiki
      @wiki = Wiki.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wiki_params
      params.require(:wiki).permit(:title, :body, :private, :user_id)
      # if !user_signed_in?
      #   params.require(:wiki).permit()
      # else
      #   if current_user.premium? || current_user.admin?
      #     params.require(:wiki).permit(:title, :body, :private, :user_id)
      #   else
      #     params.require(:wiki).permit(:title, :body, :user_id)
      #   end
      # end
    end
end
