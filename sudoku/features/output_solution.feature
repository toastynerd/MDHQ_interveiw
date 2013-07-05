Feature: output the solution as a csv file
  When a solution is found for a sudoku puzzle
  Output the solution as a CSV file

  Scenario: One solution found
    Given Only one correct solution

  Scenario: More than one solution found
    Given more than one correct solutions

  Scenario: No solutions found
    Given there is no correct solution
