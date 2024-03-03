#include <graphics.h>
//02.03.2024 g.r kit-23v

const int WINDOW_X = 800;
const int WINDOW_Y = 600;

const int BORDER_X1 = 5;
const int BORDER_Y1 = 5;
const int BORDER_X2 = WINDOW_X-20;
const int BORDER_Y2 = WINDOW_Y-20;
const int SNAKE_SIZE = 7;
const int BAR_SIZE = 20;

int vect_x = BAR_SIZE/2, vect_y = BAR_SIZE/2;

struct Snake {
    int x[SNAKE_SIZE] = {50};
    int y[SNAKE_SIZE] = {50};
    int size[SNAKE_SIZE] = {20};
    int color[SNAKE_SIZE] = {5};
};

Snake snake;

int random()
{
    int N = 16;
    return rand() % N +1;      // random 1..N
}

void init()
{
    initwindow(WINDOW_X,WINDOW_Y);
    rectangle(BORDER_X1,BORDER_Y1,BORDER_X2,BORDER_Y2);

    for(int i=0;i<SNAKE_SIZE;i++)
    {
        snake.color[i]=random();
        snake.x[i] = 50;
        snake.y[i] = 50;
    }
    snake.color[SNAKE_SIZE-1]=0;

    return;
}


void draw ()
{
    for(int i=0;i<SNAKE_SIZE;i++)
    {
        setfillstyle(1,snake.color[i]);
        bar(snake.x[i],snake.y[i],snake.x[i]+BAR_SIZE,snake.y[i]+BAR_SIZE);
    }

    setcolor(random());
    outtextxy(BORDER_X2-150,BORDER_Y2-20,"G.R. KIT-23V");
    return;
}


void update()
{
    int x = snake.x[0];
    int y = snake.y[0];

    if ((x+BAR_SIZE>=BORDER_X2) || (x<=BORDER_X1+5)) { vect_x = vect_x * -1; }
    if ((y+BAR_SIZE>=BORDER_Y2) || (y<=BORDER_Y1+5)) { vect_y = vect_y * -1; }

    for(int i=SNAKE_SIZE-1;i>0;i--)
    {
        snake.x[i] = snake.x[i-1];
        snake.y[i] = snake.y[i-1];
    }

    snake.y[0]=y+vect_y;
    snake.x[0]=x+vect_x;
    return;
}

main()
{
init();

while(!kbhit())
{
        update();
        draw();
        delay(20);
}

closegraph();
}


