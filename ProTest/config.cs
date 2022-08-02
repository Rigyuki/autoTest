/*< ItemGroup Condition = "$(TargetFramework) == 'netcoreapp2.1'" >
 
     < PackageReference Include = "Microsoft.Windows.Compatibility" Version = "2.1.0-preview.19073.11" />
    </ ItemGroup >
    < ItemGroup Condition = "$(TargetFramework) == 'net472'" >
     
         < Reference Include = "System.Management" />
      </ ItemGroup >
*/