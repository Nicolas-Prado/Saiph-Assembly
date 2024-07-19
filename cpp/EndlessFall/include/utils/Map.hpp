#ifndef EF_MAP_H
#define EF_MAP_H

template <typename Identifier, typename Pointed>
class Map {
private:
    struct MapElement {
        Identifier id;
        Pointed value;
    }

public:
    Map(MapElement*);
};

#endif