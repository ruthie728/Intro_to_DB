import mysql.connector

def create_database():
    try:
        # Connect to MySQL server
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='your_password_here'  # Replace with your MySQL root password
        )

        if connection.is_connected():
            cursor = connection.cursor()

            # Create database (won’t fail if it already exists)
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")

            print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as e:
        print("Error while connecting to MySQL:", e)

    finally:
        # Close connection safely
        try:
            if connection.is_connected():
                cursor.close()
                connection.close()
                print("MySQL connection closed.")
        except NameError:
            # Handles case where connection was never established
            pass

if __name__ == "__main__":
    create_database()
