#include <graphics.h>
#include <stdlib.h>

const int WINDOW_X = 640;
const int WINDOW_Y = 480; // razmeri ekrana i "to4ki"
const int BAR_SIZE = 20;

int x=50,y=50;   //start loc.
int vect_x = BAR_SIZE/2, vect_y = BAR_SIZE/2;    // vector

int random()
{
    int N = 16;
    return rand() % N +1;      // random 1..N
}

void draw (int x, int y, int color)
{
    setfillstyle(1,color);          // risuem kvadratik
    bar(x,y,x+BAR_SIZE,y+BAR_SIZE);

    return;
}

void update()
{
    if ((x+BAR_SIZE+10>=WINDOW_X) || (x<=0)) { vect_x = vect_x * -1; }
    if ((y+BAR_SIZE+10>=WINDOW_Y) || (y<=0)) { vect_y = vect_y * -1; }    // proverka na stolknovenie s graanicami ekrana, menjaem napravlenie esli da

    y=y+vect_y;   // libo dvigaem dalwe
    x=x+vect_x;

    return;
}

main()
{
initwindow(WINDOW_X,WINDOW_Y);

while(true)
{
        update();
        draw(x,y,random());          // klassik infinite gameloop
        delay(30);
        draw(x,y,BLACK);
}

closegraph();
}


