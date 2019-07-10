Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE8E964423
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2019 11:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727749AbfGJJJB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jul 2019 05:09:01 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35260 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbfGJJJA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jul 2019 05:09:00 -0400
Received: by mail-wm1-f68.google.com with SMTP id l2so1433676wmg.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2019 02:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UnzrRWgbuTe9Zz0w/2n+yMVUm/kQiQ1KYQOegKaDBp8=;
        b=nc12BYUO1zpFaUSEv9hSloc0orFVkHVdRlMYYXNKvVGB3Uz7A4EDLIrt/3S4C8/jXE
         vx+m2Y9hX9MnsbuWJXxQJWSM8IbwDWBXZybSYz0vd8iYN3QyGaPjS6pt1F2ol6fC1qgj
         +zhAY3O7EG/zUqdC5ZknepaTDTpWciXBfAiUnTJn3CmIZOBO6pbDDESTLrLUxgnBaMMC
         EY9FFRydxPXpZSbsKhTaOTb+80agO2oAUobIMui1Gf9l8TsQTp+QjjUiGKZjCiyDVnTU
         kQd4LBwOn7lN7VqfJPvRVKDhV6XgDifNH1/WJPF+ZfMJwOzk1PsvsY7kResDStDcrMJd
         3lSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UnzrRWgbuTe9Zz0w/2n+yMVUm/kQiQ1KYQOegKaDBp8=;
        b=O6GVvSF9w6rvfe1Strd/VKjYESPkgoo1jBfmeZVfTbzXCLlxABKPFwGRQDZ+jv4Kve
         92cCyGvvzkuYKqKurZlqAQdTz4KgdlrLdfl+JRMn2dFxPYj1JhrM7vR5nv+e1NuxsAcU
         jSIRjt1TOC4/VNvH/uietUOzNHPUSeQRVbSxgU0ykbwcGd1pE788DPD3zfMuUc00LRFa
         FeUElRVz/uvwhN+me9UQ/Awlu1mcAe+FqviHMEdCFEfRKIyLAlribIYdoOtJx8Xn7tj5
         y+0Ta7BbHPmPzRDuOrQhmCP+qyARY+dVo6v1n0HN3bCF7wxVr+AN1dsO6ZdXMxijabGn
         qaTA==
X-Gm-Message-State: APjAAAXn/w8guqXFjLF7PzFx7xb3ljrVkOoNc5qZc0s5VV7eLYQdSx3+
        UjaEE/Bzsi5I/RFIRVRPbYdq0w==
X-Google-Smtp-Source: APXvYqw5GyviTXLJvhW5O0gNTEOahA9P3riO6KEJTkecnkfJvMizd9wmQSt4G2C8UW4ZnyYGopnnIQ==
X-Received: by 2002:a05:600c:2182:: with SMTP id e2mr4203236wme.104.1562749737833;
        Wed, 10 Jul 2019 02:08:57 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id u186sm2308511wmu.26.2019.07.10.02.08.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 02:08:57 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 2/2] gpio: em: use a helper variable for &pdev->dev
Date:   Wed, 10 Jul 2019 11:08:52 +0200
Message-Id: <20190710090852.9239-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190710090852.9239-1-brgl@bgdev.pl>
References: <20190710090852.9239-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Instead of always dereferencing &pdev->dev, just assign a helper local
variable of type struct device * and use it where applicable.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-em.c | 37 +++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index c88028ac66f2..e3aa6fe3a320 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -272,11 +272,12 @@ static int em_gio_probe(struct platform_device *pdev)
 	struct resource *io[2], *irq[2];
 	struct gpio_chip *gpio_chip;
 	struct irq_chip *irq_chip;
-	const char *name = dev_name(&pdev->dev);
+	struct device *dev = &pdev->dev;
+	const char *name = dev_name(dev);
 	unsigned int ngpios;
 	int ret;
 
-	p = devm_kzalloc(&pdev->dev, sizeof(*p), GFP_KERNEL);
+	p = devm_kzalloc(dev, sizeof(*p), GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -290,27 +291,27 @@ static int em_gio_probe(struct platform_device *pdev)
 	irq[1] = platform_get_resource(pdev, IORESOURCE_IRQ, 1);
 
 	if (!io[0] || !io[1] || !irq[0] || !irq[1]) {
-		dev_err(&pdev->dev, "missing IRQ or IOMEM\n");
+		dev_err(dev, "missing IRQ or IOMEM\n");
 		return -EINVAL;
 	}
 
-	p->base0 = devm_ioremap_nocache(&pdev->dev, io[0]->start,
+	p->base0 = devm_ioremap_nocache(dev, io[0]->start,
 					resource_size(io[0]));
 	if (!p->base0)
 		return -ENOMEM;
 
-	p->base1 = devm_ioremap_nocache(&pdev->dev, io[1]->start,
+	p->base1 = devm_ioremap_nocache(dev, io[1]->start,
 				   resource_size(io[1]));
 	if (!p->base1)
 		return -ENOMEM;
 
-	if (of_property_read_u32(pdev->dev.of_node, "ngpios", &ngpios)) {
-		dev_err(&pdev->dev, "Missing ngpios OF property\n");
+	if (of_property_read_u32(dev->of_node, "ngpios", &ngpios)) {
+		dev_err(dev, "Missing ngpios OF property\n");
 		return -EINVAL;
 	}
 
 	gpio_chip = &p->gpio_chip;
-	gpio_chip->of_node = pdev->dev.of_node;
+	gpio_chip->of_node = dev->of_node;
 	gpio_chip->direction_input = em_gio_direction_input;
 	gpio_chip->get = em_gio_get;
 	gpio_chip->direction_output = em_gio_direction_output;
@@ -319,7 +320,7 @@ static int em_gio_probe(struct platform_device *pdev)
 	gpio_chip->request = em_gio_request;
 	gpio_chip->free = em_gio_free;
 	gpio_chip->label = name;
-	gpio_chip->parent = &pdev->dev;
+	gpio_chip->parent = dev;
 	gpio_chip->owner = THIS_MODULE;
 	gpio_chip->base = -1;
 	gpio_chip->ngpio = ngpios;
@@ -333,35 +334,35 @@ static int em_gio_probe(struct platform_device *pdev)
 	irq_chip->irq_release_resources = em_gio_irq_relres;
 	irq_chip->flags	= IRQCHIP_SKIP_SET_WAKE | IRQCHIP_MASK_ON_SUSPEND;
 
-	p->irq_domain = irq_domain_add_simple(pdev->dev.of_node, ngpios, 0,
+	p->irq_domain = irq_domain_add_simple(dev->of_node, ngpios, 0,
 					      &em_gio_irq_domain_ops, p);
 	if (!p->irq_domain) {
-		dev_err(&pdev->dev, "cannot initialize irq domain\n");
+		dev_err(dev, "cannot initialize irq domain\n");
 		return -ENXIO;
 	}
 
-	ret = devm_add_action(&pdev->dev,
+	ret = devm_add_action(dev,
 			      em_gio_irq_domain_remove, p->irq_domain);
 	if (ret) {
 		irq_domain_remove(p->irq_domain);
 		return ret;
 	}
 
-	if (devm_request_irq(&pdev->dev, irq[0]->start,
+	if (devm_request_irq(dev, irq[0]->start,
 			     em_gio_irq_handler, 0, name, p)) {
-		dev_err(&pdev->dev, "failed to request low IRQ\n");
+		dev_err(dev, "failed to request low IRQ\n");
 		return -ENOENT;
 	}
 
-	if (devm_request_irq(&pdev->dev, irq[1]->start,
+	if (devm_request_irq(dev, irq[1]->start,
 			     em_gio_irq_handler, 0, name, p)) {
-		dev_err(&pdev->dev, "failed to request high IRQ\n");
+		dev_err(dev, "failed to request high IRQ\n");
 		return -ENOENT;
 	}
 
-	ret = devm_gpiochip_add_data(&pdev->dev, gpio_chip, p);
+	ret = devm_gpiochip_add_data(dev, gpio_chip, p);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to add GPIO controller\n");
+		dev_err(dev, "failed to add GPIO controller\n");
 		return ret;
 	}
 
-- 
2.21.0

