using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Windows.Threading;
using System.Xml.Linq;

namespace UP_01_ALL
{
    /// <summary>
    /// Логика взаимодействия для WorkAnaliz.xaml
    /// </summary>
    public partial class WorkAnaliz : Window
    {
        public int Hours = 0, Mins = 0, Sec = 0;
        private int secSave = 0, minSave = 0, hourSave = 0;
        private DispatcherTimer Time;
        private DispatcherTimer analizator;
        private string patient;

        string name = "";

        labPermEntities db = new labPermEntities();
        List<Order> orders = new List<Order>();
        List<Services> services = new List<Services>();
        List<ServiceStatus> servicesStatus;
        List<Biomaterial> biomaterials = new List<Biomaterial>();
        Order order = new Order();
        Users Users = new Users();

        GetAnalizator getAnalizator = new GetAnalizator();

        public WorkAnaliz(Users users)
        {
            InitializeComponent();
            Users = users;
            var an = db.OrderList.ToList();
            Analiz.ItemsSource = an;
            Analiz.DisplayMemberPath = "Код_услуг";
            var patient = db.Patient.ToList();
            for (int i = 0; i < patient.Count; i++)
            {
                Zakaz.Items.Add(patient[i].Name + " " + patient[i].Surname + " " + patient[i].Patronymic);
            }
            var service = db.Services.ToList();
            for (int i = 0; i < service.Count; i++)
            {

                Zakaz.Items.Add(service[i].Name);
            }
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

        /// <summary>


        

        private int GetHours()
        {
            return Convert.ToInt32(DateTime.Now.ToString().Substring((DateTime.Now.ToString().Length - 8), 2));
        }

        private void Poluch_Click(object sender, RoutedEventArgs e)
        {
            GetAnalizator getAnalizators = new GetAnalizator();
            var httpWebRequest = (HttpWebRequest)WebRequest.Create($"http://localhost:5000/api/analyzer/Biorad");
            httpWebRequest.ContentType = "application/json";
            httpWebRequest.Method = "GET";
            try
            {
                var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse(); // отправдкем запрос на аналиватор.

                if (httpResponse.StatusCode == HttpStatusCode.OK)
                {
                    using (Stream stream = httpResponse.GetResponseStream())
                    {
                        StreamReader reader = new StreamReader(stream); // Спрашиваем полученные данныю.
                        string json = reader.ReadToEnd(); // Записываем прочитанные данные в переменную.
                        JavaScriptSerializer serializer = new JavaScriptSerializer(); // переменная для перевода из JSON.
                        getAnalizators = serializer.Deserialize<GetAnalizator>(json); // Записываем розультат.
                        MessageBox.Show($"{getAnalizators.service[0].result}");

                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());


            }
        }

        private void BtnExt_Click(object sender, RoutedEventArgs e)
        {
            Window mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }

        private void Otpravka_Click(object sender, RoutedEventArgs e)
        {
            Service services1 = new Service();
            services1.serviceCode = 619;
            List<Service> services = new List<Service>();
            services.Add(services1);
            string patient = "1";

            var httpWebRequest = (HttpWebRequest)WebRequest.Create($"http://localhost:5000/api/analyzer/Biorad");
            httpWebRequest.ContentType = "application/json";
            httpWebRequest.Method = "POST";


            using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
            {
                string json = new JavaScriptSerializer().Serialize(new
                {
                    patient,
                    services
                });
                streamWriter.Write(json);
            }

            HttpWebResponse httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();

            if (httpResponse.StatusCode == HttpStatusCode.OK)
                MessageBox.Show("Услуги успешно отправленны!");
            else
                MessageBox.Show("Ошибка отправки!");

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
