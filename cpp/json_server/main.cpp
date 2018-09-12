//
// Json http server in C++
//
// Author: Atsushi Sakai
//

#include <iostream>
#include "../cpp-httplib/httplib.h"
#include "../json/single_include/nlohmann/json.hpp"

using namespace std;
using json = nlohmann::json;

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

    svr.listen("localhost", 8000);
}

