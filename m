Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA176DFFD1
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2019 10:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388551AbfJVIn3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Oct 2019 04:43:29 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42976 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388522AbfJVIn3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Oct 2019 04:43:29 -0400
Received: by mail-wr1-f68.google.com with SMTP id r1so7220889wrs.9
        for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2019 01:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CJJSojrxXdOtbucyV3DkzPFZIOLxdDReHk1T4+sRr4o=;
        b=rcX6hmuzm5jG5P1203qFyfAYA6TgsZ+s1aPTDCnCDxTzxs+nC/HKZAJCRbSpSL8IrM
         b7W2zeXAs2zBVVXcR8WEjIfaNdrd1bgkW1G1FMW1VjdWMPkuMwHEh3Dwk4rMxIPdO7V3
         UomhROYXddDsqve9wPNR7SmcrgoNXRdz8te+Q3LjGPfr1pwTwnpb5PrvYSGPtN8IAmlP
         zugc/07P+8jIJv2y5vzaPiy7dF1qRASKOKs6wWVvaJDg2yroY+AJ+5LyBAeUdANq6f3v
         XBTnVf9H832GAVGCYdW9uk9NdcZmkrOzQua96uljULpBFs3EVwpklKpSBuqmO953qgc2
         MOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CJJSojrxXdOtbucyV3DkzPFZIOLxdDReHk1T4+sRr4o=;
        b=LiD5S9je+wcmDrko3WSyjXkMzYhhJndF0KktfocybtqPFMSWY/XeB9/tHVKKnKlvtI
         ouHx0kr32fq5EiFd61q/aM/Gq/9WI7e6P85MljyGPmoJ6f3x39ExYJkheRefIoT3AIKo
         pKySCHMLF9czXuhNvjdNb8vpUuvJyM+0rEyK6Gbfq1nEChWLtsWvSBYvNUqV2hHnRg/5
         C3Y6eyJmja25AdnrtlFuDq6Jk0NCKbn72OXaQBCx4GODjiuzq2E9K4kIhSKcLU/lTN12
         6IGcnuw+J06zI1uoAYP3xwldvIzb6y7v5bW8vEOECic+K/MqeBgQ9o5ip2HVnfZ3wCTI
         4LOg==
X-Gm-Message-State: APjAAAV/Aaapi/rjLeoQBXm9JRInjUUawwP0DXRpMGIpMggIxOVdszSt
        fOy3C/qO59TTKSnotm0Uxoeo3g==
X-Google-Smtp-Source: APXvYqxgpYoVLaj4PTRXGjR1tlAqQAUXu+5mgDnZ2dar9WhHzkR2S8ZBrtURUVmCfyd8eleOg3kdnw==
X-Received: by 2002:adf:c98b:: with SMTP id f11mr2505711wrh.274.1571733805339;
        Tue, 22 Oct 2019 01:43:25 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id q25sm477231wra.3.2019.10.22.01.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 01:43:24 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [RESEND PATCH v3 2/8] lib: devres: prepare devm_ioremap_resource() for more variants
Date:   Tue, 22 Oct 2019 10:43:12 +0200
Message-Id: <20191022084318.22256-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022084318.22256-1-brgl@bgdev.pl>
References: <20191022084318.22256-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We want to add the write-combined variant of devm_ioremap_resource().
Let's first implement __devm_ioremap_resource() which takes
an additional argument type. The types are the same as for
__devm_ioremap(). The existing devm_ioremap_resource() now simply
calls __devm_ioremap_resource() with regular DEVM_IOREMAP type.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
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
2.23.0

