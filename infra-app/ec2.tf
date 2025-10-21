resource "aws_key_pair" "my_key" {
  key_name   = "${var.env}-terra-key-ec2"
  public_key = file("${path.root}/terra-key-ec2.pub")

  tags = {
    environment = var.env
  }
}


# ---------------------------------------------------------
# 2️⃣ VPC & Security Group Configuration
# ---------------------------------------------------------

# Create or reference the default VPC available in the AWS region
resource "aws_default_vpc" "default" {
  # Uses the default VPC provided by AWS (no custom settings needed)
}

# Create a Security Group for the EC2 instance
resource "aws_security_group" "my_security_group" {
  name        = "${var.env}-infra-app-security" # Name of the security group
  description = "this will add a TF generated security group"


  /* interpolation: allows referencing another Terraform resource
     (here, pulling the VPC ID from aws_default_vpc.default.id)
  */

  # ---------------------------------------------------------
  # 🔹 Inbound Rules — Control incoming traffic to the instance
  # ---------------------------------------------------------

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from anywhere (⚠️ not secure for production)
    description = "SSH open"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP (for web traffic)
    description = "HTTP open"
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow custom app port (e.g., Flask)
    description = "Flask app open"
  }

  # ---------------------------------------------------------
  # 🔹 Outbound Rules — Control outgoing traffic from instance
  # ---------------------------------------------------------

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"          # -1 = all protocols
    cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic
    description = "All outbound access open"
  }

  # Add a Name tag to help identify the SG in AWS console
  tags = {
    Name = "${var.env}-infra-app-sg"
  }
}

# ---------------------------------------------------------
# 3️⃣ EC2 Instance Configuration
# ---------------------------------------------------------

resource "aws_instance" "my_instance" {
#   for_each = tomap({
#     tws-auto-meta-micro = "t3.micro"
#     tws-auto-midium     = "t3.micro"
#   })
  # meta argument
  count = var.instance_count                                       # meta argument - create replicas -create multiple s3 ,instances

  depends_on = [aws_security_group.my_security_group, aws_key_pair.my_key]

  key_name               = aws_key_pair.my_key.key_name              # Use the key pair for SSH login
  vpc_security_group_ids = [aws_security_group.my_security_group.id] # Attach the SG created above
  //  instance_type          = var.ec2_instance_type                     # Use instance type from variables (e.g., "t2.micro")
  instance_type = var.instance_type
  ami           = var.ec2_ami_id
  # ---------------------------------------------------------
  # 🔹 Root Block Device — configure storage
  # ---------------------------------------------------------
root_block_device {
  volume_size = var.ec2_root_storage_size
}


  # ---------------------------------------------------------
  # 🔹 Tags for easy identification
  # ---------------------------------------------------------
  tags = {
    Name =  "${var.env}-infra-app" 
    Enviroment = var.env # Environment tag (e.g., "dev", "prd")
  }
}


