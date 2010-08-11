begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end

$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'game_of_life'

Before do
  @game = GameOfLife.new
end 

Given /^the following setup$/ do |table|
  # table is a Cucumber::Ast::Table
  @game.grid = table.raw
end

When /^I evolve the board$/ do
  @game.evolve
end

Then /^the center cell should be dead$/ do
  @game.cell_at(1,1).should == "."
end

Then /^the center cell should be alive$/ do
  @game.cell_at(1,1).should == "x"
end

Then /^I should see the following board$/ do |table|
  # table is a Cucumber::Ast::Table
  @game.grid.should == table.raw
end

Given /^I have a (\w+) cell with (\d+) live neighbors$/ do |dead_or_alive, n|
  @cell_state = (dead_or_alive == "dead") ? "." : "x"
  @live_neighbors = n
end

When /^I check the next iteration$/ do
  # no-op 
end

Then /^the cell should be (\w+)$/ do |dead_or_alive|
  alive_state = ("alive" == dead_or_alive)
  @game.cell_alive_next_iteration(@cell_state, @live_neighbors).should == alive_state
end

