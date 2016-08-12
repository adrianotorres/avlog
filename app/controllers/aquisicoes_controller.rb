class AquisicoesController < ApplicationController
  before_action :set_aquisicao, only: [:show, :edit, :update, :destroy]

  include UsuariosHelper

  # GET /aquisicoes
  # GET /aquisicoes.json
  def index
    @aquisicoes = Aquisicao.all
  end

  # GET /aquisicoes/1
  # GET /aquisicoes/1.json
  def show
  end

  # GET /aquisicoes/new
  def new
    if usuario_do_setor_principal
      @aquisicao = Aquisicao.new
      set_produtos
    else
      respond_to do |format|
        format.html { redirect_to solicitacoes_path, notice: aviso_apenas_usuario_do_setor_principal }
      end
    end
  end

  # GET /aquisicoes/1/edit
  def edit
  end

  # POST /aquisicoes
  # POST /aquisicoes.json
  def create
    respond_to do |format|
      if usuario_do_setor_principal
        @aquisicao = Aquisicao.new(
          params.require(:aquisicao).permit(:produto_id, :quantidade)
        )
        @aquisicao.setor = Setor.principal
        @aquisicao.usuario = current_usuario

        if @aquisicao.save
          format.html { redirect_to @aquisicao, notice: 'Aquisição registrada com sucesso.' }
          format.json { render :show, status: :created, location: @aquisicao }
        else
          set_produtos
          format.html { render :new }
          format.json { render json: @aquisicao.errors, status: :unprocessable_entity }
        end
      else
        @aquisicao.errors.add :base, aviso_apenas_usuario_do_setor_principal
        format.html { render :new, notice: @aquisicao.errors }
        format.json { render json: @aquisicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aquisicoes/1
  # PATCH/PUT /aquisicoes/1.json
  def update
    respond_to do |format|
      if @aquisicao.update(aquisicao_params)
        format.html { redirect_to @aquisicao, notice: 'Aquisicao was successfully updated.' }
        format.json { render :show, status: :ok, location: @aquisicao }
      else
        format.html { render :edit }
        format.json { render json: @aquisicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aquisicoes/1
  # DELETE /aquisicoes/1.json
  def destroy
    @aquisicao.destroy
    respond_to do |format|
      format.html { redirect_to aquisicoes_url, notice: 'Aquisicao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aquisicao
      @aquisicao = Aquisicao.find(params[:id])
    end

    def set_produtos
      @produtos = Produto.order :nome
    end

    def aviso_apenas_usuario_do_setor_principal
      "Apenas usuários do setor #{Setor.find(1).nome} podem realizar aquisições."
    end
end
