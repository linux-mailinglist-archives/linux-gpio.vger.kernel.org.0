Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8AEE4567C
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2019 09:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbfFNHfs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Jun 2019 03:35:48 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37946 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbfFNHfs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Jun 2019 03:35:48 -0400
Received: by mail-lj1-f194.google.com with SMTP id r9so1345167ljg.5
        for <linux-gpio@vger.kernel.org>; Fri, 14 Jun 2019 00:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bsupIOWqoJH/kMhN2nTkz9PNJKkLMDNwKGxm6GhBcdU=;
        b=yiyihh9tI0ivkkzZOhrGulBibxciFhHPoXrNYR2xdk8LGn434eANVRFWBXy812vGkr
         8+gLp5vecFYS60E1SrmupApmOsWZ51fMD0LsYvF0NGx7ENaYZ1sJ2j8+ZAoSlKuaaScf
         vC4Kqbv829A3C5Kbxc0a98oXYDv/lZab6zFZwWdzUkmoXpXsDCrxq/MMhko6poZPcFry
         GyDMJwezHTPFxuFL0NdJkHJHMoRXsjGLqirpWppYMKSi2B87JKKU4ziB5/XcwLh0ajlr
         leqiqCG/i+TVIXGwGbdZmW5htmEUcLV3MHDftGOzp5R3qQOpmIynGM/+/1ShQTus9V6B
         aHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bsupIOWqoJH/kMhN2nTkz9PNJKkLMDNwKGxm6GhBcdU=;
        b=s0uZjxYb37AYnvAqxelg43vre+CUMFwa8GuGA6XPo75Y2sbek2wbJGrjKYzU9ywhLn
         czwawldlpkbub8tFreVs74SiHlQSE6IIQ6YNT1zXWU1sIMqI1stWm2kydYvXDOUUtoed
         P/E5LO8C1QaZyW5gsXkQW8rS8OeGpeyPnDEe+nI+V+lmZjeadyEhEdrzhUeJO68g1k0D
         gGzsZbBnm3MRfRk256t/hq37/hCtlBDi9nhNcoXuKhoHPAhMY2dflp3KmEnytLY/v4Dl
         WuY86Ie4tal04LGtow4SwLz3PwgEMJZDsaYGddNxqGOyiwWyfv6ljGSw2FF+zxenfD2K
         0cIQ==
X-Gm-Message-State: APjAAAXlB/XKjEStV1BnjL1LgWTXt4+14zzolxnTS+ouO9t098A1J6kr
        8smXeBnTA5OZiskg/eSudcZvQcRp17o=
X-Google-Smtp-Source: APXvYqxNKSPyiAHgBg+TsfD341NWFpg2sPE1XUaGKDG96LHq+P79CANSrBde7NicDlMjCkwzAp5G0Q==
X-Received: by 2002:a2e:9ad1:: with SMTP id p17mr18417204ljj.34.1560497745215;
        Fri, 14 Jun 2019 00:35:45 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id k8sm431008lja.24.2019.06.14.00.35.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 00:35:43 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH] gpio: Add GPIOLIB_IRQCHIP cleanup to TODO
Date:   Fri, 14 Jun 2019 09:35:41 +0200
Message-Id: <20190614073541.5591-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We now have two APIs for registering GPIOLIB_IRQCHIP, this is not
working and creating confusion. Add a TODO item to fix it up.

Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/TODO | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index 19d27c904916..1cd57f0bc0c3 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -90,6 +90,46 @@ GPIOLIB irqchip
 The GPIOLIB irqchip is a helper irqchip for "simple cases" that should
 try to cover any generic kind of irqchip cascaded from a GPIO.
 
+- Convert all the GPIOLIB_IRQCHIP users to pass an irqchip template,
+  parent and flags before calling [devm_]gpiochip_add[_data]().
+  Currently we set up the irqchip after setting up the gpiochip
+  using gpiochip_irqchip_add() and gpiochip_set_[chained|nested]_irqchip().
+  This is too complex, so convert all users over to just set up
+  the irqchip before registering the gpio_chip, typical example:
+
+  /* Typical state container with dynamic irqchip */
+  struct my_gpio {
+      struct gpio_chip gc;
+      struct irq_chip irq;
+  };
+
+  int irq; /* from platform etc */
+  struct my_gpio *g;
+  struct gpio_irq_chip *girq
+
+  /* Set up the irqchip dynamically */
+  g->irq.name = "my_gpio_irq";
+  g->irq.irq_ack = my_gpio_ack_irq;
+  g->irq.irq_mask = my_gpio_mask_irq;
+  g->irq.irq_unmask = my_gpio_unmask_irq;
+  g->irq.irq_set_type = my_gpio_set_irq_type;
+
+  /* Get a pointer to the gpio_irq_chip */
+  girq = &g->gc.irq;
+  girq->chip = &g->irq;
+  girq->parent_handler = ftgpio_gpio_irq_handler;
+  girq->num_parents = 1;
+  girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
+                               GFP_KERNEL);
+  girq->default_type = IRQ_TYPE_NONE;
+  girq->handler = handle_bad_irq;
+  if (!girq->parents)
+      return -ENOMEM;
+  girq->parents[0] = irq;
+
+  When this is done, we will delete the old APIs for instatiating
+  GPIOLIB_IRQCHIP and simplify the code.
+
 - Look over and identify any remaining easily converted drivers and
   dry-code conversions to gpiolib irqchip for maintainers to test
 
-- 
2.20.1

