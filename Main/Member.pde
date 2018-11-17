public class Member {

    PImage fondo;
    Table data;
    PFont consolas;
    PFont gabriola;
    PFont book;
    PFont bookBold;
    int y;
    int alto;
    int ancho;

    public Member (String name) {
        fondo = loadImage("/Graphic/"+ name +".png");
        data = loadTable("/data.csv");
        consolas = createFont("Consolas", 10, true);
        gabriola = createFont("Gabriola", 20, true);
        book = createFont("Book Antiqua", 30, true);
        bookBold = createFont("Book Antiqua Bold", 35, true);
        alto = 1560 - 54;
        ancho = 1080;
        fill(0);
        if(name == "Admin")
            y = 0;
        if(name == "Senpai")
            y = 4;
        if(name == "Tejón")
            y = 8;
        if(name == "Sergäy")
            y = 12;
        if(name == "Niggo")
            y = 16;
    }

    public void stats () {
        // Datos de Mensajes
            int mT = data.getInt(y,0);
            String menTotales = nfc(mT);
            int[] graph = new int[12];
            for (int i = 0; i < 12 ; i++) {
                graph[i] = data.getInt(y+1,i);
            }
            float t = data.getFloat(y,1);
            float m = 100-t;
            String texto = nfc(t,2);
            String multimedia = nfc(m,2);
            int menDiarios = data.getInt(y,2);
        //Datos de Actividad
            int diasActivo = data.getInt(y+2,0);
            int spamsDebates = data.getInt(y+2,1);
            int ratioFluidez = data.getInt(y+2,2);
        stats(menTotales, graph, texto, multimedia, menDiarios, diasActivo, spamsDebates, ratioFluidez);
    }

    private void stats(String menTotales, int[] graph, String texto, String multimedia, int menDiarios, int diasActivo, int spamsDebates, int ratioFluidez){
        drawFondo();
        drawMensajes(menTotales, graph, texto, multimedia, menDiarios);
        drawActividad(diasActivo, spamsDebates, ratioFluidez);
    }

    private void drawFondo() {
        //fondo.resize(648,936);
        fondo.resize(540,780);
        image(fondo,0,0);
    }

    private void drawMensajes(String menTotales, int[] graph, String texto, String multimedia, int menDiarios) {
        // Mensajes Totales + Diarios En Promedio
            textAlign(CENTER);
            textFont(bookBold);
            text(menTotales, X(290), Y(480));
            textFont(bookBold, 65);
            text(menDiarios, X(820), Y(722));
        // Porcentaje de Texto vs. Multimedia
            textAlign(RIGHT);
            textFont(book);
            text(texto, X(590), Y(725));
            text(multimedia, X(590), Y(840));
    }

    private int X (int x) {
        return width*x/this.ancho;
    }

    private int Y (int y) {
        return height*y/this.alto;
    }

    private void drawActividad(int diasActivo, int spamsDebates, int ratioFluidez) {
        // Dibuja la Sección de Actividad
    }


}
