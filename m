Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62702C8780
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2019 13:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbfJBLo7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 07:44:59 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45150 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbfJBLo7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 07:44:59 -0400
Received: by mail-lf1-f66.google.com with SMTP id r134so12452376lff.12
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2019 04:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EerdR1LpUJZvAsHuXgTuzOOB6ENDUncZ+hDjL7OX2GA=;
        b=VSUZD7I6P9fqH4b0brYt2bs4r05jr9Ho7a68ADRD6UZEJtet+7OVEuXIpfeBHPkUO1
         l+pm1IJdsGDk9SmPDZ4f6ZBmNVBW+63Q77ZpHcK8ag3XwfUx9Fvhk1/lF77sw60Dahae
         C1bb3tEyk7hYq9Q3FuSrkxUY4CydCo2p0zVj7GXOHaAjHtU7wPhIAkvF4ThtzX7Y2jBW
         E3A8FwjzI2uiGEHlGNgwMdKdH6N4hpgFov3eEjSAQeEM/FhB4cJCaE9l7fDdXkR6UuFo
         J2NKIhCrq7Y7ySk46XRXuGAaz7Ml2PkW3t1LnusWfbNOWaLeQjqsxjBntwUvGZ4aqSTU
         7lJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EerdR1LpUJZvAsHuXgTuzOOB6ENDUncZ+hDjL7OX2GA=;
        b=NsDFCkBdkGEBQWCPG1rI7s4oGXdA8Gey9QxCZ+1niEzm8OoF6Fy/Emlz0SSgpy2xCm
         85dakffF84j8KcOc2zqsmyppRy7wQw8qAfwL8bNMv48oqanyDskf39wiqSEJy+wr8Xbg
         5rX+eFBRsP97GPBZt8pbELwx7vFKcN4dtRcN36Iq/uYeYCv0cjAdGI9B+hnyFiGlVU+h
         LRTYlZ9xtFpjzB346UmhpkYW2+2y1UMyF+Qg8s3VINdt1qStRz8TKoLZscsbHermXiUu
         8ranIfm6fxcxWqrzbqBxnAxkO/RpJ6NN+YOyGUZLDjjzPSWsWiTso904LPEBGfpXpvKn
         DtXA==
X-Gm-Message-State: APjAAAUS1aeLX7X4XdAY3hhsTq9c5Y2vuqmfxPpbYQczBgUSNhvP7G11
        Ds2A1ggUPCnfCNrx8NraSNwxWCXufv1yDg==
X-Google-Smtp-Source: APXvYqzwzAlCpOJukl1i3wqx8OuObRjMwl4lL4RgqQEEY+aHp7Mw29/UhcEEoytZW0MBZzc0FbE65A==
X-Received: by 2002:a19:5516:: with SMTP id n22mr2191541lfe.49.1570016697381;
        Wed, 02 Oct 2019 04:44:57 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id i17sm4736846ljd.2.2019.10.02.04.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 04:44:56 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] pinctrl: ocelot: Pass irqchip when adding gpiochip
Date:   Wed,  2 Oct 2019 13:44:54 +0200
Message-Id: <20191002114454.9684-1-linus.walleij@linaro.org>
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

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-ocelot.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index fb76fb2e9ea5..eb3dd0d46d6c 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -736,6 +736,7 @@ static int ocelot_gpiochip_register(struct platform_device *pdev,
 				    struct ocelot_pinctrl *info)
 {
 	struct gpio_chip *gc;
+	struct gpio_irq_chip *girq;
 	int ret, irq;
 
 	info->gpio_chip = ocelot_gpiolib_chip;
@@ -747,22 +748,26 @@ static int ocelot_gpiochip_register(struct platform_device *pdev,
 	gc->of_node = info->dev->of_node;
 	gc->label = "ocelot-gpio";
 
-	ret = devm_gpiochip_add_data(&pdev->dev, gc, info);
-	if (ret)
-		return ret;
-
 	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
 	if (irq <= 0)
 		return irq;
 
-	ret = gpiochip_irqchip_add(gc, &ocelot_irqchip, 0, handle_edge_irq,
-				   IRQ_TYPE_NONE);
+	girq = &gc->irq;
+	girq->chip = &ocelot_irqchip;
+	girq->parent_handler = ocelot_irq_handler;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(&pdev->dev, 1, sizeof(*girq->parents),
+				     GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
+	girq->parents[0] = irq;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_edge_irq;
+
+	ret = devm_gpiochip_add_data(&pdev->dev, gc, info);
 	if (ret)
 		return ret;
 
-	gpiochip_set_chained_irqchip(gc, &ocelot_irqchip, irq,
-				     ocelot_irq_handler);
-
 	return 0;
 }
 
-- 
2.21.0

