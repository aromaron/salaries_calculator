module Api
  module V1
    class SalariesController < ApplicationController
      def index
        render json: SalaryCalculatorService.call(team_params[:_json]), status: 200
      end

      private

      def team_params
        params.require(_json: [:nombre,
                               :nivel,
                               :goles,
                               :sueldo,
                               :bono,
                               :equipo]).permit(_json: [:nombre,
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