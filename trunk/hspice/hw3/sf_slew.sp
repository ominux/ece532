
*COMMON SOURCE AMP P
.OPTIONS POST
.TRAN 0.0001n 3n
*.TRAN .01m 5ms 
*.DC SWEEP RV 100k 400k 50k
*.DC sweep outbias  3.0 4.5 .01 width .5u 50u .4u
*.DC sweep outbias  3.0 4.5 .01 width 5u 50u .4u
.PARAM VDD=5 
.GLOBAL  vdd gnd 
.PARAM VDD=5
*.AC  dec 10 1 1GHz sweep rvalue 200  1k 50 
*.AC  dec 10 1 1GHz sweep cvalue 0p 10p .5p
*.AC  dec 10 1 1GHz sweep BIAS .9v 1.7v .1v

*vinp in 0  sin (1.8 .001 10k)


*Input Range Test (INN = INP with slow ramp; open loop))
*vinp INP 0 0  pulse 1.2 3.5  2n 30u 30u 2u 84u

vinn in 0 pulse 2.75 3.25  0.001n 0.001n 0 1n 2n 



* Power supply definitions
vdd vdd gnd 5.0v
*vin in gnd 1.8v


*I2 IREF  gnd  50uA
I2 vdd IREF 50uA


mp1 IREF IREF gnd gnd nmos L=1e-6 W=10e-6 M=1
mn3 vdd in out gnd nmos L=1e-6 W=10e-6 M=1
mp2 out IREF gnd gnd nmos L=1e-6 W=31.6e-6 M=1

c2 out gnd  20p

.probe dc in out


.MODEL NMOS NMOS (
*nds=8.28 vnds=-1.09
+nlev = 1
+a0        =  0.8417870629
+a1        =  0
+a2        =  1.2
+acm       =  2
+ags       =  0.2222644
+alpha0    =  0
+at        =  1000
+b0        =  1.34706e-6
+b1        =  1.33472e-6
+beta0     =  0
+binunit   =  0
+capmod = 1
+cdsc      =  -0.0004
+cdscb     =  -0.0001
+cdscd     =  0
+cf        =  0
+cgbo      =  3e-10
+cgdl      =  0
+cgdo      =  2.15e-10  
+cgsl      =  0
+cgso      =  2.15e-10  
+cit       =  0
+cj        =  4.40e-04  
+cjsw      =  2.78e-10
+ckappa    =  0.6
+clc       =  1e-7
+cle       =  0.6
+delta     =  0.001
+drout     =  0.0009995383
+dsub      =  0.3442028
+dvt0      =  2.8861
+dvt0w     =  -4.3066193
+dvt1      =  0.4594781
+dvt1w     =  278482.2
+dvt2      =  -0.1039593
+dvt2w     =  0.055545
+dwb       =  2.8767e-9
+dwg       =  0
+elm       =  5
+em        =  510000
+eta0      =  0.001052894
+etab      =  -0.0134364
+hdif      =  8e-7
+
+js        =  6e-7
+jsw       =  1.8e-13
+k1        =  0.8831447531
+k2        =  -0.0920739
+k3        =  6.625
+k3b       =  4.2632581
+keta      =  -0.0158517
+kt1       =  -0.458441
+kt1l      =  -1.04232e-8
+kt2       =  -0.0586356
+la0       =  8.821125e-8
+lags      =  -1.443119e-7
+ldelta    =  1.1988e-8
+ldrout    =  9.809635e-10
+level = 49
+lint      =  4.4061877e-8
+lketa     =  2.00121e-8
+ll        =  5.54496e-15
+lpclm     =  -2.95794e-8
+lpdiblc1  =  2.498356e-9
+lpdiblc2  =  -7e-11
+lpdiblcb  =  0
+lprwg     =  6e-9
+lpscbe1   =  365
+lpscbe2   =  0
+lpvag     =  -9.393683e-7
+lrdsw     =  0.000272474
+lu0       =  -0.000011505
+luc       =  -1.52234e-17
+luc1      =  1.52068e-17
+lvoff     =  2.8319e-8
+lvsat     =  -0.0265709
+lwl       =  -8.287e-20
+mj        =  0.3375
+mjsw      =  0.336
+mobmod    =  1
+n         =  1.0074
+nch       =  1.5e17
+nfactor   =  1.04262
+nlx       =  0
+noia      =  9e19
+noib      =  230000
+noic      =  -5.8e-12
+noimod    =  2
+nqsmod    =  0
+pa0       =  -4.03686e-13
+pags      =  -1.85162e-13
+pb        =  0.897
+pclm      =  1.5345416
+pdiblc1   =  6.046523e-6
+pdiblc2   =  0.000217
+pdiblcb   =  0
+pketa     =  2e-14
+prdsw     =  1.423829e-10
+prt       =  1036.42
+prwb      =  0.0382133
+prwg      =  -0.0257075
+pscbe1    =  383004100
+pscbe2    =  0.0000321666
+pvag      =  2.2221198
+pvsat     =  5.916345e-9
+pvth0     =  -8e-14
+rdsw      =  1184.925011
+rsh       =  90
+tlev   =  2
+tnom      =  25
+tox       =  1.35e-8
+tt        =  1.6e-8
+u0        =  489.79702284
+ua        =  1.10262e-10
+ua1       =  -4.9182e-10
+ub        =  1.79014e-18
+ub1       =  -5.73076e-19
+uc        =  2.65278e-11
+uc1       =  -1.02068e-12
+ute       =  -2.1286493
+version   =  3.1
+pbsw      =  0.892
+voff      =  -0.0756117
+vsat      =  158790
+vth0      =  0.7423101552
+w0        =  3.32427e-7
+wa0       =  5.918789e-8
+wags      =  8.35516e-8
+wb0       =  1.91454e-13
+wb1       =  -1.6e-13
+wdelta    =  8e-9
+wint      =  1.0216552e-7
+wk3       =  0.0000726287
+wk3b      =  -0.000039488
+wketa     =  1.0121e-9
+wr        =  1
+wrdsw     =  9.57531e-6
+wu0       =  0
+wua       =  0
+wua1      =  3.466098e-15
+wub       =  0
+wub1      =  -4.4049e-24
+wuc       =  0
+wuc1      =  -6e-17
+wute      =  6e-7
+wvoff     =  -5.82486e-8
+wvth0     =  -2.055834e-9
+ww        =  0
+ww0       =  2.124767e-12
+wwl       =  -6.53031e-20
+xj        =  1.5e-7
+xpart     =  0
+xti       =  3)
*
.MODEL PMOS PMOS (   
*nds=8.28 vnds=-1.09
+nlev = 1
+a0        =  1.237251375
+a1        =  0
+a2        =  1.5
+acm       =  2
+ags       =  0.1832206
+alpha0    =  0
+at        =  1000
+b0        =  1.475235e-6
+b1        =  3.321765e-6
+beta0     =  0
+binunit   =  0
+capmod = 1
+cdsc      =  0
+cdscb     =  0.0000105451
+cdscd     =  8.353173e-6
+cf        =  0
+cgbo      =  3e-10
+cgdl      =  0
+cgdo      =  2.82e-10  
+cgsl      =  0
+cgso      =  2.82e-10  
+cit       =  0
+cj        =  7.29e-04  
+cjsw      =  3.25e-10  
+ckappa    =  0.6
+clc       =  1e-7
+cle       =  0.6
+delta     =  0.009
+drout     =  0.0902424
+dsub      =  0.6276458
+dvt0      =  1.3651
+dvt0w     =  1
+dvt1      =  0.6005274
+dvt1w     =  845916
+dvt2      =  -0.0273883
+dvt2w     =  -1.059702e-6
+dwb       =  1.13e-8
+dwg       =  0
+elm       =  5
+em        =  510000
+eta0      =  0.0770614
+etab      =  -0.0337595
+hdif      =  8e-7
+
+js        =  1.56e-7
+jsw       =  8.2e-14
+k1        =  0.5468232992
+k2        =  0.00504
+k3        =  3.30554
+k3b       =  -1.8386777
+keta      =  -0.002453008
+kt1       =  -0.545557
+kt1l      =  -7.652498e-9
+kt2       =  -0.0464174
+la0       =  -4.8e-7
+la1       =  4.316697e-11
+la2       =  4.398416e-9
+lags      =  3.66294e-8
+ldelta    =  8.299833e-9
+ldrout    =  0
+level = 49
+lint      =  3.4732049e-8
+lketa     =  -9.228203e-9
+lpclm     =  5.38144e-8
+lpdiblc1  =  4.268394e-9
+lpdiblc2  =  6.480371e-12
+lpdiblcb  =  0
+lpscbe1   =  273.2096739
+lpscbe2   =  5.895328e-13
+lpvag     =  2.216387e-7
+lu0       =  0
+lvoff     =  1.5e-8
+lvsat     =  -0.0190311
+lwl       =  -1.32499e-20
+mj        =  0.5
+mjsw      =  0.315
+mobmod    =  1
+n         =  0.984
+nch       =  5e16
+nfactor   =  1.244
+nlx       =  0
+noia      =  9e18
+noib      =  63000
+noic      =  -9.8e-13
+noimod    =  2
+nqsmod    =  0
+pb        =  0.905
+pclm      =  4.0835844
+pdiblc1   =  0.0008641836
+pdiblc2   =  0.00017559
+pdiblcb   =  0
+pketa     =  1.127813e-14
+prdsw     =  -4.76958e-12
+prt       =  0
+prwb      =  -0.001
+prwg      =  -1.05e-6
+pscbe1    =  450345000
+pscbe2    =  2.887978e-6
+pvag      =  2
+pvsat     =  1.658197e-8
+rdsw      =  2337.6478341
+rsh       =  90
+tlev   =  2
+tnom      =  21
+tox       =  1.39e-8
+tt        =  5.3e-9
+u0        =  256.11739596
+ua        =  3.382426e-9
+ua1       =  -2.172967e-9
+ub        =  1.097807e-21
+ub1       =  -1.57877e-18
+uc        =  -5.51664e-11
+uc1       =  8.270353e-11
+ute       =  -1.9736859
+version   =  3.1
+pbsw      =  0.901
+voff      =  -0.1326
+vsat      =  134850
+vth0      =  -0.964383936
+w0        =  1.48e-6
+wint      =  1.6240615e-7
+wk3       =  8.124228e-6
+wk3b      =  -1.790382e-6
+wketa     =  2.03113e-9
+wpdiblcb  =  0
+wr        =  1
+wu0       =  -7.092951e-6
+wua       =  -8.97911e-16
+wua1      =  -1.33143e-16
+wub       =  -1.42427e-26
+wub1      =  1.585459e-24
+wuc       =  -2.6028e-18
+wuc1      =  -3.7462e-18
+wute      =  5.786711e-8
+wvsat     =  0
+wwl       =  -4.38048e-20
+xj        =  1.5e-7
+xpart     =  0
+xti       =  3.2 )


.END

