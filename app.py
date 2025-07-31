from supabase import create_client, Client
from tabulate import tabulate
from datetime import date
import random
import string

url: str = "https://vtrmdayqaxwqnabfavmz.supabase.co"
key: str = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ0cm1kYXlxYXh3cW5hYmZhdm16Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTM2NzU3ODcsImV4cCI6MjA2OTI1MTc4N30.a4cyRRYo3dDBfMZUTPmY_grySIB1X6nXs7mhh5TWwok"

supabase: Client = create_client(url, key)

def makePurchase():
	today = date.today()
	customer_name = input("Enter your name: ")

	total_purchase_amount = 0
	purchased_items = []
	customer_id = None

	customer_res = supabase.table("customer").select("customerid").eq("name", customer_name).execute()
	if not customer_res.data:
		print("Customer not found!")
		return
	customer_id = customer_res.data[0]["customerid"]
	print(customer_id)
	

	while True:
		product_id = int(input("Enter product ID (Cancel purchasing enter 0): "))
		if product_id == 0:
			break

		quantity = int(input("Enter quantity: "))
	
		product_res = supabase.table("product").select("price, stock").eq("productid", product_id).execute()
		if not product_res.data:
			print("Invalid product ID")
			continue

		price = float(product_res.data[0]["price"])
		total = price * quantity
		total_purchase_amount += total

		current_stock = product_res.data[0]["stock"]
		if quantity > current_stock:
			print("Not Enough Stock Available: {current_stock}")
			continue

		purchased_items.append(f"{product_id}:{quantity}")

		customer_res = supabase.table("customer").select("customerid").eq("name", customer_name).execute()
	
		customer_id = customer_res.data[0]["customerid"]

		new_stock = current_stock - quantity
		stock_res = supabase.table("product").update({"stock": new_stock}).eq("productid", product_id).execute()

		if not stock_res.data:
			print(f"Warning: Failed to update stock for product {product_id}")

	if not purchased_items:
		print("No items purchased")
		return
	
	first_product_id = int(purchased_items[0].split(":")[0])
	purchase_res = supabase.table("purchase").insert({"customerid": customer_id, "productid": first_product_id, "date": str(today), "total": total_purchase_amount}).execute()
	
	if not purchase_res.data:
		print(f"Error inserting purchase for product {product_id}: {purchase_res}")

	purchase_id = purchase_res.data[0]["purchaseid"]
	carrier = input("Enter carrier: ")
	tracking_number = generate_tracking_number()
	
	shipment_res = supabase.table("shipment").insert({"purchaseid": purchase_id, "shipdate": str(today), "carrier": carrier, "trackingnumber": tracking_number}).execute() 

	if not shipment_res.data:
		print("Error inserting shipment!")
		
	print("\nSuccessful purchase!")
	print(f"Your Total: ${total_purchase_amount:.2f}")

		
def generate_tracking_number():
	prefix = random.choice(["1Z", "T","DT", "FX", "TRK","94", "93", "92", "91", "EC","JD01", "JD14", "JJD","PKG", "ORD", "SHIP", "BOX"])
	middle = ''.join(random.choices(string.ascii_uppercase + string.digits, k=10))
	suffix = ''.join(random.choices(string.digits, k=4))
	return f"{prefix}{middle}{suffix}"


def browseProducts():
	response = supabase.table("product").select("*").execute()
	rows = response.data
	if rows:
		print(tabulate([[p["productid"], p["name"], p["price"], p["stock"]] for p in rows], headers=["ID", "Name", "Price", "Stock"]))
	else:
		print("No products found.")

while True:
	print("\n1. Browse Products, \n2. Make Purchase, \n3. Exit")

	selection = input("Choose an option: ")

	if selection == "1":
		browseProducts()
	elif selection == "2":
		makePurchase()
	else:
		break
		print("Invalid response")