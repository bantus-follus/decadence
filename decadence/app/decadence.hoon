/-  *decadence
/+  default-agent, dbug, agentio, mast, demons, *playingcards, *decadence, mast
/=  frontend    /app/sail/decadence
/=  stylesheet  /app/sail/stylesheet
|%
+$  card  card:agent:gall
--
%-  agent:dbug
=|  state-0
=*  state  -
^-  agent:gall
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %.n) bowl)
    io    ~(. agentio bowl)
    routes  %-  limo  :~
                      :-  /app/decadence  frontend
                      ==
::
++  on-init
    ^-  (quip card _this)
    :_  this
    [(~(arvo pass:io /bind) %e %connect `/'app'/'decadence' %decadence) ~]
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
    =^  cards  state
    ?+  mark  (on-poke:def mark vase)
        %handle-http-request   (handle-http-request !<([@ta inbound-request:eyre] vase))
        %json                  (handle-json-request !<(json vase))
    ==
    [cards this]
    ++  handle-http-request
        |=  [eyre-id=@ta req=inbound-request:eyre]
        ^-  (quip card _state)
        ?.  authenticated.req
            [(make-auth-redirect:mast eyre-id) state]
        ?+  method.request.req  [(make-400:mast eyre-id) state]
            %'GET'
            =/  url=path  (parse-url:mast url.request.req)
            ?:  =(/decadence/css url)
                [(make-css-response:mast eyre-id stylesheet) state]
            =/  new-display  (rig:mast routes url state)
            :-  (plank:mast "decadence" /display-updates our.bowl eyre-id new-display)
            state(front [new-display url])
        ==
    ++  handle-json-request
        |=  json-request=json
        ^-  (quip card _state)
        =/  client-poke  (parse-json:mast json-request)
        ?+  [`@tas`(snag 0 `path`tags.client-poke) `@tas`(snag 1 `path`tags.client-poke) ~]  !!
            [%click %start ~]     =/  subdecselect  ^-  @tas  (~(got by data.client-poke) '/subdec/value')
                                  ?+  subdecselect   !!
                                      %subdecadence   =/  new-state    state(game 1, aeonscore .0, setone *deck, settwo *deck, gamescore .0, currentdeck (shuffle-deck make-subdecadence-deck eny.bowl), subdecadence %.y, message "Beginning Subdecadence")
                                                      =/  new-display  (rig:mast routes current-url:front new-state)
                                                      :-  [(gust:mast /display-updates display:front new-display) ~]
                                                      state(game 1, aeonscore .0, gamescore .0, setone *deck, settwo *deck, currentdeck (shuffle-deck make-subdecadence-deck eny.bowl), subdecadence %.y, message "Beginning Subdecadence", front [new-display current-url:front])
                                      
                                      %decadence      =/  new-state    state(game 1, aeonscore .0, gamescore .0, setone *deck, settwo *deck, currentdeck (shuffle-deck make-decadence-deck eny.bowl), subdecadence %.n, message "Beginning Decadence")
                                                      =/  new-display  (rig:mast routes current-url:front new-state)
                                                      :-  [(gust:mast /display-updates display:front new-display) ~]
                                                      state(game 1, aeonscore .0, gamescore .0, setone *deck, settwo *deck, currentdeck (shuffle-deck make-decadence-deck eny.bowl), subdecadence %.n, message "Beginning Decadence", front [new-display current-url:front])
                                  ==
            [%click %newdeck ~]   =/  new-deck   ?:  =(subdecadence %.y)  (shuffle-deck make-subdecadence-deck eny.bowl)  (shuffle-deck make-decadence-deck eny.bowl)
                                  =/  in-play    (weld setone settwo)
                                  =/  new-deck   (remove-cards [new-deck in-play])
                                  =/  new-state  state(currentdeck new-deck, message "Shuffled Deck")
                                  =/  new-display  (rig:mast routes current-url:front new-state)
                                  :-  [(gust:mast /display-updates display:front new-display) ~]
                                  state(currentdeck new-deck, message "Shuffled Deck", front [new-display current-url:front])
            [%click %deal ~]      =/  newsetone    (draw 5 currentdeck)
                                  =/  newsettwo    (draw 5 +.newsetone)
                                  =/  new-state    state(setone (turn hand.newsetone flipcard), settwo hand.newsettwo, currentdeck rest.newsettwo, message "Dealing...")
                                  =/  new-display  (rig:mast routes current-url:front new-state)
                                  :-  [(gust:mast /display-updates display:front new-display) ~]
                                  state(setone (turn hand.newsetone flipcard), settwo hand.newsettwo, currentdeck rest.newsettwo, message "Dealing...", front [new-display current-url:front])
            [%click %submit ~]    =/  decadent   (roll (pull-values setone) add:rs)  :: summing values of setone to subtract from score
                                  =/  finalgamescore  (sub:rs gamescore decadent)
                                  ?:  (gth:rs finalgamescore .0)
                                          =/  new-state  state(game +(game), aeonscore (add:rs aeonscore finalgamescore), gamescore .0, setone *deck, settwo *deck, selection [*(unit darc) *(unit darc)], message "Angelic Index: {`tape`(slag 1 "{<(add:rs aeonscore finalgamescore)>}")}")
                                          =/  new-display  (rig:mast routes current-url:front new-state)
                                          :-  [(gust:mast /display-updates display:front new-display) ~]
                                          state(game +(game), aeonscore (add:rs aeonscore finalgamescore), gamescore .0, setone *deck, settwo *deck, selection [*(unit darc) *(unit darc)], message "Angelic Index: {<aeonscore>}", front [new-display current-url:front])
                                  ?:  =(finalgamescore .0)
                                      =/  lurgo  (summondemon:demons finalgamescore)
                                      =/  new-state  state(game +(game), aeonscore (add:rs aeonscore finalgamescore), gamescore .0, currentdeck *deck, setone *deck, settwo *deck, selection [*(unit darc) *(unit darc)], message "Demon Called: {<lurgo>}")
                                      =/  new-display  (rig:mast routes current-url:front new-state)
                                      :-  [(gust:mast /display-updates display:front new-display) ~]
                                      state(game +(game), aeonscore (add:rs aeonscore finalgamescore), gamescore .0, setone *deck, currentdeck *deck, settwo *deck, selection [*(unit darc) *(unit darc)], message "Demon Called: {<lurgo>}", front [new-display current-url:front])
                                  =/  demon  (summondemon:demons finalgamescore)
                                  =/  new-state  state(game 0, gamescore .0, game 0, currentdeck *deck, setone *deck, settwo *deck, selection [*(unit darc) *(unit darc)], message "Demon Called: {<demon>}")
                                  =/  new-display  (rig:mast routes current-url:front new-state)
                                  :-  [(gust:mast /display-updates display:front new-display) ~]
                                  state(game 0, game 0, currentdeck *deck, setone *deck, settwo *deck, selection [*(unit darc) *(unit darc)], front [new-display current-url:front], message "Demon Called: {<demon>}")
            [%click %reset ~]     =/  new-state  state(game 0, aeonscore .0, gamescore .0, game 0, currentdeck *deck, setone *deck, settwo *deck, selection [*(unit darc) *(unit darc)], message "Resetting")
                                  =/  new-display  (rig:mast routes current-url:front new-state)
                                  :-  [(gust:mast /display-updates display:front new-display) ~]
                                  state(game 0, aeonscore .0, gamescore .0, game 0, currentdeck *deck, setone *deck, settwo *deck, selection [*(unit darc) *(unit darc)], message "Resetting", front [new-display current-url:front])
            [%click %flip ~]      =/  inboundpullnumber  `@tas``@ta`(snag 2 `path`tags.client-poke)
                                  =/  pullnumber  ?+(inboundpullnumber !! %zero 0, %one 1, %two 2, %three 3, %four 4)
                                  =/  new-state  state(settwo (snap settwo pullnumber (flipcard (snag pullnumber settwo))))
                                  =/  new-display  (rig:mast routes current-url:front new-state)
                                  :-  [(gust:mast /display-updates display:front new-display) ~]
                                  state(settwo (snap settwo pullnumber (flipcard (snag pullnumber settwo))), front [new-display current-url:front])
            [%click %select ~]    =/  pullset              `@tas``@ta`(snag 2 `path`tags.client-poke)
                                  =/  inboundpullnumber  `@tas``@ta`(snag 3 `path`tags.client-poke)
                                  =/  pullnumber  ?+(inboundpullnumber !! %zero 0, %one 1, %two 2, %three 3, %four 4)
                                  ?+  pullset  !!
                                          %setone  =/  new-state  state(selection [(some (snag pullnumber setone)) settwocard.selection])
                                                   =/  new-display  (rig:mast routes current-url:front new-state)
                                                   :-  [(gust:mast /display-updates display:front new-display) ~]
                                                   state(selection [(some (snag pullnumber setone)) settwocard.selection], front [new-display current-url:front])
                                          %settwo  =/  new-state  state(selection [setonecard.selection (some (snag pullnumber settwo))])
                                                   =/  new-display  (rig:mast routes current-url:front new-state)
                                                   :-  [(gust:mast /display-updates display:front new-display) ~]
                                                   state(selection [setonecard.selection (some (snag pullnumber settwo))], front [new-display current-url:front])
                                  ==
            [%click %match ~]     =/  setonecard     (need setonecard.selection)  =/  settwocard  (need settwocard.selection)
                                  =/  setoneindex    (need (find [setonecard ~] setone))  =/  settwoindex  (need (find [settwocard ~] settwo))
                                  =/  matchsum       (add:rs val.setonecard val.settwocard)
                                  =/  scoregain  ?:  (gth:rs val.setonecard val.settwocard)  (sub:rs val.setonecard val.settwocard)  (sub:rs val.settwocard val.setonecard)
                                  =/  shitcard=darc       [%null .0 %.n]
                                  ?-  subdecadence
                                      %.y  ?.  =(matchsum .9)
                                                  =/  new-state  state(message "In Subdecadence, matches must sum to 9")
                                                  =/  new-display  (rig:mast routes current-url:front new-state)
                                                  :-  [(gust:mast /display-updates display:front new-display) ~]
                                                  state(message "In Subdecadence, matches must sum to 9", front [new-display current-url:front])
                                           =/  new-state  state(gamescore (add:rs scoregain gamescore), setone (snap setone setoneindex shitcard), settwo (snap settwo settwoindex shitcard), selection [~ ~], message "Matched {`tape`(slag 1 "{<val.setonecard>}")} and {`tape`(slag 1 "{<val.settwocard>}")}")
                                           =/  new-display  (rig:mast routes current-url:front new-state)
                                           :-  [(gust:mast /display-updates display:front new-display) ~]
                                           state(gamescore (add:rs scoregain gamescore), setone (snap setone setoneindex shitcard), settwo (snap settwo settwoindex shitcard), selection [~ ~], message "Matched {`tape`(slag 1 "{<val.setonecard>}")} and {`tape`(slag 1 "{<val.settwocard>}")}", front [new-display current-url:front])
                                      %.n  ?.  =(matchsum .10)
                                                 =/  new-state  state(message "In Decadence, matches must sum to to 10")
                                                 =/  new-display  (rig:mast routes current-url:front new-state)
                                                 :-  [(gust:mast /display-updates display:front new-display) ~]
                                                 state(message "In Decadence, matches must sum to to 10", front [new-display current-url:front])
                                           =/  new-state  state(gamescore (add:rs scoregain gamescore), setone (snap setone setoneindex shitcard), settwo (snap settwo settwoindex shitcard), selection [~ ~], message "Matched {`tape`(slag 1 "{<val.setonecard>}")} and {`tape`(slag 1 "{<val.settwocard>}")}")
                                           =/  new-display  (rig:mast routes current-url:front new-state)
                                           :-  [(gust:mast /display-updates display:front new-display) ~]
                                           state(gamescore (add:rs scoregain gamescore), setone (snap setone setoneindex shitcard), settwo (snap settwo settwoindex shitcard), selection [~ ~], message "Matched {`tape`(slag 1 "{<val.setonecard>}")} and {`tape`(slag 1 "{<val.settwocard>}")}", front [new-display current-url:front])
                                  ==          
        ==
        --
++  on-watch
  |=  =path
  ^-  (quip card _this)
  ?+  path  (on-watch:def path)
    [%http-response *]
      %-  (slog leaf+"Eyre subscribed to {(spud path)}." ~)
      `this
    [%display-updates *]
      %-  (slog leaf+"Eyre subscribed to {(spud path)}." ~)
      `this
  ==
++  on-peek   on-peek:def
++  on-leave  on-leave:def
++  on-agent  on-agent:def
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  ?.  ?=([%bind ~] wire)
    (on-arvo:def [wire sign-arvo])
  ?.  ?=([%eyre %bound *] sign-arvo)
    (on-arvo:def [wire sign-arvo])
  ~?  !accepted.sign-arvo
    %eyre-rejected-squad-binding
  `this
++  on-fail   on-fail:def
--