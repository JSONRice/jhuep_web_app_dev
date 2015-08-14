package resources.newhorizons.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
import resources.newhorizons.model.PlanetaryEntity;
import resources.newhorizons.services.DiscoveriesDBService;

/**
 * @description Contains state of the Discoveries form data as well as stores 
 * the query values for the PLANETARY_ENTITY fields from the database per each 
 * successful form submission.
 * @author jsnrice
 */
public class DiscoveriesBean implements Serializable {
    
    private final static Logger LOGGER = Logger.getLogger(DiscoveriesBean.class.getName());    
    
    // Represents what was selected in the Discoveries form:
    private ArrayList<String> selectedPlanetaryEntities;
    
    /** 
     * Represents the SQL row (tuple) associated with one 
     * or more selected planetary entities.
     ***/
    private ArrayList<PlanetaryEntity> planetaryEntityData;
    private ArrayList<String> selectedPlanetaryEntitiesState;
    
    private Boolean isMoonSurveyChecked;
    private Boolean isRingDataChecked;
    private Boolean isImagesChecked;
    
    private final String[] planetaryEntityNames = {
                                    "The Moon", 
                                    "Mars", 
                                    "Jupiter", 
                                    "Saturn",                                     
                                    "Uranus",
                                    "Neptune",
                                    "Pluto"
                                   };    
    
    public DiscoveriesBean() {
        selectedPlanetaryEntities   = new ArrayList<String>();
        
        // 7 planetary entities
        selectedPlanetaryEntitiesState = new ArrayList<String>(7);
        selectedPlanetaryEntitiesState.add("");
        selectedPlanetaryEntitiesState.add("");
        selectedPlanetaryEntitiesState.add("");
        selectedPlanetaryEntitiesState.add("");
        selectedPlanetaryEntitiesState.add("");
        selectedPlanetaryEntitiesState.add("");
        selectedPlanetaryEntitiesState.add("");
        
        isMoonSurveyChecked = false;
        isRingDataChecked   = false;
        isImagesChecked     = false;
    } 
    
    public DiscoveriesBean(ArrayList<String> selectedPlanetaryEntities, 
                           Boolean isMoonSurveyChecked, 
                           Boolean isRingDataChecked, 
                           Boolean isImagesChecked){
        this.selectedPlanetaryEntities   = selectedPlanetaryEntities;
        this.isMoonSurveyChecked = isMoonSurveyChecked;
        this.isRingDataChecked   = isRingDataChecked;
        this.isImagesChecked     = isImagesChecked;
    }
    
    /***
     * @description Main SQL transaction method for obataining 
     * and storing the following data items from the PLANETARY_ENTITY table:
     * PARAMETER_DATA, ATMOSPHERE_DATA, RINGDATA, MOON_SURVEY
     * @warning Since this is a new transaction for planetary entities the current
     * planetary entities data list will first be deleted if there is at
     * least one selected planetary entity.
     * @param name
     * @return 
     */    
    public void planetaryEntityQuery(){
        if (selectedPlanetaryEntities == null) {
            LOGGER.log(Level.WARNING, "Selecte planetary entities list is null. Preempting...");
            return;
        }
        else if (selectedPlanetaryEntities.size() <= 0) {
            LOGGER.log(Level.WARNING, 
                    "Attempted to query planetary entities but user has not selected an entity to query on. Preempting...");
            return;
        }
        else if (planetaryEntityData == null) {
            planetaryEntityData = new ArrayList<PlanetaryEntity>();
        }
        else {
            planetaryEntityData.clear();
        }
        
        for (String selected : selectedPlanetaryEntities) {
            PlanetaryEntity entity = new PlanetaryEntity();
            entity.setName(selected);
            entity.setParameterData(DiscoveriesDBService.getParameterData(selected));
            entity.setAtmosphereData(DiscoveriesDBService.getAtmosphereData(selected));
            entity.setRingData(DiscoveriesDBService.getRingData(selected));
            entity.setMoonSurvey(DiscoveriesDBService.getMoonSurvey(selected));
            // Add to list:
            planetaryEntityData.add(entity);
        }
    }    
    
    public ArrayList<PlanetaryEntity> getPlanetaryEntityData() {
        return planetaryEntityData;
    }    

    public ArrayList<String> getSelectedPlanetaryEntities() {
        return selectedPlanetaryEntities;
    }

    public Boolean getIsMoonSurveyChecked() {
        return isMoonSurveyChecked;
    }

    public Boolean getIsRingDataChecked() {
        return isRingDataChecked;
    }

    public Boolean getIsImagesChecked() {
        return isImagesChecked;
    }   
    
    public ArrayList<String> getSelectedPlanetaryEntitiesState() {
        return selectedPlanetaryEntitiesState;
    }

    public synchronized void setPlanetaryEntityData(
            ArrayList<PlanetaryEntity> planetaryEntityData) {
        this.planetaryEntityData = planetaryEntityData;
    }
    
    
    public synchronized void setPlanetaryEntities(String[] selectedPlanetaryEntities) {
        if (selectedPlanetaryEntities == null){
            LOGGER.log(Level.WARNING, "Select planet entities list is null. Preempting...");
            return;
        }
        
        // clear the list first:
        if (this.selectedPlanetaryEntities != null) {
            this.selectedPlanetaryEntities.clear();
        }
        else {
            this.selectedPlanetaryEntities = new ArrayList<String>();
        }
        
        // clear the states
        if (this.selectedPlanetaryEntitiesState != null) {
            resetPlanetaryEntitiesStates();
        }
        else {
            this.selectedPlanetaryEntitiesState = new ArrayList<String>();
        }
        
        this.selectedPlanetaryEntities.addAll(Arrays.asList(selectedPlanetaryEntities));
        if (this.selectedPlanetaryEntities.isEmpty()) {
            LOGGER.log(Level.WARNING, "No planet entities where selected. Preempting...");                                              
            // reset states:
            resetPlanetaryEntitiesStates();            
            return;
        }

        resetPlanetaryEntitiesStates();
                
        int i = 0;        
        int index = -1;
        for (String str : this.selectedPlanetaryEntities) {
            // If the item has been selected then set the selected state:
            if ((index = Arrays.asList(planetaryEntityNames).indexOf(str)) >= 0) {
                this.selectedPlanetaryEntitiesState.set(index, "selected");
            }
            index = -1;
            i++;
        }        
    }
    
    public void resetPlanetaryEntitiesStates(){
        int length = this.selectedPlanetaryEntitiesState.size();
        LOGGER.log(Level.INFO, "Clearing {0} selected planetary entities from list.", length);
        for (int i = 0; i < length; i++) {
            // reset states:
            this.selectedPlanetaryEntitiesState.set(i, "");
        }        
    }
}
