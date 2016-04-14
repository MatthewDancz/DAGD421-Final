
class School
{
  
   public ArrayList<Fish> fishes=new ArrayList<Fish>();
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
   
   void addCoral(ReefGrowth c)
   {
     fishes.add(c);
   }
}