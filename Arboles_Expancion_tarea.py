import pandas as pd

dic = {
    "A": [("B", "C", "G")],
    "B": [("A", "D", "G")],
    "C": [("A", "E","D")],
    "D": [("B", "F","C")],
    "E": [("C",)],
    "F": [("D", "H")],
    "G": [("A",)],
    "H": [("F",)]
}

df = pd.DataFrame.from_dict(dic, orient="index", columns=["Conexiones"])

V = df.index.tolist()
E = [(v, c) for v, conexiones in df.iterrows() for c in conexiones["Conexiones"][0]]

edges_set = set()

# Iterar sobre cada arista en E
for edge in E:
    if (edge[1], edge[0]) not in edges_set:
        edges_set.add(edge)
        
E = list(edges_set)

print("Vértices:", V)
print("Aristas:", E)

V = list("abcdefgh")
grafo = pd.DataFrame(index= V, columns = V)
grafo.loc["a", ["b","c","g"]] = 1
grafo.loc["b", ["a","d","g"]] = 1
grafo.loc["c", ["a","d","e"]] = 1
grafo.loc["d", ["b","c","f"]] = 1
grafo.loc["e", ["c","f","g"]] = 1
grafo.loc["f", ["d","e","h"]] = 1
grafo.loc["g", ["a","b","e"]] = 1
grafo.loc["h", ["f",]] = 1
grafo = grafo.fillna(0)
grafo.to_json("grafo.json")

v1 = "a"
V = list(grafo.columns)
S = [v1]
Vp = [v1]
Ep = []
d = V.copy()
d.remove(v1)
s=[]

while True:
    for x in S:
        v = [y for y in d if y in grafo.loc[grafo[x] > 0, x]]
        _=[(Ep.append((x,y)),Vp.append(y), s.append(y), d.remove(y)) for y in v]
    if s ==[]:
        break
    S = s.copy()
    s = []
    
print(Vp)
print(Ep)