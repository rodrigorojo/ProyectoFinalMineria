import java.util.*;
import java.io.File;
import java.io.IOException;



public class AdultC45 {

	public static void main(String[] args) throws IOException {

		/*Leemos el archivo csv y lo guardamos de manera que podamos trabajar con los datos*/
		String archivo[] = {"adult.csv"};
		
		Scanner lee = new Scanner(new File(archivo[0]));
		String headerLine = lee.nextLine();
		String columnas[] = headerLine.split(",");
		
		
		int columnaClases = columnas.length-1;
		int numAtributos = columnas.length-1;
		List<String>  clases   = new ArrayList<String>();
		List<Integer> numClases = new ArrayList<Integer>();
		
		/*Almacenamos los atributos*/
		AlgoritmoC45 atributos[] = new AlgoritmoC45[numAtributos];
		for(int i = 0; i < numAtributos; i++) {
			atributos[i] = new AlgoritmoC45(columnas[i]);
		}
		
		/*Leemos todo el archivo*/
		while(lee.hasNextLine()){
			String linea = lee.nextLine();
			String lineasC[] = linea.split(",");
			
			if(clases.isEmpty()){
				clases.add(lineasC[columnaClases]);
				numClases.add(clases.indexOf(lineasC[columnaClases]), 1);
			}
			else{
				if(!clases.contains(lineasC[columnaClases])){
					clases.add(lineasC[columnaClases]);
					numClases.add(clases.indexOf(lineasC[columnaClases]), 1);
				}
				else{
					numClases.set(clases.indexOf(lineasC[columnaClases]),
					numClases.get(clases.indexOf(lineasC[columnaClases])) + 1);
				}
			}
			
			/*Agregamos datos*/
			for(int i = 0; i < numAtributos; i++){
				Opc datos = new Opc(lineasC[i], lineasC[columnaClases]);
				atributos[i].valores(datos);
			}
		}

		/*2 tipos de clase en nuestro ejemplo*/
		int totalClases = 0;
		for(int i : numClases){
			totalClases += i;
		}

		double ganancia = 0.0;
		double division = 0.0;

		/*Se imprimen los resultados*/
		for(AlgoritmoC45 a : atributos){
			ganancia = a.ganancia(a.entropiaConjunto(numClases, totalClases), totalClases);
			division = a.i_Division(numClases, totalClases);
			a.proporcionGanancia(ganancia, division);
			System.out.println(a.nombre);
			System.out.println("Proporción Ganancia: " + a.proporGanancia + "\n");
			ganancia = 0.0;
			division = 0.0;
		}
		
		
	}

	

}
