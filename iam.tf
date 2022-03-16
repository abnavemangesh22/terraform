
resource "aws_iam_user" "myuser" {
  for_each = toset(["TJack", "TJames", "Mangesh2"])
  name = each.key

}