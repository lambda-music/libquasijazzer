# quasijazzer
Basic musical instrument definitions for Pulsar a Lisp Scheme Music Sequencer. 

The "quasijazzer" is a Scheme program which defines a set of music instruments for Pulsar Music Sequencer.

This program depends on systems following :

- Calf Studio Gear
- Hydrogen Drum Machine
- ZynAddSubFx

This program can start up several instruments and connect these instruments properly.

### (session-start)
Call (session-start) function to start a Pulsar programming session. 
This function causes starting up several musical instruments.

### (session-end)
Call (session-start) function to end the Pulsar programming session.
This function shuts down the instruments which have been started up since then.


