import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;
import java.io.*;

public class TestAdultDataSet{
  public static void main(String[] args){
    /*CONJUNTO DE ENTRENEAMIENTO*/
    CreaMatriz cm = new CreaMatriz("TABLAFRECUENCIAS.csv");
    ArrayList<String> clases = new ArrayList<String>();
    clases.add(">50K");
    clases.add("<=50K");
    ArrayList<String> atributos = cm.getAtributos();
    double[][] tabla = cm.getTabla();
    NaiveBayes ads = new NaiveBayes(clases,atributos,tabla);

    /*CONJUNTO DE PRUEBA*/
    CreaMatriz cmPrueba = new CreaMatriz("AdultDataSetTest.csv");
    String[][] data = cmPrueba.getTablaString();
    int mal = 0;
    int bien = 0;
    int mayor = 0;
    int menor = 0;
    int predMayor = 0;
    int predMenor = 0;
    int predMayorMal = 0;
    int predMenorMal = 0;
    for (int i = 0; i< cmPrueba.fils;i++) {
      String[] p ={rangoAge(data[i][0]),rangoWorkclass(data[i][1]),data[i][3],
                  data[i][5],rangoOccupation(data[i][6]),data[i][7],rangoRace(data[i][8]),data[i][9],
                  rangoCapitalGain(data[i][10]),rangoCapitalLoss(data[i][11]),rangoHoursPW(data[i][12]),
                  rangoCountry(data[i][13])};
      String prediccion = ads.clasifica(p);

      if (!prediccion.equals(data[i][14])){
        mal++;
        if(prediccion.equals(">50K"))
          predMayorMal++;
        else
          predMenorMal++;
      }else
        bien++;

      if(data[i][14].equals(">50K"))
        mayor++;
      else
        menor++;

      if(prediccion.equals(">50K"))
        predMayor++;
      else
        predMenor++;

    }
    System.out.println("Clasifico " + mal +" mal.");
    System.out.println("Clasifico " + bien +" bien.");
    System.out.println("Hay  " + mayor +" >50K.");
    System.out.println("Hay  " + menor +" <=50K.");
    System.out.println("Hay  " + predMayor +" predicciones >50K.");
    System.out.println("Hay  " + predMenor +" predicciones <=50K.");
    System.out.println("Predijo "+predMayorMal+" como >50k pero son <=50k.");
    System.out.println("Predijo "+predMenorMal+" como <=50k pero son >50k.");
    System.out.println("Por lo tanto hay: "+(predMayor-predMayorMal)+" predicciones de >50K bien y "
                                            +(predMenor-predMenorMal)+" predicciones de <=50K bien.");
  }
  public static String rangoAge(String numero){
    String rango = "";
    int edad = Integer.parseInt(numero);
    if ((edad >= 10) && (edad <= 20)) {
      rango = "10y-20y";
    }else if((edad >= 21) && (edad <= 40)){
      rango = "21y-40y";
    }else if((edad >= 41) && (edad <= 60)){
      rango = "41y-60y";
    }else if((edad >= 61) && (edad <= 80)){
      rango = "61y-80y";
    }else if((edad >= 81) && (edad <= 100)){
      rango = "81y-100y";
    }
    return rango;
  }
  public static String rangoCapitalGain(String numero){
    String rango = "";
    int cg = Integer.parseInt(numero);
    if (cg == 0) {
      rango = "CG-CERO";
    }else{
      rango = "CG-MAYOR-CERO";
    }
    return rango;
  }
  public static String rangoCapitalLoss(String numero){
    String rango = "";
    int cl = Integer.parseInt(numero);
    if (cl == 0) {
      rango = "CL-CERO";
    }else{
      rango = "CL-MAYOR-CERO";
    }
    return rango;
  }
  public static String rangoHoursPW(String numero){
    String rango = "";
    int horas = Integer.parseInt(numero);
    if ((horas >= 0) && (horas <= 20)) {
      rango = "10h-20h";
    }else if((horas >= 21) && (horas <= 40)){
      rango = "21h-40h";
    }else if((horas >= 41) && (horas <= 60)){
      rango = "41h-60h";
    }else if((horas >= 61) && (horas <= 80)){
      rango = "61h-80h";
    }else if((horas >= 81) && (horas <= 100)){
      rango = "81h-100h";
    }
    return rango;
  }
  public static String rangoCountry(String pais){
    if(pais.equals("?"))
      return "COUNTRY-?";
    else if(!pais.equals("United-States"))
      return "Foreigner";
    return pais;
  }
  public static String rangoWorkclass(String wc){
    if(wc.equals("?"))
      return "WORKCLASS-?";
    return wc;
  }
  public static String rangoOccupation(String oc){
    if(oc.equals("?"))
      return "OCCUPATION-?";
    return oc;
  }
  public static String rangoRace(String race){
    if(race.equals("Other"))
      return "Other-Race";
    return race;
  }
}
