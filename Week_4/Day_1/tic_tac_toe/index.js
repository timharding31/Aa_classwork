const buttons = document.querySelectorAll('[data-XO]');
const userChoices = document.querySelectorAll('[data-choice]');
const resetButton = document.getElementById('restart');
const headerSlot = document.getElementById("title");

class Tic {
    storeUserChoice(userChoice) {
        this.userChoice = userChoice;

        if (this.userChoice === 'X') {
            this.computerChoice = 'O';
        } else {
            this.computerChoice = 'X';
        }

        this.computer()
    }

    storeUserPosition(identification) {    
        this.grid[identification] = this.userChoice;
        let square = document.getElementById(identification);
        square.innerText = this.userChoice;
   
        this.computer()
        this.declareWinner(this.checkForWin(this.grid));
    }

    computer() {
        this.depth = -1;
        for (let i = 0; i < this.grid.length; i++) {
            if (!this.grid[i]) {
                this.depth += 1;
            }
        }
    
        let choices = this.generatePossiblePositionsComputer(this.grid);
        let indices1 = []; 
        let indices0 = []; 

            for (let i = 0; i < choices.length; i += 1) {
                let choice = choices[i];
                let score = this.minimax([choice], this.depth, true);

                if (score === 1) {
                    indices1.push(i)
                } else if (score === 0) {
                    indices0.push(i)
                }
            }
        

        let index; 

        if (indices1.length > 0) {
            let isWin = indices1.some(i => {
                let possibleWin = choices[i];
                return (this.checkForWin(possibleWin) === 1)
            })

            if (isWin) {
                indices1.forEach(i => {
                    if (this.checkForWin(choices[i]) === 1) {
                        index = i;

                    }
                })
            } else {
                index = indices1[Math.floor(Math.random() * indices1.length)];
            } 
        } else if (indices0.length > 0) {
            let isDraw = indices0.some(i => {
                let possibleDraw = choices[i]; 
                return (this.checkForWin(possibleDraw) === 0) 
            })
            
            if (isDraw) {
                indices0.forEach(i => {
                    if (this.checkForWin(choices[i]) === 0) {
                        index = i; 
                        
                    }
                })
            } else {
                index = indices0[Math.floor(Math.random() * indices0.length)];
            } 
        } 

        let optimalChoice = choices[index]; 

        for (let i = 0; i < optimalChoice.length; i += 1) {
            let possibleComputer = optimalChoice[i];

            if (possibleComputer === this.computerChoice && !this.grid[i]) {
                this.grid[i] = this.computerChoice;
                let square = document.getElementById(i);
                square.innerText = this.computerChoice;
            }
        }

        this.declareWinner(this.checkForWin(this.grid));
    }

    reset() {
        userChoices.forEach(choice => {
            choice.style.backgroundColor = "white";
            headerSlot.innerText = 'Tic Tac Toe';
        });

        buttons.forEach(button => {
            button.innerText = '';
        });

        this.grid = new Array (9);
    }

    generatePossiblePositionsComputer(pos) { 

        
        let computerPossiblePositions = []; 
        let storage = [];
        
        let i = 0;
        while (i < pos.length) {
            let slot = pos[i];
            if (!slot && !storage.includes(i)) {
                let newArray = [];
                for (let j = 0; j < pos.length; j += 1) { 
                    newArray.push(pos[j]);
                }
                newArray[i] = this.computerChoice;
                computerPossiblePositions.push(newArray);
                storage.push(i);
                i = 0;
                continue;
            }
            i += 1;
        }

        return computerPossiblePositions;
    }

    generatePossiblePositionsUser(pos) {
        let userPossiblePositions = [];
        let storage = [];

        let i = 0;
        while (i < pos.length) {
            let slot = pos[i];
            if (!slot && !storage.includes(i)) {
                let newArray = [];
                for (let j = 0; j < pos.length; j += 1) {
                    newArray.push(pos[j]);
                }
                newArray[i] = this.userChoice;
                userPossiblePositions.push(newArray);
                storage.push(i);
                i = 0;
                continue;
            }

            i += 1;
        }

        return userPossiblePositions;
    }

    minimax(position, depth, maximizingPlayer) {
        if (depth === 0) {
            return this.checkForWin(position[0])
        }

        if (maximizingPlayer) {
            let bestScore = -Infinity;
            for (let i = 0; i < position.length; i ++) {
                let pos = position[i];  
                if (this.checkForWin(pos) === 1 && this.checkForWin(pos) > bestScore) {
                    bestScore = this.checkForWin(pos); 
                    continue;
                }

                let score = this.minimax(this.generatePossiblePositionsUser(pos), depth - 1, false);
                if (score > bestScore) {
                    bestScore = score;
                }

            }
            return bestScore;
        } else {
            let bestScore = Infinity;
            for (let i = 0; i < position.length; i ++) {
                let pos = position[i];
                if (this.checkForWin(pos) === -1 && this.checkForWin(pos) < bestScore) {
                    bestScore = this.checkForWin(pos);
                    continue;
                }

                let score = this.minimax(this.generatePossiblePositionsComputer(pos), depth - 1, true);
                if (score < bestScore) {
                    bestScore = score;
                }

            }
            return bestScore;
        }
    }

    checkForWin(board) {
        let countUser = 0;
        let countComputer = 0; 

        if (board[0] && (board[0] === board[1] && board[1] === board[2])) {
            if (board[0] === this.userChoice) {
                countUser -= 1;
            } else {
                countComputer += 1;
            }
        } 
        
        if (board[3] && (board[3] === board[4] && board[4] === board[5])) {
            if (board[3] === this.userChoice) {
                countUser -= 1;
            } else {
                countComputer += 1;
            }
        } 
        
        if (board[6] && (board[6] === board[7] && board[7] === board[8])) {
            if (board[6] === this.userChoice) {
                countUser -= 1;
            } else {
                countComputer += 1;
            }
        } 
        
        
        if (board[0] && (board[0] === board[3] && board[3] === board[6])) {
            if (board[0] === this.userChoice) {
                countUser -= 1;
            } else {
                countComputer += 1;
            }
        } 
        
        
        if (board[1] && (board[1] === board[4] && board[4] === board[7])) {
            if (board[1] === this.userChoice) {
                countUser -= 1;
            } else {
                countComputer += 1;
            }
        } 
        
        
        if (board[2] && (board[2] === board[5] && board[5] === board[8])) {
            if (board[2] === this.userChoice) {
                countUser -= 1;
            } else {
                countComputer += 1;
            }
        } 
        
        
        if (board[0] && (board[0] === board[4] && board[4] === board[8])) {
            if (board[0] === this.userChoice) {
                countUser -= 1;
            } else {
                countComputer += 1;
            }
        } 
        
        if (board[2] && (board[2] === board[4] && board[4] === board[6])) {
            if (board[2] === this.userChoice) {
                countUser -= 1;
            } else {
                countComputer += 1;
            }
        }
        
        var counter = 0;
        for (let i = 0; i < board.length; i ++) {

            let choice = board[i];
            if (choice) {
                counter += 1; 
            }
        }
        
        if (countUser === -1 && countComputer === 0) {
            return countUser;
        } else if (countUser === 0 && countComputer === 1) {
            return countComputer; 
        } else if (counter < 9 && (countUser === -1 && countComputer === 1)) {
            return 0;
        } else if (counter === 9 && (Math.abs(countUser) === Math.abs(countComputer))) {
            return 0;
        } 

    }

    declareWinner(score) {
        if (score === -1) {
            headerSlot.innerText = 'YOU WIN!';
        } else if (score === 1) {
            headerSlot.innerText = 'YOU LOSE!';
        } else if (score === 0) {
            headerSlot.innerText = 'DRAW!'
        }
    }

}

const newGame = new Tic();

userChoices.forEach(choice => {
    choice.addEventListener('click', () => {
        newGame.reset()
        newGame.storeUserChoice(choice.innerText);
        choice.style.backgroundColor = "red";

        if (choice.id === 'x') {
            document.getElementById('o').style.backgroundColor = "white";
        } else {
            document.getElementById('x').style.backgroundColor = "white";
        }
    })
})

buttons.forEach(button => {
    button.addEventListener('click', () => {
        newGame.storeUserPosition(button.id);
    })
})

resetButton.addEventListener('click', () => {
    newGame.reset();
})

