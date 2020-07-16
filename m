Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76E3922266E
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 17:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbgGPPFH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 11:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbgGPPFH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 11:05:07 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EA2BC061755
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 08:05:06 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id e4so7658730ljn.4
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 08:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J+OxNOTLiVGa1g6tnZA958aIio/Po1PuR8m/fLjdWtM=;
        b=boskjkiKg3uKyCnA6V8ZEYh1wzLXRr91mS4r5RyNiMUWU12jzKILdzv3VWIQuSREil
         f6Id6wa3hJq++ewpgZ8kTy4eB4tJdYoAO/MIjm/XSSbuTHh0VpKqkScJJ3b0/0T/0zkx
         g/8o5JI7qe4bVgL439fqwxNRmIli/gnkrP0MomeqzW205eZYZrnMeiI1fPNVK6Cpn6uE
         C9D7s6pZ+DMZ5BeTpc797sbZvnS4mBbDEkNgupILwOb9NWb3OgkEVyUc/iQiL5qxwcyE
         k9ni3uvWzRly+7w3/nDvE9x3sXtFcC9/dpiPrK/sKcg63766TKDkUkk3kATg7jL3quJJ
         GZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J+OxNOTLiVGa1g6tnZA958aIio/Po1PuR8m/fLjdWtM=;
        b=kLeA4qMRiISGcphwWqek3BTVp2fJ15UvRMSduAuBsfdppbPDM5lU7kZigQkKoXzvXt
         RQJZ/cDQAwGubIiBNWSsa1D3WOFR74QgBdqzhBZANyDoKwcDLsx4VO1gI2wXmhP4U3dn
         XG8iRsuE/2rop7hODBYp1+pPuLoSybaNnV1/1+t4edDvvaHyBtIBk9K1PHF2obdJEbOG
         UQtlgQhmPVEa4u1uBJaWsPIGQngBPpsss0PtmVpKuoYtQxTTJmy4Jz5ERerAzdJ0PHKJ
         FSz2OnReAOxm5hGV1gxbfkyKPOJkVYerx9hzctANjSIxe+bxzvqoeSuxtauOw4nGL/59
         px5g==
X-Gm-Message-State: AOAM5335KRfpvVfSSDsGAaeVvrvEO0XaPIW3fy8xYIg0ep75osoNueav
        uDGoFnoFlGMDbdSmH8PNaPeSUJvC9Jo=
X-Google-Smtp-Source: ABdhPJwW4Xq8bCZ2GRfSlOu5nk4l6JH3r9460lH/crz1HX3w/lCm8OkkvEGSd2M5roHQXw7HRzBRvA==
X-Received: by 2002:a2e:9e5a:: with SMTP id g26mr2373787ljk.207.1594911904804;
        Thu, 16 Jul 2020 08:05:04 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id n3sm1103073ljj.39.2020.07.16.08.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 08:05:04 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nikolaus Voss <nv@vosn.de>,
        Michael Hennerich <michael.hennerich@analog.com>
Subject: [PATCH] gpio: adp5588: Use irqchip template
Date:   Thu, 16 Jul 2020 17:05:02 +0200
Message-Id: <20200716150502.195821-1-linus.walleij@linaro.org>
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

Cc: Nikolaus Voss <nv@vosn.de>
Cc: Michael Hennerich <michael.hennerich@analog.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-adp5588.c | 39 +++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-adp5588.c b/drivers/gpio/gpio-adp5588.c
index 49f423d7beba..f1e4ac90e7d3 100644
--- a/drivers/gpio/gpio-adp5588.c
+++ b/drivers/gpio/gpio-adp5588.c
@@ -272,13 +272,24 @@ static irqreturn_t adp5588_irq_handler(int irq, void *devid)
 	return IRQ_HANDLED;
 }
 
+
+static int adp5588_irq_init_hw(struct gpio_chip *gc)
+{
+	struct adp5588_gpio *dev = gpiochip_get_data(gc);
+	/* Enable IRQs after registering chip */
+	adp5588_gpio_write(dev->client, CFG,
+			   ADP5588_AUTO_INC | ADP5588_INT_CFG | ADP5588_KE_IEN);
+
+	return 0;
+}
+
 static int adp5588_irq_setup(struct adp5588_gpio *dev)
 {
 	struct i2c_client *client = dev->client;
 	int ret;
 	struct adp5588_gpio_platform_data *pdata =
 			dev_get_platdata(&client->dev);
-	int irq_base = pdata ? pdata->irq_base : 0;
+	struct gpio_irq_chip *girq;
 
 	adp5588_gpio_write(client, CFG, ADP5588_AUTO_INC);
 	adp5588_gpio_write(client, INT_STAT, -1); /* status is W1C */
@@ -294,21 +305,19 @@ static int adp5588_irq_setup(struct adp5588_gpio *dev)
 			client->irq);
 		return ret;
 	}
-	ret = gpiochip_irqchip_add_nested(&dev->gpio_chip,
-					  &adp5588_irq_chip, irq_base,
-					  handle_simple_irq,
-					  IRQ_TYPE_NONE);
-	if (ret) {
-		dev_err(&client->dev,
-			"could not connect irqchip to gpiochip\n");
-		return ret;
-	}
-	gpiochip_set_nested_irqchip(&dev->gpio_chip,
-				    &adp5588_irq_chip,
-				    client->irq);
 
-	adp5588_gpio_write(client, CFG,
-		ADP5588_AUTO_INC | ADP5588_INT_CFG | ADP5588_KE_IEN);
+	/* This will be registered in the call to devm_gpiochip_add_data() */
+	girq = &dev->gpio_chip.irq;
+	girq->chip = &adp5588_irq_chip;
+	/* This will let us handle the parent IRQ in the driver */
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->first = pdata ? pdata->irq_base : 0;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_simple_irq;
+	girq->init_hw = adp5588_irq_init_hw;
+	girq->threaded = true;
 
 	return 0;
 }
-- 
2.26.2

