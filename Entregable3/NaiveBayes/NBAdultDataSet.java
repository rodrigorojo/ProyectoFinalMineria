import java.util.*;
import java.io.*;

public class NBAdultDataSet {
  public static void main(String[] args) {
    CreaMatriz cm = new CreaMatriz("TABLAFRECUENCIAS.csv");
    ArrayList<String> clases = new ArrayList<String>();
    clases.add(">50k");
    clases.add("<=50k");
    ArrayList<String> atributos = cm.getAtributos();
    double[][] tabla = cm.getTabla();
    NaiveBayes ads = new NaiveBayes(clases,atributos,tabla);
    String[] predice = {"Doctorate","Self-emp-inc","CG-MAYOR-CERO"};
    String prediccion = ads.clasifica(predice);
    System.out.println("con los atributos:");
    for (String pr : predice) {
      System.out.println(pr);
    }
    System.out.println("cae en la clase: "+prediccion);
  }
}
