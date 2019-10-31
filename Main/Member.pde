public class Member {

    PImage plantilla;
    Table data;
    int[] graph;
    PShape g;
    PFont consolas;
    PFont gabriola;
    PFont cambria;
    PFont book;
    PFont bookItalics;
    PFont bookBold;
    color c;
    int y;

    public Member (String name, int year) {
        plantilla = loadImage("/Graphic/"+ name +".png");
        data = loadTable("/Data/"+ year +".csv");
        graph = new int[12];
        g = createShape();
        consolas = createFont("Consolas Bold", 15, true);
        gabriola = createFont("Gabriola", 20, true);
        cambria = createFont("Cambria Italic", 20, true);
        book = createFont("Book Antiqua", 35, true);
        bookItalics = createFont("Book Antiqua Italic", 50, true);
        bookBold = createFont("Book Antiqua Bold", 50, true);
        fill(0);
        if(name == "Admin"){
            c = color(200, 0, 0);
            y = 1;
        }
        if(name == "Niggo"){
            c = color(255, 150, 0);
            y = 5;
        }
        if(name == "Tejon"){
            c = color(100, 0, 100);
            y = 9;
        }
        if(name == "Sergay"){
            c = color(0, 100, 255);
            y = 13;
        }
        if(name == "Senpai"){
            c = color(0, 200, 100);
            y = 17;
        }
        if(name == "Bosboni"){
            c = color(150, 175, 0);
            y = 21;
        }
        if(name == "Cohete"){
            c = color(100, 200, 200);
            y = 25;
        }
        if(name == "Karen"){
            c = color(150, 0, 75);
            y = 29;
        }
        if(name == "Santy"){
            c = color(200, 140, 120);
            y = 33;
        }
        if(name == "WoL!"){
            c = color(0, 0, 0);
            y = 37;
        }
    }

    public void graphLoad() {
        graphArray();
        g.beginShape();
            g.stroke(c);
            g.strokeWeight(2);
            g.noFill();
            int count = 0;
            int[] graphAjustada = ajustar(graph, min(graph));
            for (int i = 0; i < graph.length; i++) {
                g.vertex(X(count), Y(graphAjustada[i]));
                count -= 50;
            }
        g.endShape();
    }

    public void graphArray() {
        for (int i = 0; i < 12 ; i++)
            graph[i] = data.getInt(y+1,i);
    }

    public void stats () {
        // Datos de Mensajes
            int mT = data.getInt(y,0);
            String menTotales = nfc(mT);
            float t = data.getFloat(y,1);
            float m = 100-t;
            String texto = nfc(t,2);
            String multimedia = nfc(m,2);
            int menDiarios = data.getInt(y,2);
        //Datos del Año
            int year = Main.year;
        stats(menTotales, graph, t, texto, multimedia, menDiarios, year);
    }

    private void stats(String menTotales, int[] graph, float t, String texto, String multimedia, int menDiarios, int year){
        pushMatrix();
            translate((width-(height*2773/1560))/2,0);
            drawPlantilla();
            drawMensajes(menTotales, graph, t, texto, multimedia, menDiarios);
            drawYear(year);
        popMatrix();
    }

    private void drawPlantilla() {
        //plantilla.resize(648,936);
        //plantilla.resize(540,780);
        plantilla.resize(height*2773/1560,height);
        image(plantilla,0,0);
    }

    private void drawMensajes(String menTotales, int[] graph, float t, String texto, String multimedia, int menDiarios) {
        // Mensajes Totales + Diarios En Promedio
            textAlign(CENTER);
            textFont(bookBold,80);
            text(menTotales, X(1380), Y(490));
            textFont(bookBold, 100);
            text(menDiarios, X(2320), Y(940));
        // Porcentaje de Texto vs. Multimedia
            textAlign(RIGHT);
            textFont(book,50);
            text(texto, X(1900), Y(930));
            text(multimedia, X(1900), Y(1135));
        // Gráficas
            graph(graph);
            pie(t);
    }

    private void graph (int[] graph) {
        int max = max(graph);
        int min = min(graph);
        limit(max, min);
        mean(graph);
        pushMatrix();
            rotate(PI);
            // shape(g, X(-520), Y(-534));
            shape(g, X(-1800), Y(-594));
        popMatrix();
    }

    private int max (int[] arr) {
        int x = arr[0];
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] > x)
                x = arr[i];
        }
        return x;
    }

    private int min (int[] arr) {
        int x = arr[0];
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] < x)
                x = arr[i];
        }
        return x;
    }

    private int[] ajustar (int[] graph, int min) {
        int[] graphAjustada = new int[12];
        // Restarle el Mínimo valor a todo el Arreglo:
            for (int i = 0; i < graph.length; i++) {
                graphAjustada[i] = graph[i] - min;
            }
        // Ajuste Porcentual:
            int maxTemp = max(graphAjustada);
            for (int i = 0; i < graphAjustada.length; i++) {
                graphAjustada[i] = (graphAjustada[i]*175)/maxTemp;
            }
        return graphAjustada;
    }

    private void limit(int max, int min) {
        textAlign(CENTER);
        textFont(consolas);
        text(max, X(1710), Y(410));
        text(min, X(1710), Y(630));
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
            text("Media: " + m, X(2060), Y(650));
        popStyle();
    }

    private void pie (float t) {
        pushStyle();
            fill(c, 150);
            noStroke();
            float tRadial = (t*360)/100;
            float radio = width*15.7/100;
            arc(X(1380), Y(973), radio, radio, 0, radians(tRadial));
            //arc(X(290), Y(745), 125, 125, 0, radians(tRadial));
        popStyle();
    }

    private void drawYear(int year) {
        textAlign(CENTER);
        textFont(bookItalics);
        pushStyle();
            fill(c);
            text(year, X(2340), Y(1290));
        popStyle();
    }

    public int getX(int i){
        return data.getInt(y+1,i);
    }


}
