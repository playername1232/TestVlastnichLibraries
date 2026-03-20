#ifndef TEST_VLASTNICH_LIB_USER_H
#define TEST_VLASTNICH_LIB_USER_H
#include <string>


class User
{
private:
    std::string name;
    std::string surname;
    unsigned int age;

public:
    User(std::string name, std::string surname, unsigned int age);

    [[nodiscard]] std::string getName() const;
    [[nodiscard]] std::string getSurname() const;
    [[nodiscard]] unsigned int getAge() const;
};


#endif