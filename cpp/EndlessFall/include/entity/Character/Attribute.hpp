#ifndef EF_ATTRIBUTE_H
#define EF_ATTRIBUTE_H

class Attribute {
enum class AttributeName {
    Strength,
    Constitution
};

private:
    const static std::unordered_map<AttributeName, char*> attributeNameStringMap;
public:
    Attribute(AttributeName, int potency);
    AttributeName name;
    int potency;

    char* getStringName();
};
#endif