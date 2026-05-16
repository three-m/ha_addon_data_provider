FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build

WORKDIR /src

COPY app/threem.HA.Addon.DataProvider/ .

RUN dotnet publish -c Release -o /out

FROM mcr.microsoft.com/dotnet/aspnet:10.0

WORKDIR /app/threem.HA.Addon.DataProvider

COPY --from=build /out .

EXPOSE 8080

ENTRYPOINT ["dotnet", "threem.HA.Addon.DataProvider.dll"]