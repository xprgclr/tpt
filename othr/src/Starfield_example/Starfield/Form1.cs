using System.Diagnostics;
using System.Runtime.CompilerServices;

namespace Starfield
{
    public partial class Form1 : Form
    {
        public class Star
        {
            public float X { get; set; }
            public float Y { get; set; }
            public float Z { get; set; }
        }

        private Star[] stars = new Star[15000];
        private Random random = new Random();
        private Graphics graphics;


        public Form1()
        {
            InitializeComponent();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            graphics.Clear(Color.Black);
            foreach (var star in stars)
            {
                DrawStar(star);
                MoveStar(star);
            }
            pictureBox1.Refresh();
        }

        private void MoveStar(Star star)
        {
            star.Z -= 1;

            if (star.Z < 1)
            {
                star.Z = random.Next(1, pictureBox1.Width);
            }

        }

        private void DrawStar(Star star)
        {
            float starsize = Map (star.Z, 0, pictureBox1.Width,7,0);

            float x = Map(star.X / star.Z, 0, 1, 0, pictureBox1.Width) + pictureBox1.Width / 2;
            float y = Map(star.Y / star.Z, 0, 1, 0, pictureBox1.Height) + pictureBox1.Height / 2;
            
            
            graphics.FillEllipse(Brushes.GreenYellow, x, y, starsize, starsize);
        }

        private float Map(float n, float start1, float stop1, float start2, float stop2)
        {

            return ((n - start1) / (stop1 - start1)) * (stop2 - start2) + start2;

        }

        private void Form1_Load(object sender, EventArgs e)
        {

            pictureBox1.Image = new Bitmap(pictureBox1.Width, pictureBox1.Height);
            graphics = Graphics.FromImage(pictureBox1.Image);

            for (int i = 0; i < stars.Length; i++)
            {
                stars[i] = new Star()
                {
                    X = random.Next(-pictureBox1.Width, pictureBox1.Width),
                    Y = random.Next(-pictureBox1.Height, pictureBox1.Height),
                    Z = random.Next(1, pictureBox1.Width)
                };
            }

            timer1.Start();
        }
    }
}
