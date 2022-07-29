using System;
using System.Diagnostics;
using System.Windows;
public class BasicProcess
{
    public static string ProjectDir = System.AppDomain.CurrentDomain.BaseDirectory.ToString();
    public static void Main()
    {
        gitTest();      
    }
    
    /// <summary>
    /// 除了git拉取test之外的所有操作（都是需要传递参数的）在这里集中调用
    /// </summary>
    public static void testOperate()
    {
        GetILCatalogue("2020.3.33");
        Local_il2cpp(@"E:\unity\2020.3.33f1c2\Editor\Data\il2cpp");
        BuildTest(@"E:\unity\2020.3.33f1c2\Editor\Unity.exe", @"F:\hyclr\batTest\ProTest\ProTest\bin\Debug\net6.0\hybridclr_test");
        ShowPlayerLog();
    }
    /// <summary>
    /// 从git上拉取test项目
    /// </summary>
    /// <param name="gitBranch"></param>
    public static void gitTest()
    {       
        string originDir = $"{ProjectDir}";        
        Process p = new Process();
        p.StartInfo.WorkingDirectory = originDir;
        p.StartInfo.FileName = $"{originDir}/gitTest.bat";
        p.StartInfo.UseShellExecute = false;
        p.StartInfo.CreateNoWindow = false;
        p.Start();
        p.WaitForExit();
        copyBash();
    }

    /// <summary>
    /// 将bash文件复制到hybridclrdata文件夹
    /// </summary>
    public static void copyBash()
    {
        string originDir = $"{ProjectDir}/BasicBash";
        string targetDir = $"{ProjectDir}/hybridclr_test/HybridCLRData";
        Process p = new Process();
        p.StartInfo.WorkingDirectory = originDir;
        p.StartInfo.FileName = $"{originDir}/copyBash.bat";
        p.StartInfo.Arguments = targetDir;
        p.StartInfo.UseShellExecute = false;
        p.StartInfo.CreateNoWindow = false;
        p.Start();
        p.WaitForExit();
        testOperate();
    }

    /// <summary>
    /// 从git上准备目录_repo和_plus目录
    /// </summary>
    /// <param name="gitBranch">获取git上的分支</param>
    public static void GetILCatalogue(string gitBranch)
    {
        string targetDir = $"{ProjectDir}/hybridclr_test/HybridCLRData";
        Process p = new Process();
        p.StartInfo.WorkingDirectory = targetDir;
        p.StartInfo.FileName = $"{targetDir}/GetILCatalogue.bat";
        p.StartInfo.Arguments = gitBranch;
        p.StartInfo.UseShellExecute = false;
        p.StartInfo.CreateNoWindow = false;
        p.Start();
        p.WaitForExit();
    }

    /// <summary>
    /// 当前的local_il2cpp路径
    /// </summary>
    /// <param name="localPath">2020.3.33的unity安装目录</param>
    public static void Local_il2cpp(string localPath)
    {
        string targetDir = $"{ProjectDir}/hybridclr_test/HybridCLRData";
        Process p = new Process();
        p.StartInfo.WorkingDirectory = targetDir;
        p.StartInfo.FileName = $"{targetDir}/Libil2cpp.bat";
        p.StartInfo.Arguments = localPath;
        p.StartInfo.UseShellExecute = false;
        p.StartInfo.CreateNoWindow = false;
        p.Start();
        p.WaitForExit();
    }

    /// <summary>
    /// 打包win
    /// </summary>
    /// <param name="unityPath">unty路径</param>
    /// <param name="projectPath">project路径</param>
    public static void BuildTest(string unityPath,string projectPath)
    {
        string targetDir = $"{ProjectDir}/hybridclr_test/HybridCLRData";
        Process p = new Process();
        p.StartInfo.WorkingDirectory = targetDir;
        p.StartInfo.FileName = $"{targetDir}/BuildWin.bat";
        p.StartInfo.Arguments = string.Format("{0} {1}", unityPath, projectPath);
        p.StartInfo.UseShellExecute = false;
        p.StartInfo.CreateNoWindow = false;
        p.Start();
        p.WaitForExit();
    }

    /// <summary>
    /// 输出两个日志
    /// </summary>
    public static void ShowPlayerLog()
    {
        string targetDir = $"{ProjectDir}/hybridclr_test/HybridCLRData";
        Process p = new Process();
        p.StartInfo.WorkingDirectory = targetDir;
        p.StartInfo.FileName = $"{targetDir}/ShowPlayerLog.bat";
        p.StartInfo.UseShellExecute = false;
        p.StartInfo.CreateNoWindow = false;
        p.Start();
        p.WaitForExit();
    }
}
