# ACM Approaching Expiry

## Overview
This project provides a notification system for expiring AWS Certificate Manager (ACM) certificates. It is crucial for maintaining the security and reliability of web applications and services that rely on TLS/SSL certificates.

> ⚠️ Note: This system is not yet fully tested, but it may still provide valuable guidance or serve as a starting point for implementing your own ACM expiry alerting solution.

## ⚠️ Why ACM Expiry Notifications Matter
TLS/SSL certificates are essential for:

* Securing communications between clients and servers
* Establishing trust through domain validation
* Avoiding browser warnings and failed connections

## When a certificate expires:

* Your service may become inaccessible
* Users will see security warnings or connection errors
* This can lead to loss of trust, downtime, and revenue impact

## Auto-renewal Isn't Always Enough
While ACM supports automatic renewal for some certificates (like those in use by Elastic Load Balancers or CloudFront), not all certificates are automatically renewed. Even when auto-renewal is enabled:

* Certificates may fail to renew due to DNS issues or validation problems
* Human oversight is often needed to confirm successful renewal
* Notification gives you time to investigate and fix issues before service is impacted

## 🛠️ Setup
```main.tf

## Add the following code to your tf file
module "acm_expiry_notification {
    source             = "git::https://github.com/DBCD20/module-acm-expiry-notification.git"
    notification_email = myemail@gmail.com
}
```

## 🚧 Status
This project is a work in progress. Although not fully tested, it may still offer useful ideas or a framework for building your own solution.
