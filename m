Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05B96A1D19
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2019 16:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727904AbfH2Oix (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Aug 2019 10:38:53 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35733 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727794AbfH2OiJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Aug 2019 10:38:09 -0400
Received: by mail-wm1-f67.google.com with SMTP id l2so4148236wmg.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Aug 2019 07:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ixvkB7V43hKnmpubcJyfS56WaYg/zqMW9mNeR7sGzjo=;
        b=Jl/KOc3c/tWm63gxFSTjAo6PpfQzPmcUricXPWQVOnWUWtbA5tgLe8IG2LXNlz4c8W
         Ost5l50DOWqngoyPIPKalqof732a4QL679hkjpvIXoS7Qa4UwihRay+lui8HJGFE9jHg
         Z9CZ+mNBGNyc6KrrhnMjK6xHSx/25+A5LMc3//YEUindtzCENKZM5bedwY4GQRbSOka1
         s3rB2PkLMxP0jxvmN6OGq8rkVXGch4UD8nhXWKp1P1tt3s+CIxITJdI+wnu01pOR88RR
         Ks3m4R1XMFUTJt2Z+5Fg2lRELsLyNiOdhUdAlkFF4NwncUGRRk7YQJOs+GmUEI1/P1rh
         M8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ixvkB7V43hKnmpubcJyfS56WaYg/zqMW9mNeR7sGzjo=;
        b=bUh0QdE/Se0tVsGKKcIFglS1va0g8qoNSZx81rd+YC0Wo/vIP5Z/G/YaAKHUW9yflv
         pToYlNHeNuiCwWVUlOwog78uTQ9EPeNbCNuWn2l1gkUxnbmL36TGvW1oxNTN9BBHHHJ0
         oU0tszBmTYpBYEF+NY8hJiamMgpAFgLk2Cz6YmQ/7VO9m/ccqccusc4HgB08+aPSRGqE
         wn3T7jRtgojSte9sjtFYOyf6g9M/Oh0rt8+l18j1lYqeYVi199hT9XysGMFe5v8yl6rs
         8owfGfIKiCaHbAl8/rpuVUpyMBLqkXePAk+aJDuFdZVGf4KEmiwW4cCOM+A0kXaqHG8Q
         0oCQ==
X-Gm-Message-State: APjAAAUCvOGI2euqyJhwPDN5CXHGC3223pwl2Rth/BrATCpApzW+QXDS
        yTdMCivbMgntF59OjKIBB4detg==
X-Google-Smtp-Source: APXvYqzDBd56BXi2us4MHfKcSnqb+9nXEN8jrVhAop9QN4hsEPKbDM6lYwB97IRyI27AVhXumdDmkQ==
X-Received: by 2002:a1c:f20a:: with SMTP id s10mr12396085wmc.145.1567089486874;
        Thu, 29 Aug 2019 07:38:06 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id g15sm3241925wrp.29.2019.08.29.07.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 07:38:06 -0700 (PDT)
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
Subject: [PATCH 3/9] lib: devres: provide new variants for devm_ioremap_resource()
Date:   Thu, 29 Aug 2019 16:37:36 +0200
Message-Id: <20190829143742.24726-4-brgl@bgdev.pl>
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

Provide two new variants of devm_ioremap_resource() - one for nocache
and one for write-combined ioremap.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../driver-api/driver-model/devres.rst        |  2 ++
 include/linux/device.h                        |  4 +++
 lib/devres.c                                  | 29 +++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 8e3087662daf..20c4be0389ab 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -316,6 +316,8 @@ IOMAP
   devm_ioremap_nocache()
   devm_ioremap_wc()
   devm_ioremap_resource() : checks resource, requests memory region, ioremaps
+  devm_ioremap_resource_nocache()
+  devm_ioremap_resource_wc()
   devm_platform_ioremap_resource() : calls devm_ioremap_resource() for platform device
   devm_iounmap()
   pcim_iomap()
diff --git a/include/linux/device.h b/include/linux/device.h
index 6717adee33f0..e8aa916e8eb2 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -710,6 +710,10 @@ extern void devm_free_pages(struct device *dev, unsigned long addr);
 
 void __iomem *devm_ioremap_resource(struct device *dev,
 				    const struct resource *res);
+void __iomem *devm_ioremap_resource_nocache(struct device *dev,
+					    const struct resource *res);
+void __iomem *devm_ioremap_resource_wc(struct device *dev,
+				       const struct resource *res);
 
 void __iomem *devm_of_iomap(struct device *dev,
 			    struct device_node *node, int index,
diff --git a/lib/devres.c b/lib/devres.c
index a14c727128c1..f1297bcc8891 100644
--- a/lib/devres.c
+++ b/lib/devres.c
@@ -169,6 +169,35 @@ void __iomem *devm_ioremap_resource(struct device *dev,
 }
 EXPORT_SYMBOL(devm_ioremap_resource);
 
+/**
+ * devm_ioremap_resource_nocache() - nocache variant of devm_ioremap_resource()
+ * @dev: generic device to handle the resource for
+ * @res: resource to be handled
+ *
+ * Returns a pointer to the remapped memory or an ERR_PTR() encoded error code
+ * on failure. Usage example:
+ */
+void __iomem *devm_ioremap_resource_nocache(struct device *dev,
+					    const struct resource *res)
+{
+	return __devm_ioremap_resource(dev, res, DEVM_IOREMAP_NC);
+}
+
+/**
+ * devm_ioremap_resource_wc() - write-combined variant of
+ *				devm_ioremap_resource()
+ * @dev: generic device to handle the resource for
+ * @res: resource to be handled
+ *
+ * Returns a pointer to the remapped memory or an ERR_PTR() encoded error code
+ * on failure. Usage example:
+ */
+void __iomem *devm_ioremap_resource_wc(struct device *dev,
+				       const struct resource *res)
+{
+	return __devm_ioremap_resource(dev, res, DEVM_IOREMAP_WC);
+}
+
 /*
  * devm_of_iomap - Requests a resource and maps the memory mapped IO
  *		   for a given device_node managed by a given device
-- 
2.21.0

