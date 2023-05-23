FROM mcr.microsoft.com/dotnet/runtime:6.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["VolumeSecretReader/VolumeSecretReader.csproj", "VolumeSecretReader/"]
RUN dotnet restore "VolumeSecretReader/VolumeSecretReader.csproj"
COPY . .
WORKDIR "/src/VolumeSecretReader"
RUN dotnet build "VolumeSecretReader.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "VolumeSecretReader.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "VolumeSecretReader.dll"]
