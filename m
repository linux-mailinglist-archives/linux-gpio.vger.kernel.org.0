Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 731AA223F5E
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 17:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgGQPUB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 11:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgGQPUA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 11:20:00 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A504C0619D2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 08:20:00 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id t9so6270526lfl.5
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 08:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gUPQSKXtCUiRyZ102tLc5f9L6nxfRWPT+c4Gx3EIEjQ=;
        b=twb1HFBSwMnfWeOUFLso8EePXWe2LAHtxztcH/Ch5x8nihpPG4Tixy500FYEScHFLF
         sXmjXYR3SQmzgNfP5wX4F/M6r9Q5ot72Q12zN7Dr/dtTgOm1lPyTS9xIcJtRFMXqHK0N
         GWEJ42VaN1XXTzNecUTBOZwwS/3EQ7Yie2AK3Kv19eEFhIwuYTa1RUSVoC3tdrjSv/Bh
         RTDV9nqGU5dKdhE6B9Cz4GJzQyepnuUY1AHmgxKruhVWIamRoZl7NefYP1H6LZ+snwUO
         Gl9jREhjTOyBdNn/6Q0Oh4ylGOe69BQyUuZC6DShCNgYnKu+h04Yisp+BE004C/MLXz6
         pnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gUPQSKXtCUiRyZ102tLc5f9L6nxfRWPT+c4Gx3EIEjQ=;
        b=HHXXXGa+FYYvbRRn/aYvYRn1CxQNPk2gkM0K5082HAG4w0br3BCDv/I7e7RZiHC7ME
         if8T9NFq/Nmb71WBPhEAWkab27dOtwLl0vpghX9EoFxVfPyRs6UZDQiIPDXx/B7AFeEL
         W6G3Bi8/kfGKUeB7cbi8aTS+7WLah74VFGzziAOqthcIVM+C8STaUR+DBNtjDcM4fGna
         BZg5LGFCSQT82BF5YNB9iPNQV8O4FQgPGTSe7um5LuirEY+TPzgjRhhVOmb1tZxEPvvV
         SfYuRDHJ0g5KbOhdgP7zB+AFf+MxPXzo78dz3UnMdH+S5j3kcxVqcRsZAm/GgYKmQhGI
         MZyg==
X-Gm-Message-State: AOAM530zM3do3SpbgcUtoVdbOcordcvAAGCZw/n1fY8ZvbbUQARyv0/3
        Qg8L2nSMtF05OE6rXeolbUs5zoF5I44=
X-Google-Smtp-Source: ABdhPJzl/HgM5v7y5B30vpaCbvrtrYbiqPWnwVtJ9DYCg5JgUXtBtUJPOU+gNnIs2sIgWaSu6PBsSA==
X-Received: by 2002:a05:6512:3047:: with SMTP id b7mr4970058lfb.110.1594999198274;
        Fri, 17 Jul 2020 08:19:58 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id a17sm1709981lji.5.2020.07.17.08.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 08:19:57 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bin Gao <bin.gao@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] gpio: wcove: Use irqchip template
Date:   Fri, 17 Jul 2020 17:19:55 +0200
Message-Id: <20200717151955.159819-1-linus.walleij@linaro.org>
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

Cc: Bin Gao <bin.gao@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Same notices as on the Crystalcove: this one I actually
managed to compiletest properly.
---
 drivers/gpio/gpio-wcove.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index 8b481b3c1ebe..135645096575 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -400,6 +400,7 @@ static int wcove_gpio_probe(struct platform_device *pdev)
 	struct wcove_gpio *wg;
 	int virq, ret, irq;
 	struct device *dev;
+	struct gpio_irq_chip *girq;
 
 	/*
 	 * This gpio platform device is created by a mfd device (see
@@ -442,19 +443,6 @@ static int wcove_gpio_probe(struct platform_device *pdev)
 	wg->dev = dev;
 	wg->regmap = pmic->regmap;
 
-	ret = devm_gpiochip_add_data(dev, &wg->chip, wg);
-	if (ret) {
-		dev_err(dev, "Failed to add gpiochip: %d\n", ret);
-		return ret;
-	}
-
-	ret = gpiochip_irqchip_add_nested(&wg->chip, &wcove_irqchip, 0,
-					  handle_simple_irq, IRQ_TYPE_NONE);
-	if (ret) {
-		dev_err(dev, "Failed to add irqchip: %d\n", ret);
-		return ret;
-	}
-
 	virq = regmap_irq_get_virq(wg->regmap_irq_chip, irq);
 	if (virq < 0) {
 		dev_err(dev, "Failed to get virq by irq %d\n", irq);
@@ -468,7 +456,21 @@ static int wcove_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	gpiochip_set_nested_irqchip(&wg->chip, &wcove_irqchip, virq);
+	girq = &wg->chip.irq;
+	girq->chip = &wcove_irqchip;
+	/* This will let us handle the parent IRQ in the driver */
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_simple_irq;
+	girq->threaded = true;
+
+	ret = devm_gpiochip_add_data(dev, &wg->chip, wg);
+	if (ret) {
+		dev_err(dev, "Failed to add gpiochip: %d\n", ret);
+		return ret;
+	}
 
 	/* Enable GPIO0 interrupts */
 	ret = regmap_update_bits(wg->regmap, IRQ_MASK_BASE, GPIO_IRQ0_MASK,
-- 
2.26.2

