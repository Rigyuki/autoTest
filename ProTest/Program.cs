using System;
using System.Diagnostics;
using System.Windows;

public class BasicProcess
{
    public static void Main()
    {
        gitTest();      
        copyBash();
        GetILCatalogue("2020.3.33");
        Local_il2cpp(@"E:\unity\2020.3.33f1c2\Editor\Data\il2cpp");
        BuildTest(@"E:\unity\2020.3.33f1c2\Editor\Unity.exe", @"F:\hyclr\batTest\ProTest\ProTest\bin\Debug\net6.0\hybridclr_test");
        ShowPlayerLog();
    }
    /// <summary>
    /// 冗余代码封装
    /// </summary>
    public static string ProjectDir = System.AppDomain.CurrentDomain.BaseDirectory.ToString();
    public static string targetDir = $"{ProjectDir}/hybridclr_test/HybridCLRData";
    public static void bashProcess(ProcessStartInfo psi)
    {
        psi.UseShellExecute = true;
        psi.CreateNoWindow = false;
    }
    /// <summary>
    /// 除了git拉取test之外的所有操作（都是需要传递参数的）在这里集中调用
    /// </summary>
    public static void testOperate()
    {
        BuildTest(@"E:\unity\2020.3.33f1c2\Editor\Unity.exe", @"F:\hyclr\batTest\ProTest\ProTest\bin\Debug\net6.0\hybridclr_test");
        ShowPlayerLog();
    }

    /// <summary>
    /// 从git上拉取test项目
    /// </summary>
    public static void gitTest()
    {       
        ProcessStartInfo startInfo = new ProcessStartInfo();
        startInfo.FileName = $"{ProjectDir}/gitTest.sh";
        bashProcess(startInfo);
        Process pro=Process.Start(startInfo);
        pro.WaitForExit();
    }

    /// <summary>
    /// 将bash文件复制到hybridclrdata文件夹
    /// </summary>
    public static void copyBash()
    {
        ProcessStartInfo startInfo = new ProcessStartInfo();
        //string targetDir = $"{ProjectDir}/hybridclr_test/HybridCLRData";
        startInfo.FileName = $"{ProjectDir}/BasicBash/copyBash.sh";
        startInfo.Arguments = targetDir;
        bashProcess(startInfo);
        //Process.Start(startInfo);
        Process pro = Process.Start(startInfo);
        pro.WaitForExit();
    }

    /// <summary>
    /// 从git上准备目录_repo和_plus目录
    /// </summary>
    /// <param name="gitBranch">获取git上的分支</param>
    public static void GetILCatalogue(string branch)
    {
        ProcessStartInfo startInfo=new ProcessStartInfo();
        startInfo.WorkingDirectory = targetDir;
        startInfo.FileName = $"{targetDir}/GetILCatalogue.sh";
        startInfo.Arguments = branch;
        bashProcess(startInfo);
        Process pro = Process.Start(startInfo);
        pro.WaitForExit();
    }

    /// <summary>
    /// 当前的local_il2cpp路径
    /// </summary>
    /// <param name="localPath">2020.3.33的unity安装目录</param>
    public static void Local_il2cpp(string localPath)
    {
        ProcessStartInfo startInfo = new ProcessStartInfo();
        startInfo.WorkingDirectory = targetDir;
        startInfo.FileName = $"{targetDir}/Libil2cpp.sh";
        startInfo.Arguments = localPath;
        bashProcess(startInfo);
        Process pro = Process.Start(startInfo);
        pro.WaitForExit();
    }

    /// <summary>
    /// 打包win
    /// </summary>
    /// <param name="unityPath">unty路径</param>
    /// <param name="projectPath">project路径</param>
    public static void BuildTest(string unityPath,string projectPath)
    {
        ProcessStartInfo startInfo = new ProcessStartInfo();
        startInfo.WorkingDirectory = targetDir;
        startInfo.FileName = $"{targetDir}/BuildWin.sh";
        startInfo.Arguments = string.Format("{0} {1}", unityPath, projectPath);
        bashProcess(startInfo);
        //Process.Start(startInfo);
        Process pro = Process.Start(startInfo);
        pro.WaitForExit();
    }

    /// <summary>
    /// 输出两个日志
    /// </summary>
    public static void ShowPlayerLog()
    {
        ProcessStartInfo startInfo = new ProcessStartInfo();
        startInfo.WorkingDirectory = targetDir;
        startInfo.FileName = $"{targetDir}/ShowPlayerLog.sh";     
        bashProcess(startInfo);
        Process pro = Process.Start(startInfo);
        pro.WaitForExit();
    }
}
