Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96ADFC8F35
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2019 19:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728284AbfJBRDP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 13:03:15 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38359 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728344AbfJBRDI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 13:03:08 -0400
Received: by mail-wr1-f68.google.com with SMTP id w12so20531693wro.5
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2019 10:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rDg/oCUqYEzccttXvMqYSX8GdnJPBKI6UdslmgaXVWA=;
        b=L6N9pRfdNKjGQZwKKv8C2r2Kf7vgpMl3rpb3wSFuKc2vo3d7dN/AYq+ui79H2Ivhn5
         FaPeKYR4Qu098ARC28xXad1oWZyt0DFoEVfa0GqN7hzDqPPRCewq5ubn6swDWIIOO6wk
         TLMB0LJDZBrkwJw0z2UXthD8cR1SzIOy6HzL7M8G8ZLxeZ2v9mXeZ9xvWPbmV8syw9oQ
         W0fE5/ZTjW0Z6PTKQ6VvRQXt+5PGyweQtH4LMoCriizkVvHC3DoWN9ssL24CwLuO0JKc
         maSflJD7MmHCsdQVoTxpIlWlkcgmZPpbULIJje+x4KJsYxwuXB5Dm7QbJNuNm9R6/3TX
         19aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rDg/oCUqYEzccttXvMqYSX8GdnJPBKI6UdslmgaXVWA=;
        b=fver1jh2wDkaZ3OnPKyzg+aKRCyybGyiVYdv3umRLP5SD80N2VKYhx1aF6d+pUTf6I
         5mWe/fLIiFJbmDXFg5GmR3uTRuEu4nq09f4bVaNE3KTo56dd/L/AczGvOigHNE2RIiqx
         hHjfsWrcb4Z/9abJDLCoG9jFZF34BiXO28Z4eCiIPUKWnR/NSJg/4hiCmFdgf1uvNKqU
         w3ac+Wb2LDCOzmSyPu4PxrbjyBiZQlRctXh3qtgwpHbX5kkVsLdAZPivX+111N5YGY2G
         hJUtU818l1H40f4ti39Z1jSK9Y8fl07/GMqGz7uH15iCMbthtYNCjztpIoaUC/KB5hOb
         Un6A==
X-Gm-Message-State: APjAAAUuPLFjPnrWsfTsA2+Fyzv/m/KL/ze2euGabek9uyZiblD5pFF1
        IND/JzPkkNFJtVZFsUwwBWUlgQ==
X-Google-Smtp-Source: APXvYqxjEIGXUeps2oiqIQsb5u8jH5layFZN3LcUfKmBM6o+rFVRX3XpVpwHi0PYv/f2FyJWbfV6og==
X-Received: by 2002:a5d:560a:: with SMTP id l10mr3625629wrv.387.1570035784721;
        Wed, 02 Oct 2019 10:03:04 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id b62sm11188575wmc.13.2019.10.02.10.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 10:03:04 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alban Bedel <albeu@free.fr>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 6/6] gpio: htc-egpio: remove redundant error message
Date:   Wed,  2 Oct 2019 19:02:49 +0200
Message-Id: <20191002170249.17366-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191002170249.17366-1-brgl@bgdev.pl>
References: <20191002170249.17366-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

There's no need to emit an error message on probe failure unless we're
printing some meaningful info. Otherwise the core driver code will
inform us about a probe error. Also: the driver currently drops info
about errors propagated from called functions by default to returning
-EINVAL. This fixes it as well.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-htc-egpio.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-htc-egpio.c b/drivers/gpio/gpio-htc-egpio.c
index 2d4b0b888f66..8aa23d70b1e6 100644
--- a/drivers/gpio/gpio-htc-egpio.c
+++ b/drivers/gpio/gpio-htc-egpio.c
@@ -265,7 +265,6 @@ static int __init egpio_probe(struct platform_device *pdev)
 	struct gpio_chip  *chip;
 	unsigned int      irq, irq_end;
 	int               i;
-	int               ret;
 
 	/* Initialize ei data structure. */
 	ei = devm_kzalloc(&pdev->dev, sizeof(*ei), GFP_KERNEL);
@@ -275,7 +274,6 @@ static int __init egpio_probe(struct platform_device *pdev)
 	spin_lock_init(&ei->lock);
 
 	/* Find chained irq */
-	ret = -EINVAL;
 	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (res)
 		ei->chained_irq = res->start;
@@ -283,15 +281,17 @@ static int __init egpio_probe(struct platform_device *pdev)
 	/* Map egpio chip into virtual address space. */
 	ei->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ei->base_addr))
-		goto fail;
+		return PTR_ERR(ei->base_addr);
 
 	if ((pdata->bus_width != 16) && (pdata->bus_width != 32))
-		goto fail;
+		return -EINVAL;
+
 	ei->bus_shift = fls(pdata->bus_width - 1) - 3;
 	pr_debug("bus_shift = %d\n", ei->bus_shift);
 
 	if ((pdata->reg_width != 8) && (pdata->reg_width != 16))
-		goto fail;
+		return -EINVAL;
+
 	ei->reg_shift = fls(pdata->reg_width - 1);
 	pr_debug("reg_shift = %d\n", ei->reg_shift);
 
@@ -303,10 +303,9 @@ static int __init egpio_probe(struct platform_device *pdev)
 	ei->chip = devm_kcalloc(&pdev->dev,
 				ei->nchips, sizeof(struct egpio_chip),
 				GFP_KERNEL);
-	if (!ei->chip) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	if (!ei->chip)
+		return -ENOMEM;
+
 	for (i = 0; i < ei->nchips; i++) {
 		ei->chip[i].reg_start = pdata->chip[i].reg_start;
 		ei->chip[i].cached_values = pdata->chip[i].initial_values;
@@ -316,10 +315,9 @@ static int __init egpio_probe(struct platform_device *pdev)
 		chip->label = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 					     "htc-egpio-%d",
 					     i);
-		if (!chip->label) {
-			ret = -ENOMEM;
-			goto fail;
-		}
+		if (!chip->label)
+			return -ENOMEM;
+
 		chip->parent          = &pdev->dev;
 		chip->owner           = THIS_MODULE;
 		chip->get             = egpio_get;
@@ -361,10 +359,6 @@ static int __init egpio_probe(struct platform_device *pdev)
 	}
 
 	return 0;
-
-fail:
-	printk(KERN_ERR "EGPIO failed to setup\n");
-	return ret;
 }
 
 #ifdef CONFIG_PM
-- 
2.23.0

