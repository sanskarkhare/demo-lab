const Demo=artifacts.require('Demo');
var BigNumber = require('big-number');

contract('Demo',(accounts) => {

    it('Should deploy smart contract properply',async () => {
         const demo=await Demo.deployed();
         assert(demo.address !== '');
         const manager_add= await demo.owner();
         const deployer_add=accounts[0];
         assert.equal(manager_add,deployer_add,"manager is not deployer");
         
         


         //const owner=await demo.address(this);
         //const ownerBalance= await demo.balanceOf(owner.address);
         //assert(ownerBalance==balanceOf(owner.address));
        // const owner=await demo.getOwner();
         //assert.equal(owner,accounts[0],'owner should be acc0');
    });
   
     it('Should return balance of the owner', async () =>{
        const demo=await Demo.deployed();
         const manager_add= await demo.owner();

    const ownerBal=await demo.balanceOf();
        assert.isNotNull(ownerBal,"wrong balance");
        

     });

     it('should transfer ether', async() => {
        
        const demo=await Demo.deployed();
        const addr=accounts[1];
        const manager_add= await demo.owner();
        const value=await demo.send(addr);
        assert.isAtLeast(BigNumber(value),1);
        assert(addr.transfer(value));
     });
    
});
