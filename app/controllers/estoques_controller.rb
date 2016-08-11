class EstoquesController < ApplicationController
  before_action :set_estoque, only: [:show, :edit, :update, :destroy]

  include UsuariosHelper

  # def aquisicao
  #   @estoque = Estoque.new
  #   @produtos = Produto.order :nome
  #   @setores = Setor.order :nome
  # end
  #
  # def adquirir
  #   @estoque = Estoque.new(
  #     params.require(:estoque).permit(:produto_id, :setor_id, :quantidade)
  #   )
  #   debugger
  # end

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
    if usuario_do_setor_principal
      @estoque = Estoque.new
      @produtos = Produto.order :nome
    else
      respond_to do |format|
        format.html { redirect_to solicitacoes_path, notice: aviso_apenas_usuario_do_setor_principal }
      end
    end
  end

  # GET /estoques/1/edit
  def edit
  end

  # POST /estoques
  # POST /estoques.json
  def create
    respond_to do |format|
      if usuario_do_setor_principal
        @estoque = Estoque.new(
          params.require(:estoque).permit(:produto_id, :quantidade)
        )
        @estoque.setor = Setor.principal

        if @estoque.save
          format.html { redirect_to @estoque, notice: 'Estoque was successfully created.' }
          format.json { render :show, status: :created, location: @estoque }
        else
          @produtos = Produto.order :nome
          format.html { render :new }
          format.json { render json: @estoque.errors, status: :unprocessable_entity }
        end
      else
        @estoque.errors.add :base, aviso_apenas_usuario_do_setor_principal
        format.html { render :new, notice: @estoque.errors }
        format.json { render json: @estoque.errors, status: :unprocessable_entity }
      end
    end
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

    def aviso_apenas_usuario_do_setor_principal
      "Apenas usuários do setor #{Setor.find(1).nome} podem realizar aquisições."
    end
end
