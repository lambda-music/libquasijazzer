# libquasijazzer

## Description
`libquasijazzer` is a library which consists basic musical instrument
definitions for Quasijazzar Project which is developped on [Lambda Music Sequencer](https://github.com/lambda-music/lambda-music/). 

## Dependency
This library depends on following applications :

- Calf Studio Gear
- Hydrogen Drum Machine
- ZynAddSubFx

## Reference
This library offers functions to start up several instruments and connect these
instruments properly and stops all the instruments as well.

### (session-start)
Call (session-start) function to start a Pulsar programming session. 
This function causes starting up several musical instruments.

### (session-end)
Call (session-start) function to end the Pulsar programming session.
This function shuts down the instruments which have been started up so far.
