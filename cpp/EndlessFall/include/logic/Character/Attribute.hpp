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
    const static std::unordered_map<Attribute, std::string> attributeNameStringMap;
    AttributeName name;
public:
    int potency;

    void setName(AttributeName);
    std::string getName();
};
#endif