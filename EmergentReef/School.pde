
class School
{
  
   ArrayList<Fish> fishes=new ArrayList<Fish>();
   void swim()
   {
     for(Fish f:fishes)
     {
       f.swim(fishes);
     }
   }
   void addFish(Fish f)
   {
     fishes.add(f);
   }
}