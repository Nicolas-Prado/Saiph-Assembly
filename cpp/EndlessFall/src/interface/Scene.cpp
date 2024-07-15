#include "Scene.hpp"

Scene::Scene(ActionsMapType actionsMap, RequestersType requesters):   
    actionsMap(std::move(actionsMap)), 
    requesters(std::move(requesters)) {}

RequestersType Scene::getActionRequesters() {
    return this->requesters;
}

ActionResponse Scene::executeAction(ActionRequest actionRequest) {
    std::string functionIdentifier = actionRequest.name;
    ActionsMapType::iterator searchAction = this->actionsMap.find(functionIdentifier);
    if(searchAction != this->actionsMap.end()) {
        //ActionResponse (*action)(ActionRequest) = searchAction->second; works too
        ActionType action = searchAction->second;

        ActionResponse response = action(actionRequest);

        return response;
    } else {
        ActionResponse notFoundActionResponse({"Action not found."});

        return notFoundActionResponse;
    }
}