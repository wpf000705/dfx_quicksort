import Array "mo:base/Array";
import Int "mo:base/Int";
actor {
    public func qsort(arr : [Int]) : async [Int] {
        let as : [var Int] = Array.thaw(arr);
        quicksort(as,0,as.size()-1);
        Array.freeze(as);
    };
    private func quicksort(as: [var Int],left: Nat,right: Nat): (){
    var temp:Int = as[left];   
    var p:Nat = left;
    var i:Nat = left;
    var j:Nat = right;
    while(i < j){   
        while(j >= p and as[j] >= temp and j > 0){
         j -= 1;
        };
        if(j >= p){
        as[p] := as[j];
        p:=j;
        };
        while(i <= p and as[i] <= temp){
         i += 1;
        };
        if(i <= p){
        as[p] := as[i];
        p:=i;
        };
    };
        as[p] := temp;
        if (p-left:Int > 1){
           quicksort(as,left,p-1);
        };
        if (right-p:Int > 1){
            quicksort(as,p+1,right);
        };
};
};
