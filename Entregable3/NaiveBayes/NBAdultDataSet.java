import java.util.*;
import java.io.*;

public class NBAdultDataSet {
  public static void main(String[] args) {
    CreaMatriz cm = new CreaMatriz("TABLAFRECUENCIAS.csv");
    ArrayList<String> clases = new ArrayList<String>();
    clases.add(">50k");
    clases.add("<=50k");
    ArrayList<String> atributos = cm.getAtributos();
    for (String s :atributos ) {
      System.out.println(s);
    }
  }
}
