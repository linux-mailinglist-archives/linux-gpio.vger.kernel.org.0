Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 651BF223A7C
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 13:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgGQL0E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 07:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbgGQL0D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 07:26:03 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18045C061755
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 04:26:03 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id b30so3521511lfj.12
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 04:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bt59HKheyTxoXzQJ/xPcbcWq/abnlQE824df0liByqo=;
        b=DL+svgVw0/nazsfCWOX8Vg9qHVtXcih/vq17oyPuEW2aSQrg6RdnFifdA8IFqufRAi
         S5vsZ6ueykUxEcx6gyf0a8FiF5D1hgLkgULTuoWn35h6r/b17vXQyHSagoioL6QQEI4X
         Q+4KCIx3PWtnJvgKlFcGxu6OLu7OBljylh+skt/nDxIGfnQhfu+vX0lqE93hn7r5FtUs
         s9kUGg23D7SiYzUb7JplL/1/ipkgg3dmpUn62GlU9XU0Y7KvqMDmGVFVJA3Zuo0k386G
         XzYsaPl/lvYxYQmTH8QOVHw6l3AbMFJmxzaPjQDuNX61NfCuG+yhBjE8MLWQp3uPBSvg
         QlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bt59HKheyTxoXzQJ/xPcbcWq/abnlQE824df0liByqo=;
        b=MF6sGORH8QNEvyCHmSAnmVZiugK1QwjgEUT2zOc/grLPPU2G2lU++HbFd5JK50jO16
         IFjRSNKnefuUo7dTc3pKpKJDZ5bADbHBHoNp8FYpi1JT4TXPFPgRdhsdg0DdQyZt16rg
         OFeZvEJ20mJUTkRUezvwW3eHUW3t0YoVwWVodE1CKXvER5jlqZjUXf4eKQL5IK5AdAOs
         vUya6UeoYz+K+ZK//EezKK3W4RPqKA4IhhC4RNMfmaX4idKIYo3HHmC8yFGyqOXDlS1R
         wCDiQzOWevHXs2+Mkr8o4pGG2M4T4uRSXRFjHyCfvEvc3s195s/6WZHU/gZM0YftKtRj
         lPHw==
X-Gm-Message-State: AOAM53257zgERL/RsMG0jUIJx5s3DNrGcxaalV39vt/pcij8+UFJzx/+
        1eF941x9o2i4zQGOehPWmJvlQrpUFqo=
X-Google-Smtp-Source: ABdhPJywTm6aL9z/9Pz24zXLAfpviJWdcynU8xlvYAQinOegN+gw6Cge74AI96DE78zcSv8KT1uNUA==
X-Received: by 2002:a05:6512:691:: with SMTP id t17mr4426014lfe.44.1594985161353;
        Fri, 17 Jul 2020 04:26:01 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id l26sm1600553ljc.131.2020.07.17.04.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 04:26:00 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] gpio: crystalcove: Use irqchip template
Date:   Fri, 17 Jul 2020 13:25:58 +0200
Message-Id: <20200717112558.15960-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This makes the driver use the irqchip template to assign
properties to the gpio_irq_chip instead of using the
explicit calls to gpiochip_irqchip_add_nested() and
gpiochip_set_nested_irqchip(). The irqchip is instead
added while adding the gpiochip.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Intel folks and Hans: I hope someone can test this, I'm
a bit uncertain if IRQs could fire before registering
the chip and if we need a hw_init() in this driver to cope.
---
 drivers/gpio/gpio-crystalcove.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
index 14d1f4c933b6..424a00ba1c97 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -330,6 +330,7 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
 	int retval;
 	struct device *dev = pdev->dev.parent;
 	struct intel_soc_pmic *pmic = dev_get_drvdata(dev);
+	struct gpio_irq_chip *girq;
 
 	if (irq < 0)
 		return irq;
@@ -353,14 +354,15 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
 	cg->chip.dbg_show = crystalcove_gpio_dbg_show;
 	cg->regmap = pmic->regmap;
 
-	retval = devm_gpiochip_add_data(&pdev->dev, &cg->chip, cg);
-	if (retval) {
-		dev_warn(&pdev->dev, "add gpio chip error: %d\n", retval);
-		return retval;
-	}
-
-	gpiochip_irqchip_add_nested(&cg->chip, &crystalcove_irqchip, 0,
-				    handle_simple_irq, IRQ_TYPE_NONE);
+	girq = &ch->chip.irq;
+	girq->chip = &crystalcove_irqchip;
+	/* This will let us handle the parent IRQ in the driver */
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_simple_irq;
+	girq->threaded = true;
 
 	retval = request_threaded_irq(irq, NULL, crystalcove_gpio_irq_handler,
 				      IRQF_ONESHOT, KBUILD_MODNAME, cg);
@@ -370,7 +372,11 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
 		return retval;
 	}
 
-	gpiochip_set_nested_irqchip(&cg->chip, &crystalcove_irqchip, irq);
+	retval = devm_gpiochip_add_data(&pdev->dev, &cg->chip, cg);
+	if (retval) {
+		dev_warn(&pdev->dev, "add gpio chip error: %d\n", retval);
+		return retval;
+	}
 
 	return 0;
 }
-- 
2.26.2

