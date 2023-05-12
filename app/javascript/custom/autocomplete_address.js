$(document).ready(function() {
  $("#address_postal_code").blur(function(){
    var cep = this.value.replace(/[^0-9]/, "");

    if(cep.length != 8){
      return false;
    }
    var url = "https://viacep.com.br/ws/"+cep+"/json/";

    $.getJSON(url, function(dadosRetorno){
      try{
        $("#address_address").val(dadosRetorno.logradouro);
        $("#address_address_complement").val(dadosRetorno.complemento);
        $("#address_neighborhood").val(dadosRetorno.bairro);
        $("#address_city").val(dadosRetorno.localidade);
        $("#address_state").val(dadosRetorno.uf);
        $("#address_ibge_code").val(dadosRetorno.ibge);
      }catch(ex){}
    });
  });
});