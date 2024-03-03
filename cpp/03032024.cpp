#include <graphics.h>
//03.03.2024 g.r kit-23v

const int WND_SIZE_X = 800; // size windows
const int WND_SIZE_Y = 600;
const int VERTXS_COUNT = 5; // amount of points

struct VertexStruct{
    int x,y,vect_x,vect_y;

};

VertexStruct vertex[VERTXS_COUNT];


int random(int N)
{
    return rand() % N;      // random 1..N
}


//init window and pointers coord and "speed"
void init()
{
    initwindow(WND_SIZE_X,WND_SIZE_Y);

    for(int i=0;i<VERTXS_COUNT;i++)
    {
        vertex[i].x = random(WND_SIZE_X);
        vertex[i].y = random(WND_SIZE_Y);
        vertex[i].vect_x = random(8)+4;
        vertex[i].vect_y = random(8)+4;
    }
    return;
}

// drawing
void draw(bool isColorized)
{
    for (int i=0;i<VERTXS_COUNT;i++)
    {
        if (isColorized)
            setcolor( random(10)+5 ); // daem cvet randomno
        else
            setcolor(BLACK); // instead of clear  whole  screen

        if (i < VERTXS_COUNT-1)
            line(vertex[i].x,vertex[i].y,vertex[i+1].x,vertex[i+1].y); // draw line to next point
        else
            line(vertex[VERTXS_COUNT-1].x,vertex[VERTXS_COUNT-1].y,vertex[0].x,vertex[0].y); // if it's last vertex draw line to first vertex
    }

    setcolor(7);
    outtextxy(10,WND_SIZE_Y-40,"G.R KIT-23V");

    return;
}

// if arriving borders then go backward
void checkCollide()
{
    for (int i=0;i<VERTXS_COUNT;i++)
    {
    if ((vertex[i].x<=0) || (vertex[i].x>=WND_SIZE_X))
        vertex[i].vect_x *= -1;
    if ((vertex[i].y<=0) || (vertex[i].y>=WND_SIZE_Y))
        vertex[i].vect_y *= -1;

    }
    return;
}

// movement each point
void update()
{

    checkCollide();
    for (int i=0;i<VERTXS_COUNT;i++)
    {
    vertex[i].x += vertex[i].vect_x;
    vertex[i].y += vertex[i].vect_y;
    }
    return;
}

int main()
{
    init();

    while (!kbhit())  // "gameloop"
    {

        draw(true);
        delay(10);
        draw(false);
        update();

    }
    closegraph();

    return 0;
}
