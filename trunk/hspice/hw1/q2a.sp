*HSpice File
.OPTIONS ACCT POST PROBE
.DC Vdsp 0 -5 0.5 SWEEP Vgp 0 -6 0.1
.PROBE I(V0p)
.DC Vdsn 0 6 0.5 SWEEP Vgn 0 6 0.1
.PROBE I(V0n)
.OP

*VDS supply
Vdsp GND VDD 0
Vdsn 1 GND 0

*voltage sources for current measurement
V0p GND 2 0
V0n 1 4 0

*Gate sources 
Vgp 3 VDD 0
Vgn 5 GND 0

* EENET (10/24/99) output file </home/dept0/grad/ese/mentor/nets/ece262/hw1/te *
* mp_net> *
* Written on 30-Jan-2005 at 21:05:54 *

.SUBCKT q_2a
+ VDD GND VGP VGN DP DN BP BN
MXI_3 DN VGN GND BN NMOS L=1.0u W=50.0u
MXI_1 DP VGP VDD BP PMOS L=1.0u W=50.0u
.ENDS * q_2a *

XTOCELL VDD GND 3 5 2 4 VDD GND q_2a

.MODEL NMOS NMOS (                                 
+LEVEL   = 49
+VERSION = 3.1            TNOM    = 27             TOX     = 1.38E-8
+HDIF	 = 1.05E-6	  ACM     = 3
+XJ      = 1.5E-7         NCH     = 1.7E17         VTH0    = 0.7010112
+K1      = 0.7998185      K2      = -0.0774602     K3      = 38.5530098
+K3B     = -7.7395938     W0      = 1E-8           NLX     = 1E-9
+DVT0W   = 0              DVT1W   = 0              DVT2W   = 0
+DVT0    = 3.5875621      DVT1    = 0.4476102      DVT2    = -0.0981242
+U0      = 471.2871076    UA      = 1.795017E-11   UB      = 1.790185E-18
+UC      = 1.825005E-11   VSAT    = 1.476208E5     A0      = 0.5635424
+AGS     = 0.1226557      B0      = 2.510149E-6    B1      = 5E-6
+KETA    = -3.386906E-3   A1      = 1.486521E-5    A2      = 0.4412302
+RDSW    = 1.694092E3     PRWG    = 0.0114959      PRWB    = 0.0473246
+WR      = 1              WINT    = 3.080871E-7    LINT    = 3.8887E-8
+XL      = -1.0E-7        XW      = 0              DWG     = -3.789874E-8
+DWB     = 5.39558E-8     VOFF    = -0.0182675     NFACTOR = 1.0287482
+CIT     = 0              CDSC    = 2.4E-4         CDSCD   = 0
+CDSCB   = 0              ETA0    = 0.01           ETAB    = -7.328817E-4
+DSUB    = 0.2333698      PCLM    = 2.1415514      PDIBLC1 = -0.3074065
+PDIBLC2 = 2.644453E-3    PDIBLCB = -0.3733695     DROUT   = 0.5853141
+PSCBE1  = 5.349985E8     PSCBE2  = 3.388476E-5    PVAG    = 0
+DELTA   = 0.01           RSH     = 83             MOBMOD  = 1
+PRT     = 0              UTE     = -1.5           KT1     = -0.11
+KT1L    = 0              KT2     = 0.022          UA1     = 4.31E-9
+UB1     = -7.61E-18      UC1     = -5.6E-11       AT      = 3.3E4
+WL      = 0              WLN     = 1              WW      = 0
+WWN     = 1              WWL     = -6.554E-20     LL      = 0
+LLN     = 1              LW      = 0              LWN     = 1
+LWL     = -9.461E-20     CAPMOD  = 2              XPART   = 0.4
+CGDO    = 2.07E-10       CGSO    = 2.07E-10       CGBO    = 1E-9
+CJ      = 4.251916E-4    PB      = 0.9876272      MJ      = 0.4435747
+CJSW    = 3.632139E-10   PBSW    = 0.1            MJSW    = 0.1219296
+CF      = 0              PVTH0   = -0.194493      PRDSW   = -85.8778516
+AF      = 1              KF      = 2E-27
+PK2     = -5.451438E-3   WKETA   = -0.0350651     LKETA   = 4.308545E-3 )
*
.MODEL PMOS PMOS (                                
+LEVEL   = 49
+VERSION = 3.1            TNOM    = 27             TOX     = 1.38E-8
+HDIF	 = 1.05E-6 	  ACM     = 3
+XJ      = 1.5E-7         NCH     = 1.7E17         VTH0    = -0.9301481
+K1      = 0.5590701      K2      = 3.443761E-3    K3      = 3.4921695
+K3B     = -1.5136531     W0      = 1E-8           NLX     = 5.943048E-9
+DVT0W   = 0              DVT1W   = 0              DVT2W   = 0
+DVT0    = 4.6160724      DVT1    = 0.6640122      DVT2    = -0.0556713
+U0      = 250.4003774    UA      = 3.79952E-9     UB      = 1E-21
+UC      = -5.10679E-11   VSAT    = 2E5            A0      = 0.8542079
+AGS     = 0.1655325      B0      = 1.313873E-6    B1      = 5E-6
+KETA    = -2.305384E-3   A1      = 0              A2      = 0.3349568
+RDSW    = 3E3            PRWG    = -0.0463759     PRWB    = -0.0496424
+WR      = 1              WINT    = 3.629447E-7    LINT    = 3.147164E-8
+XL      = -1.0E-7        XW      = 0              DWG     = -4.124408E-8
+DWB     = 3.513677E-9    VOFF    = -0.1054997     NFACTOR = 0.5924785
+CIT     = 0              CDSC    = 2.4E-4         CDSCD   = 0
+CDSCB   = 0              ETA0    = 7.843547E-6    ETAB    = 1.072857E-3
+DSUB    = 5.564269E-3    PCLM    = 2.3816572      PDIBLC1 = 0.1781706
+PDIBLC2 = 2.796596E-3    PDIBLCB = -0.1           DROUT   = 0.3572448
+PSCBE1  = 5.205188E9     PSCBE2  = 5.102421E-10   PVAG    = 1.4469363
+DELTA   = 0.01           RSH     = 102.1          MOBMOD  = 1
+PRT     = 0              UTE     = -1.5           KT1     = -0.11
+KT1L    = 0              KT2     = 0.022          UA1     = 4.31E-9
+UB1     = -7.61E-18      UC1     = -5.6E-11       AT      = 3.3E4
+WL      = 0              WLN     = 1              WW      = 0
+WWN     = 1              WWL     = -1.205E-20     LL      = 0
+LLN     = 1              LW      = 0              LWN     = 1
+LWL     = 6.268E-21      CAPMOD  = 2              XPART   = 0.4
+CGDO    = 2.25E-10       CGSO    = 2.25E-10       CGBO    = 1E-9
+CJ      = 7.280019E-4    PB      = 0.9579643      MJ      = 0.497898
+CJSW    = 2.723078E-10   PBSW    = 0.99           MJSW    = 0.3032374
+CF      = 0              PVTH0   = 5.98016E-3     PRDSW   = 14.8598424
+AF      = 2              KF      = 2E-25
+PK2     = 3.73981E-3     WKETA   = 6.079688E-4    LKETA   = -5.379651E-3)

.END

