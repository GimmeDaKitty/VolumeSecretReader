using Microsoft.Extensions.Configuration;

// load the configuration file.
// The Microsoft.Extensions.Configuration.KeyPerFile library stores the configuration as follows:
//// the filename is the key
////  the file content is the value.

// To truly make the 'reloadOnChange' work you need to set env variable DOTNET_USE_POLLING_FILE_WATCHER to true
// in the docker/service deployment
var configurationRoot = new ConfigurationBuilder()
    .AddKeyPerFile(directoryPath: "/mnt/secrets-store/", optional: true, reloadOnChange:true)
    .Build();

while (true)
{
    var secretValue = configurationRoot["mySecret"] ?? "Secret not found";
    Console.WriteLine(secretValue);
    await Task.Delay(TimeSpan.FromSeconds(30));
}