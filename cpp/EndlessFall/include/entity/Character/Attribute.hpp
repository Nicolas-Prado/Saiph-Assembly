#ifndef EF_ATTRIBUTE_H
#define EF_ATTRIBUTE_H

#include <string>
#include <unordered_map>

class Attribute {
enum class AttributeName {
    Strength,
    Constitution
};

private:
    const static std::unordered_map<AttributeName, std::string> attributeNameStringMap;
public:
    Attribute(AttributeName, int potency);
    AttributeName name;
    int potency;

    std::string getStringName();
};
#endif