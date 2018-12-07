Member admin;
Member senpai;
Member tejon;
Member sergay;
Member niggo;

void setup(){
    // Configuración del Sketch
        fullScreen();
        shapeMode(CORNER);
        noStroke();
        loop();
    // Inicialización de Objetos (Miembros)
        admin = new Member("Admin");
        senpai = new Member("Senpai");
        tejon = new Member("Tejón");
        sergay = new Member("Sergäy");
        niggo = new Member("Niggo");
    // Proyección de Estadísticas
        //admin.stats();
        //senpai.stats();
        //tejon.stats();
        //sergay.stats();
        niggo.stats();
}

void draw(){
    //update(mouseX, mouseY);
    // Selector de Miembro
        /*for (int i = 0; i < 5; i++) {
            fill(i*20);
            rect(width*i/5,0,width/5,height);
        }*/
        /*fill(200,0,0);
        select();*/
    // Inicialización de los Overlay
        //rect(1400,410,300,300);
}

private void select() {
    highlight();
}

private void highlight() {
    if (mouseX > 0 && mouseX < width/5){
        rect(0,0,width/5,height);
    }else
    if (mouseX > width/5 && mouseX < width*2/5){
        rect(width/5,0,width/5,height);
    }else
    if (mouseX > width*2/5 && mouseX < width*3/5){
        rect(width*2/5,0,width/5,height);
    }else
    if (mouseX > width*3/5 && mouseX < width*4/5){
        rect(width*3/5,0,width/5,height);
    }else
    if (mouseX > width*4/5 && mouseX < width){
        rect(width*4/5,0,width/5,height);
    }
}
