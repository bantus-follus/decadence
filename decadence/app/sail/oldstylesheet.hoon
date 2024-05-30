^~
'''
body {
    background-color: #DDBF95;
    background-image: 
        radial-gradient(circle, rgba(255, 255, 255, 0.3) 1px, transparent 1px),
        radial-gradient(circle, rgba(255, 255, 255, 0.3) 1px, transparent 1px),
        linear-gradient(#D8B38D 50%, transparent 50%),
        linear-gradient(90deg, #D8B38D 50%, transparent 50%);
    background-size: 10px 5px, 1px 20px, 20px 20px, 50px 50px;
    background-position: 1 0, 10px 10px, 0 0, 0 0;
}
#scoreboard  {
    font-weight: bold;
    text-align: center;
}
#rules_container {
    
}
.carddisplay {
    width: 50px;
    height: 100px;
    border: 2px solid black;
    align-items: center;
    justify-content: center;
    display: flex;
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    background-color: #E5C49E;
    position: relative;
    text-weight: bold;
}

.carddisplay:hover {
    transform: scale(1.1);
    cursor: pointer;
}

.carddisplay2 {
    width: 50px;
    height: 100px;
    border: 2px solid black;
    align-items: center;
    justify-content: center;
    display: flex;
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    background-color: #E5C49E;
    position: relative;
    text-weight: bold;
}

.suitimage {
    position: absolute;
    width: 20px;
    height: 20px;
    top: 0;
    right: 0;
}

.facedown, .facedownnoclick {
    margin-left: var(--overlap-amount);
    width: 50px;
    height: 100px;
    border: 2px solid black;
    align-items: center;
    justify-content: center;
    display: flex;
    box-sizing: border-box;
    background-color: #E5C49E;
    background-image: repeating-linear-gradient(
        45deg,
        black,
        black 5px,
        #E5C49E 5px,
        #E5C49E 10px
    );
}

.facedown:hover {
    transform: scale(1.1);
    cursor: pointer;
}

.empty {
    width: 50px;
    height: 100px;
    border: 2px solid black;
    align-items: center;
    justify-content: center;
    display: flex;
    box-sizing: border-box;
    background-color: #f3e2d0;
}

.cardbox {
    font-weight: bold;
    display: flex;
    align-text: center;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    margin: 0;
    padding: 0;
}

#game_area {
    display: flex;
    justify-content: center;
    height: 700px;
}

#cross_container {
    display: flex;
    padding: 10px;
}

#atlantean_cross {
    display: grid;
    grid-template-columns: repeat(3, auto);
    grid-template-rows: repeat(4, auto);
    gap: 0px;
    justify-items: center;
    align-items: center;
    align-text:  center;
    border: 2px solid #000;
    padding: 10px;
    background-color: #f0f0f0;
    width: 400px; /* Set fixed width */
    height: 700px; /* Set fixed height */
    box-sizing: border-box;
}

#far_future {
    grid-row: 1;
    grid-column: 2;
}

#destructive_influences {
    grid-row: 2;
    grid-column: 1;
}

#creative_influences {
    grid-row: 2;
    grid-column: 3;
}

#memories_and_dreams {
    grid-row: 3;
    grid-column: 2;
}

#deep_past {
    grid-row: 4;
    grid-column: 2;
}

#card_container {
    position: relative;
    display: flex;
    flex-direction: column; /* Stack #hand and #deck_container vertically */
    align-items: flex-start; /* Align items to the left */
    padding: 0;
    margin: 0;
    height: 700px;
    width:  550px;
}

.hand_container {
    display: flex;
    flex-direction: row;
    height: auto;
    padding: 0;
    margin: 0;
}

#deck_container {
    padding-left: 50px;
    margin-top: 10px; /* Add space between the hand and deck */
    display: flex;
    align-items: flex-start; /* Align items to the left */
    --overlap-amount: -40px; /* Default overlap amount */
}

#hand {
    display: flex;
    flex-direction: row;
    gap: 10px;
}

#selection_container {
    display: flex;
    flex-direction: row;
    gap: 10px;
}

#menu_container {
    padding-left: 400px;
    padding-bottom: 15px;
    height: 300px;
    width:  100px;
    position: absolute;
    bottom: 0px;
    flex-wrap: wrap;
    bottom: 0;
    right: 0;
}

.menu_button {
    display: flex;
    font-size: 15px;
    width: 100px;
    height: 100px;
    flex-direction: column;
    text-align: center;
    justify-content: center;
    align-items: center;
    border: 2px solid #000;
    box-sizing: border-box;
    background-color: #f0f0f0;
    padding: 10px;
}

.menu_button:hover {
    transform: scale(1.1);
    cursor: pointer;
}

.check_container {
    font-size: 12px;
    font-weight: bold;
}
#subdec_check {
    float: right;
}

'''