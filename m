Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 006D18906C
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Aug 2019 10:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbfHKIHs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Aug 2019 04:07:48 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37415 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725810AbfHKIHr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Aug 2019 04:07:47 -0400
Received: by mail-lf1-f67.google.com with SMTP id c9so72282111lfh.4
        for <linux-gpio@vger.kernel.org>; Sun, 11 Aug 2019 01:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qKWJq6QK9n5a3Mmto4jXfzxWVXHKKGqpyLrkejDxkbA=;
        b=LkRFHSumQuGZRSb+8SjPrsFI08ENVmbw+hM2JJY9m7WspPsBJdIgTOwaBrxt2LvpOX
         NVfJCtlesT7PGeoPYLi86wa38Qt9a7Mb3lQ7N3a4SsXRERQrGpBbACU4sCKCsiiR+WAL
         oqNvnocHf/M48XrZrubmU7e0nzsNFAXCFw+7f4YYztGNjIXinPMwaaTa/87agiYOfiQ4
         Tdgfweai0JzCitW9wH16HE53x/lvOR/ZPX9qDrDTwh01AGaUVEtSDk83Kj7VZxvU4D5/
         0UafZWxgo6u1jffIGkpaPD0bFtWWl7LPV8xddyK8w4ukTGorsIIhrZKj5/o8EY/FOEBb
         aBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qKWJq6QK9n5a3Mmto4jXfzxWVXHKKGqpyLrkejDxkbA=;
        b=S0Sc+48BEzWN1QxCWZJ5Q10Gjf4cEcKDs08F6a/HB85yTFpy9xMYEr7BV+J53x+LLj
         R4RKn8uwEwoPHHQkkjOntYAbe1jCQZnr1tuig/NEwxwNjcnkuV6YPpfozKIL7VyyoUuT
         TfTrxZNqPX36k54bHLUKvL787Hj2YrQMAVdU2iX2APvChtqXLO8esI0b7U5H1PllBXqK
         HM1J+u9QiviYfL8FrUAd0068PidYSDvMng2+npdEPk+X2UgItEyp9plYct1Sb2Yce3GF
         nm04HEriLfDHYwv/5T0DGBF3Q9basA43CtF5PCJEJ0E9r5JuTy27M4Fuks7jnRd+V8Of
         t6TA==
X-Gm-Message-State: APjAAAUbNcD0xQW0/nareOtYlZ1PFO+5FQM11hsOk28NF23NQepFCxMr
        WC0io+SPDDKH13oxI1GYSsUam4BcqixK/Q==
X-Google-Smtp-Source: APXvYqyGZpvcpI5LsSynTOSWbHX8YtH49aQhWTuDZmB1twCuw4zn2BfOZ7+DWVojv4Eo0xaEX74M/w==
X-Received: by 2002:a19:7709:: with SMTP id s9mr16188404lfc.86.1565510862306;
        Sun, 11 Aug 2019 01:07:42 -0700 (PDT)
Received: from localhost.localdomain (c-2ccd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.44])
        by smtp.gmail.com with ESMTPSA id u1sm861998lji.25.2019.08.11.01.07.40
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 11 Aug 2019 01:07:41 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        David Cohen <david.a.cohen@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH] gpio: intel-mid: Pass irqchip when adding gpiochip
Date:   Sun, 11 Aug 2019 10:05:39 +0200
Message-Id: <20190811080539.15647-1-linus.walleij@linaro.org>
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
Cc: David Cohen <david.a.cohen@linux.intel.com>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Andy: when you're happy with this you can either supply an
ACK and I will merge it or you can merge it into your tree
for a later pull request, just tell me what you prefer.
---
 drivers/gpio/gpio-intel-mid.c | 35 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mid.c
index 4e803baf980e..1f5c9d21db0b 100644
--- a/drivers/gpio/gpio-intel-mid.c
+++ b/drivers/gpio/gpio-intel-mid.c
@@ -329,6 +329,7 @@ static int intel_gpio_probe(struct pci_dev *pdev,
 	u32 gpio_base;
 	u32 irq_base;
 	int retval;
+	struct gpio_irq_chip *girq;
 	struct intel_mid_gpio_ddata *ddata =
 				(struct intel_mid_gpio_ddata *)id->driver_data;
 
@@ -369,6 +370,22 @@ static int intel_gpio_probe(struct pci_dev *pdev,
 
 	spin_lock_init(&priv->lock);
 
+	girq = &priv->chip.irq;
+	girq->chip = &intel_mid_irqchip;
+	girq->parent_handler = intel_mid_irq_handler;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(&pdev->dev, 1,
+				     sizeof(*girq->parents),
+				     GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
+	girq->parents[0] = pdev->irq;
+	girq->first = irq_base;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_simple_irq;
+
+	intel_mid_irq_init_hw(priv);
+
 	pci_set_drvdata(pdev, priv);
 	retval = devm_gpiochip_add_data(&pdev->dev, &priv->chip, priv);
 	if (retval) {
@@ -376,24 +393,6 @@ static int intel_gpio_probe(struct pci_dev *pdev,
 		return retval;
 	}
 
-	retval = gpiochip_irqchip_add(&priv->chip,
-				      &intel_mid_irqchip,
-				      irq_base,
-				      handle_simple_irq,
-				      IRQ_TYPE_NONE);
-	if (retval) {
-		dev_err(&pdev->dev,
-			"could not connect irqchip to gpiochip\n");
-		return retval;
-	}
-
-	intel_mid_irq_init_hw(priv);
-
-	gpiochip_set_chained_irqchip(&priv->chip,
-				     &intel_mid_irqchip,
-				     pdev->irq,
-				     intel_mid_irq_handler);
-
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_allow(&pdev->dev);
 
-- 
2.21.0

