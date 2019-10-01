Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8644FC3663
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2019 15:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388567AbfJANxz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Oct 2019 09:53:55 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40321 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbfJANxz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Oct 2019 09:53:55 -0400
Received: by mail-lj1-f195.google.com with SMTP id 7so13449950ljw.7
        for <linux-gpio@vger.kernel.org>; Tue, 01 Oct 2019 06:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gvBQeIEI/x9mXZQVwgqeZ7kaM6LzZwxLRjfLMfWieM8=;
        b=J83fHGTjCSsnD1rpKCckbThsAiZLaz7BVzauZaMZH8+lchnX36lKowk7qjMYE7ZEv1
         Qku5To+b/dbVZG5xuY7GWm4aftlo9M4Yz3Wriy0IvA4VQxyW84JY/IL0PFSrIvbL1fBB
         w2xbBUW/rqv4fJXsfMHiFtgiuQdeZKxkshbQResFrF2Ddb2gavWImZgr+fkPqOi1OMiE
         JeerwhtL60jma8sDEiEHeY/ZrxMeIklXF7AEySjNsf6CGZQbTACH5rTCctySiNTV50ka
         Y8dcxGFIAkzzJlO7fr40MrBVKAk2zRNSLQYiSQ+Fr5jwfc7OlMufup6gh3ZP0jUzglh2
         EOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gvBQeIEI/x9mXZQVwgqeZ7kaM6LzZwxLRjfLMfWieM8=;
        b=aXMQtLi+ffIe8paVtv05zCkTF7+IeS9rQS958srdPePaNPt4CgvoJETuLKtpzib00M
         BbryQ7v5dYVpERm3dyd5ZZVKY9rTpHLijh4xtvvB7z6Za0TsaIZoMdu4Cyiz+e1r5i4G
         h3t9rK0zetoyhHRWr92YBk8uWMepB+IQF6pz65qcb8Y8ydthG08+aSPzxI/znujxBamF
         W5pZrR/r9VteOfBDK7xOxyERGNwsAFwvaD7MQwLGBwj3IFkR6CyNShM9Hh896INLQYxt
         KAH39ew2wLF3/GrxTFO78IVs6I5HXa1nRKkNUP6uou6/8VQ+tTEs4xBUeJdlpPTfmzpE
         P0kA==
X-Gm-Message-State: APjAAAXDO3rxW7Icefjubpb3fb+pml6FHVazV8TpmRfA7ZVRZ8AUZihH
        BXfc2m4/TY5a7yT64Owkj6ZInOxWuVaQSA==
X-Google-Smtp-Source: APXvYqyZDaI0VtCasFRcQPlFjyYv/DYWdRbQW/uJWEUBYqm7b58A9uP4Pg9r3KzkcgPH6sjHqQj8BQ==
X-Received: by 2002:a2e:730a:: with SMTP id o10mr15969464ljc.214.1569938033179;
        Tue, 01 Oct 2019 06:53:53 -0700 (PDT)
Received: from localhost.localdomain (c-79c8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.200.121])
        by smtp.gmail.com with ESMTPSA id e19sm4024023lja.8.2019.10.01.06.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 06:53:52 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] pinctrl: st: Pass irqchip when adding gpiochip
Date:   Tue,  1 Oct 2019 15:51:47 +0200
Message-Id: <20191001135147.29416-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
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
conversion: the ST pin controller errors out of adding a
irqchip if the interrupt is invalid or missing or if the
irqmux is not present: the irqchip should not be added
if either of these errors happen, so rewrite the code to
deal with that. Keep the exit path where the gpio_chip
is added no matter what the status of the irq is.

Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-st.c | 53 ++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index 00db8b9efb2c..4f39a7945d01 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -1477,7 +1477,7 @@ static int st_gpiolib_register_bank(struct st_pinctrl *info,
 	struct device *dev = info->dev;
 	int bank_num = of_alias_get_id(np, "gpio");
 	struct resource res, irq_res;
-	int gpio_irq = 0, err;
+	int err;
 
 	if (of_address_to_resource(np, 0, &res))
 		return -ENODEV;
@@ -1500,12 +1500,6 @@ static int st_gpiolib_register_bank(struct st_pinctrl *info,
 	range->pin_base = range->base = range->id * ST_GPIO_PINS_PER_BANK;
 	range->npins = bank->gpio_chip.ngpio;
 	range->gc = &bank->gpio_chip;
-	err  = gpiochip_add_data(&bank->gpio_chip, bank);
-	if (err) {
-		dev_err(dev, "Failed to add gpiochip(%d)!\n", bank_num);
-		return err;
-	}
-	dev_info(dev, "%s bank added.\n", range->name);
 
 	/**
 	 * GPIO bank can have one of the two possible types of
@@ -1527,23 +1521,40 @@ static int st_gpiolib_register_bank(struct st_pinctrl *info,
 	 */
 
 	if (of_irq_to_resource(np, 0, &irq_res) > 0) {
-		gpio_irq = irq_res.start;
-		gpiochip_set_chained_irqchip(&bank->gpio_chip, &st_gpio_irqchip,
-					     gpio_irq, st_gpio_irq_handler);
-	}
+		struct gpio_irq_chip *girq;
+		int gpio_irq = irq_res.start;
 
-	if (info->irqmux_base || gpio_irq > 0) {
-		err = gpiochip_irqchip_add(&bank->gpio_chip, &st_gpio_irqchip,
-					   0, handle_simple_irq,
-					   IRQ_TYPE_NONE);
-		if (err) {
-			gpiochip_remove(&bank->gpio_chip);
-			dev_info(dev, "could not add irqchip\n");
-			return err;
+		/* This is not a valid IRQ */
+		if (gpio_irq <= 0) {
+			dev_err(dev, "invalid IRQ for %pOF bank\n", np);
+			goto skip_irq;
 		}
-	} else {
-		dev_info(dev, "No IRQ support for %pOF bank\n", np);
+		/* We need to have a mux as well */
+		if (!info->irqmux_base) {
+			dev_err(dev, "no irqmux for %pOF bank\n", np);
+			goto skip_irq;
+		}
+
+		girq = &bank->gpio_chip.irq;
+		girq->chip = &st_gpio_irqchip;
+		girq->parent_handler = st_gpio_irq_handler;
+		girq->num_parents = 1;
+		girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
+					     GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+		girq->parents[0] = gpio_irq;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_simple_irq;
+	}
+
+skip_irq:
+	err  = gpiochip_add_data(&bank->gpio_chip, bank);
+	if (err) {
+		dev_err(dev, "Failed to add gpiochip(%d)!\n", bank_num);
+		return err;
 	}
+	dev_info(dev, "%s bank added.\n", range->name);
 
 	return 0;
 }
-- 
2.21.0

