#include "Attribute.hpp"

const std::unordered_map<Attribute::AttributeName, std::string> Attribute::attributeNameStringMap = {
    { AttributeName::Strength, "Strength" },
    { AttributeName::Constitution, "Constitution" }
};

Attribute::Attribute(AttributeName name, int potency):
    name(name),
    potency(potency) {};

std::string Attribute::getStringName() {
    const std::string name = Attribute::attributeNameStringMap.at(this->name);

    return name;
}