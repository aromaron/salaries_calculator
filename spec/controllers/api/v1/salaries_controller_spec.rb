require 'rails_helper'
include RequestHelperSpec

RSpec.describe Api::V1::SalariesController do

  # Test suite for GET /salaries
  describe 'GET #index' do
    context 'with valid data request' do
      # initialize test data 
      let(:json_request) do 
        {'_json': [{
            'nombre': 'Luis',
            'nivel': 'Cuauh',
            'goles': 19,
            'sueldo': 50000,
            'bono': 10000,
            'sueldo_completo': nil,
            'equipo': 'rojo'
          }]}
      end

        # make HTTP get request before each example
        before(:each) do
          get :index, params: json_request
        end

        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end

        it "returns http success" do
          expect(response).to have_http_status(:success)
        end

        it 'returns salaries' do
          # Note `json` is a custom helper to parse JSON responses
          expect(json).not_to be_empty
          expect(json.size).to eq(1)
        end

        it 'returns calculated salary' do
          # Note `json` is a custom helper to parse JSON responses
          expect(json[0]['sueldo_completo']).to eq(56650)
        end


        it 'JSON body response contains expected player attributes' do
          expect(json[0].keys).to match_array(['nombre',
                                            'nivel',
                                            'goles',
                                            'sueldo',
                                            'bono',
                                            'sueldo_completo',
                                            'equipo',
                                            'goles_minimos'])
        end
    end

    context 'with invalid data request' do
      let(:bad_json_request) do 
        {'_json': [{
            'nombre': 'Luis',
            'nivel': nil,
            'goles': 19,
            'sueldo': 50000,
            'bono': 10000,
            'sueldo_completo': nil,
            'equipo': 'rojo'
          }]}
      end
    
      # make HTTP get request before each example
      before(:each) do
          get :index, params: bad_json_request
      end
  
      it 'returns status code 402 with required attributes are nil' do
        expect(response).to have_http_status(402)
        expect(json['message']).to eq('Mising attributes, required attributes are: sueldo, goles, equipo, nivel, bono')
      end
    end
  end
end