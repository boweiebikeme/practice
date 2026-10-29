variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "my-ebi-test-bucket"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "momoh-ebi-vpc"
}

variable "subnet_1_cidr" {
  description = "CIDR block for public subnet 1"
  type        = string
  default     = "10.10.1.0/24"
}

variable "subnet_2_cidr" {
  description = "CIDR block for public subnet 2"
  type        = string
  default     = "10.10.2.0/24"
}

variable "subnet_1_az" {
  description = "Availability Zone for public subnet 1"
  type        = string
  default     = "us-east-1a"
}

variable "subnet_2_az" {
  description = "Availability Zone for public subnet 2"
  type        = string
  default     = "us-east-1b"
}

variable "subnet_1_name" {
  description = "Name of public subnet 1"
  type        = string
  default     = "public-subnet-1"
}

variable "subnet_2_name" {
  description = "Name of public subnet 2"
  type        = string
  default     = "public-subnet-2"
}

variable "internet_gateway_name" {
  description = "Name of the Internet Gateway"
  type        = string
  default     = "main-igw"
}

variable "public_route_table_name" {
  description = "Name of the public route table"
  type        = string
  default     = "public-route-table"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}