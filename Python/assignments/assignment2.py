points=[(4,5),(4,6), (7,3),(4,3)]
for i in points:
    if(i[0]>i[1]):
        print("The X Coordinate is greater than Y Coordinate for point (X,Y)")
    else:
        print("The Y Coordinate is greater than or equal to X Coordinate for point (X,Y)")