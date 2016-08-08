class SetoresController < ApplicationController
  before_action :set_setor, only: [:show, :edit, :update, :destroy]

  # GET /setores
  # GET /setores.json
  def index
    @setores = Setor.order(principal: :desc)
  end

  # GET /setores/1
  # GET /setores/1.json
  def show
  end

  # GET /setores/new
  def new
    @setor = Setor.new
  end

  # GET /setores/1/edit
  def edit
  end

  # POST /setores
  # POST /setores.json
  def create
    @setor = Setor.new(setor_params)
    @setor.principal = false

    respond_to do |format|
      if @setor.save
        format.html { redirect_to @setor, notice: 'Setor foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @setor }
      else
        format.html { render :new }
        format.json { render json: @setor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /setores/1
  # PATCH/PUT /setores/1.json
  def update
    respond_to do |format|
      if @setor.update(setor_params)
        format.html { redirect_to @setor, notice: 'Setor alterado com sucesso.' }
        format.json { render :show, status: :ok, location: @setor }
      else
        format.html { render :edit }
        format.json { render json: @setor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /setores/1
  # DELETE /setores/1.json
  def destroy
    unless @setor.principal
      @setor.destroy
      retorno = 'Setor foi excluído com sucesso.'
    else
      retorno = 'Não é permitido excluir o setor principal.'
    end

    respond_to do |format|
      format.html { redirect_to setores_url, notice: retorno  }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_setor
      @setor = Setor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def setor_params
      params.require(:setor).permit(:nome, :sigla)
    end
end
