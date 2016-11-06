import java.util.*;

/*Se aplica el algoritmo C45 para saber que atributo será nuestro nodo raiz*/
/*Conforme mas datos tenga mayor será la complejidad*/

public class AlgoritmoC45 {
	public String nombre   = new String();
	public List<Valores> valores = new ArrayList<Valores>();
	public double gananci   = 0.0;
	
	public AlgoritmoC45(String nomb){
		nombre = nomb;
	}

	/**
	* Método que calcula la entropía del conjunto de datos
	* @param clase Lista del total de cada una de las diferentes clases
	* @param totalClases Entero que contiene la suma del total de todas las clases
	* @return Un double que representa la entropia del conjunto de datos
	**/
	public double entropiaConjunto(List<Integer> clase, int totalClases){
		double entropia = 0.0;
		double sub = 0.0;
		
		for(double c : clase){
			sub = (-1*(c/totalClases))*(Math.log((c/totalClases)) / Math.log(2));
			entropia += sub;
		}
		return entropia;
	}
	
	/**
	* Método que calcula la ganancia de cada atributo
	* @param entropiaConj Double que contiene la entropia del conjunto de datos
	* @param totalClases Entero que contiene la suma del total de todas las clases
	**/
	public void ganancia(double entropiaConj, int totalClases){
		int pj = 0;
		double temp = 0.0;
		for(Valores v : valores){
			double entropiaAtributo = v.entropia();
			for(int i : v.clase){
				pj += i;
			}
			gananci += (pj/(double)totalClases) * entropiaAtributo;
			pj = 0;
		}
		gananci = entropiaConj - gananci;
	}
	

	/**
	* Método que le asigna a cada atributo sus valores correspondientes
	* @param valor Contiene el nombre del valor y su clase
	**/
	public void valores(Opc valor){
		if(valores.isEmpty()){
			valores.add(new Valores(valor.nombreVal, valor.claseVal));
		}
		else{
			for(Valores v : valores){
				if(v.nombreVal.equals(valor.nombreVal)){
					v.revisa(valor);
					return;
				}
			}
			valores.add(new Valores(valor.nombreVal, valor.claseVal));
		}
	}
	
}


/*Clase Opc que convierte los datos a Strings para facilitar su manejo*/
class Opc {
	public String nombreVal = "";
	public String claseVal = "";

	public Opc(String nombre, String clase){
		this.nombreVal = new String(nombre);
		this.claseVal = new String(clase);
	}
}

/*Clase Valores que maneja los valores de los atributos, pudiendo hacer operaciones sobre estos*/
class Valores {
	public String nombreVal = new String();
	public List<String> listClases = new ArrayList<String>();
	public List<Integer> clase = new ArrayList<Integer>();
	public double entropia = 0.0;
	
	public Valores(String nombre, String claase){
		nombreVal = nombre;
		listClases.add(claase);
		clase.add(1);
	}


	/**
	* Método que cálcula la entropía de un atributo del conjunto de datos
	* @return La entropia de algun atributo 
	**/
	public double entropia(){
		double temp = 0.0;
		
		int totalClases = 0;
		for(int i : clase) {
			totalClases += i;
		}
		
		for(double c : clase){
			temp = (-1 * (c/totalClases)) * (Math.log((c/totalClases)) / Math.log(2));
			this.entropia += temp;
		}

		return entropia;
	}


	/**
	* Método que verifica que los valores se agregen de manera correcta
	* @param valor Valor a ser verificado junto con los datos ya guardados
	**/
	public void revisa(Opc valor) {
		if(listClases.contains(valor.claseVal)){
			clase.set(listClases.indexOf(valor.claseVal),
			clase.get(listClases.indexOf(valor.claseVal)) + 1);
		}
		else{
			listClases.add(valor.claseVal);
			clase.add(listClases.indexOf(valor.claseVal), 1);
		}
	}

}