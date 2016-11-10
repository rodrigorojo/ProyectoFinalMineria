import java.util.*;

public class EjemploNaiveBayes {
  public static void main(String[] args) {
      String[] clases = {"Platano","Naranja","Otros"};
      String[] atributos = {"Alargada","No Alargada","Dulce","No Dulce","Amarilla","No Amarilla"};
      double[][] frecuencias = {
        {400,100,350,150,450,50,500},
        {0,300,150,150,300,0,300},
        {100,100,150,50,50,150,200},
        {500,500,650,350,800,200,1000}
      };
      NaiveBayes frutas = new NaiveBayes(clases,atributos,frecuencias);
      String[] predice = {"No Alargada","Amarilla","Dulce"};
      String prediccion = frutas.clasifica(predice);
      //frutas.imprimetabla();
      System.out.println("con los atributos:");
      for (String pr : predice) {
        System.out.println(pr);
      }
      System.out.println("cae en la clase: "+prediccion);
  }
}
