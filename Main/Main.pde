Member admin;
Member senpai;
Member tejon;
Member sergay;
Member niggo;

// Variables Preinicializadas
    int screenC = 0; // Control de Pantalla
    int memberC = 0; // Control de Miembro
    PImage fondo; // Fondo del Sketch

void setup(){
    // Configuración del Sketch
        fullScreen();
        shapeMode(CORNER);
        noStroke();
        loop();
        fondo = loadImage("/Graphic/Fondo.png");
        fondo.resize(width,height);
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
        //niggo.stats();
}

void draw(){
    image(fondo,0,0);
    memberDisplay();
    select();
}

public void memberDisplay() {
    switch (memberC) {
        case 1: // Admin
            admin.stats();
        break;
        case 2: // Senpai
            senpai.stats();
        break;
        case 3: // Tejón
            tejon.stats();
        break;
        case 4: // Sergäy
            sergay.stats();
        break;
        case 5: // Niggo
            niggo.stats();
        break;
        default: // Vacío (Sin Display)
        break;
    }
}

private void select() {
    if (screenC == 0) {
        highlight();
    }
    click();
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

private void click() {
    if(mousePressed && mouseButton == LEFT && screenC == 0) {
        if (mouseX > 0 && mouseX < width/5){
            memberC = 1;
        }else
        if (mouseX > width/5 && mouseX < width*2/5){
            memberC = 2;
        }else
        if (mouseX > width*2/5 && mouseX < width*3/5){
            memberC = 3;
        }else
        if (mouseX > width*3/5 && mouseX < width*4/5){
            memberC = 4;
        }else
        if (mouseX > width*4/5 && mouseX < width){
            memberC = 5;
        }
        screenC = 1;
    }
}
