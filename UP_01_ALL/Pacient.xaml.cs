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
    /// Логика взаимодействия для Pacient.xaml
    /// </summary>
    public partial class Pacient : Window
    {
        labPermEntities db = new labPermEntities();
        Users Users = new Users();

        public Pacient(Users users)
        {
            InitializeComponent();
            Users = users;
            var tupePolicy = db.PolicyType.ToList();
            var company = db.InsuranceCompany.ToList();
            for (int i = 0; i < tupePolicy.Count; i++)
            {
                comboBoxTypePolicy.Items.Add(tupePolicy[i].Name);
            }
            for (int i = 0; i < company.Count; i++)
            {
                comboBoxInsuranceCompany.Items.Add(company[i].Name);
            }
        }

        private void textBoxPhone_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            int maxLength = 11;
            TextBox textBox = (TextBox)sender;
            string text = textBox.Text;
            if (text.Length > maxLength)
            {
                e.Handled = true;
            }

            foreach (char c in e.Text)
            {
                if (!char.IsDigit(c))
                {
                    e.Handled |= true;
                    return;
                }
            }
        }

        private void textBoxPolis_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            int maxLength = 16;
            TextBox textBox = (TextBox)sender;
            string text = textBox.Text;
            if (text.Length > maxLength)
            {
                e.Handled = true;
            }

            foreach (char c in e.Text)
            {
                if (!char.IsDigit(c))
                {
                    e.Handled |= true;
                    return;
                }
            }
        }

        private void textBoxName_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (char.IsDigit(e.Text, 0))
            {
                e.Handled |= true;
            }
            if (e.Text == "_" || e.Text == "," || e.Text == "?" || e.Text == "/" || e.Text == "|" || e.Text == "+" || e.Text == "=" || e.Text == "*" || e.Text == ".")
            { e.Handled |= true; }
        }

        private void textBoxSurname_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (char.IsDigit(e.Text, 0))
            {
                e.Handled |= true;
            }
            if (e.Text == "_" || e.Text == "," || e.Text == "?" || e.Text == "/" || e.Text == "|" || e.Text == "+" || e.Text == "=" || e.Text == "*" || e.Text == ".")
            { e.Handled |= true; }
        }

        private void textBoxOTchestvo_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (char.IsDigit(e.Text, 0))
            {
                e.Handled |= true;
            }
            if (e.Text == "_" || e.Text == "," || e.Text == "?" || e.Text == "/" || e.Text == "|" || e.Text == "+" || e.Text == "=" || e.Text == "*" || e.Text == ".")
            { e.Handled |= true; }
        }

        private void DatePicker1_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            DatePicker datePicker = sender as DatePicker;

            if (datePicker.SelectedDate > DateTime.Today)
            {
                MessageBox.Show("Выберите корректную дату!");
                datePicker.SelectedDate = DateTime.Today;
            }
        }

        private void textBoxSeries_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            int maxLength = 4;
            TextBox textBox = (TextBox)sender;
            string text = textBox.Text;
            if (text.Length > maxLength)
            {
                e.Handled = true;
            }

            foreach (char c in e.Text)
            {
                if (!char.IsDigit(c))
                {
                    e.Handled |= true;
                    return;
                }
            }
        }

        private void textBoxNumber_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            int maxLength = 6;
            TextBox textBox = (TextBox)sender;
            string text = textBox.Text;
            if (text.Length > maxLength)
            {
                e.Handled = true;
            }

            foreach (char c in e.Text)
            {
                if (!char.IsDigit(c))
                {
                    e.Handled |= true;
                    return;
                }
            }
        }

        private void BtnCreateUser_Click(object sender, RoutedEventArgs e)
        {
            if (textBoxName.Text == "" || textBoxSurname.Text == "" || textBoxOTchestvo.Text == "")
            {
                MessageBox.Show("Введите ФИО пациента");
            }
            else if (textBoxNumber.Text == "" || textBoxSeries.Text == "")
            {
                MessageBox.Show("Введите паспортные данные пациента");
            }
            else if (DatePicker1.SelectedDate == null)
            {
                MessageBox.Show("Введите дату рождения пациента");
            }
            else if (comboBoxTypePolicy.SelectedItem == null || comboBoxInsuranceCompany.SelectedItem == null || textBoxPolis.Text == "")
            {
                MessageBox.Show("Введите данные о полисе пациента");
            }
            else if (textBoxPhone.Text == "" || textBoxEmail.Text == "")
            {
                MessageBox.Show("Введите контактные данные пациента");
            }
            else
            {
                if (textBoxNumber.Text.Length < 6 || textBoxSeries.Text.Length < 4)
                {
                    MessageBox.Show("Паспортные данные должны состоять из серии(4 цифры) и номера(6)");
                }
                else if (textBoxPolis.Text.Length < 16)
                {
                    MessageBox.Show("Полис должен содержать 16 символов");
                }
                else if (textBoxPhone.Text.Length < 11)
                {
                    MessageBox.Show("Номер должен состоять из 11 цифр");
                }
                else
                {
                    var patient = new Patient
                    {
                        Name = textBoxName.Text,
                        Surname = textBoxSurname.Text,
                        Patronymic = textBoxOTchestvo.Text,
                        Birthday = DatePicker1.SelectedDate.Value,
                        Series = textBoxSeries.Text,
                        Number = textBoxNumber.Text.ToString(),
                        Phone = textBoxPhone.Text,
                        Policy = textBoxPolis.Text,
                        TypePolicy = comboBoxTypePolicy.SelectedIndex + 1,
                        InsuranceCompany = comboBoxInsuranceCompany.SelectedIndex + 1,
                        Email = textBoxEmail.Text
                    };
                    db.Patient.Add(patient);
                    db.SaveChanges();
                    MessageBox.Show("Пациент успешно добавлен");
                    ReceiveBiomat RecBiomat = new ReceiveBiomat(Users);
                    RecBiomat.Show();
                    this.Close();
                }
            }
        }

        private void BtnExit_Click(object sender, RoutedEventArgs e)
        {
            ReceiveBiomat receiveBiomat = new ReceiveBiomat(Users);
            receiveBiomat.Show();
            Close();
        }
    }
}
