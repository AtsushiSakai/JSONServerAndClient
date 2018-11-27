//
// Json http client in C++
//
// Author: Atsushi Sakai
//

#include <iostream>
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
  	cout<<"c++ Json client start !!"<<endl;

	// Create request json
	map<string, string> c_map { {"Name", "request_from_cpp_client"},
	   							{"Test", "test"} };
	json j_map(c_map);
	string sjson = j_map.dump();
  	cout << "Request:" << endl;
  	cout << sjson << endl;

    string SERVER_IP = get_server_ip();

	httplib::Client cli(SERVER_IP.c_str(), 8000);
	auto res = cli.Post("/", sjson,  "application/json");

    if (res && res->status == 200) {
  		cout << "Response:" << endl;
		auto jres = json::parse(res->body);
		for (json::iterator it = jres.begin(); it != jres.end(); ++it) {
  			cout << it.key() << " : " << it.value() << endl;
		}
    }

}

