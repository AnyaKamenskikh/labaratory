using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Interop;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;
using ClassLibrary1;
using Microsoft.Win32;

namespace UP_01_ALL
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        labPermEntities db = new labPermEntities();
        List<Users> users = new List<Users>();
        public string captchaText = "";
        public MainWindow()
        {
            InitializeComponent();
            textBoxCaptcha.FontFamily = new System.Windows.Media.FontFamily("Wingdings 2");

            timer1.Interval = TimeSpan.FromSeconds(1);
            timer1.Tick += timer1_Tick;
            timer1.Start();
            DeleteTimeUser();
            GetRegistryTime();
        }

        


        private void Entrance_Click(object sender, RoutedEventArgs e)
        {
            if (textBoxLogin.Text == "")
            {
                MessageBox.Show("Введите логин");
            }
            else if (textBoxPassword.Text == "")
            {
                MessageBox.Show("Введите пароль");
            }
            else
            {
                users = db.Users.ToList();
                var user = db.Users.FirstOrDefault(x => x.Login == textBoxLogin.Text && x.Password == textBoxPassword.Text);

                if (user == null)
                {
                    MessageBox.Show("Такого пользователя не существует. Проверьте правильно ли введён логин и пароль.");
                    RectangleCaptcha.Visibility = Visibility;
                    CaptchaImage.Visibility = Visibility;
                    textBoxCaptcha.Visibility = Visibility;
                    BtnUpdateCaptcha.Visibility = Visibility;
                    DisplayCaptchaImage();
                    var login = new LoginHistory
                    {
                        ID_User = null,
                        DateOfEntry = DateTime.Now.Date,
                        ID_AttemptStatus = 2
                    };
                    db.LoginHistory.Add(login);
                    db.SaveChanges();
                }
                else
                {

                    if (textBoxCaptcha.Text == C.Content.ToString() || CaptchaImage.Visibility == Visibility.Hidden)
                    {
                        var type = db.Positions.FirstOrDefault(x => x.ID == user.Type);
                        if (type.Name == "Лаборатн")
                        {
                            var login = new LoginHistory
                            {
                                ID_User = user.ID,
                                DateOfEntry = DateTime.Now.Date,
                                ID_AttemptStatus = 1
                            };
                            db.LoginHistory.Add(login);
                            db.SaveChanges();
                            Window LaborantAssistent = new LaborantAssistent(user);
                            LaborantAssistent.Show();
                            this.Close();
                        }
                        else if (type.Name == "Администратор")
                        {
                            var login = new LoginHistory
                            {
                                ID_User = user.ID,
                                DateOfEntry = DateTime.Now.Date,
                                ID_AttemptStatus = 1
                            };
                            db.LoginHistory.Add(login);
                            db.SaveChanges();
                            Window Admin = new Admin(user);
                            Admin.Show();
                            this.Close();
                        }
                        else if (type.Name == "Лаборант-исследователь")
                        {
                            var login = new LoginHistory
                            {
                                ID_User = user.ID,
                                DateOfEntry = DateTime.Now.Date,
                                ID_AttemptStatus = 1
                            };
                            db.LoginHistory.Add(login);
                            db.SaveChanges();
                            Window LaborantAnalizator = new LaborantAnalizator(user);
                            LaborantAnalizator.Show();
                            this.Close();
                        }
                        else if (type.Name == "Бухгалтер")
                        {
                            var login = new LoginHistory
                            {
                                ID_User = user.ID,
                                DateOfEntry = DateTime.Now.Date,
                                ID_AttemptStatus = 1
                            };
                            db.LoginHistory.Add(login);
                            db.SaveChanges();
                            Window Accountant = new Accountant(user);
                            Accountant.Show();
                            this.Close();
                        }
                        else
                            MessageBox.Show("Поздравляю, вы тут не работаете!");
                    }
                    else
                    {
                        MessageBox.Show("Капча введена неправильно");
                        var login = new LoginHistory
                        {
                            ID_User = user.ID,
                            DateOfEntry = DateTime.Now.Date,
                            ID_AttemptStatus = 2
                        };
                        db.LoginHistory.Add(login);
                        db.SaveChanges();
                        DisplayCaptchaImage();
                    }
                }
            }
        }


        //КАПЧА

        private string GenerateRandomText(int length)
        {
            const string chars = "ABSDEFGHIJKLMNOPQRSTUVWXYZabcdefghjklmnopqrstuvwxyz0123456789";
            Random random = new Random();
            StringBuilder captchaText = new StringBuilder();
            for (int i = 0; i < length; i++)
            {
                captchaText.Append(chars[random.Next(chars.Length)]);
            }
            return captchaText.ToString();
        }

        private const string CaptchaText = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        private readonly Random _random = new Random();

        private Bitmap GenerateCaptchaImage()
        {
            string capcthaText = GenerateRandomText(6);
            Font font = new Font("Comic Sans MS", 20);
            Bitmap bitmap = new Bitmap(200, 50);
            C.Content = capcthaText;
            using (Graphics g = Graphics.FromImage(bitmap))
            {
                g.Clear(System.Drawing.Color.White);
                int letterWidth = bitmap.Width / capcthaText.Length;
                int initialX = 0;// Начальное значение x
                Random random = new Random();
                foreach (char letter in capcthaText)
                {
                    int y = random.Next(0, 10); // Фиксированный y
                    int offsetX = random.Next(-3, 6);
                    int offsetY = random.Next(-3, 6);

                    // Получаем значения компонентов цвета из шестнадцатеричного представления
                    byte red = Convert.ToByte(0x49); // 0x49 соответствует 73
                    byte green = Convert.ToByte(0x8C); // 0x8C соответствует 140
                    byte blue = Convert.ToByte(0x51); // 0x51 соответствует 81
                    byte alpha = Convert.ToByte(0xFF); // 0xFF соответствует 255

                    // Создаем новый цвет на основе полученных компонентов
                    System.Drawing.Color newColor = System.Drawing.Color.FromArgb(alpha, red, green, blue);

                    // Создаем новую кисть с этим цветом
                    System.Drawing.Brush brush = new System.Drawing.SolidBrush(newColor);

                    float x = initialX + offsetX; //Вычисляем x на основе начального значения и случайного смещения

                    g.DrawString(letter.ToString(), font, brush, x, y + offsetY);
                    initialX += letterWidth;
                }
            }
            return bitmap;
        }//конец капчи

        private void AddNoiseToCaptcha(Bitmap captchaImage)
        {
            Random random = new Random();
            using (Graphics g = Graphics.FromImage(captchaImage))
            {
                for (int i = 0; i < 20; i++)
                {
                    System.Drawing.Pen pen = new System.Drawing.Pen(System.Drawing.Color.Black, 1);
                    int x1 = random.Next(captchaImage.Width);
                    int y1 = random.Next(captchaImage.Height);
                    int x2 = random.Next(captchaImage.Width);
                    int y2 = random.Next(captchaImage.Height);
                    g.DrawLine(pen, x1, y1, x2, y2);

                    //добавление случайных точек
                    for (int j = 0; j < 50; j++)
                    {
                        int x = random.Next(captchaImage.Width);
                        int y = random.Next(captchaImage.Height);
                        captchaImage.SetPixel(x, y, System.Drawing.Color.Gray);
                    }
                }
            }
        }

        private void DisplayCaptchaImage()
        {
            Bitmap captchaImage = GenerateCaptchaImage();
            AddNoiseToCaptcha(captchaImage);
            BitmapSource bitmapSource = ConvertBitmapToBitmapSource(captchaImage);
            CaptchaImage.Source = bitmapSource;
        }

        private BitmapSource ConvertBitmapToBitmapSource(Bitmap captchaImage)
        {
            throw new NotImplementedException();
        }



        //СКРЫТИЕ ПАРОЛЯ
        private void BtnMAska_Click(object sender, RoutedEventArgs e)
        {
            if (textBoxPassword.Visibility == Visibility.Visible)
            {
                paswordPB.Visibility = Visibility.Visible;
                textBoxPassword.Visibility = Visibility.Collapsed;
            }
            else
            {
                paswordPB.Visibility = Visibility.Collapsed;
                textBoxPassword.Visibility = Visibility.Visible;
            }
            //скрытие пароля

        }


        //ТАЙМЕР
        DispatcherTimer timer1 = new DispatcherTimer();
        private int secSave = 0;
        private int minSave = 0;
        private int hourSave = 0;
        private int secCur = 0;
        private int minCur = 0;
        private int hourCur = 0;
        private int lastSeconds = 0;
        bool IsCanLab = true;

        private void timer1_Tick(object sender, EventArgs e)
        {
            secCur = GetSeconds();
            minCur = GetMinutes();
            hourCur = GetHours();
            lastSeconds = 1800 - ((hourCur * 3600 + minCur * 60 + secCur) - (hourSave * 3600 + minSave * 60 + secSave));
            if (lastSeconds <= 0)
            {
                IsCanLab = true;

                string subKeyName = "BanTimer";
                RegistryKey key = Registry.CurrentUser;
                if (key.OpenSubKey(subKeyName) != null)
                    key.DeleteSubKeyTree(subKeyName);
            }
        }

        private void DeleteTimeUser()
        {
            string subKeyName = "Timer";
            RegistryKey key = Registry.CurrentUser;

            if (key.OpenSubKey(subKeyName) != null)
            {
                key.DeleteSubKeyTree(subKeyName);
            }
        }

        private void GetRegistryTime()
        {
            if (Registry.CurrentUser.OpenSubKey("BanTimer") == null)
            {
                return;
            }
            RegistryKey currentUserKey = Registry.CurrentUser;
            RegistryKey GIBDD_KEY = currentUserKey.OpenSubKey("BanTimer");
            secSave = Convert.ToInt32(GIBDD_KEY.GetValue("seconds"));
            minSave = Convert.ToInt32(GIBDD_KEY.GetValue("minutes"));
            hourSave = Convert.ToInt32(GIBDD_KEY.GetValue("hours"));
            GIBDD_KEY.Close();
            secCur = GetSeconds();
            minCur = GetMinutes();
            hourCur = GetHours();

            lastSeconds = 1800 - ((hourCur * 3600 + minCur * 60 + secCur) - (hourSave * 3600 + minSave * 60 + secSave));
            if (lastSeconds > 0)
            {
                IsCanLab = false;
            }
            else
            {
                IsCanLab = true;

                string subKeyName = "BanTimer";
                RegistryKey key = Registry.CurrentUser;
                if (key.OpenSubKey(subKeyName) != null)
                    key.DeleteSubKeyTree(subKeyName);
            }
        }

        private int GetSeconds()
        {
            return Convert.ToInt32(DateTime.Now.ToString().Substring((DateTime.Now.ToString().Length - 2), 2));
        }
        private int GetMinutes()
        {
            return Convert.ToInt32(DateTime.Now.ToString().Substring((DateTime.Now.ToString().Length - 5), 2));
        }
        private int GetHours()
        {
            return Convert.ToInt32(DateTime.Now.ToString().Substring((DateTime.Now.ToString().Length - 8), 2));
        }

        private void textBoxPassword_TextChanged(object sender, TextChangedEventArgs e)
        {
            paswordPB.Password = textBoxPassword.Text;
        }

        private void paswordPB_TextInput(object sender, TextCompositionEventArgs e)
        {
            textBoxPassword.Text = paswordPB.Password;
        }
    }

}
