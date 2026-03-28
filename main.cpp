#include <iostream>
#include "PlajaLogger.h"
#include "Model/User/User.h"

int main()
{
    PlajaLogger::Info("Informacni")
    .AppendValue("id", 25)
    .AppendValue("name", "Martin")
    .Write();

    PlajaLogger::Debug("Debugovaci", '"')
    .AppendValue("id", 25)
    .AppendValue("name", "Martin")
    .Write();

    PlajaLogger::Warning("Warningovaci", '\'')
    .AppendValue("id", 25)
    .AppendValue("name", "Martin")
    .Write();

    PlajaLogger::Error("Errorovaci", '\\')
    .AppendValue("id", 25)
    .AppendValue("name", "Martin", '"')
    .Write();

    return 0;
}