import java.util.*;
import java.io.*;

public class CreaMatriz {

  String [][] tf;
  int fils,cols;

  public CreaMatriz(String file) {
    int numvalores = 0;
    List<String[]> lista = new ArrayList<String[]>();
    try {
      BufferedReader br = new BufferedReader(new FileReader(file));
      String  line;
      while ((line = br.readLine()) != null) {
        String[] valores = line.split(",");
        numvalores = valores.length;
        lista.add(valores);
      }
    } catch(Exception e){
         e.printStackTrace();
    }
    String[][] tabla = new String[lista.size()][numvalores];
    for (int i = 0 ; i < lista.size() ; i++ ) {
      tabla[i] = lista.get(i);
    }
    this.tf = tabla;
    this.fils = tabla.length;
    this.cols = tabla[0].length;
  }

  public ArrayList<String> getAtributos() {
    ArrayList<String> ats = new ArrayList<String>();
    for(int i = 1; i < cols;i++) {
      ats.add(tf[0][i]);
    }
    return ats;
  }

  public double[][] getTabla() {
    double[][] frec = new double[fils-1][cols];
    for (int i = 1;i < fils ; i++) {
      for (int j = 1;j < cols ; j++) {
        frec[i-1][j-1] = Double.parseDouble(tf[i][j]);
      }
    }
    for (int k = 1; k < fils ; k++) {
      frec[k-1][cols-1] = Double.parseDouble(tf[k][0]);
    }
    return frec;
  }
  public String[][] getTablaString(){
    return tf;
  }

}
