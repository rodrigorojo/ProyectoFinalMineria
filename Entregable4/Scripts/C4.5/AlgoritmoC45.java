import java.util.*;


/*Se aplica el algoritmo C45 para saber que atributo será nuestro nodo raiz*/
/*Conforme mas datos tenga mayor será la complejidad*/

public class AlgoritmoC45 {
	public String nombre   = new String();
	public List<Valores> valores = new ArrayList<Valores>();
	public double gananci   = 0.0;
	public double proporGanancia = 0.0;
	public Set<String> hash;
	public List<String> valoresNombres = new ArrayList<String>(); 


	
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
	public double ganancia(double entropiaConj, int totalClases){
		int pj = 0;
		double temp = 0.0;
		for(Valores v : valores){
			double entropiaValor = v.entropia();
			for(int i : v.clase){
				pj += i;
			}
			gananci += (pj/(double)totalClases) * entropiaValor;
			pj = 0;
		}
		gananci = entropiaConj - gananci;
		return gananci;
	}	

	/**
	* Método que calcula la información de la división del conjunto de Datos
	* @param clase Lista del total de cada una de las diferentes clases
	* @param totalClases Entero que contiene la suma del total de todas las clases
	**/
	public double i_Division(List<Integer> clase, int totalClases){
		double i_division = 0.0;
		double sub = 0.0;

		List<Integer> conteo = new ArrayList<Integer>();

		for (String key : hash) {
			conteo.add(Collections.frequency(valoresNombres, key));
            //System.out.println(key + " : " + Collections.frequency(valoresNombres, key));
        }

        for(int num: conteo){
        	sub += (-1*(num/(double)totalClases))*(Math.log((num/(double)totalClases)) / Math.log(2));
        	i_division += sub;
        }

		//System.out.println(i_division);
		return i_division;

	}

	/**
	* Método que calcula la proporción de ganancia del conjunto de Datos
	* @param gananciaAtri Double que contiene ganancia de información del atributo
	* @param i_division DOuble que contiene la información de la divisón
	**/
	public void proporcionGanancia(double gananciaAtri, double i_division){
		proporGanancia = gananciaAtri/i_division;
	}
	

	/**
	* Método que le asigna a cada atributo sus valores correspondientes (nombre y su clase), no hay repetidos.
	* @param valor Contiene el nombre del valor y su clase
	**/
	public void valores(Opc valor){
		if(valores.isEmpty()){
			valores.add(new Valores(valor.nombreVal, valor.claseVal));
		}
		else{
			for(Valores v : valores){
				if(v.nombreVal.equals(valor.nombreVal)){
					v.aumenta(valor);
					return;
				}
			}
			valores.add(new Valores(valor.nombreVal, valor.claseVal));
		}
		
	}


	/**
	* Método que le asigna a cada atributo sus valores correspondientes (solo los nombres), tiene repetidos.
	* @param valor Contiene el nombre del valor y su clase
	**/
	public void valores2(Opc valor){
		if(valores.isEmpty()){
			valoresNombres.add(valor.nombreVal);
		}
		else{
			valoresNombres.add(valor.nombreVal);
		}
		hash = new HashSet<String>(valoresNombres);
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

	public Opc(String nombre){
		this.nombreVal = new String(nombre);
	}
}

/*Clase Valores que maneja los valores de los atributos, pudiendo hacer operaciones sobre estos*/
class Valores {
	public String nombreVal = new String();
	public List<String> listClases = new ArrayList<String>();
	public List<Integer> clase = new ArrayList<Integer>();
	public double entropia = 0.0;
	
	public Valores(String nombre){
		nombreVal = nombre;
	}

	public Valores(String nombre, String claase){
		nombreVal = nombre;
		listClases.add(claase);
		clase.add(1);
	}


	/**
	* Método que cálcula la entropía de un valor de un atributo del conjunto de datos
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
	* Método que verifica que aumenta el conteo de clases de un valor
	* @param valor Valor a ser verificado junto con los datos ya guardados
	**/
	public void aumenta(Opc valor) {
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