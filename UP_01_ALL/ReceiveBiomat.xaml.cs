using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.ConstrainedExecution;
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
    /// Логика взаимодействия для ReceiveBiomat.xaml
    /// </summary>
    public partial class ReceiveBiomat : Window
    {

       

        labPermEntities db = new labPermEntities();
        Users Users = new Users();

        Order orderbio = new Order();
        Biomaterial bioorder = new Biomaterial();

        public ReceiveBiomat(Users users)
        {
            InitializeComponent();
            Users = users;
            var patient = db.Patient.ToList();
            for (int i = 0; i < patient.Count; i++)
            {
                comboBoxPatient.Items.Add(patient[i].Name + " " + patient[i].Surname + " " + patient[i].Patronymic);
            }
            var service = db.Services.ToList();
            for (int i = 0; i < service.Count; i++)
            {
                comboBoxService.Items.Add(service[i].Name);
            }

            var bio = db.Biomaterial.ToList();
            for (int i = 0; i < bio.Count; i++)
            {
                comboBoxBiomat.Items.Add(bio[i].Name);
            }
        }

        private void BtnAddPatient_Click(object sender, RoutedEventArgs e)
        {
            Window pacient = new Pacient(Users);
            pacient.Show();
            this.Close();
        }

        private void BtnBiomat_Click(object sender, RoutedEventArgs e)
        {
            var patient = db.Patient.FirstOrDefault(x => x.ID == comboBoxPatient.SelectedIndex + 1);
            if (patient != null)
            {
                Window Biomat = new Biomaterial(patient, Users);
                Biomat.Show();
                this.Close();
            }
            else
            {
                MessageBox.Show("Вы не выбрали пациента!");
            }
        }

        private void BtnCreateOrderList_Click(object sender, RoutedEventArgs e)
        {
            List<Services> services = new List<Services>();
            Order order = db.Order.OrderByDescending(b => b.ID).FirstOrDefault();

            if (textBoxShtrihCode.Text != "" && comboBoxPatient.Text != "" && services.Count != 0)
            {
                Order ordr = new Order
                {
                    DateOfCreation = DateTime.Today,
                    ID_OrderStatus = 3,
                    ID_Patient = comboBoxPatient.SelectedIndex + 1,
                    ID_Biomaterial = bioorder.ID
                };
                orderbio = order;
                db.Order.Add(order);
                db.SaveChanges();
            }

            MessageBox.Show("Заказ добавлен!");
        }

        private void BrnShtrihCode_Click(object sender, RoutedEventArgs e)
        {
            System.Drawing.Image image = null;
            BarcodeLib.Barcode b = new BarcodeLib.Barcode();
            b.BackColor = System.Drawing.Color.White;
            b.ForeColor = System.Drawing.Color.Black;
            b.IncludeLabel = true;
            b.Alignment = BarcodeLib.AlignmentPositions.CENTER;
            b.LabelPosition = BarcodeLib.LabelPositions.BOTTOMCENTER;
            b.ImageFormat = System.Drawing.Imaging.ImageFormat.Png;
            System.Drawing.Font font = new System.Drawing.Font("verdana", 10f);
            b.LabelFont = font;
            b.Height = 100;
            b.Width = 200;
            image = b.Encode(BarcodeLib.TYPE.CODE128C, bioorder.ID);
            image.Save($@"C:\tmp\barcode{bioorder.ID}.png");
            MessageBox.Show("Штрих-код был добавлен!");
        }

    }

}
