Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9748A12BFE2
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Dec 2019 02:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbfL2BdU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 28 Dec 2019 20:33:20 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45943 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726378AbfL2BdU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Dec 2019 20:33:20 -0500
Received: by mail-lf1-f65.google.com with SMTP id 203so23088199lfa.12
        for <linux-gpio@vger.kernel.org>; Sat, 28 Dec 2019 17:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oxOgqhMXtymlKCx9sWdDrZQ1p0DDEV4Iw4JHMohGHtg=;
        b=TtTxV8fQD9Irm82p/Y2p8yCZp8HU8E7LZlrKF0zkg3Boqqd20yy9SqLIZdAtjEjAAz
         QEqX7N+ZEpS6FVOX/SlsvMT4e/oK5/LbN+H6Y6M4E64z5Fe5uv0o+S5lUnY7mJ7wS920
         e1iu1HqcID7kb/y3h94ZRNfFfZ8qx5FC88CMU72HY+Pe6V2xqIYjnuqG9OcRAMb6telG
         8Z5xhKkm5BXzaCxR3NLkAzAmMlR44CdRVFrOBC88NCaljw1OIx6O9Kj+i/NlMb1QpIjw
         vHhbXpdpZFbKFd0vxqT2cpRDLiq2/ftDgi40+Yq26ki1cuI/T45Fug/qe6p0HdF8mXFY
         OQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oxOgqhMXtymlKCx9sWdDrZQ1p0DDEV4Iw4JHMohGHtg=;
        b=AcoKcQReZQ+xGRHR9DodncRW/yiLVAqsU5fdLqPSnnY6cNF9uYEcnYlVDxaZJqSfI4
         QpZFJz2sbn8gIcYsf72CWXspYOGRrKVmHE64IVjffwLrvcCwIlxqK1c7zyVh0dKuW3Et
         kZAsSKnDkqOlHOus8lPxnCz/xsYMp07b+uBjQ2VOmFRbGLoo8U4clyp7fs9mFv8InASq
         8J5CbX4xrQh3QBAjF391mIGqFD6NaZknhXoPFAmvOOElUO+/b50KdecdC83lax5au6fl
         elp0RxVKesYLa184S8T0yrGZU2RwiDHRVcK0Un8NVInPckYeQfDypaAtujNYTi55+2EE
         YnDg==
X-Gm-Message-State: APjAAAUllhBQ4BBsQ2l0v5CEQE4LuM4zKC/nNexo5fZMHtVdeaMI62Je
        YAa5W+Fo5mGYUPodXEvcwvyD/g==
X-Google-Smtp-Source: APXvYqzEiHGahLxXrtb4lwCmMarvZXcYbTlKjJX1BYBK1fxnGrBVJlCriV93zhSGGNv7N0KW1CI54g==
X-Received: by 2002:ac2:5468:: with SMTP id e8mr33443651lfn.113.1577583197756;
        Sat, 28 Dec 2019 17:33:17 -0800 (PST)
Received: from localhost.localdomain (c-5ac9225c.014-348-6c756e10.bbcust.telenor.se. [92.34.201.90])
        by smtp.gmail.com with ESMTPSA id i4sm15350327ljg.102.2019.12.28.17.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2019 17:33:16 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: intel: Pass irqchip when adding gpiochip
Date:   Sun, 29 Dec 2019 02:30:59 +0100
Message-Id: <20191229013059.495767-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We need to convert all old gpio irqchips to pass the irqchip
setup along when adding the gpio_chip. For more info see
drivers/gpio/TODO.

Set up the pin ranges using the new callback.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 61 +++++++++++++++------------
 1 file changed, 35 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 4860bc9a4e48..ffacd77861f7 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1160,8 +1160,8 @@ static irqreturn_t intel_gpio_irq(int irq, void *data)
 	return ret;
 }
 
-static int intel_gpio_add_pin_ranges(struct intel_pinctrl *pctrl,
-				     const struct intel_community *community)
+static int intel_gpio_add_community_ranges(struct intel_pinctrl *pctrl,
+				const struct intel_community *community)
 {
 	int ret = 0, i;
 
@@ -1181,6 +1181,24 @@ static int intel_gpio_add_pin_ranges(struct intel_pinctrl *pctrl,
 	return ret;
 }
 
+static int intel_gpio_add_pin_ranges(struct gpio_chip *gc)
+{
+	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
+	int ret, i;
+
+	for (i = 0; i < pctrl->ncommunities; i++) {
+		struct intel_community *community = &pctrl->communities[i];
+
+		ret = intel_gpio_add_community_ranges(pctrl, community);
+		if (ret) {
+			dev_err(pctrl->dev, "failed to add GPIO pin range\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static unsigned int intel_gpio_ngpio(const struct intel_pinctrl *pctrl)
 {
 	const struct intel_community *community;
@@ -1205,7 +1223,8 @@ static unsigned int intel_gpio_ngpio(const struct intel_pinctrl *pctrl)
 
 static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 {
-	int ret, i;
+	int ret;
+	struct gpio_irq_chip *girq;
 
 	pctrl->chip = intel_gpio_chip;
 
@@ -1214,6 +1233,7 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 	pctrl->chip.label = dev_name(pctrl->dev);
 	pctrl->chip.parent = pctrl->dev;
 	pctrl->chip.base = -1;
+	pctrl->chip.add_pin_ranges = intel_gpio_add_pin_ranges;
 	pctrl->irq = irq;
 
 	/* Setup IRQ chip */
@@ -1225,26 +1245,9 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 	pctrl->irqchip.irq_set_wake = intel_gpio_irq_wake;
 	pctrl->irqchip.flags = IRQCHIP_MASK_ON_SUSPEND;
 
-	ret = devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
-	if (ret) {
-		dev_err(pctrl->dev, "failed to register gpiochip\n");
-		return ret;
-	}
-
-	for (i = 0; i < pctrl->ncommunities; i++) {
-		struct intel_community *community = &pctrl->communities[i];
-
-		ret = intel_gpio_add_pin_ranges(pctrl, community);
-		if (ret) {
-			dev_err(pctrl->dev, "failed to add GPIO pin range\n");
-			return ret;
-		}
-	}
-
 	/*
-	 * We need to request the interrupt here (instead of providing chip
-	 * to the irq directly) because on some platforms several GPIO
-	 * controllers share the same interrupt line.
+	 * On some platforms several GPIO controllers share the same interrupt
+	 * line.
 	 */
 	ret = devm_request_irq(pctrl->dev, irq, intel_gpio_irq,
 			       IRQF_SHARED | IRQF_NO_THREAD,
@@ -1254,14 +1257,20 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 		return ret;
 	}
 
-	ret = gpiochip_irqchip_add(&pctrl->chip, &pctrl->irqchip, 0,
-				   handle_bad_irq, IRQ_TYPE_NONE);
+	girq = &pctrl->chip.irq;
+	girq->chip = &pctrl->irqchip;
+	/* This will let us handle the IRQ in the driver */
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_bad_irq;
+
+	ret = devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
 	if (ret) {
-		dev_err(pctrl->dev, "failed to add irqchip\n");
+		dev_err(pctrl->dev, "failed to register gpiochip\n");
 		return ret;
 	}
 
-	gpiochip_set_chained_irqchip(&pctrl->chip, &pctrl->irqchip, irq, NULL);
 	return 0;
 }
 
-- 
2.23.0

