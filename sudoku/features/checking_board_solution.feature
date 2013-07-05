Feature: checking to see if a solution is correct
  A sudoku board that has been solve
  Should return true
  When run through the checker

  Scenario: A correct solution
    Given a correct board

  Scenario: An incorrect solution
    Given an incorrect board

