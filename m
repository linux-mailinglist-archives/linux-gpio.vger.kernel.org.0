Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 750AA228186
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 16:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbgGUOB6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 10:01:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbgGUOB6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 10:01:58 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC027C061794
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 07:01:57 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id b30so9444394lfj.12
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 07:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zfFskMNtglDTQfBBXBTFkB3EO8hjOPBd0mwqDur9izY=;
        b=unByUORwpDe58ka9VTTmpLdpZrw/vxiO6uzNq3h9vdG3Sv0PkvMz/RmtsiHFCADtMh
         Gi97zLhuvAsYRmBWVQgG2Gt9LvZyq/0iFcZx6D3W11vAGu20JEKZvmJQah/6BNpjrB0h
         HI+oVnQo2e+8jVUUmodblD3pX/k9YUN59crIborYSl7fZrcvEKKEGqHQzB6r2JAeuXfE
         khMnXfGoQtDVRQlBko1ugctOG11W4iG00HdKnsroMltF9Ri8zHRdy5CGjo1ziraCJ9ym
         e3t1RlZ7EC+y+bDc7SJCYEU0HGCSU2/YCsJX+RxV2qiHUCXjiidCq1GUJMK99MMTW2Hz
         2JeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zfFskMNtglDTQfBBXBTFkB3EO8hjOPBd0mwqDur9izY=;
        b=fqBpOZczT4/U8gMHhp8AJEfQDvN3qXpEYyPLQkdzh9jMH9fJiv3OLFKs9/cAvAM1PI
         gWK9bUb7pwd9vc5JuqGqe22FUNPJEXtbPAep88Zlp4Fkleb96O71U/LoPaojLnM4uGDR
         pkEEeYdLk0dJ/hiXSdPlthlGcMbHNezPno423rrhD4RDxVhTiTKtpuPu1WSxqUJYfmve
         gn+2yANfa2yPfEkT0hMHDsXVeTpLM3+JMfbwZAblMkgjfIj9hxDXy3+wEcSzlH8Pm+Jp
         40NgKV4Mq/Hy1M4EIf8BPXD+IcBZ4buIrFcY5Z/ClDkvnDcpaD14/B76pRota6uDhhB4
         TL+A==
X-Gm-Message-State: AOAM53350o0K4FhOHkcjLuKKbxJlpa1sIa2s4Y1W1Te73jxCS8TrWIL8
        htshvV3VujSC9Wgk3AuUYotl5P17jxM=
X-Google-Smtp-Source: ABdhPJxfpNNhW7ljKRWR6QDU4hW99Bqx9Qw9fXNG3Ig76ifa4LUmFyZXustR7UMwHjGprweKmPpNAA==
X-Received: by 2002:a05:6512:36cf:: with SMTP id e15mr5093821lfs.149.1595340116049;
        Tue, 21 Jul 2020 07:01:56 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id z12sm5365983lfh.61.2020.07.21.07.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 07:01:55 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2] gpio: crystalcove: Use irqchip template
Date:   Tue, 21 Jul 2020 16:01:53 +0200
Message-Id: <20200721140153.369171-1-linus.walleij@linaro.org>
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
ChangeLog v1->V2:
- Fixed a variable name ch->cg
---
 drivers/gpio/gpio-crystalcove.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
index 14d1f4c933b6..39349b0e6923 100644
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
+	girq = &cg->chip.irq;
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

