(import (lamu lang))
(import (srfi 1))
(import (kawa pprint))
(import (lamu evaluators))

(use "h2quasijazzer.scm")

; incremental keywords
(define (session-init #!optional kawapad)
  (init-h2quasijazzer-variables h2quasijazzer-drumkit)
  (if kawapad
    (init-h2quasijazzer-incremental-symbols kawapad h2quasijazzer-drumkit)))


(define (define-if-not-exists k v)
  (if (environment-bound? (interaction-environment) k )
      #f
      (eval (list 'define k (list 'quote v)))))

(define-if-not-exists 'all-newp '() )

(define (clear-newp)
  (for-each (lambda (x) (kilp x) ) all-newp )
  (set! all-newp '() )
  (sleep 1000))

(define (add-newp v)
  (set! all-newp (xcons all-newp v)))


(define (session-start)
  (add-newp (newp dir: #!current-dir "hydrogen"     "--song"   "./h2-drumkit.h2song" ))
  (add-newp (newp dir: #!current-dir "calfjackhost" "--client" "calf-counter" "--load" "./calf-counter.xml" ) )
  (add-newp (newp dir: #!current-dir "calfjackhost" "--client" "calf-fluidsynth-bass" "--load" "./calf-bass.xml" ))
  (add-newp (newp dir: #!current-dir "calfjackhost" "--client" "calf-fluidsynth" "--load" "./calf-fluidsynth.xml" ))
  (add-newp (newp dir: #!current-dir "calfjackhost" "--client" "calf-reverb" "--load" "./calf-reverb.xml" ))
  (add-newp (newp dir: #!current-dir "zynaddsubfx" "--input" "jack" "--output" "jack" "--named" "quasijazzer0" "--load=./zynaddsubfx.xmz" ))
  
  (sleep 5000)  
  (open          "pulsar" )
  (open-output   "h2" "counter" "fluidsynth" "fluidsynth-bass" "zyn" )
  (open-input    "i0"  "i1"  )
  (set-tempo 150)
  (putt (newt 'main 1 (synct 'i))  )
  (connect  "pulsar:h2"              "hydrogen-midi:RX" )
  (connect  "pulsar:counter"         "calf-counter:fluidsynth MIDI In" )
  (connect  "pulsar:fluidsynth"      "calf-fluidsynth:fluidsynth MIDI In" )
  (connect  "pulsar:fluidsynth-bass" "calf-fluidsynth-bass:fluidsynth MIDI In" )
  (connect  "pulsar:zyn"             "zynaddsubfx_quasijazzer0:midi_input" )
  
  (connect  "calf-counter:fluidsynth Out #1"    "system:playback_1" )
  (connect  "calf-counter:fluidsynth Out #2"    "system:playback_2" )
  (connect  "calf-fluidsynth:fluidsynth Out #1" "system:playback_1" )
  (connect  "calf-fluidsynth:fluidsynth Out #2" "system:playback_2" )
  (connect  "calf-fluidsynth-bass:fluidsynth Out #1" "calf-fluidsynth-bass:exciter In #1" )
  (connect  "calf-fluidsynth-bass:fluidsynth Out #2" "calf-fluidsynth-bass:exciter In #2" )
  (connect  "calf-fluidsynth-bass:exciter Out #1" "system:playback_1" )
  (connect  "calf-fluidsynth-bass:exciter Out #2" "system:playback_2" )

  (connect  "calf-reverb:reverb Out #1" "system:playback_1")
  (connect  "calf-reverb:reverb Out #2" "system:playback_2")
  (connect "Hydrogen:out_L" "calf-reverb:reverb In #1")
  (connect "Hydrogen:out_R" "calf-reverb:reverb In #2")
  (connect "zynaddsubfx_quasijazzer0:out_1" "system:playback_1")
  (connect "zynaddsubfx_quasijazzer0:out_2" "system:playback_2")
  (disconnect "Hydrogen:out_L" "system:playback_1")
  (disconnect "Hydrogen:out_R" "system:playback_2")
  (play))

(define (session-end)
  (clear-newp)
  (close))



; (session-start)
; (session-end)

; vim: filetype=scheme expandtab :
