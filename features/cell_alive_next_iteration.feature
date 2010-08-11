Feature: Determining if a cell is alive in the next iteration
  In order to create a functioning rules engine
  As a programmer of Conway's Game of Life
  I can determine if a cell is alive in the next iteration

  Scenario Outline: Check cell state in next iteration
    Given I have a <orig_state> cell with <num_live_neighbors> live neighbors
    When I check the next iteration
    Then the cell should be <next_state> 

  Examples:
    | orig_state  | num_live_neighbors  | next_state  |
    | dead        | 0                   | dead        |
    | dead        | 1                   | dead        |
    | dead        | 2                   | dead        |
    | dead        | 3                   | alive       |
    | dead        | 4                   | dead        |
    | dead        | 5                   | dead        |
    | dead        | 6                   | dead        |
    | dead        | 7                   | dead        |
    | dead        | 8                   | dead        |
    | live        | 0                   | dead        |
    | live        | 1                   | dead        |
    | live        | 2                   | alive       |
    | live        | 3                   | alive       |
    | live        | 4                   | dead        |
    | live        | 5                   | dead        |
    | live        | 6                   | dead        |
    | live        | 7                   | dead        |
    | live        | 8                   | dead        |
