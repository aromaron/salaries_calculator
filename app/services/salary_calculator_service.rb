class SalaryCalculatorService < ApplicationService
  attr_reader :team, :player

  LEVEL = {
    a: 5,
    b: 10,
    c: 15,
    cuauh: 20
  }.freeze

  def initialize(team)
    @team = team
    @player = nil
  end

  def call
    if valid_object?
      @team.each do |player|
        @player = player
        player[:goles_minimos] = LEVEL[player[:nivel].downcase.to_sym]
        player[:sueldo_completo] = calculate_total_salary
      end
      { team: @team, status: :success }
    else
      { team: nil }
    end
  end

  private

  # sums the players salary plus the players bonus amount
  def calculate_total_salary
    @player[:sueldo].to_i + total_bonus_amount
  end

  # sums the individual (player) bonus amount plus the team bonus amount
  def total_bonus_amount
    individual_bonus_amount + team_bonus_amount
  end

  # calculates the individual (player) bonus amount
  # since individual amount is 50% of total bonus then we do bono / 2
  # then we request the bonus percentage based on players performance
  def individual_bonus_amount
    ((@player[:bono].to_i / 2) * bonus_percentage(player[:goles].to_i, LEVEL[@player[:nivel].downcase.to_sym])) / 100
  end

   # calculates the individual (player) bonus amount
  # since team amount is 50% of total bonus then we do bono / 2
  # then we request the bonus percentage based on team performance
  def team_bonus_amount
    ((@player[:bono].to_i / 2) * bonus_percentage(total_team_goals(@player[:equipo]), total_level_goals)) / 100
  end

  # generic bonus calculator, works for both individual and team percentages
  def bonus_percentage(goals, expected_goals)
    (goals * 100).to_i / expected_goals
  end

  # sums the total goals scored by a given team
  # first we group the current evaluated player team by name
  # then we sum all the goals of this team
  def total_team_goals(equipo)
    @team.select {|player| player[:equipo] == equipo }.sum {|h| h[:goles].to_i }
  end

  # sums the total of goals expected
  def total_level_goals
    LEVEL.values.sum
  end

  # validates if any of the required values are nil
  def valid_object?
    @team.each do |player| 
      return !(player[:bono].blank? || player[:sueldo].blank? || player[:equipo].blank? || player[:nivel].blank? || player[:goles].blank?)
    end
  end
end