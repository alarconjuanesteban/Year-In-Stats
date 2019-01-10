public class Member {

    PImage plantilla;
    Table data;
    int[] graph;
    PShape g;
    PFont consolas;
    PFont gabriola;
    PFont cambria;
    PFont book;
    PFont bookBold;
    color c;
    int y;

    public Member (String name) {
        plantilla = loadImage("/Graphic/"+ name +".png");
        data = loadTable("/data.csv");
        graph = new int[12];
        g = createShape();
        consolas = createFont("Consolas Bold", 12, true);
        gabriola = createFont("Gabriola", 20, true);
        cambria = createFont("Cambria Italic", 15, true);
        book = createFont("Book Antiqua", 35, true);
        bookBold = createFont("Book Antiqua Bold", 50, true);
        fill(0);
        if(name == "Admin"){
            c = color(200, 0, 0);
            y = 1;
        }
        if(name == "Senpai"){
            c = color(0, 200, 100);
            y = 5;
        }
        if(name == "Tejón"){
            c = color(100, 0, 100);
            y = 9;
        }
        if(name == "Sergäy"){
            c = color(0, 100, 255);
            y = 13;
        }
        if(name == "Niggo"){
            c = color(255, 150, 0);
            y = 17;
        }
        if(name == "WoL!"){
            c = color(0, 0, 0);
            y = 21;
        }
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
        //Datos de Actividad
            int diasActivo = data.getInt(y+2,0);
            int spamsDebates = data.getInt(y+2,1);
            int ratioFluidez = data.getInt(y+2,2);
        stats(menTotales, graph, t, texto, multimedia, menDiarios, diasActivo, spamsDebates, ratioFluidez);
    }

    private void stats(String menTotales, int[] graph, float t, String texto, String multimedia, int menDiarios, int diasActivo, int spamsDebates, int ratioFluidez){
        pushMatrix();
            translate((width-(height*1080/1560))/2,0);
            drawPlantilla();
            drawMensajes(menTotales, graph, t, texto, multimedia, menDiarios);
            drawActividad(diasActivo, spamsDebates, ratioFluidez);
        popMatrix();
    }

    private void drawPlantilla() {
        //plantilla.resize(648,936);
        //plantilla.resize(540,780);
        plantilla.resize(height*1080/1560,height);
        image(plantilla,0,0);
    }

    private void drawMensajes(String menTotales, int[] graph, float t, String texto, String multimedia, int menDiarios) {
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
            pie(t);
    }

    private void graph (int[] graph) {
        int max = max(graph);
        int min = min(graph);
        limit(max, min);
        mean(graph);
        g.beginShape();
            g.stroke(c);
            g.strokeWeight(2);
            g.noFill();
            int count = 0;
            int[] graphAjustada = ajustar(graph, min);
            for (int i = 0; i < graph.length; i++) {
                g.vertex(X(count), Y(graphAjustada[i]));
                count -= 32;
            }
            for (int i = 0; i < graph.length-1; i++) {
                count += 32;
                g.vertex(X(count), Y(graphAjustada[graph.length-i-1]));
            }
        g.endShape();
        pushMatrix();
            rotate(PI);
            shape(g, X(-520), Y(-534));
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
                graphAjustada[i] = (graphAjustada[i]*100)/maxTemp;
            }
        return graphAjustada;
    }

    private void limit(int max, int min) {
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

    private void pie (float t) {
        pushStyle();
            fill(c, 150);
            noStroke();
            float tRadial = (t*360)/100;
            float radio = width*9.1/100;
            arc(X(290), Y(745), radio, radio, 0, radians(tRadial));
            //arc(X(290), Y(745), 125, 125, 0, radians(tRadial));
        popStyle();
    }

    private void drawActividad(int diasActivo, int spamsDebates, int ratioFluidez) {
        textAlign(CENTER);
        textFont(bookBold, 50);
        text(diasActivo, X(250), Y(1215));
        text(spamsDebates, X(540), Y(1215));
        text(ratioFluidez, X(830), Y(1215));
    }

    public int getX(int i){
        return data.getInt(y+1,i);
    }


}
