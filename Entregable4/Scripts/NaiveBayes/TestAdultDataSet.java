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
    for(String at : atributos)
      System.out.println(at);
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
      System.out.println(p[0]+" "+p[1]+" "+p[2]+" "+p[3]+" "+p[4]+" "+p[5]+" "+p[6]+" "
                          +p[7]+" "+p[8]+" "+p[9]+" "+p[10]+" "+p[11]);
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
    if ((edad >= 17) && (edad <= 21)) {
      rango = "17-21y";
    }else if((edad >= 22) && (edad <= 25)){
      rango = "22-25y";
    }else if((edad >= 26) && (edad <= 29)){
      rango = "26-29y";
    }else if((edad >= 30) && (edad <= 33)){
      rango = "30-33y";
    }else if((edad >= 34) && (edad <= 37)){
      rango = "34-37y";
    }else if((edad >= 38) && (edad <= 41)){
      rango = "38-41y";
    }else if((edad >= 42) && (edad <= 45)){
      rango = "42-45y";
    }else if((edad >= 46) && (edad <= 50)){
      rango = "46-50y";
    }else if((edad >= 51) && (edad <= 57)){
      rango = "51-57y";
    }else if((edad >= 58) && (edad <= 88)){
      rango = "58-88y";
    }else if((edad >= 89)){
      rango = "AGE-?";
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
    if ((horas >= 1) && (horas <= 18)) {
      rango = "1-18h";
    }else if((horas >= 19) && (horas <= 24)){
      rango = "19-24h";
    }else if((horas >= 25) && (horas <= 30)){
      rango = "25-30h";
    }else if((horas >= 31) && (horas <= 35)){
      rango = "31-35h";
    }else if((horas >= 36) && (horas <= 39)){
      rango = "36-39h";
    }else if(horas == 40){
      rango = "40h";
    }else if((horas >= 41) && (horas <= 44)){
      rango = "41-44h";
    }else if(horas == 45){
      rango = "45h";
    }else if((horas >= 46) && (horas <= 49)){
      rango = "46-49h";
    }else if(horas == 50){
      rango = "50h";
    }else if((horas >= 51) && (horas <= 59)){
      rango = "51-59h";
    }else if((horas >= 60) && (horas <= 64)){
      rango = "60-64h";
    }else if((horas >= 65) && (horas <= 89)){
      rango = "65-89h";
    }else if(horas >= 90){
      rango = "HPW-?";
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
    else if(wc.equals("Without-pay"))
      return "Without- pay";
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
