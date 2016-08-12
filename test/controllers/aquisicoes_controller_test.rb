require 'test_helper'

class AquisicoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aquisicao = aquisicoes(:one)
  end

  test "should get index" do
    get aquisicoes_url
    assert_response :success
  end

  test "should get new" do
    get new_aquisicao_url
    assert_response :success
  end

  test "should create aquisicao" do
    assert_difference('Aquisicao.count') do
      post aquisicoes_url, params: { aquisicao: { produto_id: @aquisicao.produto_id, quantidade: @aquisicao.quantidade, setor_id: @aquisicao.setor_id, usuario_id: @aquisicao.usuario_id } }
    end

    assert_redirected_to aquisicao_url(Aquisicao.last)
  end

  test "should show aquisicao" do
    get aquisicao_url(@aquisicao)
    assert_response :success
  end

  test "should get edit" do
    get edit_aquisicao_url(@aquisicao)
    assert_response :success
  end

  test "should update aquisicao" do
    patch aquisicao_url(@aquisicao), params: { aquisicao: { produto_id: @aquisicao.produto_id, quantidade: @aquisicao.quantidade, setor_id: @aquisicao.setor_id, usuario_id: @aquisicao.usuario_id } }
    assert_redirected_to aquisicao_url(@aquisicao)
  end

  test "should destroy aquisicao" do
    assert_difference('Aquisicao.count', -1) do
      delete aquisicao_url(@aquisicao)
    end

    assert_redirected_to aquisicoes_url
  end
end
