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
    ISMOON BIT(0),
    ORBITING_MOON_SURVEY CHAR(200),
    ORBITING_MOON_COUNT TINYINT,
    RING_DATA   CHAR(200),
    IMAGE BLOB,
    NAME CHAR(64) NOT NULL UNIQUE,    
    DATA TEXT,
    PRIMARY KEY (PLANETARY_ENTITY_ID)
)

-- Table Truncation and Insertions:

TRUNCATE TABLE PLANETARY_ENTITY

-- Earth's Moon
-- Note the LOAD_FILE doesn't seem to work so to get around this just open up 
-- the db4free newhorizons db in Services and manually read image file in.
INSERT INTO PLANETARY_ENTITY(NAME, ISMOON, DATA, ORBITING_MOON_COUNT, IMAGE)
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
from the Moon to Earth roughly ranges from 357,000 km to 407,000 km.', 0, LOAD_FILE('/home/jsnrice/Desktop/themoon.jpg'))