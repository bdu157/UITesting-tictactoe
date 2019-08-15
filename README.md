# Unit Testing I - Intro to Unit Testing Lesson Plan

1: Use [this project](https://github.com/LambdaSchool/ios-tictactoe-unit-tests/tree/master) as a starting point. Have your students clone or download the project as well.

2: Take time to go over the code already in the project and go over the game logic. If the students don't have at least a basic understanding of how the code works, it will prove difficult for them to understand the tests that use this code. Especially important to understand is the `Gameboard`.

3: Create a Unit Testing Bundle target together. Review the  `XCTestCase` methods `setup` and `tearDown`.

4: Delete the test case the unit test target comes with and explain that it is similar to the "ViewController.swift" file that comes with a new project. Its name doesn't describe what tests should be contained in this test case.

### GameBoardTests

5: Create a new Unit Test Case Class file called `GameBoardTests`.

As you write the tests in the next section, be sure to review `XCTAssert`. Ensure that the students understand that this is how we ensure that the test is actually working or not by checking the state of values in the ` GameBoard` in this case.

Also, it is going to be helpful for the students if you are able to pull up the Assistant Editor and show the code you are testing such as the `GameBoard`.

6: Make sure to `@testable import TicTacToe`, and write the `testCreatingEmptyBoard` test method together. Run the test and make sure everyone's works.
  - In the `XCTAssertThrowsError`, its closure will only get called if there was an error when trying to place a mark. (In this test, that would be always however)

7: Write out the `testPlacingMarks` test method. Point out to the students that we are using assertions all over in this test, and that's a good thing.

### GameAITests

8: Create a new Unit Test Case Class called `GameAITests`.

9: Write the `testWinCheckingVertical1` method. In the assertions, you will call the "GameAI.swift"'s `game(board: GameBoard, isWonBy: GameBoard.Mark)` method. Show that as of now, the method is hard-coded to return false. So even if we place the correct marks, the test will fail.

10: Implement the `game(board: GameBoard, isWonBy: GameBoard.Mark)` method in the "GameAI.swift". For now, just implement vertical win checking. 

11: As a challenge, have the students take ~15 minutes to implement:
  - The other two vertical win check tests
  - Horizontal win checking in the `game(board: GameBoard, isWonBy: GameBoard.Mark)`
  - At least one horizontal win test.

**Go over the solution for this challenge together when the time is up.**

12: Implement diagonal win checking and write a test with a diagonal win.
