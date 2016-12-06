""" Clase que nos ayudara a crear el arbol de decision """

import csv


class Arbol(object):

    def __init__(self, archivo):
        datos = []
        self.archivo = archivo
        self.raiz = None
        
        infocsv = csv.reader(self.archivo)
        atributos = infocsv.next()
        
        for fila in infocsv:
            fila = dict(zip(atributos, fila))
            datos.append(fila)
        self.archivo.close()

        self.clases = atributos[-1]
        self.atributos = [a for a in atributos if a != self.clases]
        self.atributosSinClase = atributos
        self.datos = datos

        values = {}
        for attr in self.atributosSinClase: 
            values[attr] = set(r[attr] for r in self.datos)
        self.values = values



    def decide(self, atributos):

        atributoss = dict(zip(self.attribute_order, atributos))
        return self.raiz._decide(atributoss)


    def test_file(self, archivo_test, csv=None):
   
        import csv

        reader = csv.reader(archivo_test)
        prif = reader.next()
        if prif == self.atributosSinClase or prif == self.atributos:
            datos = []
        else:
            datos = [dict(zip(self.atributosSinClase, prif))]
        for fila in reader:
            fila = dict(zip(self.atributosSinClase, fila))
            datos.append(fila)

        archivo_test.close()

        bien = 0 
        mal = 0
        mayor = 0
        menor = 0
        predMayor = 0
        predMenor = 0
        predMayorMal = 0
        predMenorMal = 0
        for fila in datos:
            atributoss = [fila[a] for a in self.atributos]
            decision = self.decide(atributoss)
            if fila[self.clases] == decision:
                bien += 1
            else:
                mal += 1
                if decision == ">50K":
                    predMayorMal +=1
                else:
                    predMenorMal +=1

            if fila[self.clases] == ">50K": ####>50K
                mayor +=1
            else:
                menor +=1   
                    
            if decision == ">50K": ####>50K
                predMayor +=1
            else:
                predMenor +=1  

    
        print "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
        print "Clasifico " + str(bien) +" bien\n"
        print "Clasifico " + str(mal)+ " mal\n"
        print "Hay  " + str(mayor) +" >50K.\n"
        print "Hay  " + str(menor) +" <=50K.\n"
        print "Hay  " + str(predMayor) +" predicciones >50K.\n"
        print "Hay  " + str(predMenor) +" predicciones <=50K.\n"
        print "Predijo "+ str(predMayorMal) +" como >50k pero son <=50k.\n"
        print "Predijo "+ str(predMenorMal) +" como <=50k pero son >50k.\n"
        print "Por lo tanto hay: "+ str(predMayor-predMayorMal) +" predicciones de >50K bien y "+str(predMenor-predMenorMal)+" predicciones de <=50K bien."



    def reglas(self):
        return sorted(self.raiz._reglas(),key=lambda t: (len(t), [p[1] for p in t if isinstance(p, tuple)]))

    def set_atributos(self, atributos):
        self.attribute_order = atributos


    """Datos arbol de decision"""
    def __repr__(self):
        return ("\nEntropia del conjunto de datos: {0}\n" + "\nGanancias de informacion:\n{1}\n").format(self.entropiaConjunto(self.datos),repr(self.raiz))



class Nodo(object):

    def __init__(self, Atrib_Hoja, padre_valor=None, caracteristicas={}, hoja=False):

        self.Atrib_Hoja = Atrib_Hoja
        self.hijos = []
        self.padre_valor = padre_valor
        self.caracteristicas = caracteristicas
        self.hoja = hoja



    def _decide(self, atributoss):

        if self.hoja:
            return self.Atrib_Hoja
        val = atributoss[self.Atrib_Hoja]
        for node in self.hijos:
            if val == node.padre_valor:
                return node._decide(atributoss)

    def hijo(self, node):
        self.hijos.append(node)




    def _reglas(self, padre=None, anterior=()):
        filas = []
        if padre is not None:
            anterior += ((padre.Atrib_Hoja, self.padre_valor), )
        if self.hoja:
            anterior += ((self.Atrib_Hoja), )
            filas.append(anterior)
        else:
            for node in self.hijos:
                filas.extend(node._reglas(self, anterior))
        return filas



    def __repr__(self):
        return "\n{0}({1}{2})".format(
            self.Atrib_Hoja,
            self.caracteristicas,
            ', '.join(repr(c) for c in self.hijos)
        )
