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
    /// Логика взаимодействия для History.xaml
    /// </summary>
    public partial class History : Window
    {
        labPermEntities db = new labPermEntities();
        Users users = new Users();
        public History(Users users)
        {
            InitializeComponent();
            this.users = users;
            var log = db.LoginHistory.Where(x => x.ID_User == x.Users.ID && x.ID_AttemptStatus == x.AttemptStatus.ID).Select(x => new
            {
                x.ID,
                x.ID_User,
                x.DateOfEntry,
                x.AttemptStatus.Name,
                x.Users.Login,
            }).ToList();
            HistoryList.ItemsSource = log;
            SortType.Items.Add("Дата");
            SortType.Items.Add("Логин");
        }
        private void ListLoad()
        {

            var userLogin = db.Users.ToList();
            var dateLogin = db.LoginHistory.Select(x => x.DateOfEntry).Distinct().ToList();
            if (SortType.SelectedItem.ToString() == "Логин")
            {
                for (int i = 0; i < userLogin.Count; i++)
                {
                    SortList.Items.Add(userLogin[i].Login);
                }
            }
            else if (SortType.SelectedItem.ToString() == "Дата")
            {
                foreach (var date in dateLogin)
                {
                    SortList.Items.Add(date);
                }
            }
        }
        private void Sort()
        {
            if (SortType.SelectedItem.ToString() == "Логин")
            {
                var sort = db.LoginHistory.Where(x => x.ID_User == x.Users.ID && x.ID_AttemptStatus == x.AttemptStatus.ID && x.Users.Login == SortList.SelectedItem.ToString()).Select(x => new
                {
                    x.ID,
                    x.ID_User,
                    x.DateOfEntry,
                    x.AttemptStatus.Name,
                    x.Users.Login,
                }).ToList();
                HistoryList.ItemsSource = sort;
            }
            else if (SortType.SelectedItem.ToString() == "Дата")
            {
                DateTime date = DateTime.Parse(SortList.SelectedItem.ToString());
                var sort = db.LoginHistory.Where(x => x.ID_User == x.Users.ID && x.ID_AttemptStatus == x.AttemptStatus.ID && x.DateOfEntry == date).Select(x => new
                {
                    x.ID,
                    x.ID_User,
                    x.DateOfEntry,
                    x.AttemptStatus.Name,
                    x.Users.Login,

                }).ToList();
                HistoryList.ItemsSource = sort;
            }
        }

        private void SortType_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SortList.Items.Clear();
            ListLoad();
        }

        private void BtnSort_Click(object sender, RoutedEventArgs e)
        {
            if (SortType.SelectedItem.ToString() == "")
            {
                MessageBox.Show("Выберите сортировать нужно по дате или логину!");
            }
            else
            {
                if (SortList.SelectedItem.ToString() == "")
                {
                    MessageBox.Show("Выберите определенные дату или логин!");
                }
                else
                {
                    Sort();
                }
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Window admin = new Admin(users);
            admin.Show();
            this.Close();
        }
    }
}
