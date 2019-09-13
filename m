Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB44B1C72
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2019 13:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728312AbfIMLfo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 07:35:44 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40446 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727997AbfIMLfo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2019 07:35:44 -0400
Received: by mail-lj1-f195.google.com with SMTP id 7so26722278ljw.7
        for <linux-gpio@vger.kernel.org>; Fri, 13 Sep 2019 04:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w9fEQCsJxJRtCSmdQt5g3lXraTG5twe5gH5I2a/g70s=;
        b=Bx9auY4Q3guRMod2775tCeixOoq5q/yKUCLLJwup/z4ikpAfXHNNdPs/GjtUBUwPaM
         3llzndW7ISKVxqa3svRZzV+tQ3FccGDs9WBwKExSd6OsBz3eRZmi39Oi9u012cwvQ5gJ
         DPNVSQiujOL4XJOsOhywiTB6HKRm0+D0KSyk370Hiyy/JEawPi2Zu7mg2pBNMARtbvoE
         7NvtTKu8JNJKikInL/WibchMWDJZU3PK84QfxX0HODN6jSLD0MSontiJmftKMxiurdH5
         rdaRizfX6D8vxbOfJyJrA13X9W7+OpXHzepVEM9WyGwOVU0LzRrWL3NECtKF6Qo9v69K
         74lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w9fEQCsJxJRtCSmdQt5g3lXraTG5twe5gH5I2a/g70s=;
        b=lva8fLvuTA3oGGlyIk+EzKuMW2j6HA76xmpQP9/hrK6E9SCXiPbMZBr+1fiVlAJ53Q
         xy+cOFr/I+P0BzcQynnZocKj8/IftRUEwpi4YOgqoMn9J28Erm5XA/d0D+JKkXU+9I59
         0/1CCFPfUSa2YEJP7KcLPhs/C3dJZhRoWZDkwvs00yQYxWKqgT9YGAjVjoBNLnu2sTE/
         IIF51M3iaqvY5IggUabe+ZwU5k5KrUm1ZL5LYfeKlOIG7kRm2ldjRsq4LIa7VycxF9LA
         d5IHXLaJF1avbmjwtnkFkK89iNILsYe1/a2ag3QvFejr4fubxCD+OdtzPWaYnpHTjJj9
         hEBQ==
X-Gm-Message-State: APjAAAUmq+lKrUpNF7vwoZJnNtZLmA6yK4UiwFMhYUHkaILHei8t9oQE
        JPZNdizNXvLp3CqWjcIcOWsTIiIZJben0xOf
X-Google-Smtp-Source: APXvYqzrgfrpDU8Ff7QunYXe1p++sc8b1YPnWsy7c31lG7qUsYlalGcKFgHIkkre+J9BA+AqY2JFXA==
X-Received: by 2002:a2e:9250:: with SMTP id v16mr18855229ljg.199.1568374541183;
        Fri, 13 Sep 2019 04:35:41 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id v17sm6177440ljh.8.2019.09.13.04.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 04:35:40 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 3/6] pinctrl: spear/plgpio: Pass irqchip when adding gpiochip
Date:   Fri, 13 Sep 2019 13:35:27 +0200
Message-Id: <20190913113530.5536-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190913113530.5536-1-linus.walleij@linaro.org>
References: <20190913113530.5536-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We need to convert all old gpio irqchips to pass the irqchip
setup along when adding the gpio_chip. For more info see
drivers/gpio/TODO.

For chained irqchips this is a pretty straight-forward
conversion.

Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/spear/pinctrl-plgpio.c | 47 ++++++++++++--------------
 1 file changed, 21 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
index 9d906474f3e4..c4c9a2971445 100644
--- a/drivers/pinctrl/spear/pinctrl-plgpio.c
+++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
@@ -569,40 +569,35 @@ static int plgpio_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = gpiochip_add_data(&plgpio->chip, plgpio);
-	if (ret) {
-		dev_err(&pdev->dev, "unable to add gpio chip\n");
-		goto unprepare_clk;
-	}
-
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_info(&pdev->dev, "PLGPIO registered without IRQs\n");
-		return 0;
+	if (irq > 0) {
+		struct gpio_irq_chip *girq;
+
+		girq = &plgpio->chip.irq;
+		girq->chip = &plgpio_irqchip;
+		girq->parent_handler = plgpio_irq_handler;
+		girq->num_parents = 1;
+		girq->parents = devm_kcalloc(&pdev->dev, 1,
+					     sizeof(*girq->parents),
+					     GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+		girq->parents[0] = irq;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_simple_irq;
+		dev_info(&pdev->dev, "PLGPIO registering with IRQs\n");
+	} else {
+		dev_info(&pdev->dev, "PLGPIO registering without IRQs\n");
 	}
 
-	ret = gpiochip_irqchip_add(&plgpio->chip,
-				   &plgpio_irqchip,
-				   0,
-				   handle_simple_irq,
-				   IRQ_TYPE_NONE);
+	ret = gpiochip_add_data(&plgpio->chip, plgpio);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to add irqchip to gpiochip\n");
-		goto remove_gpiochip;
+		dev_err(&pdev->dev, "unable to add gpio chip\n");
+		goto unprepare_clk;
 	}
 
-	gpiochip_set_chained_irqchip(&plgpio->chip,
-				     &plgpio_irqchip,
-				     irq,
-				     plgpio_irq_handler);
-
-	dev_info(&pdev->dev, "PLGPIO registered with IRQs\n");
-
 	return 0;
 
-remove_gpiochip:
-	dev_info(&pdev->dev, "Remove gpiochip\n");
-	gpiochip_remove(&plgpio->chip);
 unprepare_clk:
 	if (!IS_ERR(plgpio->clk))
 		clk_unprepare(plgpio->clk);
-- 
2.21.0

