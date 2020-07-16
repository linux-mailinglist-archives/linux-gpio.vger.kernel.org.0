Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77C5022221D
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 14:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbgGPMDX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 08:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgGPMDX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 08:03:23 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCF94C061755
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 05:03:22 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id s9so6800501ljm.11
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 05:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pm90CMDs5KAJRgf5IT/u/TpwXqN+8gJ40rj0jB1tHi8=;
        b=EWpjMRqc1Oyp5cvqbT8tnnj1NGXI61gKswFRMeb68LRB10x4KdJlIWvNd9FqM/9ILq
         gKJg8V0dPKFONEzU/hzo93jyMGMoxUX1SJwAlijdG6ba1/d7p6zZgxU17ANSUe7KK7Mh
         DjdHHBYsxeH5OgXy3xetuyBkHOSoFFlD/7971yo4JXh/v9ayQORT4h48zmZrBcCAezMz
         w/390KYGbQYyIETjGBXNdRpG7K2VGUBCkU/whXgN73yekcjfxAMJbJU6nbkMSoPk+p02
         XNlN/oIopf8OtBVooon1+nU5HAclBhQzkWQnN8gJaXOhlkMx8rUBrnS23h2HvPy8J9rO
         JcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pm90CMDs5KAJRgf5IT/u/TpwXqN+8gJ40rj0jB1tHi8=;
        b=t7sbgoo2+axvkCBpOHE8QZQOv2M/uiRc/LKQxDaGRfni1qjb2mhUVbiG9TcExvtMwc
         Nm7OqojSksYwOKVLrROlsa+cI+R5VfNDlrd4a0POuK1JnrNp+nfl8bA8aldzv0l6b9mL
         NWQwLThmVQMkuX2HNwviSDIMayWaNC8GOZg80Y4i+jzwVbfGFtRMrmoQSTZqi1QqlVJd
         mHyftnJa+TSx5JSakbPL5oWOUc+QPVqzq9LEK2HnN3R3nLo/hT8AWc2dfTzuZJlDeZzw
         JpOTuX3K3cOFA2pYPzknxSu4R1o8aHUA/7ZDZ4NQOoTrmxA9q4K8WxyOAab3XolO3H0s
         2JBw==
X-Gm-Message-State: AOAM531a3NWqO79SVpQ/LXCFb7Uxs3VPEOmt6Ua+2+mC5Z1QcoPAmnlV
        DxensKjlhzXpwNYwWnird8uuZw77UE4=
X-Google-Smtp-Source: ABdhPJwtjwlAduFuYjC18hLw9srXEcs08SWkPIMlYb8C6YEgg4vCBGMsU/ybV0qbNCqdDUT4rXIC6w==
X-Received: by 2002:a2e:b054:: with SMTP id d20mr1755871ljl.55.1594901001028;
        Thu, 16 Jul 2020 05:03:21 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id v5sm998402lji.75.2020.07.16.05.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 05:03:20 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Roland Stigge <stigge@antcom.de>,
        Lars Poeschel <poeschel@lemonage.de>
Subject: [PATCH] gpio: adnp: Use irqchip template
Date:   Thu, 16 Jul 2020 14:03:18 +0200
Message-Id: <20200716120318.127176-1-linus.walleij@linaro.org>
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

Cc: Roland Stigge <stigge@antcom.de>
Cc: Lars Poeschel <poeschel@lemonage.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-adnp.c | 95 ++++++++++++++++++++--------------------
 1 file changed, 48 insertions(+), 47 deletions(-)

diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index b9fcaab2a931..8eedfc6451df 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -238,36 +238,6 @@ static void adnp_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	mutex_unlock(&adnp->i2c_lock);
 }
 
-static int adnp_gpio_setup(struct adnp *adnp, unsigned int num_gpios)
-{
-	struct gpio_chip *chip = &adnp->gpio;
-	int err;
-
-	adnp->reg_shift = get_count_order(num_gpios) - 3;
-
-	chip->direction_input = adnp_gpio_direction_input;
-	chip->direction_output = adnp_gpio_direction_output;
-	chip->get = adnp_gpio_get;
-	chip->set = adnp_gpio_set;
-	chip->can_sleep = true;
-
-	if (IS_ENABLED(CONFIG_DEBUG_FS))
-		chip->dbg_show = adnp_gpio_dbg_show;
-
-	chip->base = -1;
-	chip->ngpio = num_gpios;
-	chip->label = adnp->client->name;
-	chip->parent = &adnp->client->dev;
-	chip->of_node = chip->parent->of_node;
-	chip->owner = THIS_MODULE;
-
-	err = devm_gpiochip_add_data(&adnp->client->dev, chip, adnp);
-	if (err)
-		return err;
-
-	return 0;
-}
-
 static irqreturn_t adnp_irq(int irq, void *data)
 {
 	struct adnp *adnp = data;
@@ -464,18 +434,54 @@ static int adnp_irq_setup(struct adnp *adnp)
 		return err;
 	}
 
-	err = gpiochip_irqchip_add_nested(chip,
-					  &adnp_irq_chip,
-					  0,
-					  handle_simple_irq,
-					  IRQ_TYPE_NONE);
-	if (err) {
-		dev_err(chip->parent,
-			"could not connect irqchip to gpiochip\n");
-		return err;
+	return 0;
+}
+
+static int adnp_gpio_setup(struct adnp *adnp, unsigned int num_gpios,
+			   bool is_irq_controller)
+{
+	struct gpio_chip *chip = &adnp->gpio;
+	int err;
+
+	adnp->reg_shift = get_count_order(num_gpios) - 3;
+
+	chip->direction_input = adnp_gpio_direction_input;
+	chip->direction_output = adnp_gpio_direction_output;
+	chip->get = adnp_gpio_get;
+	chip->set = adnp_gpio_set;
+	chip->can_sleep = true;
+
+	if (IS_ENABLED(CONFIG_DEBUG_FS))
+		chip->dbg_show = adnp_gpio_dbg_show;
+
+	chip->base = -1;
+	chip->ngpio = num_gpios;
+	chip->label = adnp->client->name;
+	chip->parent = &adnp->client->dev;
+	chip->of_node = chip->parent->of_node;
+	chip->owner = THIS_MODULE;
+
+	if (is_irq_controller) {
+		struct gpio_irq_chip *girq;
+
+		err = adnp_irq_setup(adnp);
+		if (err)
+			return err;
+
+		girq = &chip->irq;
+		girq->chip = &adnp_irq_chip;
+		/* This will let us handle the parent IRQ in the driver */
+		girq->parent_handler = NULL;
+		girq->num_parents = 0;
+		girq->parents = NULL;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_simple_irq;
+		girq->threaded = true;
 	}
 
-	gpiochip_set_nested_irqchip(chip, &adnp_irq_chip, adnp->client->irq);
+	err = devm_gpiochip_add_data(&adnp->client->dev, chip, adnp);
+	if (err)
+		return err;
 
 	return 0;
 }
@@ -503,16 +509,11 @@ static int adnp_i2c_probe(struct i2c_client *client,
 	mutex_init(&adnp->i2c_lock);
 	adnp->client = client;
 
-	err = adnp_gpio_setup(adnp, num_gpios);
+	err = adnp_gpio_setup(adnp, num_gpios,
+			of_property_read_bool(np, "interrupt-controller"));
 	if (err)
 		return err;
 
-	if (of_find_property(np, "interrupt-controller", NULL)) {
-		err = adnp_irq_setup(adnp);
-		if (err)
-			return err;
-	}
-
 	i2c_set_clientdata(client, adnp);
 
 	return 0;
-- 
2.26.2

