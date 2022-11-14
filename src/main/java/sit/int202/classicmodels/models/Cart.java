package sit.int202.classicmodels.models;

import java.util.*;

public class Cart {
    Map<String, LineItems> itemsMap = new HashMap<>();
    public void add(LineItems item){
        String key =item.getProduct().getProductCode();
        LineItems existItem = itemsMap.get(key);
        if(existItem!=null){
            existItem.setAmount(existItem.getAmount()+item.getAmount());
        }else{
            itemsMap.put(key, item);
        }
    }
    public void clear(){
        itemsMap.clear();
    }

    public List<LineItems> getItems(){
        Collection<LineItems> lineItems = itemsMap.values();
        return new ArrayList(lineItems);
    }

    public Double getTotalPrice(){
        Double sumTotalPrice = 0.00;
        for (LineItems items : itemsMap.values()){
            sumTotalPrice += items.getTotalPrice();
        }
        return sumTotalPrice;
    }

}
