* He said what he gave us should be 99% of what we need
* ignore offset stuff (using tip model so doesn't matter)
* vbias we can use a voltage source
* if we use this in our project we can just assume vbias if off chip 
* the first thing we do is look at currents to see what is in saturation
* open loop biasing vin/ vbias, common mode ground should be ~2 V or less, 1.2 maybe
* vout should be around 2.5 volts
* changing M6 will really determinate output strength of this common source amp / gain
* the bandwidth and slew rate will be hard to reach
* part 2:
* 2 to 2.05 V for the step
* Input range is about 1.2V he said so there's some clipping
* Check all transistors are all in Saturation
* Just because it's in sat isn't enough, check VDS too

* Noise statement
* Check spice manual
* Sums all noise components
* .NOISE somenodetodonoiseanalysison srcnam inter
* .NOISE makes the spice simulator look at a node you are calculating noise on
* like .TRANSIENT / .AC
* He will send an example of how to run this

* Sample statement, noise folding analysis
* .SAMPLE etc

* For part 3, there is a junction paramter in the spice file
* TJ
* in degrees Kelvin
* move this around for part 3
* No TJ in our models though
* DO .TEMP instead, it's in celcius, room temp is 25
* t3-6 in spice manual
* when you raise temperature, the current should go down since higher resistive 
* junctions diffusions etc
* but if bias voltages are tuned by resistors could change
* don't debug and put everything in saturation here, just re-run it and
* see what happens









*HSpice File
*.OPTIONS ACCT POST PROBE
.OPTIONS ACCT POST ACOUT=0 DCON=1 ACCURATE=1 UNWRAP LIST 
.OP
*.TRAN 200n 2.5m sweep  BIAS .9v 1.7v .1v 
*.TRAN 1u .3m
*.TRAN 1u 3ms  sweep biasvalue 0 1.8 .1
*.TRAN 1u 50ms sweep cvalue 0 4p .5p
*.TRAN .001u .001ms   sweep sfreq 5e6 20e6 2e6
.TRAN 10n 200us  

* Do this sweep so we can see right where we want to be biased
* This will be helpful for AC Analysis, could use this for ACGND etc?
*.DC SWEEP biasvalue  1.3995v 1.4005v .00001v

*.DC sweep bias .5v 2.0v .25v width .5u 50u .4u
*.DC sweep vbias .5v 2.0v .25v 
*.DC  






.GLOBAL vdd gnd
.PARAM VDD=5.0






*.AC  dec 10 1 1GHz 
**.AC  dec 10 1 1GHz sweep offset 1.5 3.5 .1
**.AC  dec 10 1 1GHz sweep cvalue 0 2.0p .1p 

* Use this for AC Analysis
* builds off ACGND
*Vp1 INP ACGND   AC=1e-4

**VSRC INP gnd 1.25 AC 1 sin(.0001 0 1)
*vp1 INP 0 sin (.9 .0005 3000)
*vinp INP 0  sin (2.2  .130 sfreq) 
*vinp INP 0 .9v
*vinn INN 0 2.9v
*vbias outbias 0  sin (offset .4 1e3)
*vbias outbias 0  sin (3.8 .01 5e4)
*vinp P1 0  sin (1.25 .001 1000)
*vbias outbias 0 outbias


VPOS INP 0 1.0v







* for AC analysis we have to set up these inputs

*vp1 INP 0 biasvalue
*vinn N_1237 0 1.4
*Small Amp SLew Test
*vinn INP gnd  pulse 2.499 2.501 2n .1n .1n 1000n 2000n
*Larger Amp SLew Test
*vinp INP 0 0  pulse 2.49 2.51 2n .1n .1n 1600n 3200n

* this is for measuring slew rate and settling time
* comment this out for AC, only for DC
*Vp1 INP 0 0  pulse 2.5 3.0 2n 2n 1n 1600n 3200n

*vinp INP 0 0  pulse 2.499 2.501 2n 0.1n 0.1n 40u 80u
*vinp INP 0 0  pulse 2.1 2.9 2n 0.1n 0.1n 40u 80u
*Vp1 INP 0 0  pulse .9070v .893v 2n 0.1n 0.1n 40u 80u
*Vinp INP 0 0  pulse 1.v 1.8v 2n 0.1n 0.1n 5u 10u
*vinp INN 0 .9v
*vinp P1 0 0  pulse 2.3 2.7 2n 0.1n 0.1n 40u 80u








*Input Range Test (INN = INP with slow ramp; open loop))
*vinp INP 0 0  pulse 1.3 1.4 2n 30u 30u 2u 84u
*vinn INN 0 0  pulse 1.2 3.5  2n 30u 30u 2u 84u






* Power supply definitions
vdd vdd gnd 5.0v
vacgnd ACGND gnd 2.9v
*vgainctln gainctln  gnd 0 
*vgainctlp gainctlp  gnd vdd
*vbias bias 0 1.25 
vnbias NBIAS 0 1.3

* these are floating nodes used for debugging
*vpc PC 0  3.0
*vnc NC 0 2.7









.subckt HIGHBWN  OUTPUT NIN NBIAS PIN VDD GROUND

        C2 N$653 OUTPUT  C=4.5p
        R3 N$229 N$653  R=1851.5


        MPOUT OUTPUT N$229 VDD VDD PMOS L=1.6e-6 W=225e-6 M=1
        MOUT_BIAS OUTPUT NBIAS GROUND GROUND NMOS L=1.6e-6 W=44e-6 M=1

	* load devices / resistors for diff pair
        M_PLOAD1 N$239 N$239 VDD VDD PMOS L=1.6e-6 W=14e-6 M=1
        M_PLOAD2 N$229 N$239 VDD VDD PMOS L=1.6e-6 W=14e-6 M=1

        * this is the diff pair
        MNDIF1 N$239 NIN N$228 GROUND NMOS L=1.6e-6 W=300e-6 M=1
        MNDIF2 N$229 PIN N$228 GROUND NMOS L=1.6e-6 W=300e-6 M=1
        
        * tail current
        M_TAILBIAS N$228 NBIAS GROUND GROUND NMOS L=1.6e-6 W=6e-6 M=1

.ends HIGHBWN









* spice command to initialize a node, this is an intial condition
* might need to use this
*.IC v(N_1237) 1.4

* ACGND BIAS GAINCTLN GAINCTLP OUTPUT P1
XI_1744  OUT INN NBIAS INP VDD GND  HIGHBWN
*.subckt BOOKAMPPIP GND INN INP OUT pipbias VDD
*XI_1744  GND  INN INP OUTPUT BIAS VDD BOOKAMPPIP 
* GAIN 4 or 12 dB is 45000
*RFeed INN OUT 45000

* for open loop gain we comment these out

* gain should be 2 with this setup, these are resistors around the subcircuit
RFeed INN OUT 20000

*ROpen INN OUT 100G
*COpen INN GND 1u

* ACGND is a bias at 2.9V. this is the common mode center. AC GND
* could be at 0 v, but that would load down output, we want it at common mode
* if ACGND is at 0V, we would get more offset
*Rgnd INN ACGND 20000
Rgnd INN GND 20000

*MXBIAS VDD BIAS BIAS VDD PMOS L=4u W=30u
*RBIAS BIAS GND 850k
**XI_1744  BIAS OUTPUT INP OUTPUT opampip
**MXM4 N_1235 GAINCTLP N_1237 VDD PMOS L=.7u W=5u
**RXR4 OUTPUT N_1236 133333
***RXRS N_1236 N_1235 1
**RXRS OUTPUT N_1237 1386666 
*RXRS OUTPUT N_1237 1386666 
**RXRS OUTPUT N_1237 700000
***MXM1 N_1235 GAINCTLN N_1236 gnd NMOS L=.7u W=50u
**RXR2 N_1235 N_1237 133333
*RXR3 N_1237 ACGND  7923
*Cload OUTPUT gnd 3.5p

* small load capacitor
Cload OUT GND 20p


 
 
 
 
 


.probe ac vdb(OUT) vp(OUT)
.probe ac gain=par('20*log10(vm(OUT)/vm(INP))')
.probe ac phase=par('vp(OUT)-vp(INP,INN)')
.probe ac margin=par('vp(OUT)-vp(INP,INN)+180')






* .INCLUDE '/ece/digital/share/saturn/hspice/opampjim/pip/pip.sp.pex'
.INCLUDE 'spice_models/ami.5um.typmodels'


.END


