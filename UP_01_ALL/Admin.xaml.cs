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
    /// Логика взаимодействия для Admin.xaml
    /// </summary>
    public partial class Admin : Window
    {
        labPermEntities db = new labPermEntities();
        Users Users = new Users();
        public Admin(Users users)
        {
            InitializeComponent();
            Users = users;
            var type = db.Positions.FirstOrDefault(x => x.ID == users.Type);
            FIOLabel.Content = users.Name;
        }

        private void BtnExit_Click(object sender, RoutedEventArgs e)
        {
            Window mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }

        private void BtnHistory_Click(object sender, RoutedEventArgs e)
        {
            Window His = new History(Users);
            His.Show();
            this.Close();
        }

        private void BtnRegistr_Click(object sender, RoutedEventArgs e)
        {
            Window createUser = new Registracia(Users);
            createUser.Show();
            this.Close();
        }
    }
}
