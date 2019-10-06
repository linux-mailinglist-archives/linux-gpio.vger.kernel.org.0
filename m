Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C534CCD9B
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2019 03:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbfJFBB7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Oct 2019 21:01:59 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43610 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727005AbfJFBB5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Oct 2019 21:01:57 -0400
Received: by mail-lj1-f194.google.com with SMTP id n14so10053374ljj.10
        for <linux-gpio@vger.kernel.org>; Sat, 05 Oct 2019 18:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rr3poPIf3VgG4Pe2qvuSKOuLsf+oc1+sEbIckjoOK+g=;
        b=q+NgPS/AQO148x7zQcw7mJDnCRxinHmTVp6O83jMMFPNZAtrEasL6uMvXRbMdPz+gK
         FJYco5NOATc3JF6FUCGwOrOqebTsNTujAejQACzq1BOP8ELYpZsCjpZrhR2f1ZK3TfAk
         JqdxGRHuAl1kcAqyiOpjbLZmmIOvo01O/4Y2oP/sYT6q7PeD4hcJ5AagnnIOkyILb0xj
         H0NmrzOHI3feKSlSbHPuMtq7DTU9lJN8HAYriOtHNdKtG+yDSazTAgo/9HcVwZ5VMe1l
         Zd275o+wYj8+QE/K6zS64idpOthgkVnQNRKkyIl+U9Cuf8FG6E8A3ALrguQiiuBc/dzI
         TT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rr3poPIf3VgG4Pe2qvuSKOuLsf+oc1+sEbIckjoOK+g=;
        b=BOPCTfGbhufln8k1V1vQYkAh+OPJ785t+ZCVe1naVFTHSnOybKZs/pfd2bfc+qPEJQ
         p9FEyoEtYe/w4rBaf/wale3QlqJZYtpg5E1n+/FawwfXv8UdW3GwfgfvtPEaRuNaHdfp
         U3HoZwnmHINzM0z7Z0eNfgWbIp+3SXMTUmx1U26A9TLqtWNz1g07fTXJ1waQjRmQBG0u
         FK2100pzpYep3/5WFym/AIpRN7n4X5or8sy3z/UoeTrifVRnkYVlnGc6UVhsvcbGc6d1
         96VhDqa5QqvcIJoQPzPHHDfL1gVXTca5X7TQlrX4KmvFesr8uFpC209qkqbguli57POo
         +Vfw==
X-Gm-Message-State: APjAAAUSfk0owj9Govad1NTQuYTpyVCt/P+JxE0L9W6kE7ZELkXPrMGd
        k37IkrSmXiI3K4nq6HrXsk154bL+GOr84w==
X-Google-Smtp-Source: APXvYqxkOTeQBo4t6Xc5nBOXAlyvoFdhkjIbWGk0Axjul45GVB6zetABT5CJr5bQNtphmgcKWDCJbw==
X-Received: by 2002:a05:651c:c4:: with SMTP id 4mr13480748ljr.111.1570323714893;
        Sat, 05 Oct 2019 18:01:54 -0700 (PDT)
Received: from localhost.localdomain (c-79c8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.200.121])
        by smtp.gmail.com with ESMTPSA id m10sm1925268lfo.69.2019.10.05.18.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2019 18:01:53 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] pinctrl: intel: Pass irqchip when adding gpiochip
Date:   Sun,  6 Oct 2019 02:59:49 +0200
Message-Id: <20191006005949.30849-1-linus.walleij@linaro.org>
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

This is an unchained irqchip so we use the method from
drivers/gpio/gpio-mt7621.c that also requests its interrupt
instead if chaining the interrupt handler.

Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
This is based on Andy's patch to dynamically allocate the
irqchio. Mika maybe you want to queue it with the rest of
the stuff so you can sync fixes and new development?
---
 drivers/pinctrl/intel/pinctrl-intel.c | 52 ++++++++++++++++-----------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index bc013599a9a3..d63566e57f4c 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1206,6 +1206,37 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 	pctrl->irqchip.irq_set_wake = intel_gpio_irq_wake;
 	pctrl->irqchip.flags = IRQCHIP_MASK_ON_SUSPEND;
 
+	/*
+	 * We need to request the interrupt here (instead of using a
+	 * chained handler) because on some platforms several GPIO
+	 * controllers share the same interrupt line.
+	 */
+	ret = devm_request_irq(pctrl->dev, irq, intel_gpio_irq,
+			       IRQF_SHARED | IRQF_NO_THREAD,
+			       dev_name(pctrl->dev), pctrl);
+	if (!ret) {
+		struct gpio_irq_chip *girq;
+
+		girq = &pctrl->chip.irq;
+		girq->chip = &pctrl->irqchip;
+		/*
+		 * This is an unchained interrupt. Compare to
+		 * drivers/gpio/gpio-mt7621.c that also does this:
+		 * assign no parents.
+		 *
+		 * FIXME: make the gpiolib flag this and handle unchained
+		 * GPIO interrupts better if need be.
+		 */
+		girq->parent_handler = NULL;
+		girq->num_parents = 0;
+		girq->parents = NULL;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_bad_irq;
+	} else {
+		/* Skip irqchip, register gpiochip anyway */
+		dev_err(pctrl->dev, "failed to request interrupt\n");
+	}
+
 	ret = devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
 	if (ret) {
 		dev_err(pctrl->dev, "failed to register gpiochip\n");
@@ -1222,27 +1253,6 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 		}
 	}
 
-	/*
-	 * We need to request the interrupt here (instead of providing chip
-	 * to the irq directly) because on some platforms several GPIO
-	 * controllers share the same interrupt line.
-	 */
-	ret = devm_request_irq(pctrl->dev, irq, intel_gpio_irq,
-			       IRQF_SHARED | IRQF_NO_THREAD,
-			       dev_name(pctrl->dev), pctrl);
-	if (ret) {
-		dev_err(pctrl->dev, "failed to request interrupt\n");
-		return ret;
-	}
-
-	ret = gpiochip_irqchip_add(&pctrl->chip, &pctrl->irqchip, 0,
-				   handle_bad_irq, IRQ_TYPE_NONE);
-	if (ret) {
-		dev_err(pctrl->dev, "failed to add irqchip\n");
-		return ret;
-	}
-
-	gpiochip_set_chained_irqchip(&pctrl->chip, &pctrl->irqchip, irq, NULL);
 	return 0;
 }
 
-- 
2.21.0

