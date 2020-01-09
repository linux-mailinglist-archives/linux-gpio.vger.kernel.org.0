Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3250F1353EF
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2020 08:56:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728351AbgAIH4l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jan 2020 02:56:41 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35152 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728273AbgAIH4l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jan 2020 02:56:41 -0500
Received: by mail-lj1-f194.google.com with SMTP id j1so6172369lja.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jan 2020 23:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=av7HcYUDPVtq744dD/jQrW74iw2JEPAQcG8TalAj878=;
        b=PVj20/v8nJEgW8x/2ffVvBamuKf2e+R62LDvNuEA454AhRrfVxNT28PWF8j2eQFFY3
         wJ8tb2Hs7uEgaYoY4eAJsTmm4YmKiPqlLdmp6NB+kXVzgV/eqpsWGNL0Isg0RISvjH5T
         ly3S+sjE4shGQ1/XEy8Xyp69P2w+g857mH7FKOg6LyVltln+Zd3YI3H/gnHpM76KzYqK
         feM4TmqZc2L6BKecEskzhScWfisE6zCR5roB7Bt3C1vl922bUsPdmJxniwmpHHQkaqp/
         lSgwHCFFgC4qzCrogLsAURnjxaAXsc5DkPpX6Ljioxkslb8zVny8T67CtgG6NXSJSkKH
         Zmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=av7HcYUDPVtq744dD/jQrW74iw2JEPAQcG8TalAj878=;
        b=Az53h6pzI4fxVtanBeFHzU3Gr7aaVQeTFz122ssOMMA99BTuheP+K3UF6Nbo5Twzfp
         FMcNkfJs86J2fuFsQBjgU6nZPNLkE/UyMuijGyVbndHbH1O7DkKbmczav+A4KyV85tBx
         iDwQvS7bg2sOCV25/JnjNMtVEwag8ugs+vdbjnXwCub1Jggu5wkYMqFMiDYJ4zroJyfY
         0B4KSmYVp6rwfsoh0Fog16dPi5mT0ez4TMf/y8aUN7FqrdyPMR1wqrEzke0Tt061AWs3
         875kuNHmOl449obLeqv81PHqGdY9s5Tyl3bSt0AdVVKmJcMWeNkLRnTfJ5mfy4KvuchH
         Ahmg==
X-Gm-Message-State: APjAAAX8GtyiGlPRxIWlqbaErY/9E1MdgSjNxFk9gzvTT0nNOOAJZPAn
        9qIPnNdfkaUEI3TPU3xoTPvp/w==
X-Google-Smtp-Source: APXvYqym0Tv71bG9Gm071smIw2DYk3olyayzv//M2eg9LEq/S8Kd10Rbhgbgeqz0ZdYKOuQLGwmx+A==
X-Received: by 2002:a2e:8942:: with SMTP id b2mr5478293ljk.162.1578556599344;
        Wed, 08 Jan 2020 23:56:39 -0800 (PST)
Received: from localhost.localdomain (c-5ac9225c.014-348-6c756e10.bbcust.telenor.se. [92.34.201.90])
        by smtp.gmail.com with ESMTPSA id d9sm2452745lja.73.2020.01.08.23.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 23:56:38 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/2] pinctrl: intel: Pass irqchip when adding gpiochip
Date:   Thu,  9 Jan 2020 08:53:29 +0100
Message-Id: <20200109075329.398347-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200109075329.398347-1-linus.walleij@linaro.org>
References: <20200109075329.398347-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We need to convert all old gpio irqchips to pass the irqchip
setup along when adding the gpio_chip. For more info see
drivers/gpio/TODO.

For chained irqchips this is a pretty straight-forward conversion.

Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Please apply this to the Intel pinctrl tree when you are
happy with the result!
---
 drivers/pinctrl/intel/pinctrl-intel.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index b479bcf1e246..ffacd77861f7 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1224,6 +1224,7 @@ static unsigned int intel_gpio_ngpio(const struct intel_pinctrl *pctrl)
 static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 {
 	int ret;
+	struct gpio_irq_chip *girq;
 
 	pctrl->chip = intel_gpio_chip;
 
@@ -1244,16 +1245,9 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 	pctrl->irqchip.irq_set_wake = intel_gpio_irq_wake;
 	pctrl->irqchip.flags = IRQCHIP_MASK_ON_SUSPEND;
 
-	ret = devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
-	if (ret) {
-		dev_err(pctrl->dev, "failed to register gpiochip\n");
-		return ret;
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
@@ -1263,14 +1257,20 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
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

