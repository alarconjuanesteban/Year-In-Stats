public class Member {

    PImage fondo;
    Table data;
    PShape g;
    PFont consolas;
    PFont gabriola;
    PFont cambria;
    PFont book;
    PFont bookBold;
    int y;
    int alto;
    int ancho;

    public Member (String name) {
        fondo = loadImage("/Graphic/"+ name +".png");
        data = loadTable("/data.csv");
        g = createShape();
        consolas = createFont("Consolas Bold", 12, true);
        gabriola = createFont("Gabriola", 20, true);
        cambria = createFont("Cambria Italic", 15, true);
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
        // Gráficas
            graph(graph);
            //pie();
    }

    private int X (int x) {
        return width*x/this.ancho;
    }

    private int Y (int y) {
        return height*y/this.alto;
    }

    private void graph (int[] graph) {
        // Dibuja la gráfica mensual
        limit(graph);
        mean(graph);
        g.beginShape();
        g.stroke(200, 0, 0);
        g.noFill();
        int count = 0;
        for (int i = 0; i < graph.length; i++) {
            g.vertex(X(count), Y(graph[i]));
            count -= 32;
        }
        g.endShape();
        pushMatrix();
            rotate(PI);
            shape(g, X(-520), Y(-534));
        popMatrix();
    }

    private void limit(int[] graph) {
        int max = graph[0];
        int min = max;
        for (int i = 0; i < graph.length; i++) {
            if (graph[i] > max)
                max = graph[i];
            if (graph[i] < min)
                min = graph[i];
        }
        textAlign(CENTER);
        textFont(consolas);
        text(max, X(480), Y(430));
        text(min, X(480), Y(553));
    }

    private void mean(int[] graph) {
        int ac = 0;
        for (int i = 0; i < graph.length; i++) {
            ac += graph[i];
        }
        int m = ac/graph.length;
        pushStyle();
            textFont(cambria);
            textAlign(CENTER);
            fill(200);
            text("Media: " + m, X(680), Y(565));
        popStyle();
    }

    private void drawActividad(int diasActivo, int spamsDebates, int ratioFluidez) {
        textAlign(CENTER);
        textFont(bookBold, 50);
        text(diasActivo, X(250), Y(1215));
        text(spamsDebates, X(540), Y(1215));
        text(ratioFluidez, X(830), Y(1215));
    }


}
