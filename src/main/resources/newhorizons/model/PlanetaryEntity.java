package resources.newhorizons.model;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @description Represents a tuple (row) record from the PLANETARY_ENTITY SQL table.
 * @author jsnrice
 */
public class PlanetaryEntity {

    private String name;
    private String parameterData;
    private String atmosphereData;
    private String ringData;
    private String moonSurvey;
    private Integer moonCount;
    private Boolean isPlanet;
    private Boolean isMoon;
    private Boolean hasMoons;
    
    private static final Logger LOG = Logger.getLogger(PlanetaryEntity.class.getName());
    
    public PlanetaryEntity() {
        LOG.log(Level.WARNING, "Empty constructor called. PlanetaryEntity contains empty defaults.");
    }

    public PlanetaryEntity(
            String name, 
            String parameterData, 
            String atmosphereData, 
            String ringData, 
            String moonSurvey, 
            Integer moonCount, 
            Boolean isPlanet, 
            Boolean isMoon, 
            Boolean hasMoons) {
        this.name = name;
        this.parameterData = parameterData;
        this.atmosphereData = atmosphereData;
        this.ringData = ringData;
        this.moonSurvey = moonSurvey;
        this.moonCount = moonCount;
        this.isPlanet = isPlanet;
        this.isMoon = isMoon;
        this.hasMoons = hasMoons;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getParameterData() {
        return parameterData;
    }

    public void setParameterData(String parameterData) {
        this.parameterData = parameterData;
    }

    public String getAtmosphereData() {
        return atmosphereData;
    }

    public void setAtmosphereData(String atmosphereData) {
        this.atmosphereData = atmosphereData;
    }

    public String getRingData() {
        return ringData;
    }

    public void setRingData(String ringData) {
        this.ringData = ringData;
    }

    public String getMoonSurvey() {
        return moonSurvey;
    }

    public void setMoonSurvey(String moonSurvey) {
        this.moonSurvey = moonSurvey;
    }

    public Integer getMoonCount() {
        return moonCount;
    }

    public void setMoonCount(Integer moonCount) {
        this.moonCount = moonCount;
    }

    public Boolean getIsPlanet() {
        return isPlanet;
    }

    public void setIsPlanet(Boolean isPlanet) {
        this.isPlanet = isPlanet;
    }

    public Boolean getIsMoon() {
        return isMoon;
    }

    public void setIsMoon(Boolean isMoon) {
        this.isMoon = isMoon;
    }

    public Boolean getHasMoons() {
        return hasMoons;
    }

    public void setHasMoons(Boolean hasMoons) {
        this.hasMoons = hasMoons;
    }
}
