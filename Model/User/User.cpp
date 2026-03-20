//
// Created by marti on 3/19/2026.
//

#include "User.h"

User::User(std::string name, std::string surname, unsigned int age) : name(std::move(name)), surname(std::move(surname)), age(age)
{}

std::string User::getName() const
{
    return name;
}

std::string User::getSurname() const
{
    return surname;
}

unsigned int User::getAge() const
{
    return age;
}

