Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72F40A1D1A
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2019 16:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbfH2OiI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Aug 2019 10:38:08 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:32916 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727735AbfH2OiI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Aug 2019 10:38:08 -0400
Received: by mail-wm1-f68.google.com with SMTP id r17so4315128wme.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Aug 2019 07:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CcXwQ54TS9oqYUYDALsJlErvtZdechYOTQTghcQzmo4=;
        b=Ea683PP1vKNCsMhfQpDj7TP/NTJiAbsJP5WCR2r/bBmHa+0/miks4QlSv9/8j9I0No
         pMxPhOtg+L0WmMg5EGat/zN3LVWu5yd9kttsCiCcW1K9dK2u3Qe5OXTAdz7qZQNXkI7e
         F5uCRbISfaYNJvCUYWun7zbLSQ237krjiZWMVrraGkQ49iP6F4gs61xEA6pBSGZMI5Vs
         BofhQCGSjIPFKU3XVLId8pDlTbFbP3sxi2Qn6HZ2XlI1ixApzZ93rcwXLijb1sFZCZvh
         RMr8eup9OG7OV9TfAxM5RsPlQDFlpLhxA6mj48RnedH58ww+geEsP1jyIuX1iXxcDNEW
         +SIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CcXwQ54TS9oqYUYDALsJlErvtZdechYOTQTghcQzmo4=;
        b=cmqRr0SXAn5ucM6erGl6rrrSVbzFFKkj0LTxPxP8xvP/64ihOaCRCojGIkGX83OVoD
         3DR/yiaJzxJGbb0rVAFEAIs4PVeg+dpCqCpWW9EUe8KthY7MCKxWtErzsAYRmbTb9ZFm
         19HFD1v1LLuMkYseQDLxu8ZFzlZwttrek0e43/EXkJOVNJd0yz8UHO5qNVqYxc/NcCyh
         3ClSciVFyDUxGbBOHf/1AmWx9uJuhDXY6arOTPvS7XtO+PbOOjgIuE4KrJhQcvFWwfy2
         8/yEJ12ORNds4vNcNisGYFM8QX9ZHSdeIpdkhmW7tZl7IwOp6cK38J5bpS5WS+Cws7Ga
         Scdw==
X-Gm-Message-State: APjAAAV8ViecjliklhrfW7MnjmImECRH2Auf9Rx+DqG0yMnwamg1coUe
        CP8FQvKMC/NSJ4NfwAhcIgYRAw==
X-Google-Smtp-Source: APXvYqxd9Rq6sxgB/1L+kdjuZeO1sZ1/0JXVmhQDvYi9fvlk488g/HgijrcUVUzGXWIRMxr1QmDMZg==
X-Received: by 2002:a7b:cbce:: with SMTP id n14mr11150105wmi.47.1567089485900;
        Thu, 29 Aug 2019 07:38:05 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id g15sm3241925wrp.29.2019.08.29.07.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 07:38:05 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Alban Bedel <albeu@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 2/9] lib: devres: prepare devm_ioremap_resource() for more variants
Date:   Thu, 29 Aug 2019 16:37:35 +0200
Message-Id: <20190829143742.24726-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829143742.24726-1-brgl@bgdev.pl>
References: <20190829143742.24726-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We want to add the nocache and write-combined variants of
devm_ioremap_resource(). Let's first implement __devm_ioremap_resource()
which takes an additional argument type. The types are the same as
for __devm_ioremap(). The existing devm_ioremap_resource() now simply
calls __devm_ioremap_resource() with regular DEVM_IOREMAP type.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 lib/devres.c | 47 +++++++++++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/lib/devres.c b/lib/devres.c
index 6a0e9bd6524a..a14c727128c1 100644
--- a/lib/devres.c
+++ b/lib/devres.c
@@ -114,25 +114,9 @@ void devm_iounmap(struct device *dev, void __iomem *addr)
 }
 EXPORT_SYMBOL(devm_iounmap);
 
-/**
- * devm_ioremap_resource() - check, request region, and ioremap resource
- * @dev: generic device to handle the resource for
- * @res: resource to be handled
- *
- * Checks that a resource is a valid memory region, requests the memory
- * region and ioremaps it. All operations are managed and will be undone
- * on driver detach.
- *
- * Returns a pointer to the remapped memory or an ERR_PTR() encoded error code
- * on failure. Usage example:
- *
- *	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
- *	base = devm_ioremap_resource(&pdev->dev, res);
- *	if (IS_ERR(base))
- *		return PTR_ERR(base);
- */
-void __iomem *devm_ioremap_resource(struct device *dev,
-				    const struct resource *res)
+static void __iomem *
+__devm_ioremap_resource(struct device *dev, const struct resource *res,
+			enum devm_ioremap_type type)
 {
 	resource_size_t size;
 	void __iomem *dest_ptr;
@@ -151,7 +135,7 @@ void __iomem *devm_ioremap_resource(struct device *dev,
 		return IOMEM_ERR_PTR(-EBUSY);
 	}
 
-	dest_ptr = devm_ioremap(dev, res->start, size);
+	dest_ptr = __devm_ioremap(dev, res->start, size, type);
 	if (!dest_ptr) {
 		dev_err(dev, "ioremap failed for resource %pR\n", res);
 		devm_release_mem_region(dev, res->start, size);
@@ -160,6 +144,29 @@ void __iomem *devm_ioremap_resource(struct device *dev,
 
 	return dest_ptr;
 }
+
+/**
+ * devm_ioremap_resource() - check, request region, and ioremap resource
+ * @dev: generic device to handle the resource for
+ * @res: resource to be handled
+ *
+ * Checks that a resource is a valid memory region, requests the memory
+ * region and ioremaps it. All operations are managed and will be undone
+ * on driver detach.
+ *
+ * Returns a pointer to the remapped memory or an ERR_PTR() encoded error code
+ * on failure. Usage example:
+ *
+ *	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+ *	base = devm_ioremap_resource(&pdev->dev, res);
+ *	if (IS_ERR(base))
+ *		return PTR_ERR(base);
+ */
+void __iomem *devm_ioremap_resource(struct device *dev,
+				    const struct resource *res)
+{
+	return __devm_ioremap_resource(dev, res, DEVM_IOREMAP);
+}
 EXPORT_SYMBOL(devm_ioremap_resource);
 
 /*
-- 
2.21.0

