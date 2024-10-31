using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Windows.Threading;

namespace UP_01_ALL
{
    /// <summary>
    /// Логика взаимодействия для LaborantAssistent.xaml
    /// </summary>
    public partial class LaborantAssistent : Window
    {
        public int Hours = 0, Mins = 0, Sec = 0;
        private int secSave = 0, minSave = 0, hourSave = 0;
        private DispatcherTimer Time;

        labPermEntities db = new labPermEntities();
        Users Users = new Users();

        public LaborantAssistent(Users users)
        {
            InitializeComponent();
            Users = users;
            var type = db.Positions.FirstOrDefault(x => x.ID == users.Type);
            FIOLabel.Content = users.Name;
            Time = new DispatcherTimer();

            TimeFromRegistracia();
            Time.Interval = TimeSpan.FromSeconds(1);
            Time.Tick += TimerLabel_Tick;
            Time.Start();
        }

        private void BtnExit_Click(object sender, RoutedEventArgs e)
        {
            Window mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }

        private void BtnRecBiomat_Click(object sender, RoutedEventArgs e)
        {
            Window RecBio = new ReceiveBiomat(Users);
            RecBio.Show();
            this.Close();
        }

        //Время сеанса
        private void TimerLabel_Tick(object sender, EventArgs e)
        {
            Sec++;
            if (Sec == 60)
            {
                Mins++;
                Sec = 0;
            }
            if (Mins == 60)
            {
                Hours++;
                Mins = 0;
            }
            TimerLabel.Content = $"{Hours}:{Mins}:{Sec}";

            if (Hours == 2 && Mins == 25)
                MessageBox.Show("Через 5 минут сеанс будет закончен!");

            if (Hours == 2 && Mins == 30)
            {
                SetBlock();

                Application.Current.Shutdown();
            }
        }

        private void SetBlock()
        {
            secSave = GetSec();
            minSave = GetMins();
            hourSave = GetHours();
            CreateTimeReg(secSave, minSave, hourSave);
        }

        private void CreateTimeReg(int secSave, int minSave, int hourSave)
        {
            RegistryKey regTime = Registry.CurrentUser;
            RegistryKey REG_TIME = regTime.CreateSubKey("REG_TIME");
            REG_TIME.SetValue("seconds", Sec.ToString());
            REG_TIME.SetValue("minutes", Mins.ToString());
            REG_TIME.SetValue("hours", Hours.ToString());
            REG_TIME.Close();
        }

        private int GetMins()
        {
            return Convert.ToInt32(DateTime.Now.ToString().Substring((DateTime.Now.ToString().Length - 5), 2));
        }

        private int GetHours()
        {
            return Convert.ToInt32(DateTime.Now.ToString().Substring((DateTime.Now.ToString().Length - 8), 2));
        }

        private int GetSec()
        {
            return Convert.ToInt32(DateTime.Now.ToString().Substring((DateTime.Now.ToString().Length - 2), 2)); ;
        }

        private void TimeFromRegistracia()
        {
            RegistryKey time = Registry.CurrentUser.OpenSubKey("Timer");
            if (time != null)
            {
                Hours = (int)time.GetValue("Houers", 0);
                Mins = (int)time.GetValue("Minutes", 0);
                Sec = (int)time.GetValue("Seconds", 0);
                time.Close();
            }
        }


    }
}
