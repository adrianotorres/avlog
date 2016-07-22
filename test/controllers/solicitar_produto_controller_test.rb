require 'test_helper'

class SolicitarProdutoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get solicitar_produto_index_url
    assert_response :success
  end

end
