class EstoquesController < ApplicationController
  before_action :set_estoque, only: [:show, :edit, :update, :destroy]

  # GET /estoques
  # GET /estoques.json
  def index
    @estoques = Estoque.all
  end

  # GET /estoques/1
  # GET /estoques/1.json
  def show
  end

  # GET /estoques/new
  def new
  end

  # GET /estoques/1/edit
  def edit
  end

  # POST /estoques
  # POST /estoques.json
  def create
  end

  # PATCH/PUT /estoques/1
  # PATCH/PUT /estoques/1.json
  def update
    respond_to do |format|
      if @estoque.update(
          params.require(:estoque).permit(:quantidade)
        )
        format.html { redirect_to @estoque, notice: 'Estoque was successfully updated.' }
        format.json { render :show, status: :ok, location: @estoque }
      else
        format.html { render :edit }
        format.json { render json: @estoque.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estoques/1
  # DELETE /estoques/1.json
  def destroy
    @estoque.destroy
    respond_to do |format|
      format.html { redirect_to estoques_url, notice: 'Estoque was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estoque
      @estoque = Estoque.find(params[:id])
    end
end
