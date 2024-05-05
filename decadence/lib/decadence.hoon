/-  *decadence
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
--