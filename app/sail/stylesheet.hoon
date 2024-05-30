^~
'''
* {
    font-family: "Courier New", Times, serif;
}
p, h3, h2, h1, hr {
    color: darkgreen;
}
body {
    background-color: #a8a8a8;
    background-image: 
        radial-gradient(circle, rgba(255, 255, 255, 0.4) 2px, transparent 2px),
        radial-gradient(circle, rgba(230, 230, 230, 0.4) 2px, transparent 2px),
        linear-gradient(#cccccc 50%, transparent 50%),
        linear-gradient(90deg, #cccccc 50%, transparent 50%);
    background-size: 15px 10px, 5px 30px, 25px 25px, 60px 60px;
    background-position: 5px 0, 20px 20px, 0 0, 0 0;
}


#scoreboard  {
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    font-weight: bold;
    background-color: lightgrey;
    height: 30px;
    width:  700px;
    border: 2px solid black;
    margin: 15px;
}

#game_area {
    display: flex;
    margin: 15px;
    border: 2px solid black;
    padding: 10px;
    background-color: #f0f0f0;
    background-image: linear-gradient(90deg, #e0e0e0 25%, transparent 25%, transparent 50%, #e0e0e0 50%, #e0e0e0 75%, transparent 75%, transparent);
    background-size: 60px 60px;
}

#card_container {
    position: relative;
    display: flex;
    flex-direction: column;
    align-self: center; 
    padding: 0;
    margin: 0;
    height: 750px;
    width:  550px;
}

#deck_container {
    display: flex;
    align-items: flex-start;
    position: relative;
    --overlap-amount: -65px;
    padding-left: 55px;
}

#hand {
    display: flex;
    flex-direction: row;
    gap: 10px;
}
#rules_container {
    background-color: #f0f0f0;
    background-image: linear-gradient(90deg, #e0e0e0 25%, transparent 25%, transparent 50%, #e0e0e0 50%, #e0e0e0 75%, transparent 75%, transparent);
    background-size: 60px 60px;
    padding: 10px;
    margin: 15px;
    border: 2px solid black;
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
    background-color: #A5D6A7;
    position: relative;
    font-weight: bold;
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
    background-color: #A5D6A7;
    position: relative;
    font-weight: bold;
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
    background-color: #A5D6A7; /* Light green background color */
    background-image: repeating-linear-gradient(
        45deg,
        black,
        black 5px,
        #A5D6A7 5px, /* Light green background color */
        #A5D6A7 10px  /* Light green background color */
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
    background-color: darkgrey;
}

.cardbox {
    justify-content: center;
    align-items: center;
    text-align: center;
    display: flex;
    flex-direction: column;
    justify-items: center;
    padding: 10px;
}


#cross_container {
    justify-items: center;
    display: inline-block;
    align-items: center;
}

#atlantean_cross {
    display: grid;
    grid-template-columns: repeat(3, auto);
    grid-template-rows: repeat(4, auto);
    justify-items: center;
    align-items: center;
    border: 2px solid #000;
    padding: 10px;
    background-color: #f0f0f0;
    background-image: linear-gradient(45deg, #e0e0e0 25%, transparent 25%, transparent 50%, #e0e0e0 50%, #e0e0e0 75%, transparent 75%, transparent);
    background-size: 60px 60px;
    width: 400px;
    height: 750px;
    margin-left: 20px;
    position: relative;
}

#atlantean_cross::before {
    content: '';
    position: absolute;
    top: 0;
    bottom: 0;
    left: 50%;
    width: 10px;
    background-color: lightgreen;
    z-index: -0;
    transform: translateX(-50%);
}

#atlantean_cross::after {
  content: '';
  position: absolute;
  top: 40%;
  left: 0;
  right: 0;
  height: 10px; /* Adjust the height of the horizontal line as needed */
  background-color: lightgreen; /* Adjust the color of the horizontal line as needed */
  z-index: -0; /* Ensure the line is behind other elements */
  transform: translateY(-50%); /* Center the line exactly in the middle */
}


#far_future {
    grid-row: 1;
    grid-column: 2;
    font-weight: bold;
    z-index: 1;
}

#destructive_influences {
    grid-row: 2;
    grid-column: 1;
    font-weight: bold;
    z-index: 1;
}

#creative_influences {
    grid-row: 2;
    grid-column: 3;
    font-weight: bold;
    z-index: 1;
}

#memories_and_dreams {
    grid-row: 3;
    grid-column: 2;
    font-weight: bold;
    z-index: 1;
}

#deep_past {
    grid-row: 4;
    grid-column: 2;
    font-weight: bold;
    z-index: 1;
}

#selection_container {
    display: flex;
    flex-direction: row;
    gap: 10px;
}

#message {

}

#menu_container {
    display: flex;
    flex-direction: row;
    position: absolute;
    bottom: 0;
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
    margin: 10px;
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