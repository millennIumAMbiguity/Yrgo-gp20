static PVector playerPosition;
void movement(){
    playerPosition.add(input);

    for (Ball o : list) {
	 	o.move();
	}
}