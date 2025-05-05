# Secure-Static-Website-on-AWS-Using-Terraform
![diagram-export-5-5-2025-1_43_28-PM](https://github.com/user-attachments/assets/23e274a9-26c6-41f9-8b23-536a4f20ca4f)

I deployed a static website hosted on Amazon S3, secured with SSL/TLS using AWS Certificate Manager (ACM), and distributed globally with low latency through Amazon CloudFront. The infrastructure was fully provisioned using Terraform, ensuring a reproducible, automated, and scalable deployment process. To make the website accessible via a custom domain, I used Amazon Route 53 for DNS management, routing domain traffic to the CloudFront distribution efficiently and reliably.

## ⚙️ AWS Services Used

### Amazon S3 (Simple Storage Service)
- Used to store and deliver the static website content, such as HTML, CSS, and JS files.

### Amazon CloudFront
- A global content delivery network (CDN) that caches and delivers the S3 content with low latency and high availability.

### AWS Certificate Manager (ACM)
- Provides the SSL/TLS certificate to enable secure HTTPS access via CloudFront.

### Amazon Route 53
- A scalable DNS service used to manage the custom domain and route DNS queries to CloudFront.

### Terraform
- Infrastructure as Code (IaC) tool used to automate the provisioning of all AWS resources—ensuring repeatability, version control, and clean teardown if needed.
