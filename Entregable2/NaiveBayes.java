import java.util.*;

public class NaiveBayes {

	String[] clases;
	String[] atributos;
	double[][] tabla;
	int tc, ta;

	public NaiveBayes(String[] c, String[] a, double[][] t) {
		this.clases = c;
		this.atributos = a;
		this.tabla = t;
		tc = (int)c.length;
		ta = (int)a.length;
	}

	public String clasifica(String[] variables) {
		String clasepred = "s";
		double max = -1;
		for (String cs : this.clases) {
			double pvp = prob_var_pred(variables,cs);
			//System.out.println("varpres:"+pvp);
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
		double pc = tabla[c][ta]/tabla[tc][ta];
		double pv = tabla[tc][v]/tabla[tc][ta];
		double pvc = tabla[c][v]/tabla[tc][v];
		return (pc*pvc)/pv;
	}

	public double probclase(String clase) {
		int c = Arrays.asList(this.clases).indexOf(clase);
		double pc = tabla[c][ta]/tabla[tc][ta];
		return pc;
	}

	public double probz(String[] variables) {
		double probac = 1.0;
		for (String vs : variables) {
			int v = Arrays.asList(this.atributos).indexOf(vs);
			double pv = tabla[tc][v]/tabla[tc][ta];
			//System.out.println("predcadaz"+tabla[tc][v]+"/"+tabla[tc][ta] +"="+pv);
			probac *= pv;
		}
		return probac;
	}

	public double prob_var_pred(String[] variables, String clase) {
		double probac = 1.0;
		double pc = probclase(clase);
		//System.out.println("prob clase:"+pc);
		probac *= pc;
		for (String vs : variables) {
			double pv = bayes(vs,clase);
			probac *= pv;
		}
		double pz = probz(variables);
		//System.out.println("prob z:"+pz);
		probac *= (1/pz);
		//System.out.println("prob vars predictivas:"+probac);
		return probac;
	}

	/*public void imprimetabla() {
		for (int k = 0; k < ta+1;k++) {
			System.out.print("|"+atributos[k]);
		}
		System.out.println("");
		for (int i = 0; i < tc+1;i++) {
			for(int j = 0;j<ta+1;j++) {
				System.out.print("|"+tabla[i][j]);
			}
			System.out.println("|"+clases[i]);
		}
	}*/
}
