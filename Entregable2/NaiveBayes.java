import java.util.*;

public class NaiveBayes {

	String[] clases;
	String[] atrubutos;
	int[][] tabla;
	int tc, tv;

	public NaiveBayes(String[] c, String[] a, int[][] t) {
		this.clases = c;
		this.atrubutos = a;
		this.tabla = t;
		tc = c.length-1;
		tv = v.length-1;
	}

	public String clasifica(String[] variables) {
		String clasepred = "";
		double max = -1;
		for (String cs : this.clases) {
			double pvp = prob_var_pred(variables,cs);
			if (pvp > max) {
				max = pvp;
				clasepred = cs;
			}
		}
		return clasepred;
	}
	
	public double bayes(String variable, String clase) {
		int v = Arrays.asList(this.atributos).indexOf(variable);
		int c = Arrays.asList(this.clases).indexOf(clase);
		double pc = tabla[c][tv]/tabla[tc][tv];
		double pv = tabla[tc][v]/tabla[tc][tv];
		double pvc = tabla[c][v]/tabla[tc][v];
		return (pc*pvc)/pv;
	}

	public double probclase(String clase) {
		int c = Arrays.asList(this.clases).indexOf(clase);
		double pc = tabla[c][tv]/tabla[tc][tv];
		return pc;
	}

	public double probz(String[] variables) {
		double probac = 1.0;
		for (String vs : variables) {
			int v = Arrays.asList(this.atrubutos).indexOf(vs);
			double pv = tabla[tc][v]/tabla[tc][tv];
			probac *= pv;
		}
		return probac;
	}

	public double prob_var_pred(String[] variables, String clase) {
		double probac = 1.0;
		double pc = probclase(clase);
		probac *= pc;
		for (String vs : variables) {
			double pv = bayes(vs,clase);
			probac *= pv;
		}
		double pz = probz(variables);
		probac *= (1/pz);
		return probac;
	}
}