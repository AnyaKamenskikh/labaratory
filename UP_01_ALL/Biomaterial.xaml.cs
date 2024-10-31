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

namespace UP_01_ALL
{
    /// <summary>
    /// Логика взаимодействия для Biomaterial.xaml
    /// </summary>
    public partial class Biomaterial : Window
    {
        Patient patient = new Patient();
        Users Users = new Users();
        labPermEntities db = new labPermEntities();

        public Biomaterial(Patient patient, Users users)
        {
            InitializeComponent();
            this.patient = patient;
            textBox1.Text = patient.Name + " " + patient.Surname + " " + patient.Patronymic;
            Users = users;
            textBox2.Text = users.Name;
            var bio = db.Biomaterial.ToList();
            for (int i = 0; i < bio.Count; i++)
            {
                comboBoxBiomat.Items.Add(bio[i].Name);
            }
        }

        private void BtnExit_Click(object sender, RoutedEventArgs e)
        {
            Window recBio = new ReceiveBiomat(Users);
            recBio.Show();
            this.Close();
        }

        private void BtnReceiveBiomat_Click(object sender, RoutedEventArgs e)
        {
            if (comboBoxBiomat.SelectedItem != null)
            {
                var id = db.Biomaterial.FirstOrDefault(x => x.Name == comboBoxBiomat.SelectedItem.ToString());
                var bioPatient = new Order
                {
                    DateOfCreation = DateTime.Now.Date,
                    ID_OrderStatus = 2,
                    ID_User = Users.ID,
                    ID_Patient = patient.ID,
                    ID_Biomaterial = id.ID
                };
                db.Order.Add(bioPatient);
                db.SaveChanges();
                MessageBox.Show("Все прошло успешно!");
                Window takeBio = new ReceiveBiomat(Users);
                takeBio.Show();
                this.Close();
            }
        }
    }
}
