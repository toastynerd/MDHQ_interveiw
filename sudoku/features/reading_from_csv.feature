Feature: Read a csv sudoku board
  In order to find a solution
  The program reads a .csv sudoku board
  Through a Unix stream "<"

  Scenario: No board at specified runtime
    Given no board specified with ARGF

  Scenario: Board is an incorrect size
    Given a board specified but with incorrect data

  Scenario: Board specified and correct size
    Given a board specified and with correct data
