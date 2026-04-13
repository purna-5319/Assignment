# Dictionary mapping
rates={
    'Economy':10,
    'Premium':18,
    'SUV':25
}

# Function defenition
def calculate_fare(km,type,hour):
    # Error handling
    if type not in rates: 
        print("Service Not Available");
        return None
    
    rate=rates[type]
    price=km*rate
    surge = False
    # Surge logic
    if hour>=17 and hour<=20:
        price=price*1.5
        surge=True
    return price,surge
    
km=int(input("Enter the Number of Kilometers: "))
type=input("Enter the type of the vehicle(Economy/Premium/SUV): ")
hour=int(input("Enter the Hour of Day(0-23): "))

res=calculate_fare(km,type,hour)
if res:
    price,surge=res

    print("----- CityCab Ride Estimate Price Receipt -----")
    print("Distance:",km, "km")
    print("Vehicle:",type)
    print("Hour:",hour)
    if surge:
        print("Surge: Yes")
        print("Surge has been applied, the fare increased by 1.5X due to peak hours")
    else:
        print("Surge: No")
    print("Total Fare:",price,"/-")
    print("-----HAPPY JOURNEY-----")



        



    