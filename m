Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5BC221FAD
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 11:28:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726000AbgGPJ2k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 05:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgGPJ2j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 05:28:39 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8924FC061755
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 02:28:39 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id b25so6347799ljp.6
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 02:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XNEhMap9NM6UItrRge++eefZ6Qhtg+Jsg73OotlholI=;
        b=E2ZcvJf7E8ouMF600f9QqR21OopS0MMrnR1yJ6nAjPW2dOfw4gUpNnhnKBLtlrQvwj
         IgvDfHzeRioHlULZI1EBwJEjL0rQbJGykuuDLrqkyY/9ZCk/T84hy3pcO2BGxstxCqtx
         /7MCkoYn0QVycsMQ65MAgn7bzJc2SVB/E6s6U/IzsSwgNPSCgM7jTsqNnrJWQNxtgQqK
         rJNtnsS4NuxewaOtF+uGAp4o/6zI63jtod5ZH0l5CXy3q65pY1qq4+JubFTzRbjOjssi
         F6UvoFK1qIMwIUBAMGJPAzt+COyqllu8djPna2z2h4n3Nkw/8cqyok2GNL5tdXXP2kQj
         sRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XNEhMap9NM6UItrRge++eefZ6Qhtg+Jsg73OotlholI=;
        b=YZXSDCYcLlmMEWihHOQmODHeckQBE9g92VIYUhhxHum3JSu4MYkG9aeWBtp5pys9TZ
         WAahRFgKLkinvPsvOzaDZEhYITS876saK6eLiOuRRU1OoLC6fOJpWwD5uCl9Gs/RTL/M
         vHy3fmoVbdSrBz6xCuLWVxCECfuSCExo0FIsa4wDDyPVVtUcR1BNgcGhYDjz68WspmEM
         f/EkzvM+14bigKrWN1VZh/UO3rXG0g8WkoeUdmdAy3HmsjaobTXt2rJSut5EYm1McP6j
         D6Vkp7sa0GufyBPTOZzoPYnWAhMah1q96aCR4jFGYr4DCWPXrvqAxKOLheKsqSNvCUfD
         phZA==
X-Gm-Message-State: AOAM533rM48XDOs5y/OpkDT122yAQCw4hFe6n7ykfbpYemquiKFHodB+
        0pKSo/6LTLjaxbo1Om4CwjS3PY9sWsI=
X-Google-Smtp-Source: ABdhPJzBwZZTBZt8m1PlPwxpRPXwSuY0mtIMZ3+Pofxzco6ikFeA+AS9fkT1L0bMzajoaVYhIWRybQ==
X-Received: by 2002:a2e:9785:: with SMTP id y5mr1653309lji.383.1594891717893;
        Thu, 16 Jul 2020 02:28:37 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id b26sm1120854lji.36.2020.07.16.02.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 02:28:37 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH] gpio: max77620: Use helper variable and clarify
Date:   Thu, 16 Jul 2020 11:28:35 +0200
Message-Id: <20200716092835.69176-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Most other drivers fill out the gpio_irq_chip using a
struct gpio_irq_chip *girq helper variable for ease of
reading.

We also make a habit of explicitly assigning NULL and
zero to the parent IRQs when using ordinary IRQ handlers
in the driver, mostly for code readability and
maintenance.

Cc: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-max77620.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index e090979659eb..7c0a9ef0b500 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -288,6 +288,7 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 {
 	struct max77620_chip *chip =  dev_get_drvdata(pdev->dev.parent);
 	struct max77620_gpio *mgpio;
+	struct gpio_irq_chip *girq;
 	unsigned int gpio_irq;
 	int ret;
 
@@ -316,11 +317,16 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	mgpio->gpio_chip.can_sleep = 1;
 	mgpio->gpio_chip.base = -1;
 
-	mgpio->gpio_chip.irq.chip = &max77620_gpio_irqchip;
-	mgpio->gpio_chip.irq.default_type = IRQ_TYPE_NONE;
-	mgpio->gpio_chip.irq.handler = handle_edge_irq;
-	mgpio->gpio_chip.irq.init_hw = max77620_gpio_irq_init_hw,
-	mgpio->gpio_chip.irq.threaded = true;
+	girq = &mgpio->gpio_chip.irq;
+	girq->chip = &max77620_gpio_irqchip;
+	/* This will let us handle the parent IRQ in the driver */
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_edge_irq;
+	girq->init_hw = max77620_gpio_irq_init_hw,
+	girq->threaded = true;
 
 	platform_set_drvdata(pdev, mgpio);
 
-- 
2.26.2

