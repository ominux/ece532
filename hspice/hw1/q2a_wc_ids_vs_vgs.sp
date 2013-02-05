*HSpice File
*.OPTIONS ACCT POST PROBE
.OPTIONS ACCT POST 
*.DC Vgp 0 -5 0.5 SWEEP Vdsp 0 -6 0.5
*.DC Vdsp 0 -6 0.5 Vgp 0 -7 0.1
.DC Vgp 0 -6 0.1 Vdsp -0.001 -6.001 0.5
*.DC Vdsp 0 -6 0.5
*.PROBE I(Vdsp)
*.DC Vgn 0 5 0.5 SWEEP Vdsn 0 6 0.5
*.DC Vdsn 0 6 0.5 Vgn 0 7 0.1
.DC Vgn 0 6 0.1 Vdsn 0.001 6.001 0.5
*.DC Vdsp 0 6 0.5
*.PROBE I(Vdsn) 
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

.MODEL     NMOS              NMOS                   ( LEVEL   = 49                
+TNOM    = 25             TLEV    = 2              MOBMOD  = 1
+NQSMOD  = 0              CAPMOD  = 1              XPART   = 0                  
+ACM     = 2              HDIF    = 0.8E-6         NLEV    = 0   
+               
+TOX     = 145E-10        XJ      = 0.15E-6        NCH     = 1.65E17
+K1      = 1.0070         K2      = -0.1620                     
+VTH0    = 0.712          U0      = 516.4          RSH     = 110              
+RDSW    = 1418           LINT    = 0              WINT    = 0.20E-6        
+JS      = 6E-3           CGDO    = 0.33E-9        CGSO    = 0.28E-9            
+CGBO    = 0.33E-9        CJ      = 0.480E-3       CJSW    = 0.268E-9  
+         
+UA      = 1.182E-13      UB      = 1.980E-18      UC      = 5.033E-11       
+K3      = 72.66          K3B     = -34.46         W0      = 4.532E-6        
+DWG     = -7.677E-9      DWB     = 2.646E-8       NLX     = 5.747E-8        
+DVT0    = 2.439          DVT1    = 0.4879         DVT2    = -0.2141         
+PRWG    = 0.09207        PRWB    = 0.3148         WR      = 1                  
+VOFF    = -0.1276        NFACTOR = 0.6019         CDSC    = -0.01053        
+CDSCD   = -6.499E-4      CDSCB   = 2.659E-4       CIT     = 0                  
+VSAT    = 9.664E4        A0      = 0.7025         A1      = 0                  
+A2      = 1              B0      = 6.448E-7       B1      = 1.154E-6        
+ETA0    = 0.02354        ETAB    = -0.01088       DSUB    = 0.2295           
+PVAG    = 0.2255         PCLM    = 1.307          AGS     = 0.1800         
+PDIBLC1 = -0.2023        PDIBLC2 = 2.079E-3       PDIBLCB = 0.09114          
+DROUT   = 0.8483         PSCBE1  = 7.020E8        PSCBE2  = 2.794E-4        
+KETA    = -0.01595       DELTA   = 0.01           ALPHA0  = 0                  
+BETA0   = 0              WWL     = -6.554E-20     LWL     = -6.461E-20 
+      
+PRT     = 912.3          UTE     = -2.023         AT      = 1.536E4          
+KT1     = -0.4279        KT1L    = 6.188E-8       KT2     = -0.09041         
+UA1     = 9.475E-12      UB1     = -3.811E-19     UC1     = -5.629E-12         
+N       = 2.2            XTI     = 3               
+                
+MJ      = 0.394          PB      = 0.80           MJSW    = 0.200              
+PHP     = 0.80           ELM     = 5              CGSL    = 0                  
+CGDL    = 0              CKAPPA  = 0.6            CF      = 0                  
+CLC     = 1E-7           CLE     = 0.6            TT      = 1.6E-8
+                  
+KF      = 2E-29          AF      = 1            )
* 
* 
.MODEL     PMOS              PMOS                   ( LEVEL   = 49                 
+TNOM    = 25             TLEV    = 2              MOBMOD  = 1                  
+NQSMOD  = 0              CAPMOD  = 1              XPART   = 0                  
+ACM     = 2              HDIF    = 0.8E-6         NLEV    = 1  
+                
+TOX     = 145E-10        XJ      = 0.15E-6        NCH     = 5.5E16
+K1      = 0.5202         K2      = 1.474E-4                      
+VTH0    = -1.074         U0      = 255.5          RSH     = 145                
+RDSW    = 2377           LINT    = -0.025E-6      WINT    = 0.22E-6        
+JS      = 6E-3           CGDO    = 0.33E-9        CGSO    = 0.28E-9            
+CGBO    = 0.33E-9        CJ      = 0.769E-3       CJSW    = 0.293E-9  
+         
+UA      = 3.001E-9       UB      = 6.211E-19      UC      = -6.942E-11       
+K3      = 118.0          K3B     = -14.66         W0      = 5.165E-6        
+DWG     = -1.283E-8      DWB     = 1.559E-8       NLX     = -8.897E-8       
+DVT0    = 0.1879         DVT1    = 0.6893         DVT2    = -2.772        
+PRWG    = -0.04148       PRWB    = -0.07548       WR      = 1                  
+VOFF    = -0.1446        NFACTOR = 0.9027         CDSC    = 3.591E-3        
+CDSCD   = 3.109E-4       CDSCB   = 0.01282        CIT     = 0                  
+VSAT    = 9.887E4        A0      = 0.3360         A1      = 5.591E-4        
+A2      = 1.444          B0      = 4.286E-6       B1      = 7.021E-6        
+ETA0    = 4.973E-3       ETAB    = -4.008E-3      DSUB    = 0.1147             
+PVAG    = 1.516          PCLM    = 2.608          AGS     = 0.2114          
+PDIBLC1 = 0.5085         PDIBLC2 = 7.607E-4       PDIBLCB = 0.3184        
+DROUT   = 0.7880         PSCBE1  = 1.151E10       PSCBE2  = 3.049E-8        
+KETA    = -0.01241       DELTA   = 0.01           ALPHA0  = 0                  
+BETA0   = 0              WWL     = -1.205E-20     LWL     = 2.268E-20  
+     
+PRT     = 620.2          UTE     = -1.854         AT      = 0                  
+KT1     = -0.5225        KT1L    = -2.369E-8      KT2     = -0.07349         
+UA1     = 1.655E-10      UB1     = -4.449E-18     UC1     = 6.875E-11       
+N       = 2.2            XTI     = 3              
+                 
+MJ      = 0.474          PB      = 0.80           MJSW    = 0.270              
+PHP     = 0.80           ELM     = 5              CGSL    = 0                  
+CGDL    = 0              CKAPPA  = 0.6            CF      = 0                  
+CLC     = 1E-7           CLE     = 0.6            TT      = 5.3E-9
+               
+KF      = 2E-24          AF      = 2             )                           

.END


