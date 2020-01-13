# QUASIJAZZER-BAND

Quasijazzer-Band is a library which consists basic musical instrument
definitions for Quasijazzar Project which is developped on [Pulsar a Lisp
Scheme Music Sequencer](https://github.com/lisp-scheme-music/pulsar). 

This library depends on following applications :

- Calf Studio Gear
- Hydrogen Drum Machine
- ZynAddSubFx

This library offers functions to start up several instruments and connect these
instruments properly and shut down all the instruments as well.

### (session-start)
Call (session-start) function to start a Pulsar programming session. 
This function causes starting up several musical instruments.

### (session-end)
Call (session-start) function to end the Pulsar programming session.
This function shuts down the instruments which have been started up so far.

