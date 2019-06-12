using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace From
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            //加载页面事件  
            this.treeView1.ExpandAll();    //展开treeview所有节点
        }

        private void MainForm_FormClosed(object sender, FormClosedEventArgs e)
        {
            //结束进程
            DialogResult rs = MessageBox.Show("确定退出系统？","温馨提示",MessageBoxButtons.YesNo,MessageBoxIcon.Question);
            if (rs==DialogResult.Yes)
            {
                Application.Exit();
            }
        }
    }
}
