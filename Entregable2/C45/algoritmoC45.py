""" Algoritmo C4.5 
python algoritmoC45.py data.csv  (para el ejemplo)
"""

import tree
import math
from collections import Counter


class algoritmoC45(tree.Arbol):


    def entropiaConjunto(self, datos):
        return self.entropia(datos, self.clases, None, bandera=True)


    def entropia(self, datos, atributo, valor, bandera=False):

        contador = Counter()
        for fila in datos:
            if fila[atributo] == valor or bandera:
                contador[fila[self.clases]] += 1

        total = float(sum(contador.values())) 
        entropia = 0
        #para cada valor de la clase
        for inf in contador: 
            proportion = contador[inf] / total
            entropia += -(proportion*math.log(proportion, 2))
        return entropia

    def ganancia(self, datos, atributo):
 
        gain = self.entropiaConjunto(datos)
        contador = Counter()
        for fila in datos:
            contador[fila[atributo]] += 1
        total = float(sum(contador.values()))
        for valor in self.values[atributo]:
            gain += -((contador[valor]/total)*self.entropia(datos, atributo, valor))
        return gain



    def construyeArbol(self, sub_padre=None, padre=None, padre_valor=None,restantes=None):

        # Se identifican el subconjunto de los datos utilizados en el calculo de gain
        if sub_padre is None:
            datos = self.datos
        else:
            datos = [d for d in sub_padre if d[padre.Atrib_Hoja] == padre_valor] 

        if restantes is None:
            restantes = self.atributos

        use_padre = False
        contador = Counter()
        for fila in datos:
            contador[fila[self.clases]] += 1
        if not contador:
            # no se encuentra nada para el subconjunto dado
            datos = sub_padre
            contador = Counter()
            for fila in datos:
                contador[fila[self.clases]] += 1
            use_padre = True

        # Si cada elemento del subconjunto pertenece a un grupo de clases, Atrib_Hoja
        if len(contador) == 1: 
            node = tree.Nodo(Atrib_Hoja=contador.keys()[0],hoja=True,padre_valor=padre_valor)
        elif not restantes or use_padre:
            # Si no hay atributos restantess 
            comun = max(contador, key=lambda k: contador[k])
            node = tree.Nodo(Atrib_Hoja=comun,hoja=True,padre_valor=padre_valor)
        else:
            # Se calcula la maxima informacion de ganancia
            igains = []
            for atributo in restantes:
                igains.append((atributo, self.ganancia(datos, atributo)))

            max_atributo = max(igains, key=lambda a: a[1])

            # se crea el nodo
            node = tree.Nodo(max_atributo[0],caracteristicas={'Ganancia de informacion': max_atributo[1]},padre_valor=padre_valor)

        if padre is None:
            # orden de las decisiones del arbol
            self.set_atributos(self.atributos)
            self.raiz = node
        else:
            padre.hijo(node)

        if not node.hoja: 
            # eliminamos el atributo de la lista de atributos restantes
            restantess = restantes[:]
            restantess.remove(node.Atrib_Hoja)
            for value in self.values[node.Atrib_Hoja]:
                self.construyeArbol(datos,node,value,restantess)


if __name__ == '__main__':
    import argparse
    import pprint
    import sys

    parser = argparse.ArgumentParser()
    parser.add_argument('DatosEntrenamiento', type=argparse.FileType('r'))
    parser.add_argument('-p', '--DatosPrueba', nargs='?', const=None, default=False, type=argparse.FileType('r'))


    args = parser.parse_args()


    algoritmoC45 = algoritmoC45(args.DatosEntrenamiento)
    algoritmoC45.construyeArbol()
    print repr(algoritmoC45)
    pprint.pprint(algoritmoC45.reglas(), width=400)


    if args.DatosPrueba:
        algoritmoC45.test_file(args.DatosPrueba)


