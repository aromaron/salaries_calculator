require 'rails_helper'

RSpec.describe SalaryCalculatorService do
  describe 'SalaryCalculatorService' do
    before(:each) do
      @service = SalaryCalculatorService.new({})
      @service.instance_variable_set(:@player, set_initial_data)
      @service.instance_variable_set(:@team, [set_initial_data])
    end

    context '.calculate_total_salary' do
      it 'should return player total salary' do
        expect(@service.send(:calculate_total_salary)).to eq(38100)
      end
    end
  
    context '.total_bonus_amount' do
      it 'should return total bonus amount' do
        expect(@service.send(:total_bonus_amount)).to eq(8100)
      end
    end
  
    context '.individual_bonus_amount' do
      it 'should return individual bonus amount' do
        expect(@service.send(:individual_bonus_amount)).to eq(6750)
      end
    end
  
    context '.team_bonus_amount' do
      it 'should return team bonus amount' do
        expect(@service.send(:team_bonus_amount)).to eq(1350)
      end
    end
  
    context '.bonus_percentage' do
      it 'should return individual bonus percentage' do
        expect(@service.send(:bonus_percentage, 9, 10)).to eq(90)
      end
    end

    context '.total_team_goals' do
      it 'should return individual bonus percentage' do
        expect(@service.send(:total_team_goals, 'rojo')).to eq(9)
      end
    end
  
    context '.total_level_goals' do
      it 'should return correct sum' do
        expect(@service.send(:total_level_goals)).to eq(50)
      end
    end

    context '.level_minimum' do
      it 'should return correct sum' do
        expect(@service.send(:level_minimum)).to eq(10)
      end
    end

    context '.valid_object?' do
      it 'should return correct sum' do
        expect(@service.send(:valid_object?)).to be_truthy
      end
    end
  end

  private
  def set_initial_data
    {
      'nombre': 'El Rulo',
      'nivel': 'B',
      'goles': 9,
      'sueldo': 30000,
      'bono': 15000,
      'sueldo_completo': nil,
      'equipo': 'rojo'
  }
  end
end


