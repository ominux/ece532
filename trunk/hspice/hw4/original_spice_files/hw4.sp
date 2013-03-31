
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
*.DC SWEEP biasvalue  1.3995v 1.4005v .00001v
*.DC sweep bias .5v 2.0v .25v width .5u 50u .4u
*.DC sweep vbias .5v 2.0v .25v 
*.DC  
.GLOBAL vdd gnd
.PARAM VDD=5.0


*.AC  dec 10 1 1GHz 
**.AC  dec 10 1 1GHz sweep offset 1.5 3.5 .1
**.AC  dec 10 1 1GHz sweep cvalue 0 2.0p .1p 
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

*vp1 INP 0 biasvalue
*vinn N_1237 0 1.4
*Small Amp SLew Test
*vinn INP gnd  pulse 2.499 2.501 2n .1n .1n 1000n 2000n
*Larger Amp SLew Test
*vinp INP 0 0  pulse 2.49 2.51 2n .1n .1n 1600n 3200n
Vp1 INP 0 0  pulse 2.5 3.0 2n 2n 1n 1600n 3200n
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
vacgnd acgnd gnd 2.9v
vgainctln gainctln  gnd 0 
vgainctlp gainctlp  gnd vdd
*vbias bias 0 1.25 
vnbias NBIAS 0 1.3
vpc PC 0  3.0
vnc NC 0 2.7


.subckt HIGHBWN  OUTPUT NIN NBIAS PIN VDD GROUND

        C2 N$653 OUTPUT  C=4.5p
        R3 N$229 N$653  R=1851.5


        MPOUT OUTPUT N$229 VDD VDD PMOS L=1.6e-6 W=225e-6 M=1
        MOUT_BIAS OUTPUT NBIAS GROUND GROUND NMOS L=1.6e-6 W=44e-6 M=1

        M_PLOAD1 N$239 N$239 VDD VDD PMOS L=1.6e-6 W=14e-6 M=1
        M_PLOAD2 N$229 N$239 VDD VDD PMOS L=1.6e-6 W=14e-6 M=1

        
        MNDIF1 N$239 NIN N$228 GROUND NMOS L=1.6e-6 W=300e-6 M=1
        MNDIF2 N$229 PIN N$228 GROUND NMOS L=1.6e-6 W=300e-6 M=1
        M_TAILBIAS N$228 NBIAS GROUND GROUND NMOS L=1.6e-6 W=6e-6 M=1

.ends HIGHBWN


.include '/ece/digital/share/saturn/hspice/opampjim/pip/pip.sp.pex'


*.IC v(N_1237) 1.4
* ACGND BIAS GAINCTLN GAINCTLP OUTPUT P1
XI_1744  OUT INN NBIAS INP VDD GND  HIGHBWN
*.subckt BOOKAMPPIP GND INN INP OUT pipbias VDD
*XI_1744  GND  INN INP OUTPUT BIAS VDD BOOKAMPPIP 
* GAIN 4 or 12 dB is 45000
*RFeed INN OUT 45000
RFeed INN OUT 20000
Rgnd INN ACGND 20000
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
Cload OUT gnd 4p
 


.probe ac vdb(OUT) vp(OUT)
.probe ac gain=par('20*log10(vm(OUT)/vm(INP))')
.probe ac phase=par('vp(OUT)-vp(INP,INN)')
.probe ac margin=par('vp(OUT)-vp(INP,INN)+180')


*.INCLUDE '/home/dsl/simulation/opjim/lvl49.5um'
*.INCLUDE '/home/dsl/simulation/opjim/t06f.5um'
*.INCLUDE '/home/dsl/simulation/opjim/t05c.5um'
.INCLUDE '/opt/digital/share/saturn/hspice/opampjim/ami.5um.typmodels'
**.INCLUDE '/ece/digital/share/mgc_hep/duke_local/Mosisami.5u.spice.models/ami.5umtypmodels'
**.INCLUDE '/ece/digital/share/mgc_hep/duke_local/Mosisami.5u.spice.models/ami.5um.bcmodels'
**.INCLUDE '/ece/digital/share/mgc_hep/duke_local/Mosisami.5u.spice.models/ami.5um.wcmodels'
**.INCLUDE '/ece/digital/share/mgc_hep/duke_local/Mosisami.5u.spice.models/ami.5um.bcnwcpmodels'
**.INCLUDE '/ece/digital/share/mgc_hep/duke_local/Mosisami.5u.spice.models/ami.5um.wcnbcpmodels'

.END


