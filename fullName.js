function User(fullName) {
    this.fullName = fullName;

    Object.defineProperties(this, {
        firstName: {
            get: function() {
                return this.fullName.split(" ")[0];
            },
            set: function(newFirstName) {
                this.fullName = newFirstName + " " + this.lastName;
            }
        },
        lastName: {
            get: function() {
                return this.fullName.split(" ")[1];
            },
            set: function(newLastName) {
                this.fullName = this.firstName + " " + newLastName;
            }
        }
    });
}

var vasya = new User("Vasya Popkin");

console.log(vasya.firstName);
console.log(vasya.lastName);

vasya.lastName = "Sidorov";

console.log(vasya.fullName);