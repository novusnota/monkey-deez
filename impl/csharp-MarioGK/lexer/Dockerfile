﻿FROM mcr.microsoft.com/dotnet/sdk:7.0 AS publish
WORKDIR /src
COPY . .
RUN dotnet restore
RUN dotnet publish "lexer.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/runtime:7.0 AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "lexer.dll"]