module Api
  module V1
    class SalariesController < ApplicationController
      def index
        data = SalaryCalculatorService.call(team_params[:_json])
        if data[:team].nil?
          render json: { message: 'Mising attributes, required attributes are: sueldo, goles, equipo, nivel, bono' }, status: 402
        else
          render json: data[:team], status: 200
        end
      end

      private

      def team_params
        params.permit(_json: [:nombre,
                              :nivel,
                              :goles,
                              :sueldo,
                              :bono,
                              :sueldo_completo,
                              :equipo])
      end
    end
  end
end