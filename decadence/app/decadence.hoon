/-  *decadence
/+  default-agent, dbug, agentio, mast, demons, *playingcards, *decadence
|%
+$  versioned-state
    $%  state-0
    ==
+$  state-0  [%0 state]
+$  card  card:agent:gall
--
%-  agent:dbug
=|  state-0
=*  state  -
^-  agent:gall
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %.n) bowl)
::
++  on-init
    ^-  (quip card _this)
    `this
++  on-save
    ^-  vase
    !>(state)
++  on-load
    |=  old-state=vase
    ^-  (quip card _this)
        =/  old  !<(versioned-state old-state)
        ?-  -.old
            %0  `this(state old)
        ==
++  on-poke
    |=  [=mark =vase]
    ^-  (quip card _this)
    |^
    ?>  =(src.bowl our.bowl)
    ?+  mark  (on-poke:def mark vase)
        %decadence-action
        =^  cards  state
        (handle-action !<(action vase))
    [cards this]
    ==
    ++  handle-action
        |=  =action
        ^-  (quip card _state)
        ?-  -.action
            %start
                ?-  subdec.action
                    %.n  `state(game 1, currentdeck (shuffle-deck make-decadence-deck eny.bowl), subdecadence %.n)
                    %.y  `state(game 1, currentdeck (shuffle-deck make-subdecadence-deck eny.bowl), subdecadence %.y)
                ==
            %deal
                =/  newsetone    (draw 5 currentdeck)
                =/  newsettwo    (draw 5 +.newsetone)
                `state(setone (turn hand.newsetone flipcard), settwo hand.newsettwo, currentdeck rest.newsettwo)
            %flip
                `state(settwo (snap settwo +.action (flipcard (snag +.action settwo))))
            %match
                =/  setonecard   (snag setonechoice.action setone)
                =/  settwocard   (snag settwochoice.action settwo)
                ?.  (valid-check [setonecard settwocard subdecadence])
                    ~|('invalid match' !!)
                =/  matchscore   (score-match setonecard settwocard)
                :-  ~  
                %=  state
                    gamescore    (add:rs gamescore matchscore)
                    setone       (snap setone setonechoice.action *darc)
                    settwo       (snap settwo settwochoice.action *darc)
                ==
            %submit
                =/  decadent   (roll (pull-values setone) add:rs)  :: summing values of setone to subtract from score
                =/  finalgamescore  (sub:rs decadent gamescore)
                ?:  (gth:rs finalgamescore .0)
                    `state(game +(game), aeonscore (add:rs aeonscore finalgamescore), gamescore .0, currentdeck *deck, setone *deck, settwo *deck)
                ?:  =(finalgamescore .0)
                    =/  lurgo  (summondemon:demons finalgamescore)
                    ~&  lurgo
                    ~&  'With a score of 0, you may either continue or terminate here.'
                    `state(game +(game), aeonscore (add:rs aeonscore finalgamescore), gamescore .0, currentdeck *deck, setone *deck, settwo *deck)
                =/  demon  (summondemon:demons finalgamescore)
                ~&  demon
                ~&  "Game over. Final score: {<finalgamescore>}"
                `state(game 0, aeonscore .0, gamescore .0, game 0, currentdeck *deck, setone *deck, settwo *deck)
        ==
        --
++  on-watch  on-watch:def
++  on-peek   on-peek:def
++  on-leave  on-leave:def
++  on-agent  on-agent:def
++  on-arvo   on-arvo:def
++  on-fail   on-fail:def
--