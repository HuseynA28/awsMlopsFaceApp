
provider "aws" {
  region = "us-east-1" 
}


resource "aws_security_group" "docker_sg" {
  name        = "docker_security_group"
  description = "Allow inbound traffic for Docker services"

  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5433
    to_port     = 5433
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 50000
    to_port     = 50000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "docker_security_group"
  }
}

# Create an EC2 instance
resource "aws_instance" "docker_instance" {
  ami           = "ami-0c94855ba95c71c99"  # Update with a valid AMI ID for your region
  instance_type = "t2.medium"              # t2.medium has 4 GB RAM
  key_name      = "your-key-pair-name"     # Replace with your key pair name

  # Attach the security group
  security_groups = [aws_security_group.docker_sg.name]

  # Ensure the instance has a public IP
  associate_public_ip_address = true

  # User data script to install Docker and run your application
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y

              # Install prerequisites
              sudo apt-get install -y \
                apt-transport-https \
                ca-certificates \
                curl \
                software-properties-common \
                git

              # Add Docker’s official GPG key
              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

              # Set up the stable repository
              sudo add-apt-repository \
                 "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
                 $(lsb_release -cs) \
                 stable"

              # Install Docker Engine
              sudo apt-get update -y
              sudo apt-get install -y docker-ce docker-ce-cli containerd.io

              # Install Docker Compose
              sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-\$(uname -s)-\$(uname -m)" -o /usr/local/bin/docker-compose
              sudo chmod +x /usr/local/bin/docker-compose

              # Clone your repository (make sure it's public or handle authentication)
              git clone https://github.com/HuseynA28/awsMlopsFaceApp.git /home/ubuntu/app
              cd /home/ubuntu/app

              # Run Docker Compose
              sudo docker-compose up -d
              EOF

  tags = {
    Name = "DockerEC2Instance"
  }
}


output "instance_public_ip" {
  value = aws_instance.docker_instance.public_ip
}
