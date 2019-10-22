Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAB4FE0681
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2019 16:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbfJVOd7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Oct 2019 10:33:59 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37515 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727194AbfJVOd7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Oct 2019 10:33:59 -0400
Received: by mail-lj1-f195.google.com with SMTP id l21so17480038lje.4
        for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2019 07:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aGnqJgrRFX9ypqcKZLRkU4u14oPyd+4FFI+mtDPvEHI=;
        b=NsI3sH4N8OkL82XjPdmQWakESXV8JRvx0iJ8/EmRrCnk4gHCkoAJROMxNfUTD+rar4
         EJ2w7WQko39HV3UsdmUmD/4NzX7sS08n1N53J7DGDj9qZY4Jdf7D8AZxAV7nFn9IUQwN
         vaSNz0fHt6enagu0LpAnFsvUSW2wbYXxcf1XB6HpB7naLrB/MUrf/ty3y9wyZ4s/tzZQ
         P1U+2UuAgmxLVbDm1xguEiStNFl7zttEg9kPqjsT1F+tPQdMtG4WofDQJI6PIyZi62K2
         DOpvWmLLTyRRww+ZEOJl0MfqbyFSWn9CVDwVvsfr4vqKRy1HwzwVaRlpw1CAy9Y1JkSp
         Qi/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aGnqJgrRFX9ypqcKZLRkU4u14oPyd+4FFI+mtDPvEHI=;
        b=V5nj/WQ5neL3YewH4WObmo3zz9VUews+96XkNESW5z8J2Gh9qB6LFoc6mPmxNl/Fg6
         9JFl1LruhtEzGL2nhmwop9837T/w/T2IqZwm4sWKI4U5FkZpOKUV4PkTMAaIOX/BmTcG
         ZWQqtgp+N+p7FzRMibypNDAdNkqT0b3/vvm63iOIYWIsb5dSOsZJKtjWD+0KOIzZFQYQ
         JtHMtUx+vNV0P6wIvzaS1T9mS4tyS5NvMSrPu9yJSyuLyKuio69Y4th2CW7TIlrn/4/2
         f1PGDNF/AVWkFJxEzhM7LeRQVbDsr+DNudzYa4gIR5T6KlUdVBdMKYmQ10frlYeRfKxf
         qZUA==
X-Gm-Message-State: APjAAAWoU+GV0sRM+EEDr5q5hCt2rIgR0VmViX1clbfXc9oCmuFkbyRM
        XVXnOX+4owzsvAPQwd284S22Y77K7Kk=
X-Google-Smtp-Source: APXvYqy5bl4wXCZLjTEfHKuuFn22ZyhhoPMYTLlDgRqPxH7GGStNc1WbtQ8xVfwEFyDBT5wISx3QAw==
X-Received: by 2002:a2e:b527:: with SMTP id z7mr12906858ljm.245.1571754836405;
        Tue, 22 Oct 2019 07:33:56 -0700 (PDT)
Received: from localhost.localdomain (c-79c8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.200.121])
        by smtp.gmail.com with ESMTPSA id w16sm7597938lji.42.2019.10.22.07.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 07:33:55 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH v3] pinctrl: intel: baytrail: Pass irqchip when adding gpiochip
Date:   Tue, 22 Oct 2019 16:31:52 +0200
Message-Id: <20191022143152.14740-1-linus.walleij@linaro.org>
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
conversion.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Use the new .init_hw() callback to initialize IRQ
  hardware.
ChangeLog v1->v2:
- Rebase on v5.4-rc1
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 42 ++++++++++++++----------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 9ffb22211d2b..450cb5bf6a9f 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1450,9 +1450,9 @@ static void byt_init_irq_valid_mask(struct gpio_chip *chip,
 	 */
 }
 
-static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
+static int byt_gpio_irq_init_hw(struct gpio_chip *gc)
 {
-	struct gpio_chip *gc = &vg->chip;
+	struct byt_gpio *vg = gpiochip_get_data(gc);
 	struct device *dev = &vg->pdev->dev;
 	void __iomem *reg;
 	u32 base, value;
@@ -1504,6 +1504,7 @@ static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
 				"GPIO interrupt error, pins misconfigured. INT_STAT%u: 0x%08x\n",
 				base / 32, value);
 	}
+	return 0;
 }
 
 static int byt_gpio_probe(struct byt_gpio *vg)
@@ -1528,6 +1529,27 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 	if (!vg->saved_context)
 		return -ENOMEM;
 #endif
+
+	/* set up interrupts  */
+	irq_rc = platform_get_resource(vg->pdev, IORESOURCE_IRQ, 0);
+	if (irq_rc && irq_rc->start) {
+		struct gpio_irq_chip *girq;
+
+		girq = &gc->irq;
+		girq->chip = &byt_irqchip;
+		girq->init_hw = byt_gpio_irq_init_hw;
+		girq->parent_handler = byt_gpio_irq_handler;
+		girq->num_parents = 1;
+		girq->parents = devm_kcalloc(&vg->pdev->dev, 1,
+					     sizeof(*girq->parents),
+					     GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+		girq->parents[0] = (unsigned int)irq_rc->start;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_bad_irq;
+	}
+
 	ret = devm_gpiochip_add_data(&vg->pdev->dev, gc, vg);
 	if (ret) {
 		dev_err(&vg->pdev->dev, "failed adding byt-gpio chip\n");
@@ -1541,22 +1563,6 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 		return ret;
 	}
 
-	/* set up interrupts  */
-	irq_rc = platform_get_resource(vg->pdev, IORESOURCE_IRQ, 0);
-	if (irq_rc && irq_rc->start) {
-		byt_gpio_irq_init_hw(vg);
-		ret = gpiochip_irqchip_add(gc, &byt_irqchip, 0,
-					   handle_bad_irq, IRQ_TYPE_NONE);
-		if (ret) {
-			dev_err(&vg->pdev->dev, "failed to add irqchip\n");
-			return ret;
-		}
-
-		gpiochip_set_chained_irqchip(gc, &byt_irqchip,
-					     (unsigned)irq_rc->start,
-					     byt_gpio_irq_handler);
-	}
-
 	return ret;
 }
 
-- 
2.21.0

