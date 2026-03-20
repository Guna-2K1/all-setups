# Install latest Java (Corretto 21)
sudo yum install java-21-amazon-corretto -y

# Set JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/java-21-amazon-corretto.x86_64
export PATH=$JAVA_HOME/bin:$PATH

# Verify Java
java -version

# Download Tomcat
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.116/bin/apache-tomcat-9.0.116.tar.gz

# Extract
tar -zxvf apache-tomcat-9.0.116.tar.gz

# Configure users (same as your script)
sed -i '56  a\<role rolename="manager-gui"/>' apache-tomcat-9.0.116/conf/tomcat-users.xml
sed -i '57  a\<role rolename="manager-script"/>' apache-tomcat-9.0.116/conf/tomcat-users.xml
sed -i '58  a\<user username="tomcat" password="admin@123" roles="manager-gui, manager-script"/>' apache-tomcat-9.0.116/conf/tomcat-users.xml
sed -i '59  a\</tomcat-users>' apache-tomcat-9.0.116/conf/tomcat-users.xml
sed -i '56d' apache-tomcat-9.0.116/conf/tomcat-users.xml

# Allow manager access (same as your script)
sed -i '21d' apache-tomcat-9.0.116/webapps/manager/META-INF/context.xml
sed -i '22d' apache-tomcat-9.0.116/webapps/manager/META-INF/context.xml

# Start Tomcat
sh apache-tomcat-9.0.116/bin/startup.sh
