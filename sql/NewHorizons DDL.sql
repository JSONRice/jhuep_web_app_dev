--------------------------------------------------------------------------------
-- This file is used as a reference point and contains the default SQL for
-- loading into db4free.
--------------------------------------------------------------------------------

-- Table Creation:

-- DROP TABLE NH_USERS;
create table NH_USERS (
    USER_ID MEDIUMINT NOT NULL AUTO_INCREMENT,
    USERNAME CHAR(200),
    FIRSTNAME CHAR(200),
    LASTNAME CHAR(200),
    ITEMS BLOB,
    EMAIL CHAR(200),
    PASSWORD CHAR(200),
    PRIMARY KEY (USER_ID)
)

-- Discoveries Page
-- DROP TABLE PLANETARY_ENTITY
CREATE TABLE PLANETARY_ENTITY (
    PLANETARY_ENTITY_ID MEDIUMINT NOT NULL AUTO_INCREMENT,
    ISPLANET BIT(0),
    ISMOON   BIT(0),
    HASRINGS BIT(0),
    HASMOONS BIT(0),
    IMAGE BLOB,
    NAME CHAR(64) NOT NULL UNIQUE,    
    -- Entity Info (Data):
    PARAMETER_DATA TEXT,
    ATMOSPHERE_DATA TEXT,
    RINGDATA   TEXT,
    MOON_SURVEY TEXT,
    MOON_COUNT TINYINT,
    PRIMARY KEY (PLANETARY_ENTITY_ID)
)

-- Table Truncation and Insertions:

TRUNCATE TABLE PLANETARY_ENTITY

-- Earth's Moon
-- Note the LOAD_FILE doesn't seem to work so to get around this just open up 
-- the db4free newhorizons db in Services and manually read image file in.
INSERT INTO PLANETARY_ENTITY(NAME, ISMOON, PARAMETER_DATA, MOON_COUNT)
    VALUES('The Moon', 1, 
'Lunar orbital data: 
Semimajor axis (106 km)             0.3844                 
Perigee (106 km)*                   0.3633
Apogee (106 km)*                    0.4055
Revolution period (days)            27.3217            
Synodic period (days)               29.53               
Mean orbital velocity (km/s)        1.022                  
Max. orbital velocity (km/s)        1.076
Min. orbital velocity (km/s)        0.964
Inclination to ecliptic (deg)       5.145
Inclination to equator (deg)        18.28 - 28.58                    
Orbit eccentricity                  0.0549              
Sidereal rotation period (hrs)      655.728                
Obliquity to orbit (deg)            6.68                   
Recession rate from Earth (cm/yr)   3.8

Mean values at opposition from Earth
        Distance from Earth (equator, km)   378,000    
        Apparent diameter (seconds of arc)     1896
        Apparent visual magnitude               -12.74     

* These represent mean apogee and perigee for the lunar orbit.  
The orbit changes over the course of the year so the distance 
from the Moon to Earth roughly ranges from 357,000 km to 407,000 km.', 0)

-- Mars
INSERT INTO PLANETARY_ENTITY(NAME, ISPLANET, MOON_COUNT, PARAMETER_DATA, ATMOSPHERE_DATA, MOON_SURVEY, MOON_COUNT)
    VALUES('Mars', 1, 2,
'Bulk parameters

                                   Mars           Earth     Ratio (Mars/Earth)
Mass (1024 kg)                     0.64174         5.9726         0.107
Volume (1010 km3)                 16.318         108.321          0.151  
Equatorial radius (km)	           3396.2         6378.1          0.532
Polar radius (km)                  3376.2         6356.8          0.531
Volumetric mean radius (km)        3389.5         6371.0          0.532
Core radius (km)                   1700           3485            0.488
Ellipticity (Flattening)           0.00589         0.00335        1.76
Mean density (kg/m3)               3933           5514            0.713 
Surface gravity (m/s2)             3.71            9.80           0.379
Surface acceleration (m/s2)        3.69            9.78           0.377
Escape velocity (km/s)             5.03           11.19           0.450 
GM (x 106 km3/s2)                  0.04283         0.3986         0.107
Bond albedo                        0.250           0.306          0.817
Visual geometric albedo            0.170           0.367          0.463
Visual magnitude V(1,0)           -1.52           -3.86             -
Solar irradiance (W/m2)          589.2          1367.6            0.431
Black-body temperature (K)       210.1           254.3            0.826
Topographic range (km)               30             20            1.500
Moment of inertia (I/MR2)          0.366           0.3308         1.106
J2 (x 10-6)                     1960.45         1082.63           1.811 
Number of natural satellites          2              1
Planetary ring system                No             No
',
'Martian Atmosphere

Surface pressure:  6.36 mb at mean radius (variable from 4.0 to 8.7 mb depending on season)  
                   [6.9 mb to 9 mb (Viking 1 Lander site)]
Surface density: ~0.020 kg/m3
Scale height:  11.1 km
Total mass of atmosphere: ~2.5 x 1016 kg
Average temperature:  ~210 K (-63 C)
Diurnal temperature range: 184 K to 242 K (-89 to -31 C) (Viking 1 Lander site)
Wind speeds:  2-7 m/s (summer), 5-10 m/s (fall), 17-30 m/s (dust storm) (Viking Lander sites)
Mean molecular weight: 43.34 g/mole 
Atmospheric composition (by volume): 
    Major      : Carbon Dioxide (CO2) - 95.32% ; Nitrogen (N2) - 2.7%
                 Argon (Ar) - 1.6%; Oxygen (O2) - 0.13%; Carbon Monoxide (CO) - 0.08% 
    Minor (ppm): Water (H2O) - 210; Nitrogen Oxide (NO) - 100; Neon (Ne) - 2.5;
                 Hydrogen-Deuterium-Oxygen (HDO) - 0.85; Krypton (Kr) - 0.3; 
		 Xenon (Xe) - 0.08
',
'Satellites of Mars

                                    Phobos         Deimos
Semi-major axis* (km)                9378          23459
Sidereal orbit period (days)        0.31891        1.26244
Sidereal rotation period (days)     0.31891        1.26244
Orbital inclination (deg)            1.08           1.79
Orbital eccentricity                0.0151         0.0005
Major axis radius (km)                13.4            7.5
Median axis radius (km)               11.2            6.1
Minor axis radius (km)                 9.2            5.2
Mass (1015 kg)                       10.6            2.4
Mean density (kg/m3)                 1900           1750 
Geometric albedo                      0.07           0.08
Visual magnitude V(1,0)             +11.8          +12.89     
Apparent visual magnitude (V0)        11.3           12.40      

*Mean orbital distance from the center of Mars.
',
2)

-- Jupiter
INSERT INTO PLANETARY_ENTITY(NAME, ISPLANET, HASRINGS, HASMOONS, MOON_COUNT, PARAMETER_DATA, ATMOSPHERE_DATA, MOON_SURVEY)
    VALUES('Jupiter', 1, 1, 1, 67, 
'Bulk parameters

                                   Jupiter      Earth   Ratio (Jupiter/Earth)
Mass (1024 kg)                      1,898.3     5.9726      317.83 
Volume (1010 km3)                 143,128     108.321      1321.33
Radius (1 bar level) (km)
    Equatorial                     71,492       6,378.1      11.209    
    Polar                          66,854       6,356.8      10.517
Volumetric mean radius (km)        69,911       6,371.0      10.973
Ellipticity                         0.06487     0.00335      19.36 
Mean density (kg/m3)                1,326       5,514         0.240 
Gravity (eq., 1 bar) (m/s2)        24.79        9.80          2.530 
Acceleration (eq., 1 bar) (m/s2)   23.12        9.78          2.364 
Escape velocity (km/s)             59.5        11.19          5.32
GM (x 106 km3/s2)                 126.687       0.3986      317.8 
Bond albedo                         0.343       0.306         1.12
Visual geometric albedo             0.52        0.367         1.42  
Visual magnitude V(1,0)            -9.40       -3.86           -
Solar irradiance (W/m2)            50.50     1367.6           0.037
Black-body temperature (K)        110.0       254.3           0.433
Moment of inertia (I/MR2)           0.254       0.3308        0.768 
J2 (x 10-6)                        14,736    1082.63         13.611    
Number of natural satellites       67           1
Planetary ring system             Yes          No
',
'Jovian Atmosphere

Surface Pressure: >>1000 bars  
Temperature at 1 bar: 165 K (-108 C)
Temperature at 0.1 bar: 112 K (-161 C)
Density at 1 bar: 0.16 kg/m3
Wind speeds
   Up to 150 m/s (<30 degrees latitude)
   Up to  40 m/s (>30 degrees latitude)
Scale height: 27 km
Mean molecular weight: 2.22 g/mole
Atmospheric composition (by volume, uncertainty in parentheses)
    Major:       Molecular hydrogen (H2) - 89.8% (2.0%); Helium (He) - 10.2% (2.0%)
    Minor (ppm): Methane (CH4) - 3000 (1000); Ammonia (NH3) - 260 (40);
                 Hydrogen Deuteride (HD) - 28 (10); Ethane (C2H6) - 5.8 (1.5);
                 Water (H2O) - 4 (varies with pressure)
    Aerosols:    Ammonia ice, water ice, ammonia hydrosulfide
',
'Bulk parameters

                                  Mass       Radius     Mean density    Visual geometric albedo
                               (1020 kg)      (km)        (kg/m3)
Galilean Satellites
  Io (JI)                         893.2       1821.6        3530                 0.62
  Europa (JII)                    480.0       1560.8        3010                 0.68
  Ganymede (JIII)                1481.9       2631.2        1940                 0.44
  Callisto (JIV)                 1075.9       2410.3        1830                 0.19

Lesser Satellites
  Metis (JXVI, S/1979 J3)       0.001           20                               0.06
  Adrastea (JXV, S/1979 J1)     0.0002     13 x 10 x 8                           0.10
  Amalthea (JV)                 0.075     131 x 73 x 67     3100                 0.09
  Thebe (JXIV, S/1979 J2)       0.008        55 x 45                             0.05

  Themisto (JXVIII, S/1975 J1)                   4                               0.04

  Leda (JXIII)                  0.00006          5                               0.07
  Himalia (JVI)                 0.095           85                               0.03
  Lysithea (JX)                 0.0008          12                               0.06
  Elara (JVII)                  0.008           40                               0.03

  S/2000 J11                                     2.0                             0.04

  Carpo (XLVI, S/2003 J20)                       3.0
  Euporie (JXXXIV, S/2001 J10)                   1.0                                     
  Orthosie (JXXXV, S/2001 J9)                    1.0                                    
  Euanthe (JXXXIII, S/2001 J7)                   1.5                                     
  Thyone (JXXIX, S/2001 J2)                      2.0                                    
  Mneme (JXL, S/2003 J21)                        2.0
  Harpalyke (JXXII, S/2000 J5)                   2.2                             0.04
  Hermippe (JXXX, S/2001 J3)                     2.0                                    
  Praxidike (JXXVII, S/2000 J7)                  3.4                             0.04
  Thelxinoe (XLII, S/2003 J22)                   2.0
  Helike (XLV, S/2003 J6)                        4.0
  Iocaste (JXXIV, S/2000 J3)                     2.6                             0.04
  Ananke (JXII)                 0.0004          10                               0.06
 
  Herse (L, S/2003 J17)                          2.0
  Eurydome (JXXXII, S/2001 J4)                   1.5                                    
  Arche (XLIII, S/2002 J1)                       1.5
  Autonoe (JXXVIII, S/2001 J1)                   2.0                                    
  Pasithee (JXXXVIII, S/2001 J6)                 1.0                                    
  Chaldene (JXXI, S/2000 J10)                    1.9                             0.04
  Kale (JXXXVII, S/2001 J8)                      1.0                                    
  Isonoe (JXXVI, S/2000 J6)                      1.9                             0.04
  Aitne (JXXXI, S/2001 J11)                      1.5                                     
  Erinome (JXXV, S/2000 J4)                      1.6                             0.04
  Taygete (JXX, S/2000 J9)                       2.5                             0.04
  Carme (JXI)                   0.001           15                               0.06
  Sponde (JXXXVI, S/2001 J5)                     1.0                                    
  Kalyke (JXXIII, S/2000 J2)                     2.6                             0.04
  Pasiphae (JVIII)              0.003           18                               0.10
  Eukelade (XLVII, S/2003 J1)                    4.0
  Megaclite (JXIX, S/2000 J8)                    2.7                             0.04
  Sinope (JIX)                  0.0008          14                               0.05
  Hegemone (JXXXIX, S/2003 J8)                   3.0
  Aoede (XLI, S/2003 J7)                         4.0
  Kallichore (XLIV, S/2003 J11)                  2.0

  Callirrhoe (JXVII, S/1999 J1)                  4                               0.04
  Cyllene (XLVIII, S/2003 J13)                   2.0
  Kore (XLIX, S/2003 J14)                        2.0  


Recently Discovered Unnamed Satellites

                                  Mass       Radius     Mean density    Visual geometric albedo
                               (1020 kg)      (km)        (kg/m3)

  S/2003 J2                                      2.0
  S/2003 J3                                      2.0
  S/2003 J4                                      2.0
  S/2003 J5                                      4.0
  S/2003 J9                                      1.0
  S/2003 J10                                     2.0
  S/2003 J12                                     1.0
  S/2003 J15                                     2.0
  S/2003 J16                                     2.0
  S/2003 J18                                     2.0
  S/2003 J19                                     2.0
  S/2003 J23                                     2.0
  S/2010 J1                                      2.0
  S/2010 J2                                      2.0
  S/2011 J1                                      2.0
  S/2011 J2                                      2.0
')

INSERT INTO PLANETARY_ENTITY(NAME, ISPLANET, HASRINGS, HASMOONS, MOON_COUNT, PARAMETER_DATA, ATMOSPHERE_DATA, MOON_SURVEY)
    VALUES('Saturn', 1, 1, 1, 53,
'Bulk parameters

                                     Saturn      Earth   Ratio (Saturn/Earth)
Mass (1024 kg)                      568.36       5.9726       95.159 
Volume (1010 km3)                    82,713    108.321       763.59
Radius (1 bar level) (km)
    Equatorial                       60,268      6,378.1       9.449   
    Polar                            54,364      6,356.8       8.552
Volumetric mean radius (km)          58,232      6,371.0       9.140
Ellipticity (Flattening)              0.09796    0.00335      29.24
Mean density (kg/m3)                    687      5,514         0.125
Gravity (eq., 1 bar) (m/s2)          10.44       9.80          1.065 
Acceleration (eq., 1 bar) (m/s2)      8.96       9.78          0.916 
Escape velocity (km/s)               35.5       11.19          3.172
GM (x 106 km3/s2)                    37.931      0.3986       95.16
Bond albedo                           0.342      0.306         1.12
Visual geometric albedo               0.47       0.367         1.28
Visual magnitude V(1,0)              -8.88      -3.86            -
Solar irradiance (W/m2)              14.90       1,367.6       0.011
Black-body temperature (K)           81.1      254.3           0.319
Moment of inertia (I/MR2)             0.210      0.3308        0.635
J2 (x 10-6)                      16,298.      1082.63         15.054    
Number of natural satellites         62          1
Planetary ring system               Yes         No
',
'Saturnian Atmosphere

Surface Pressure: >>1000 bars  
Temperature at 1 bar: 134 K (-139 C)
Temperature at 0.1 bar: 84 K (-189 C)
Density at 1 bar: 0.19 kg/m3
Wind speeds
   Up to 400 m/s (<30 degrees latitude)
   Up to 150 m/s (>30 degrees latitude)
Scale height: 59.5 km
Mean molecular weight: 2.07 g/mole
Atmospheric composition (by volume, uncertainty in parentheses)
    Major:       Molecular hydrogen (H2) - 96.3% (2.4%); Helium (He) - 3.25% (2.4%)
    Minor (ppm): Methane (CH4) - 4500 (2000); Ammonia (NH3) - 125 (75);
                 Hydrogen Deuteride (HD) - 110 (58); Ethane (C2H6) - 7 (1.5)
    Aerosols:    Ammonia ice, water ice, ammonia hydrosulfide
',
'Bulk parameters

                                 Mass         Radius       Mean density    Visual geometric albedo
                              (1020 kg)          (km)        (kg/m3)
Major Satellites
  Mimas (SI)                     0.379     208 x 197 x 191     1150                 0.6
  Enceladus (SII)                1.08      257 x 251 x 248     1610                 1.0
  Tethys (SIII)                  6.18      538 x 528 x 526      985                 0.8
  Dione (SIV)                   11.0       563 x 561 x 560     1480                 0.7
  Rhea (SV)                     23.1       765 x 763 x 762     1240                 0.7

  Titan (SVI)                1,345.5           2,575           1880                 0.22
  Hyperion (SVII)                0.056     180 x 133 x 103      550                 0.3
  Iapetus (SVIII)               18.1       746 x 746 x 712     1090             0.05 / 0.5

Lesser Satellites
  Pan (SXVIII, S/1981 S13)       0.00005     17 x 16 x 10       420                 0.5
  Daphnis (SXXXV, S/2005 S1)     0.000001   4.3 x 4.1 x 3.2     340                       
  Atlas (SXV, S/1980 S28)        0.00007     20 x 18 x 9        500                 0.8
  Prometheus (SXVI, S/1980 S27)  0.0016      68 x 40 x 30       480                 0.5
  Pandora (SXVII, S/1980 S26)    0.0014      52 x 41 x 32       490                 0.7
  Epimetheus (SXI, S/1980 S3)    0.0053      65 x 57 x 53       640                 0.8
  Janus (SX, S/1980 S1)          0.0190     102 x 93 x 76       630                 0.9

  Aegaeon (LIII, S/2008 S1)                        0.5
  Methone (SXXXII, S/2004 S1)                      1.6           
  Anthe (XLIX, S/2007 S4)                         ~1       
  Pallene (SXXXIII, S/2004 S2)              2.9 x 2.8 x 2.0
  Calypso (SXIV, S/1980 S25)     0.00004     15 x 12 x 7       1000                 1.0
  Telesto (SXIII, S/1980 S13)    0.00007     16 x 12 x 10      1000                 1.0
  Helene (SXII, S/1980 S6)       0.0003      22 x 19 x 13      1300                 0.7
  Polydeuces (SXXXIV, S/2004 S5)            1.5 x 1.2 x 1.0

  Kiviuq (SXXIV, S/2000 S5)                       ~7                                0.06
  Ijiraq (SXXII, S/2000 S6)                       ~5                                0.06
  Phoebe (SIX)                   0.083     109 x 109 x 102     1640                 0.08
  Paaliaq (SXX, S/2000 S2)                       ~10                                0.06
  Skathi (SXXVII, S/2000 S8)                      ~3                                0.06
  Albiorix (SXXVI, S/2000 S11)                   ~13                                0.06
  Bebhionn (XXXVII, S/2004 S11)                   ~3                      
  Erriapo (SXXVIII, S/2000 S10)                   ~4                                0.06
  Siarnaq (SXXIX, S/2000 S3)                     ~16                                0.06
  Skoll (XLVII, S/2006 S8)                        ~3    
  Tarvos (SXXI, S/2000 S4)                        ~7                                0.06
  Tarqeq (SLII, S/2007 S1)                        ~3                                            

  Greip (SLI, S/2006 S4)                          ~3                                                                                      
  Hyrrokkin (SXLIV, S/2004 S19)                   ~4                                                 
  Mundilfari (SXXV, S/2000 S9)                    ~3                                0.06
  Jarnsaxa (SL, S/2006 S6)                        ~3                                                
  Narvi (SXXXI, S/2003 S1)                        ~3                                0.06
  Bergelmir (XXXVIII, S/2004 S15)                 ~3                     
  Suttungr (SXXIII, S/2000 S12)                   ~3                                0.06
  Hati (XLIII, S/2004 S14)                        ~3                      
  Bestla (SXXXIX, S/2004 S18)                     ~3                     
  Farbauti (SXL, S/2004 S9)                       ~3                     
  Thrymr (SXXX, S/2000 S7)                        ~3                                0.06
  Aegir (SXXXVI, S/2004 S10)                      ~3                      
  Kari (SXLV, S/2006 S2)                          ~3                                                
  Fenrir (SXLI, S/2004 S16)                       ~2                       
  Surtur (SXLVIII, S/2006 S7)                     ~3                                                
  Loge (SXLVI, S/2006 S5)                         ~3                                                                                      
  Ymir (SXIX, S/2000 S1)                          ~9                                0.06
  Fornjot (SXLII, S/2004 S8)                      ~3  

  
Recently Discovered (Unnamed) Satellites

  S/2004 S07                                      ~3
  S/2004 S12                                      ~3                     
  S/2004 S13                                      ~3                      
  S/2004 S17                                      ~2                     

  S/2006 S1                                       ~3                                                     
  S/2006 S3                                       ~3                                                

  S/2007 S2                                       ~3
  S/2007 S3                                       ~3

  S/2009 S1                                        0.3

') 

INSERT INTO PLANETARY_ENTITY(NAME, ISPLANET, HASRINGS, HASMOONS, MOON_COUNT, PARAMETER_DATA, ATMOSPHERE_DATA, MOON_SURVEY)
    VALUES('Uranus', 1, 1, 1, 27,
'Bulk parameters

                                    Uranus      Earth   Ratio (Uranus/Earth)
Mass (1024 kg)                      86.816      5.9726        14.536
Volume (1010 km3)                    6,833    108.321         63.08
Radius (1 bar level) (km)
    Equatorial                      25,559      6,378.1        4.007
    Polar                           24,973      6,356.8        3.929
Volumetric mean radius (km)         25,362      6,371.0        3.981
Ellipticity (Flattening)             0.02293    0.00335        6.84
Mean density (kg/m3)                 1,271      5,514          0.231
Gravity (eq., 1 bar) (m/s2)          8.87       9.80           0.905
Acceleration (eq., 1 bar) (m/s2)     8.69       9.78           0.889
Escape velocity (km/s)              21.3       11.19           1.903
GM (x 106 km3/s2)                    5.794      0.3986        14.536
Bond albedo                          0.300      0.306          0.980
Visual geometric albedo              0.51       0.367          1.390
Visual magnitude V(1,0)             -7.19      -3.86             -
Solar irradiance (W/m2)              3.71       1,367.6        0.0027
Black-body temperature (K)          58.2      254.3            0.229
Moment of inertia (I/MR2)            0.225      0.3308         0.680
J2 (x 10-6)                       3343.43    1082.63           3.088    
Number of natural satellites        27          1
Planetary ring system              Yes         No
',
'Uranian Atmosphere

Surface Pressure: >>1000 bars  
Temperature at 1 bar: 76 K (-197 C)
Temperature at 0.1 bar: 53 K (-220 C)
Density at 1 bar: 0.42 kg/m3
Wind speeds: 0-250 m/s
Scale height: 27.7 km
Mean molecular weight: 2.64 g/mole
Atmospheric composition (by volume, uncertainty in parentheses)
    Major:       Molecular hydrogen (H2) - 82.5% (3.3%); Helium (He) - 15.2% (3.3%)
                 Methane (CH4) - 2.3%
    Minor (ppm): Hydrogen Deuteride (HD) - 148
    Aerosols:    Ammonia ice, water ice, ammonia hydrosulfide, methane ice(?)
',
'Bulk parameters

                             Mass          Radius       Mean density    Visual geometric albedo
                          (1020 kg)         (km)          (kg/m3)
Major Satellites
  Miranda (UV)              0.66     240 x 234.2 x 232.9   1,200               0.27
  Ariel (UI)               13.5     581.1 x 577.9 x 577.7  1,670               0.35
  Umbriel (UII)            11.7             584.7          1,400               0.19
  Titania (UIII)           35.2             788.9          1,710               0.28
  Oberon (UIV)             30.1             761.4          1,630               0.25

Lesser Satellites
  Cordelia (UVI, S/1986 U7)                  20                                0.07
  Ophelia (UVII, S/1986 U8)                  21                                0.07
  Bianca (UVIII, S/1986 U9)                  26                                0.07
  Cressida (UIX, S/1986 U3)                  40                                0.07
  Desdemona (UX, S/1986 U6)                  32                                0.07
  Juliet (UXI, S/1986 U2)                    47                                0.07

  Portia (UXII, S/1986 U1)                   68                                0.07
  Rosalind (UXIII, S/1986 U4)                36                                0.07
  Cupid (S/2003 U2)                           5    
  Belinda (UXIV, S/1986 U5)                  40                                0.07
  Perdita (XXV, S/1986 U10)                  10
  Puck (UXV, S/1985 U1)                      81                                0.07
  Mab (S/2003 U1)                             5

  Francisco (XXII, S/2001 U3)                11
  Caliban (UXVI, S/1997 U1)                  36                                0.07
  Stephano (UXX, S/1999 U2)                  16                                0.07
  Trinculo (UXXI, S/2001 U1)                  9
  Sycorax (UXVII, S/1997 U2)                 75                                0.07

  Margaret (UXXIII, S/2003 U3)               10
  Prospero (UXVIII, S/1999 U3)               25                                0.07
  Setebos (UXIX, S/1999 U1)                  24                                0.07   
  Ferdinand (XXIV, S/2001 U2)                10                              
')

INSERT INTO PLANETARY_ENTITY(NAME, ISPLANET, HASRINGS, HASMOONS, MOON_COUNT, PARAMETER_DATA, ATMOSPHERE_DATA, MOON_SURVEY)
    VALUES('Neptune', 1, 1, 1, 14,
'Bulk parameters

                                   Neptune      Earth   Ratio (Neptune/Earth)
Mass (1024 kg)                    102.42       5.9726        17.147
Volume (1010 km3)                   6,254    108.321         57.74 
Radius (1 bar level) (km)
    Equatorial                     24,764      6,378.1        3.883
    Polar                          24,341      6,356.8        3.829
Volumetric mean radius (km)        24,622      6,371.0        3.865
Ellipticity (Flattening)            0.01708    0.00335        5.10
Mean density (kg/m3)                1,638      5,514          0.297
Gravity (eq., 1 bar) (m/s2)        11.15       9.80           1.14
Acceleration (eq., 1 bar) (m/s2)   11.00       9.78           1.12
Escape velocity (km/s)             23.5       11.19           2.10
GM (x 106 km3/s2)                   6.8351     0.3986        17.15 
Bond albedo                         0.290      0.306          0.95
Visual geometric albedo             0.41       0.367          1.12
Visual magnitude V(1,0)            -6.87      -3.86             -
Solar irradiance (W/m2)             1.51       1,367.6        0.0011
Black-body temperature (K)         46.6      254.3            0.183
J2 (x 10-6)                      3411.      1082.63           3.151    
Number of natural satellites       14          1
Planetary ring system             Yes         No
',
'Neptunian Atmosphere

Surface Pressure: >>1000 bars  
Temperature at 1 bar: 72 K (-201 C)
Temperature at 0.1 bar: 55 K (-218 C)
Density at 1 bar: 0.45 kg/m3
Wind speeds: 0-580 m/s
Scale height: 19.1 - 20.3 km
Mean molecular weight: 2.53 - 2.69 g/mole
Atmospheric composition (by volume, uncertainty in parentheses)
    Major:       Molecular hydrogen (H2) - 80.0% (3.2%); Helium (He) - 19.0% (3.2%);
                 Methane (CH4) 1.5% (0.5%)
    Minor (ppm): Hydrogen Deuteride (HD) - 192; Ethane (C2H6) - 1.5
    Aerosols:    Ammonia ice, water ice, ammonia hydrosulfide, methane ice(?)
',
'Bulk parameters

                              Mass          Radius       Mean density    Visual geometric albedo
                           (1020 kg)         (km)          (kg/m3)
  Naiad (NIII)                0.002      48 x 30 x 26                            0.07
  Thalassa (NIV)              0.004      54 x 50 x 26                            0.09
  Despina (NV)                0.02       90 x 74 x 64                            0.09
  Galatea (NVI)               0.04      102 x 92 x 72                            0.08
  Larissa (NVII)              0.05     108 x 102 x 84                            0.09
  S/2004 N1                                   18               
  Proteus (NVIII)             0.5      220 x 208 x 202                           0.10
  Triton (NI)               214.           1,353.4          2,050                0.76
  Nereid (NII)                0.3            170                                 0.16
  Halimede (NIX, S/2002 N1)   0.001           30                                 0.16
  Sao (NXI, S/2002 N2)        0.001           20                                 0.16
  Laomedeia (NXII, S/2002 N3) 0.001           20                                 0.16
  Neso (NXIII, S/2002 N4)                     30                                                      
  Psamathe (NX, S/2003 N1     0.0002          20                                 0.16                       
')

INSERT INTO PLANETARY_ENTITY(NAME, ISPLANET, HASRINGS, HASMOONS, MOON_COUNT, PARAMETER_DATA, ATMOSPHERE_DATA, MOON_SURVEY)
    VALUES('Pluto', 1, 1, 1, 5,
'Bulk parameters

                                  Pluto          Earth      Ratio (Pluto/Earth)
Mass (1024 kg)                    0.01303        5.9726         0.0022
Volume (1010 km3)                 0.697        108.321          0.0064
Equatorial radius (km)	           1185           6378.1        0.186
Polar radius (km)                  1185           6356.8        0.186
Volumetric mean radius (km)        1185           6371.0        0.186         
Ellipticity (Flattening)          0.0000         0.00335        0.0
Mean density (kg/m3)               1869           5514          0.339
Surface gravity (m/s2)            0.62           9.80           0.063
Surface acceleration (m/s2)       0.62           9.78           0.063
Escape velocity (km/s)            1.21          11.19           0.108
GM (x 106 km3/s2)                 0.00087        0.3986         0.0022  
Bond albedo                    0.4 - 0.6         0.306        1.3 - 2.0
Visual geometric albedo        0.5 - 0.7         0.367        1.4 - 1.9
Visual magnitude V(1,0)          -1.0           -3.86             -
Solar irradiance (W/m2)           0.89           1367.6         0.0007
Black-body temperature (K)       37.5          254.3            0.147
Number of natural satellites      5              1
Planetary ring system            No             No

',
'Pluto Atmosphere

Surface Pressure: ~3 microbar
Average temperature: ~50 K (-223 C)
Scale height: ~60 km
Mean molecular weight: ~16-25 g/mole
Atmospheric composition:  Methane (CH4), Nitrogen (N2)

',
'Charon (P1)

Mean distance from Pluto (km)     19,600        
Sidereal orbit period (days)        6.3872        
Sidereal rotation period (days)     6.3872        
Orbital inclination to Pluto (deg)  0.0       
Orbital eccentricity                0.0
Equatorial radius (km)              604          
Mass (1021 kg)                      1.59        
Mean density (kg/m3)               1720
Surface gravity (m/s2)              0.29
Escape velocity (km/s)              0.59  
Geometric albedo                    0.38
Apparent visual magnitude          16.8

Other Moons of Pluto

                Semi-Major    Orbital     Mean Diameter
                Axis (km)  Period (days)      (km)
Nix (P2)          48,700       24.9         42 x 36
Hydra (P3)        64,750       38.2         55 x 40
Kerberos (P4)     57,750       32.2         13 - 34
Styx (P5)         42,400       20.2         10 - 25

Orbital values are barycentric
')


