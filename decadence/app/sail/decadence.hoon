/-  decadence
/+  *decadence
|=  state=state-0.decadence
=,  state
^.  manx
|^

;html
    ;head
        ;meta(charset "utf-8");
        ;link(href "/apps/decadence/css", rel "stylesheet");
    ==
    ;body
         ::  Stats
        ;br;
        ;div(id "scoreboard")
        ;p(font-weight "bold"):  Angelic Index: {(slag 1 "{<aeonscore>}")}, Game Score: {(slag 1 "{<gamescore>}")}, Game Number: {<game>}, Subdecadence: {<subdecadence>}
        ;br;
        ;br;
        ==
        ;div(id "game_area")
            ;img@"https://schizohost.nyc3.cdn.digitaloceanspaces.com/spine1.png";
            ::  Atlantean Cross
                ;div(id "cross_container")
                    ;+  ?~  setone
                            empty-cross
                            active-cross
                ==
                ;div(id "card_container")
            ::  Hand
                ;div(id "hand_container")
                    ;+  ?~  settwo
                            empty-hand
                            active-hand
                ==
            ::  Deck
                ;div(id "deck_container")
                    ;*  (deck-gen currentdeck)
                ==
            ;br;
            ::  Selection
                
                ;+  =/  nullcheck  [=(-.selection ~) =(+.selection ~)]
                    ?+  nullcheck  !!
                        [%.y %.y]  ;div(id "null");
                        [%.y %.n]  ::  settwo has card, setone null
                                   ;div(id "selection_container")
                                   ;div(class "cardbox")
                                   ;+  (no-click-card-gen (need settwocard.selection))
                                   ==  ==
                        [%.n %.y]    ::  settwo has card, setone null
                                   ;div(id "selection_container")
                                   ;div(class "cardbox")
                                   ;+  (no-click-card-gen (need setonecard.selection))
                                   ==  ==
                        [%.n %.n]    ::  settwo has card, setone null
                                   ;div(id "selection_container")
                                   ;div(class "cardbox")
                                   ;+  (no-click-card-gen (need setonecard.selection))
                                   ==
                                   ;div(class "cardbox")
                                   ;+  (no-click-card-gen (need settwocard.selection))
                                   ==  ==
                    ==
                    
            ::::  Menu
            ;div(id "menu_container")
            ::  Match Button
                    ;+  =/  nullcheck  [=(-.selection ~) =(+.selection ~)]
                    ?.  =(nullcheck [%.n %.n])
                            ;div(id "null");
                    ;div(class "menu_button", event "/click/match")
                        ;h2: Match
                    ==
            ::  Start
                    ;+  ?:  (lth game 1)
                        ;div(class "start_container")
                            ;div(class "check_container")
                                ;select(id "subdec", name "subdec")
                                    ;option(value "decadence"): Decadence
                                    ;option(value "subdecadence"): Subdecadence
                                ==
                            ==
                            ;div(class "menu_button", event "/click/start", return "/subdec/value")
                                ;h2: Start
                            ==
                        ==
                    ;div(id "null");
            ::  Deal
                ;+  ?~  setone
                    ?:  ?&  (gth game 0)  !=(message "Demon Called: 'Mesh-00: Lurgo (Legba). (Terminal) Initiator. (Clicks Gt-00). Pitch Ana-1. Net-Span 1::0. Amphidemon of Openings. (The Door of Doors). Cipher Gt-01, Gt-10. 1st Door (The Pod) [Mercury], Dorsal. 1st Phase-limit. Decadology. C/tp-#7, Mj+ [7C]. Rt-1:[1890] Spinal-voyage (fate line), programming.'")  ==
                        ;div(class "menu_button", event "/click/deal")
                            ;h2: Deal
                        ==
                    ;div(id "null");
                    ;div(id "null");
            ::  Submit
                ;+  ?:  ?&  (gth game 0)  !=(message "Demon Called: 'Mesh-00: Lurgo (Legba). (Terminal) Initiator. (Clicks Gt-00). Pitch Ana-1. Net-Span 1::0. Amphidemon of Openings. (The Door of Doors). Cipher Gt-01, Gt-10. 1st Door (The Pod) [Mercury], Dorsal. 1st Phase-limit. Decadology. C/tp-#7, Mj+ [7C]. Rt-1:[1890] Spinal-voyage (fate line), programming.'")  ==
                        ;div(class "menu_button", event "/click/submit")
                            ;h2: Submit
                        ==
                    ;div(id "null");
            ::  Shuffle Deck
                ;+  ?:  ?&  (gth game 0)  (lte (lent currentdeck) 10)  !=(message "Demon Called: 'Mesh-00: Lurgo (Legba). (Terminal) Initiator. (Clicks Gt-00). Pitch Ana-1. Net-Span 1::0. Amphidemon of Openings. (The Door of Doors). Cipher Gt-01, Gt-10. 1st Door (The Pod) [Mercury], Dorsal. 1st Phase-limit. Decadology. C/tp-#7, Mj+ [7C]. Rt-1:[1890] Spinal-voyage (fate line), programming.'")  ==
                        ;div(class "menu_button", event "/click/newdeck")
                            ;h2: Shuffle Deck
                        ==
                    ;div(id "null");
            ::  Reset
                ;+  ?:  (gth game 0)
                        ?:  =(message "Demon Called: 'Mesh-00: Lurgo (Legba). (Terminal) Initiator. (Clicks Gt-00). Pitch Ana-1. Net-Span 1::0. Amphidemon of Openings. (The Door of Doors). Cipher Gt-01, Gt-10. 1st Door (The Pod) [Mercury], Dorsal. 1st Phase-limit. Decadology. C/tp-#7, Mj+ [7C]. Rt-1:[1890] Spinal-voyage (fate line), programming.'")
                            ;div(class "menu_button", data "Resetid", event "/click/reset")
                                ;h2: End
                            ==
                        ;div(class "menu_button", data "Resetid", event "/click/reset")
                            ;h2: Reset
                        ==
                    ;div(id "null");
            ==
            ==
             ::  message
            ;div(id "message")
                 ;h3: {message}
            ==
        ==
    ;+  rules-script
    ==
==
::  Display cores
++  empty-cross
    ;div(id "atlantean_cross")
            ;div(class "cardbox", id "far_future")
                ;p: Far Future
                ;div(class "empty");
            ==
            ;div(class "cardbox", id "destructive_influences")
                ;p: Destructive Influences
                ;div(class "empty");
            ==
            ;div(class "cardbox", id "creative_influences")
                ;p: Creative Influences
                ;div(class "empty");
            ==
            ;div(class "cardbox", id "memories_and_dreams")
                ;p: Memories and Dreams
                ;div(class "empty");
            ==
            ;div(class "cardbox", id "deep_past")
                ;p: Deep Past
                ;div(class "empty");
            ==
    ==
++  active-cross
        ;div(id "atlantean_cross")
            ;+  (active-cross-gen 0)
            ;+  (active-cross-gen 1)
            ;+  (active-cross-gen 2)
            ;+  (active-cross-gen 3)
            ;+  (active-cross-gen 4)
        ==
++  empty-hand
    ;div(id "hand")
        ;div(class "cardbox")
             ;div(class "empty");
        ==
        ;div(class "cardbox")
             ;div(class "empty");
        ==
        ;div(class "cardbox")
             ;div(class "empty");
        ==
        ;div(class "cardbox")
             ;div(class "empty");
        ==
        ;div(class "cardbox")
             ;div(class "empty");
        ==
    ==
++  active-hand
    ;div(id "hand")
        ;+  (active-hand-gen 0)
        ;+  (active-hand-gen 1)
        ;+  (active-hand-gen 2)
        ;+  (active-hand-gen 3)
        ;+  (active-hand-gen 4)
    ==
::  Helper cores
::++  card-box-gen
::   |=  check@ud
::  ^-  (list manx)
::  =/  cardtocheck  (snag check settwo)
::  ?:  =(faceup.cardtocheck %.y)
::      ;div(class "cardbox")
::  ;div(class "cardbox", event "/click/flip", return "/settwo0/value")
++  active-hand-gen
    |=  order=@ud
    ^-  manx
    =/  pulled-card  (snag order settwo)
    =/  clickselect  ?+(order !! %0 "zero", %1 "one", %2 "two", %3 "three", %4 "four")
    ?:  =(pulled-card [%null .0 %.n])
            ;div(class "cardbox")
            ;div(class "empty");
            ==
    ?:  =(faceup.pulled-card %.n)
        ;div(class "cardbox", event "/click/flip/{clickselect}")
             ;+  (card-gen pulled-card)
        ==
    ?~  settwocard.selection
            ;div(class "cardbox", event "/click/select/settwo/{clickselect}")
            ;+  (card-gen pulled-card)
            ==
    ?:  =(pulled-card (tail settwocard.selection))
            ;div(class "cardbox")
            ;div(class "empty");
            ==
    ;div(class "cardbox", event "/click/select/settwo/{clickselect}")
    ;+  (card-gen pulled-card)
    ==
++  active-cross-gen
    |=  order=@ud
    ^-  manx
    =/  position     ?+(order !! %0 "Far Future", %1 "Destructive Influences", %2 "Creative Influences", %3 "Memories and Dreams", %4 "Deep Past")
    =/  divid        ?+(order !! %0 "far_future", %1 "destructive_influences", %2 "creative_influences", %3 "memories_and_dreams", %4 "deep_past")
    =/  clickselect  ?+(order !! %0 "zero", %1 "one", %2 "two", %3 "three", %4 "four")
    ?:  =((snag order setone) [%null .0 %.n])
            ;div(class "cardbox", id divid)
                ;p: {position}
            ;div(class "empty");
            ==
    ?~  setonecard.selection
            ;div(class "cardbox", id divid, event "/click/select/setone/{clickselect}")
                ;p: {position}
            ;+  (card-gen (snag order setone))
            ==
    ?:  =((snag order setone) (tail setonecard.selection))
            ;div(class "cardbox", id divid)
                ;p: {position}
            ;div(class "empty");
            ==
    ;div(class "cardbox", id divid, event "/click/select/setone/{clickselect}")
        ;p: {position}
    ;+  (card-gen (snag order setone))
    ==
++  card-gen
    |=  darc=darc:decadence
    ?:  =(faceup.darc %.n)
                ;div(class "facedown");
        ;div(class "carddisplay")
            ;img(class "suitimage", src (sut-match darc));
            ; {(card-value-display-parse darc)}
        ==
++  no-click-card-gen
    |=  darc=darc:decadence
    ?:  =(faceup.darc %.n)
                ;div(class "facedown");
        ;div(class "carddisplay2")
            ;img(class "suitimage", src (sut-match darc));
            ; {(card-value-display-parse darc)}
        ==
++  deck-gen
    |=  deck=deck:decadence
    ^-  marl
    =/  decklength  (lent deck)
    =/  deckcard     ;div(class "cardbox")
                     ;div(class "facedownnoclick");
                     ==
    (reap decklength deckcard)
++  sut-match
    |=  darc=darc:decadence
    ?-  sut.darc
        %diamonds  diamonds
        %clubs     clubs
        %hearts    hearts
        %spades    spades
        %null      ""
    ==
++  card-value-display-parse
    |=  darc=darc:decadence
    (slag 1 "{<val.darc>}")
++  diamonds  "https://schizohost.nyc3.cdn.digitaloceanspaces.com/decadence/playing-card-diamond-shape-icon.png"
++  clubs     "https://schizohost.nyc3.cdn.digitaloceanspaces.com/decadence/playing-card-club-shape-icon.png"
++  hearts    "https://schizohost.nyc3.cdn.digitaloceanspaces.com/decadence/playing-card-heart-shape-icon.png"
++  spades    "https://schizohost.nyc3.cdn.digitaloceanspaces.com/decadence/playing-card-spade-shape-icon.png"
++  null      ""
++  rules-script
;div(id "rules_container")
;h2: Decadence . .
;hr;
;p: The Adept Orders of Decadence trace their system back to the period immediately following the submergence of Atlantis, which they date to 10 000 BC.
;p: It is linked to the origin of Sumero-Babylonian geometry, from which we derive the division of the circle into 360 (= 36 x 10) degrees. In the ancient egyptian mysteries it was attributed to the god of catastrophe and drowning - Osiris - who was later symbolized by The Hanged Man of the Tarot (taken by decadologists as an image of the Atlantean Cross).
;p: Decadence adepts consider post-atlantean history to be surreptitiously guided by the outcomes of select Decadence Aeons, which have the status of solemn rituals. Searching out the occurrence and outcomes of such destining Decadence sessions is preeminent amongst the tasks adopted by decadological research, combining exact history, practical conspiracy, numerology, and occult angelology. It is said that materials contributing to this work are meticulously archived in the AOE Hall of Records.
;h3: The Game .
;p: Truncate a standard pack of playing cards, removing all royal cards, tens, and jokers. The remainder constitutes a Decadence park of thirty-six cards.
;p: Five cards are dealt face up (Set-1), and another five dealt face down (Set-2).
;p: Turn over Set-2 cards one at a time, and by adding these cards to those in Set-1, construct pairs summing to ten.
;p: Scoring is calculated as follows: Each pair scores positively, according to its differences [from 5:5 = 0 to 9:1 = 8]. Unpaired cards (in Set-1) score negatively, according to their raw values [1 = 1 to 9 = 9]. Overall results can be positive or negative. A round (Aeon) of Decadance lasts until the first negative result, accumulating any positive scores.
;h3: The Oracle (decadology and decamancy) .
;p: Positive results contribute the the Angelic Index of the Decadence game, and are referred to the Decamantic tables of AOE-Angelogy. The maximum gain from any single game is thirty-eight, but this can be exceeded (in principle) by cumulations from game to game until completion of an Aeon.
;p: Negative results (from zero to forty-four ) call demons, and are referred to mesh-numbers of the Pandemonium Matrix.
;p: Since a demon-call concludes each Decadence Aeon a particular value is attributed to Lurgo (Mesh-00), since this demon alone allows a termination without loss.
;p: The western (or Atlantean) uptake of Pandemonium has its own esotoric gnosis called Decadology. This doctrine assigns the Amphidemons and Cyclic Chronodemons of Lemurian Pandemonium to one of nine cluster types (C/tp-#), determined by the pattern of their rites. Each cluster type is instantiated by four demons, in isomorphy with the thirty-six cards of the decadence pack. These decadological correspondences are marked on the Pandemonium Matrix.
;p: Decadology assumes a particular distribution of the five Set-1 cards, in which they are laid out on Pylons arranged in the configuration of the Atlantean Cross. Far Future Destructive Influences ¨ ¨ Creative Influences ¨ Memories & Dreams ¨ Deep Past
;h3: Subdecadance (the ultimate blasphemy) .
;p: Add four Queens to the Decadance pack, bringing the total to forty cards. Queens have a value of zero.
;p: Play as Decadance, except making pairs which add to nine (corresponding to Numogram Syzygies). 
;h3: Angelic Index .
;p: Sum produced by positive Decadence outcomes. According to AOE decadology, the measure of good fortune, or celestial favour.
;br;
;br;
;p: Source: 
;a/"https://www.ccru.net/digithype/pandemonium.htm": https://www.ccru.net/digithype/pandemonium.htm
==
--