Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36EFFCCEDA
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2019 07:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbfJFFkQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Oct 2019 01:40:16 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46534 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbfJFFjl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Oct 2019 01:39:41 -0400
Received: by mail-pg1-f195.google.com with SMTP id a3so6114807pgm.13
        for <linux-gpio@vger.kernel.org>; Sat, 05 Oct 2019 22:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EgzlAIhkpsVrchDajp8SP2c8jH/gUd2pLHbFdDZ/+4w=;
        b=gK/qxRTV8cT9fGDqLH7/3E/uJkniwGKqA6Z2ESMtMIrxYwBaq4TVHAClTb19gjH2h1
         OFUsaU0X+0/RRFfqCFvK8Oqdl3zScVCT6/pY0C2F0jtEleRLje29sEIImT1EKp6EgSjK
         nNoVQUzekSglxxspf1y5CkULth8/JgkWxfGe3VVwXd1ARnHscehoI2hWzERVQ7Yufe5M
         gxHewhguH3lfRtIt+QiPRjYLH5pGoJU8oeH031S8o9jRdo7zsFVpmvPC3anVGA0fmxne
         GArC8Rbnk68JlbNsKwvXUpq9YToWzqmyAfKH3zdbZbEIix+RkJjX3ARfDxap0sDxrZ1M
         KPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EgzlAIhkpsVrchDajp8SP2c8jH/gUd2pLHbFdDZ/+4w=;
        b=keoR0bvNUmQd49l3ATFRn8gNyUPU/GxISO7iXCoUWu0MCEwsGqaQLh+ZEGtRr2Ob8y
         vrpPXMvAanOiqifn59RhHIxLofshdaQqspKeoBABcOU0NzcXCqGdhikUBWrBHUDHXSGP
         OozcBz7npEQfgBBC/Bp6Lz7Lf5NxQ98oF0mpgQZyXggJewNP19dpmeKWZAx8ioZtpZnS
         hZ73b9+Ltk0s1IyrdhVcED4AoFZLmn+gYRI0ZpqEr0gIWu42hdOdmmRCnAcDTO3UzizK
         KffiPhNCmTqfzeKacLpQt6AEEtAJZC8UQnRzehx2v5bfzLMdQxf2JCjrVZ2rhsFqVUML
         4FAg==
X-Gm-Message-State: APjAAAW7FXdaGc3m1RN5b2IXX0fIZd6b1P4WYvNKsLNmfMddWTEV9GbA
        1iCcMk01bJ/2WF4A1UBGk3AYgw==
X-Google-Smtp-Source: APXvYqwS2flP03ODMjWNm+9SJT+cfwwXQTQiQVUCv7+rG+Jn/skkvucUSS0Bd+0q4puJHr9Hggmu8w==
X-Received: by 2002:a17:90a:a2b:: with SMTP id o40mr26574353pjo.107.1570340380653;
        Sat, 05 Oct 2019 22:39:40 -0700 (PDT)
Received: from debian-brgl.local (50-255-47-209-static.hfc.comcastbusiness.net. [50.255.47.209])
        by smtp.gmail.com with ESMTPSA id q30sm10019320pja.18.2019.10.05.22.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2019 22:39:40 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 3/8] lib: devres: provide devm_ioremap_resource_wc()
Date:   Sun,  6 Oct 2019 07:39:11 +0200
Message-Id: <20191006053916.8849-4-brgl@bgdev.pl>
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

Provide a variant of devm_ioremap_resource() for write-combined ioremap.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 Documentation/driver-api/driver-model/devres.rst |  1 +
 include/linux/device.h                           |  2 ++
 lib/devres.c                                     | 15 +++++++++++++++
 3 files changed, 18 insertions(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 8e3087662daf..e605bb9df6e1 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -316,6 +316,7 @@ IOMAP
   devm_ioremap_nocache()
   devm_ioremap_wc()
   devm_ioremap_resource() : checks resource, requests memory region, ioremaps
+  devm_ioremap_resource_wc()
   devm_platform_ioremap_resource() : calls devm_ioremap_resource() for platform device
   devm_iounmap()
   pcim_iomap()
diff --git a/include/linux/device.h b/include/linux/device.h
index 297239a08bb7..1f4aaf2d4b2a 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -946,6 +946,8 @@ extern void devm_free_pages(struct device *dev, unsigned long addr);
 
 void __iomem *devm_ioremap_resource(struct device *dev,
 				    const struct resource *res);
+void __iomem *devm_ioremap_resource_wc(struct device *dev,
+				       const struct resource *res);
 
 void __iomem *devm_of_iomap(struct device *dev,
 			    struct device_node *node, int index,
diff --git a/lib/devres.c b/lib/devres.c
index a14c727128c1..97fb44e5b4d6 100644
--- a/lib/devres.c
+++ b/lib/devres.c
@@ -169,6 +169,21 @@ void __iomem *devm_ioremap_resource(struct device *dev,
 }
 EXPORT_SYMBOL(devm_ioremap_resource);
 
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
2.23.0

