Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B87F7CCECB
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2019 07:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbfJFFj5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Oct 2019 01:39:57 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39923 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726271AbfJFFjp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Oct 2019 01:39:45 -0400
Received: by mail-pf1-f194.google.com with SMTP id v4so6421296pff.6
        for <linux-gpio@vger.kernel.org>; Sat, 05 Oct 2019 22:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EZctdb2EuU+FP6ZJizqHnH1ZQoblRYPFlqyAYuvzD20=;
        b=NpApFIedXdrlmbEUK/h9l3WT4rH2EnNIsQlDII8fDOMAVwLlVyCUZVXmBytWP0yuFv
         pXpcL9URhY+tunDb9OFu5jCs4TkBCf+w7so/Yvfc00vcT4+pLUo8LgKTN5p5Dd4EeweD
         XZsEUTkaYPgmR4DeCdlNsKRLlJ5DYkiz/TKIiqwOcLxWcNwd+2QNUgQqjs7sxovPNkkV
         kaui8X0nKnZPYLez5EGbmwDeijGAYIk3CwVVefwgJFwg4zMG4E0ZxwYfoGscazT7cF9Y
         97hFM5UBRhLxQ59cgK2wOI26glsXofjt5QhzGyT8WqMrqQuKiBYVeF2C0fmXQWvEym0K
         LAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EZctdb2EuU+FP6ZJizqHnH1ZQoblRYPFlqyAYuvzD20=;
        b=OUtMDQ/OAYjvvepQNfWlgBPUf2F1dV7GeRHYOG5f0Hc3bv3NiDXjbosns860iWcBh0
         W83YHPUYrmZ3qgCHhfb3/HNyk10rXsMMYmcO2mWnc6cS+OmSgjueCC+L0xgVvhIX3MvQ
         hNgUTYdrEIRclvisZCUQRT9R/F7mKbXa9wo/L/M7HX6htl+P9tH5Wxw8tCJDKqJA2hPW
         q9iU7Gv+83O4rV1wGOrwK0o3CZMBqs2/HoZDbN0teIFqR8IYBuGhPcUoLx+1gdClj3I0
         +Md1OlsWxiBaBAS/3VQ8U/cYevcbU5iSZvr/NxY7FGCXVQBuPOOYDxwXq0k5BctWiLlk
         f1Ww==
X-Gm-Message-State: APjAAAW1HJb8FZMKGgwpptSvTD1QZyBfDOUE/biG8hs+VodI4hvAl70n
        eAFk41tY3rQ4gVxYrqWSdHfZ+iT3v7aZsg==
X-Google-Smtp-Source: APXvYqzS/NuH9G9b377gcdt8bKZ36+WUD+1e5Kp1+cmEBlnWIUitci4/fgTJ8hlQr7cc3bV+4iwF9w==
X-Received: by 2002:a65:5a84:: with SMTP id c4mr23893162pgt.261.1570340383448;
        Sat, 05 Oct 2019 22:39:43 -0700 (PDT)
Received: from debian-brgl.local (50-255-47-209-static.hfc.comcastbusiness.net. [50.255.47.209])
        by smtp.gmail.com with ESMTPSA id q30sm10019320pja.18.2019.10.05.22.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2019 22:39:43 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 6/8] drivers: provide devm_platform_ioremap_resource_byname()
Date:   Sun,  6 Oct 2019 07:39:14 +0200
Message-Id: <20191006053916.8849-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191006053916.8849-1-brgl@bgdev.pl>
References: <20191006053916.8849-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Provide a variant of devm_platform_ioremap_resource() that allows to
lookup resources from platform devices by name rather than by index.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../driver-api/driver-model/devres.rst        |  1 +
 drivers/base/platform.c                       | 20 +++++++++++++++++++
 include/linux/platform_device.h               |  3 +++
 3 files changed, 24 insertions(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 480b78ca3871..4ab193319d8c 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -319,6 +319,7 @@ IOMAP
   devm_ioremap_resource_wc()
   devm_platform_ioremap_resource() : calls devm_ioremap_resource() for platform device
   devm_platform_ioremap_resource_wc()
+  devm_platform_ioremap_resource_byname()
   devm_iounmap()
   pcim_iomap()
   pcim_iomap_regions()	: do request_region() and iomap() on multiple BARs
diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index d481b8a7d4fc..265d34253865 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -95,6 +95,26 @@ void __iomem *devm_platform_ioremap_resource_wc(struct platform_device *pdev,
 	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
 	return devm_ioremap_resource_wc(&pdev->dev, res);
 }
+
+/**
+ * devm_platform_ioremap_resource_byname - call devm_ioremap_resource for
+ *					   a platform device, retrieve the
+ *					   resource by name
+ *
+ * @pdev: platform device to use both for memory resource lookup as well as
+ *	  resource management
+ * @name: name of the resource
+ */
+void __iomem *
+devm_platform_ioremap_resource_byname(struct platform_device *pdev,
+				      const char *name)
+{
+	struct resource *res;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
+	return devm_ioremap_resource(&pdev->dev, res);
+}
+EXPORT_SYMBOL_GPL(devm_platform_ioremap_resource_byname);
 #endif /* CONFIG_HAS_IOMEM */
 
 static int __platform_get_irq(struct platform_device *dev, unsigned int num)
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 83930790c701..fea5563f6fcf 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -60,6 +60,9 @@ devm_platform_ioremap_resource(struct platform_device *pdev,
 extern void __iomem *
 devm_platform_ioremap_resource_wc(struct platform_device *pdev,
 				  unsigned int index);
+extern void __iomem *
+devm_platform_ioremap_resource_byname(struct platform_device *pdev,
+				      const char *name);
 extern int platform_get_irq(struct platform_device *, unsigned int);
 extern int platform_get_irq_optional(struct platform_device *, unsigned int);
 extern int platform_irq_count(struct platform_device *);
-- 
2.23.0

