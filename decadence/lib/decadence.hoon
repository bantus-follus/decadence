/-  *decadence
/+  playingcards
|%
++  valid-check
    |=  [setonecard=darc settwocard=darc subdecadence=?]
    ^-  ?
        ?-  subdecadence
            %.y  =((add:rs val.setonecard val.settwocard) .9)
            %.n  =((add:rs val.setonecard val.settwocard) .10)
        ==

++  score-match
    |=  [setonecard=darc settwocard=darc]
    ^-  @rs
        =/  values  [val.setonecard val.settwocard]
        ?:  (gte:rs -.values +.values)
            (sub:rs -.values +.values)
            (sub:rs +.values -.values)
++  pull-values
    |=  pulldeck=deck
    ^-  (list @rs)
        (turn pulldeck pull-value)
++  pull-value
    |=  pulldarc=darc
    ^-  @rs
        val.pulldarc
++  remove-cards
    |=  [currentdeck=deck cardstoremove=deck]
    ^-  deck
    ~&  cardstoremove
    =/  cardstoremove  (turn cardstoremove flipcardfacedown.playingcards)
    =/  i  0
    |-
    ~&  [i (lent cardstoremove) (lent currentdeck)]
    ?:  =(i (lent cardstoremove))
        currentdeck
    =/  cardtoremove  (snag i cardstoremove)
    =/  index         (find `(list darc)`[cardtoremove ~] currentdeck)
    %=  $
        i  +(i)
        currentdeck    ?~  index  currentdeck  (oust [(need index) 1] currentdeck)
    ==
::  frontend
--