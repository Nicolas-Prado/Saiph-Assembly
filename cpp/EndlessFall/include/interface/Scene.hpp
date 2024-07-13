#ifndef EF_SCENE_H
#define EF_SCENE_H

#include <unordered_map>
#include <string>
#include <vector>

#include "ActionRequest.hpp"
#include "ActionResponse.hpp"

using ActionType = ActionResponse(*)(ActionRequest);
using ActionsMapType = std::unordered_map<std::string, ActionType>;
using RequestersType = std::vector<ActionRequest>;

class Scene {
private:
    ActionsMapType actionsMap;
    RequestersType requesters;
public:
    Scene(ActionsMapType, RequestersType);
    RequestersType getActionRequesters();
    ActionResponse executeAction(ActionRequest);
};
#endif