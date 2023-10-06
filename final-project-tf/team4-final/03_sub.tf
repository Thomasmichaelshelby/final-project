resource "aws_subnet" "team4_pub_" {
  count             = 2
  vpc_id            = aws_vpc.team4_vpc.id
  cidr_block        = "10.4.${count.index == 0 ? "0" : "1"}.0/24"
  availability_zone = "${var.region}${count.index == 0 ? "a" : "c"}"

  tags = {
    Name                              = "${var.tag}-pub-${count.index == 0 ? "a" : "c"}"
    "kubernetes.io/cluster/team4-clu" = "shared"
    "kubernetes.io/role/internal-elb" = 1
    "kubernetes.io/role/elb"          = 1
  }
}

resource "aws_subnet" "team4_web_" {
  count             = 2
  vpc_id            = aws_vpc.team4_vpc.id
  cidr_block        = "10.4.${count.index == 0 ? "2" : "3"}.0/24"
  availability_zone = "${var.region}${count.index == 0 ? "a" : "c"}"
  tags = {
    Name                              = "${var.tag}-web-${count.index == 0 ? "a" : "c"}"
    "kubernetes.io/cluster/team4-clu" = "shared"
    "kubernetes.io/role/internal-elb" = 1
    "kubernetes.io/role/elb"          = 1
  }
}

resource "aws_subnet" "team4_was_" {
  count             = 2
  vpc_id            = aws_vpc.team4_vpc.id
  cidr_block        = "10.4.${count.index == 0 ? "4" : "5"}.0/24"
  availability_zone = "${var.region}${count.index == 0 ? "a" : "c"}"
  tags = {
    Name                              = "${var.tag}-was-${count.index == 0 ? "a" : "c"}"
    "kubernetes.io/cluster/team4-clu" = "shared"
    "kubernetes.io/role/internal-elb" = 1
    "kubernetes.io/role/elb"          = 1
  }
}

resource "aws_subnet" "team4_db_" {
  count             = 2
  vpc_id            = aws_vpc.team4_vpc.id
  cidr_block        = "10.4.${count.index == 0 ? "6" : "7"}.0/24"
  availability_zone = "${var.region}${count.index == 0 ? "a" : "c"}"
  tags = {
    Name                              = "${var.tag}-db-${count.index == 0 ? "a" : "c"}"
    "kubernetes.io/cluster/team4-clu" = "shared"
    "kubernetes.io/role/internal-elb" = 1
    "kubernetes.io/role/elb"          = 1
  }
}