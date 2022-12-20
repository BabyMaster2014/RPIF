FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /source

COPY . .
RUN dotnet publish -c Release -o /build --self-contained false

FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /build .

ENTRYPOINT ["dotnet"]