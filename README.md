# ACM Approaching Expiry

## Overview
This project provides a notification system for expiring AWS Certificate Manager (ACM) certificates. It is crucial for maintaining the security and reliability of web applications and services that rely on TLS/SSL certificates.

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