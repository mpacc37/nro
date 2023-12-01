#include <iostream>
#include <fstream>
#include <vector>
#include <sstream>
using namespace std;


int main() {

    std::string polinom = "poly.txt";
    std::string diff_poly = "diff_poly.txt";

    std::ofstream outputFile(diff_poly);
    std::ifstream indata;
    indata.open(polinom);

    int N = 0;
    indata >> N;

    std::vector<double> x;
    std::vector<double> f;

    for (int i = 0; i < N; i++) {

        double vrednost1, vrednost2, ID;

        char colon;
        indata >> ID >> colon >> vrednost1 >> vrednost2;
        x.push_back(vrednost1);
        f.push_back(vrednost2);
    }
    indata.close();

    double h = abs(x[1] - x[2]);
    double naprej;

    naprej = (-3 * f[0] + 4 * f[1] - f[2]) / abs(x[2] - x[0]);
    std::vector<double> difo;
    difo.push_back(naprej);

    for (int i = 1; i < (N - 1); i++) {
        double sredina;
        sredina = (f[i + 1] - f[i - 1]) / (2 * h);

        difo.push_back(sredina); 
    }
    double nazaj;
    nazaj = (3 * f[102] - 4 * f[101] + f[100]) / (2 * abs(x[102] - x[101]));


    for (double value : difo) {
        outputFile << value << '\n';
    }
    outputFile.close();

    return 0;
}