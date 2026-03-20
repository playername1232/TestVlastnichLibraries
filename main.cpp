#include <iostream>
#include "windows_libs/plaja_logger/PlajaLogger.h"
#include "Model/User/User.h"

int main()
{
    std::string name = "Martin";

    User* user = new User(name, "Krepcik", 22);

    PlajaLogger::Debug("User created")
        .AppendValue("name", user->getName())
        .AppendValue("surname", user->getSurname())
        .AppendValue("age", user->getAge())
        .Write();

    PlajaLogger::Info("Program finished").Write();

    return 0;
}