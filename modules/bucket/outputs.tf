output "bucket_arn"{
    value = aws_s3_bucket.static_site.arn 
}

output "bucket_regional_domain_name" {
    value = aws_s3_bucket.static_site.bucket_regional_domain_name
}

output "bucket_domain_name"{
    value = aws_s3_bucket.static_site.bucket_domain_name
}

output "s3_website_endpoint" {
    value = aws_s3_bucket_website_configuration.website_configuration.website_endpoint
}

output "s3_website_endpoint_id" {
    value = aws_s3_bucket_website_configuration.website_configuration.id 
}