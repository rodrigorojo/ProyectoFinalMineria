import java.util.*;
/* Clase para hacer un Clasificador Naive Bayes usando una tabla de frecuencias*/
public class NaiveBayes {

	/*Las clases en las que se puede clasificar*/
	ArrayList<String> clases;
	/*Los atributos que tienen las clases*/
	ArrayList<String> atributos;
	/*La tabla de frecuencias*/
	double[][] tabla;
	/*Número de clases y número de atributos*/
	int tc, ta;

	/**
	* Constructor recibe las clases, los atributos y la tabla de frecuencias
	* @param c Un arreglo de String con las clases
	* @param a Un arreglo de String con los atributos
	* @param t Un arreglo de 2 dimensiones de double con la tabla de frecuencias
	*/
	public NaiveBayes(String[] c, String[] a, double[][] t) {
		this.tabla = t;
		tc = c.length;
		ta = a.length;
		this.clases = new ArrayList<String>(Arrays.asList(c));
		this.atributos = new ArrayList<String>(Arrays.asList(a));
	}

	/**
	* Constructor recibe las clases, los atributos y la tabla de frecuencias
	* @param c Una lista de String con las clases
	* @param a Una lista de String con los atributos
	* @param t Un arreglo de 2 dimensiones de double con la tabla de frecuencias
	*/
	public NaiveBayes(ArrayList<String> c, ArrayList<String> a, double[][] t) {
		this.clases = c;
		this.atributos = a;
		this.tabla = t;
		tc = c.size();
		ta = a.size();
	}

	/**
	* Método para clasificar un objeto que tenga las variables que se pasan
	* @param variables Un arreglo de String que tiene las variables que se usan para la clasificación
	* @return Un String que tiene la clase a la que pertenece
	*/
	public String clasifica(String[] variables) {
		String clasepred = "s";
		double max = -1;
		double pz = probz(variables);
		for (String cs : this.clases) {
			double pvp = prob_var_pred(variables,cs);
			pvp *= (1/pz);
			if (pvp > max) {
				max = pvp;
				clasepred = cs;
			}
		}
		return clasepred;
	}

	/**
	* Método que aplica la fórmula de bayes de una clase dado una variable
	* @param variable Un String que es la variable
	* @param clase Un String que es la clase
	* @return Un double que tiene la probabilidad resultante
	*/
	public double bayes(String variable, String clase) {
		int v = this.atributos.indexOf(variable);
		int c = this.clases.indexOf(clase);
		double pc = tabla[c][ta]/tabla[tc][ta];
		double pv = tabla[tc][v]/tabla[tc][ta];
		double pvc = tabla[c][v]/tabla[tc][v];
		return (pc*pvc)/pv;
	}

	/**
	* Método para sacar la probabilidad de una clase
	* @param clase Un String que es la clase
	* @return Un double que tiene la probabilidad resultante
	*/
	public double probclase(String clase) {
		int c = this.clases.indexOf(clase);
		double pc = tabla[c][ta]/tabla[tc][ta];
		return pc;
	}

	/**
	* Método para sacar la probabilidad z de Naive Bayes, es la probabilidad de las variables multiplicadas
	* @param variables Un arreglo de String que tiene las variables
	* @return Un double que tiene la probabilidad resultante
	*/
	public double probz(String[] variables) {
		double probac = 1.0;
		for (String vs : variables) {
			int v = this.atributos.indexOf(vs);
			double pv = tabla[tc][v]/tabla[tc][ta];
			probac *= pv;
		}
		return probac;
	}

	/**
	* Método que aplica la fórmula que se usa en Naive Bayes para sacar la probabilidad de una clase dado un
	* conjunto de variables predictivas
	* @param variables Un arreglo de String que tiene las variables predictivas
	* @param clase Un String que es la clase
	* @return Un double que tiene la probabilidad resultante
	*/
	public double prob_var_pred(String[] variables, String clase) {
		double probac = 1.0;
		double pc = probclase(clase);
		probac *= pc;
		for (String vs : variables) {
			double pv = bayes(vs,clase);
			probac *= pv;
		}
		return probac;
	}

	/**
	* Método para imprimir la tabla de frecuencias junto con las clases y atributos
	*/
	public void imprimetabla() {
		String ita[] = new String[ta+1];
		String itc[] = new String[tc+1];
		for (int m = 0; m < ta; m++) {
			ita[m] = this.atributos.get(m);
		}
		ita[ta]="Total";
		for (int n = 0; n < tc; n++) {
			itc[n] = this.clases.get(n);
		}
		itc[tc]="Total";
		for (int k = 0; k < ta+1;k++) {
			System.out.print("|"+ita[k]);
		}
		System.out.println("");
		for (int i = 0; i < tc+1;i++) {
			for(int j = 0;j < ta+1;j++) {
				System.out.print("|"+tabla[i][j]);
			}
			System.out.println("|"+itc[i]);
		}
	}
}
