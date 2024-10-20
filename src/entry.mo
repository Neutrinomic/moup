import MU_one_mem1 "./mo_dules/one/memory/v1";
import MU_one_mem2 "./mo_dules/one/memory/v2";
import MU_two_mem1 "./mo_dules/two/memory/v1";
import MU_one "./mo_dules/one";
import MU_two "./mo_dules/two";

import MU "./moup";

actor {

    
    stable let mem_one_1 : MU.MemShell<MU_one_mem1.Mem> = { var inner = null };

    stable let mem_one_2 : MU.MemShell<MU_one_mem2.Mem> = { var inner = do ? { MU_one_mem2.patch(mem_one_1.inner!) } };
    
    mem_one_1.inner := null;
        
    stable let mem_two_1 : MU.MemShell<MU_two_mem1.Mem> = { var inner = null };
        

    let mod_one = MU_one.Mod(mem_one_2);

    let mod_two = MU_two.Mod(mem_two_1);


    public func inc() : async Nat = async mod_one.inc();
}


