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

}
