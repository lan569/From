using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace From.LMX
{
    public partial class ExitFrom : Form
    {
        public ExitFrom()
        {
            InitializeComponent();
        }

        private void ExitFrom_FormClosed(object sender, FormClosedEventArgs e)
        {
            DialogResult sr = MessageBox.Show("确定退出程序？","温馨提示",MessageBoxButtons.YesNo,MessageBoxIcon.Question);
            if (sr==DialogResult.Yes)
            {
                Application.Exit();
            }
        }
    }
}
