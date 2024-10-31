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
    /// Логика взаимодействия для Pegistracia.xaml
    /// </summary>
    public partial class Registracia : Window
    {
        Users users = new Users();
        labPermEntities db = new labPermEntities();
        public Registracia(Users users)
        {
            InitializeComponent();
            this.users = users;
            var positions = db.Positions.ToList();
            for (int i = 0; i < positions.Count; i++)
            {
                comboBox1.Items.Add(positions[i].Name);
            }
        }

        private void BtnReg_Click(object sender, RoutedEventArgs e)
        {
            if (textBoxName.Text == "")
            {
                MessageBox.Show("Вы не ввели имя");
            }
            else if (textBoxFio.Text == "")
            {
                MessageBox.Show("Ввы не ввели фамилию");
            }
            else if (textBoxLogin.Text == "")
            {
                MessageBox.Show("Вы не ввели логин");
            }
            else if (textBoxPassword.Text == "")
            {
                MessageBox.Show("Вы не ввели пароль");
            }
            else if (textBoxPassword2.Text == "")
            {
                MessageBox.Show("Вы не подтвердили пароль");
            }
            else if (textBoxIp.Text == "" || textBoxIp.Text.Length > 15)
            {
                MessageBox.Show("Проверьте поле Ip");
            }
            else if (comboBox1.SelectedItem == null)
            {
                MessageBox.Show("Пожалуйста, выберите должность");
            }
            else
            {
                if (textBoxPassword.Text != textBoxPassword2.Text)
                {
                    MessageBox.Show("Пароли не совпадают");
                }
                else
                {
                    string AllName = textBoxName.Text + " " + textBoxFio.Text;
                    var user = new Users
                    {
                        Name = AllName,
                        Login = textBoxLogin.Text,
                        Password = textBoxPassword.Text,
                        Ip = textBoxIp.Text,
                        Type = comboBox1.SelectedIndex + 1
                    };
                    db.Users.Add(user);
                    db.SaveChanges();
                    MessageBox.Show("Пользователь успешно добавлен");
                    Window admin = new Admin(users);
                    admin.Show();
                    this.Close();
                }
            }
        }

        private void BtnExit_Click(object sender, RoutedEventArgs e)
        {
            Window mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }
    }
}
