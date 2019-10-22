Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99C98DFFCD
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2019 10:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388556AbfJVIna (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Oct 2019 04:43:30 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52529 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388532AbfJVIn3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Oct 2019 04:43:29 -0400
Received: by mail-wm1-f65.google.com with SMTP id r19so16202175wmh.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2019 01:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t38qTDyvCIN9F9VCdUnEGu/RLffByFTv/wX9PAJP8Dc=;
        b=oHGNj3EJ0Ty7HQmiQAZbNf3l0P/707ITFCQlTvwdXl3FFPMFhHW9BShbgCf39oVQ3c
         lzRXbdE1ppQABfMJ95Uf3/HCE/YcNaSSNmYUbaofRGyagi9I/4B8/DWAShdzRHmmkI+N
         XuC3xeTgugOUTS8bycmLpo8uvdXnHggii8OuAlG9ary5wyIpAsb/4sy3xwSEfxi+tapH
         ZSMCBy6uP3MohrRn3zJeFAlq+N5W3DZwGCyuGnkaAocoX8BD8mgJZPq+YusTKtNGDVEK
         WdqyWyYOq4aLKeU063ssygetioghbxbBtfu7i78GWLsFbrQzSzZ7XZVWOPRn764lWrme
         ZHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t38qTDyvCIN9F9VCdUnEGu/RLffByFTv/wX9PAJP8Dc=;
        b=UlnB2Mlu6CcNwmyimzF5GaNQ8RWr/sLyGEmzJP6GR2eR388lcHnmIojIUdlIS40aHa
         Er4NX0iWWgXLfB1vGjQpZLgO1h/0ghVxav9t7immLCoSqrdMfslBOCFzXxczDqtFwRau
         LDrA5jIuFFavyA9u5Gvv/0DNjhkraHLBFLgmHZ0wspMZcCdShA8lQ64hNQn0DTlmc4d6
         okUN+1Wt60Mfd5o5ZYpcqHIIZmVHYnd6bHlQ/qEhesaa3JL0aKmmH3PPKwkA6Zsc2u5L
         UI863Gg6PwloP6c/VDNq8dd/3R0bwO82GMD56/tq46sDWJtENEnOq7nhMDGG41zXp5xq
         vd4w==
X-Gm-Message-State: APjAAAX3tvyrny7NBenIhLa5WE3UZS1KQCMyZK+8h2eiWSeARh1alSi8
        fzMNSzZgCr2jomapOECxVqeeXQ==
X-Google-Smtp-Source: APXvYqziGeOfTJY/tjRJaq6DIbQhhMJ2O+ETxOZtnm9hsV8gFqOYspSodZCQI2yyNEqrFx4UOjkFBA==
X-Received: by 2002:a1c:80c7:: with SMTP id b190mr1952384wmd.3.1571733807272;
        Tue, 22 Oct 2019 01:43:27 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id q25sm477231wra.3.2019.10.22.01.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 01:43:26 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [RESEND PATCH v3 4/8] drivers: platform: provide devm_platform_ioremap_resource_wc()
Date:   Tue, 22 Oct 2019 10:43:14 +0200
Message-Id: <20191022084318.22256-5-brgl@bgdev.pl>
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

Provide a write-combined variant of devm_platform_ioremap_resource().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 .../driver-api/driver-model/devres.rst        |  1 +
 drivers/base/platform.c                       | 19 ++++++++++++++++++-
 include/linux/platform_device.h               |  3 +++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index e605bb9df6e1..480b78ca3871 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -318,6 +318,7 @@ IOMAP
   devm_ioremap_resource() : checks resource, requests memory region, ioremaps
   devm_ioremap_resource_wc()
   devm_platform_ioremap_resource() : calls devm_ioremap_resource() for platform device
+  devm_platform_ioremap_resource_wc()
   devm_iounmap()
   pcim_iomap()
   pcim_iomap_regions()	: do request_region() and iomap() on multiple BARs
diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index b230beb6ccb4..177010c27516 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -60,6 +60,7 @@ struct resource *platform_get_resource(struct platform_device *dev,
 }
 EXPORT_SYMBOL_GPL(platform_get_resource);
 
+#ifdef CONFIG_HAS_IOMEM
 /**
  * devm_platform_ioremap_resource - call devm_ioremap_resource() for a platform
  *				    device
@@ -68,7 +69,6 @@ EXPORT_SYMBOL_GPL(platform_get_resource);
  *        resource management
  * @index: resource index
  */
-#ifdef CONFIG_HAS_IOMEM
 void __iomem *devm_platform_ioremap_resource(struct platform_device *pdev,
 					     unsigned int index)
 {
@@ -78,6 +78,23 @@ void __iomem *devm_platform_ioremap_resource(struct platform_device *pdev,
 	return devm_ioremap_resource(&pdev->dev, res);
 }
 EXPORT_SYMBOL_GPL(devm_platform_ioremap_resource);
+
+/**
+ * devm_platform_ioremap_resource_wc - write-combined variant of
+ *                                     devm_platform_ioremap_resource()
+ *
+ * @pdev: platform device to use both for memory resource lookup as well as
+ *        resource management
+ * @index: resource index
+ */
+void __iomem *devm_platform_ioremap_resource_wc(struct platform_device *pdev,
+						unsigned int index)
+{
+	struct resource *res;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
+	return devm_ioremap_resource_wc(&pdev->dev, res);
+}
 #endif /* CONFIG_HAS_IOMEM */
 
 static int __platform_get_irq(struct platform_device *dev, unsigned int num)
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index f2688404d1cd..74cecb919e5c 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -57,6 +57,9 @@ platform_find_device_by_driver(struct device *start,
 extern void __iomem *
 devm_platform_ioremap_resource(struct platform_device *pdev,
 			       unsigned int index);
+extern void __iomem *
+devm_platform_ioremap_resource_wc(struct platform_device *pdev,
+				  unsigned int index);
 extern int platform_get_irq(struct platform_device *, unsigned int);
 extern int platform_get_irq_optional(struct platform_device *, unsigned int);
 extern int platform_irq_count(struct platform_device *);
-- 
2.23.0

