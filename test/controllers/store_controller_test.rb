require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success
    assert_select 'nav.side_nav a', minimum: 4 #cauta in elementul de tip nav cu clasa side_nav elementele de tip a si se asigura ca sunt mimim 4
    assert_select 'main ul.catalog li', 4 #cauta in main elemente ul de clasa catalog care au elemente li si sa fie 3
    assert_select 'h2', 'Programming Ruby 1.9' #cauta un h2 care sa fie egal cu stringu dintre ghilimele
    assert_select '.price', /\$|\€[,\d]+\.|\,\d\d/	#cauta o expresie reg: dolar urmat de orice numar(cel putin unu) virgule sau numere urmat de un decimal point urmat de 2 cifre
  end

end
