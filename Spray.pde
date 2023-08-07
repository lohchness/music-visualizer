class Spray {
    ArrayList<Dot> dots;
    
    Spray() {
        dots= new ArrayList<Dot>();
    }
    
    void addDot(Dot dot) {
        dots.add(dot);
    }
    
    void removeDot(Dot dot) {
        dots.remove(dot);
    }
    
}
