# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AddressesController, type: :routing do
  let(:valid_attributes) do
    skip()
  end

  describe 'routing' do
    it 'routes to #index' do
      municipe = Municipe.create! valid_attributes
      expect(get: '/municipes/1/addresses').to route_to('addresses#index', municipe_id: municipe)
    end

    it 'routes to #new' do
      municipe = Municipe.create! valid_attributes
      expect(get: '/municipes/1/addresses/new').to route_to('addresses#new', municipe_id: municipe)
    end

    it 'routes to #show' do
      municipe = Municipe.create! valid_attributes
      expect(get: '/municipes/1/addresses/1').to route_to('addresses#show', municipe_id: municipe, id: '1')
    end

    it 'routes to #create' do
      municipe = Municipe.create! valid_attributes
      expect(post: '/municipes/1/addresses').to route_to('addresses#create', municipe_id: municipe)
    end

    it 'routes to #update via PUT' do
      municipe = Municipe.create! valid_attributes
      expect(put: '/municipes/1/addresses/1').to route_to('addresses#update', municipe_id: municipe, id: '1')
    end

    it 'routes to #update via PATCH' do
      municipe = Municipe.create! valid_attributes
      expect(patch: 'municipes/1/addresses/1').to route_to('addresses#update', municipe_id: municipe, id: '1')
    end
  end
end
