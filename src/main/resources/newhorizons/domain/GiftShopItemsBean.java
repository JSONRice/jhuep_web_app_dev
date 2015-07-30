/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resources.newhorizons.domain;
import java.io.Serializable;
import java.util.*;

/**
 *
 * @author Sajjad
 */
public class GiftShopItemsBean 
{
    private Dictionary itemsAndPrices;
    private Dictionary itemsAndImages;
    
    public GiftShopItemsBean()
    {
        
    }
    
    public void setItemsAndPricesDictionary()
    {
        itemsAndPrices = new Hashtable();
        itemsAndPrices.put("mug", 10);
        itemsAndPrices.put("shirt", 15);
        itemsAndPrices.put("mousepad", 5);
        itemsAndPrices.put("telescope", 250);
        itemsAndPrices.put("coaster", 7);
    }
    
    
    public void setItemsAndImagesDictionary()
    {
        itemsAndImages = new Hashtable();
        itemsAndImages.put("mug", "images/mug.jpg");
        itemsAndImages.put("shirt", "images/shirt.jpg");
        itemsAndImages.put("mousepad", "images/mousepad.jpg");
        itemsAndImages.put("telescope", "images/telescope.jpg");
        itemsAndImages.put("coaster", "images/coaster.jpg");
    }
    
    
    public Dictionary getItemsAndImagesDictionary()
    {
        return itemsAndImages;
    }
    
    
    public Dictionary getItemsAndPricesDictionary()
    {
        return itemsAndPrices;
    }
    
    public Enumeration getItemsKeys()
    {
        Enumeration itemskeys = itemsAndPrices.keys();
        return itemskeys;
    }
    
    
}
