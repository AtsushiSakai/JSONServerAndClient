//
// Json http server in C++
//
// Author: Atsushi Sakai
//

#include <iostream>
#include <cstdlib>
#include "../cpp-httplib/httplib.h"
#include "../json/single_include/nlohmann/json.hpp"

using namespace std;
using json = nlohmann::json;

string get_server_ip(){
    string SERVER_IP="localhost";
    char* env_SERVER_IP = getenv("SERVER_IP");
    if (env_SERVER_IP != NULL){
        SERVER_IP=string(env_SERVER_IP);
    }

    return SERVER_IP;
}


int main(void){
  	cout<<"c++ Json server start !!"<<endl;
	httplib::Server svr;

    svr.Post("/", [](const httplib::Request& req, httplib::Response& res) {
		cout<<"request"<<endl;
		cout<<req.body<<endl;
		map<string, string> c_map { {"Name", "response_from_cpp_server"},
	   								{"Test", "test2"} };
		json j_map(c_map);

		res.set_content(j_map.dump(), "application/json");
    });

    string SERVER_IP = get_server_ip();
    cout<<"SERVER_IP:"<<SERVER_IP<<endl;

    svr.listen(SERVER_IP.c_str(), 8000);
}

