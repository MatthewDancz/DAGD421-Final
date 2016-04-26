
class School
{
   public ArrayList<Fish> fishes=new ArrayList<Fish>();
   
   void swim()
   {
     for(Fish f:fishes)
     {
       if (f instanceof Fish)
       {
         f.swim(fishes);
       }
     }
   }
   
   void addFish(Fish f)
   {
     fishes.add(f);
   }
}