# frozen_string_literal: true

module MunicipesHelper
  def get_status(status)
    if status == true
      status = 'Ativo'
    else
      status = 'Inativo'
    end
  end
end
