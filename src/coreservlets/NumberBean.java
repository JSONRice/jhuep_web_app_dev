package coreservlets;

/**  From <a href="http://courses.coreservlets.com/Course-Materials/">the
 *  coreservlets.com tutorials on servlets, JSP, Struts, JSF, Ajax, GWT, and Java</a>.
 */

public class NumberBean {
  private double num = 0;

  public NumberBean(double number) {
    setNumber(number);
  }
  
  public double getNumber() {
    return(num);
  }
  
  public void setNumber(double number) {
    num = number;
  }
}
