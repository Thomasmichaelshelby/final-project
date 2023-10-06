resource "aws_rds_cluster_parameter_group" "aurora_clupg" {
  name   = "aurora-pg"
  family = "aurora-mysql5.7"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }

  parameter {
    name  = "character_set_connection"
    value = "utf8"
  }

  parameter {
    name  = "character_set_database"
    value = "utf8"
  }

  parameter {
    name  = "character_set_filesystem"
    value = "utf8"
  }

  parameter {
    name  = "character_set_results"
    value = "utf8"
  }

  parameter {
    name  = "collation_server"
    value = "utf8_general_ci"
  }

  parameter {
    name  = "collation_connection"
    value = "utf8_general_ci"
  }

  parameter {
    name  = "time_zone"
    value = "Asia/Seoul"
  }
}


resource "aws_db_subnet_group" "aurora_dbsg" {
  name       = "aurora-dbsg"
  subnet_ids = concat(aws_subnet.team4_db_[*].id)
}


resource "aws_rds_cluster" "team4_aurora" {
  cluster_identifier = "team4-aurora"
  engine             = "aurora-mysql"
  engine_version     = "5.7.mysql_aurora.2.11.2"

  database_name   = "team4db"
  master_username = "root"
  master_password = "VMware1!"

  vpc_security_group_ids = [aws_security_group.team4_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.aurora_dbsg.name
  port                   = 3306
  network_type           = "IPV4"

  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.aurora_clupg.name

  apply_immediately       = true
  skip_final_snapshot     = true
  backup_retention_period = 7

  tags = {
    Name = "${var.tag}-aurora"
  }
}

resource "aws_rds_cluster_instance" "aurora_replicas" {
  count              = 2
  identifier         = "aurora-replica-${count.index + 1}"
  cluster_identifier = aws_rds_cluster.team4_aurora.id
  instance_class     = "db.t3.medium"
  engine             = "aurora-mysql"
  engine_version     = "5.7.mysql_aurora.2.11.2"

  tags = {
    Name = "${var.tag}-aurora-rc${count.index + 1}"
  }
}

