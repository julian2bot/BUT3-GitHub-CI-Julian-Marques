FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.sln ./
COPY src/. ./src/
RUN dotnet restore
RUN dotnet build -c Release 
RUN cd /app/src/Data.Api && dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app/src/Data.Api/out .
ENTRYPOINT ["dotnet", "Data.Api.dll"]
