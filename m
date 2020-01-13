Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2229A139C2F
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2020 23:10:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728641AbgAMWKG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jan 2020 17:10:06 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34691 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727382AbgAMWKG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jan 2020 17:10:06 -0500
Received: by mail-lf1-f66.google.com with SMTP id l18so8141048lfc.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jan 2020 14:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j+d0ZXMIpYXrlgjUrFyUdt5fCPQEAcWCJkzfepiMfNA=;
        b=lVA7m/E9cOcScg+TDKxXd+nJ20pDSOLtVBKfMDX8rjHqTQ4kKpY7uIxDLqmwJDhAQF
         MR16L2qq+Rg5P4wgU9NLnxrxhkr6Pl0HGPB36leMpOEJqlOEO/hgBTaMaYdWVRzxFRek
         Go30sCHa7v8lwUaxaGktBGe1FUrEiH9ElQDcr1gbuegby82OEMSt6k3Gxwx6f+Wg1TNQ
         Y55q9bO2tyS51pEIE0CsNtQ1SMk/fv30m6NKEBUJ6zVdk66RnpJ4FNzGBHGoJfTV5YrL
         ppIAOkt82YKQzIO7r2zvB87rBAN4saM+cQy66KX4I3SaI0p3tlgJpyDYOHxXSUzno4Wv
         aYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j+d0ZXMIpYXrlgjUrFyUdt5fCPQEAcWCJkzfepiMfNA=;
        b=nzHwLCArKu5b4/N7Il1DmX3rqcwW1iP6EBNX5BSDdlZ6YExIgYS3/tR4K3rLp0XlO+
         30R0Lx/8IdUl0V/v72KlfEDpQpiwLzMePOj/XqizSWsbZLpZeqV/MGKHZviPsQGY0N1c
         XNi+IQ9kwxBiUPOhkIo99jaUae8/VCuZOc1Vg3wNiC75ZcwO90kpzuS1kQOb2G/04mLw
         s8VOP69clJp1ZlzAj+3Ja3LEbz9P7lJEoWh8uPiydoW+TnBs0QMbPdFVeOtD3gttiN9V
         FcjPbGfsKPYSBDm5u5DS6oW/KH94GWAUUgVafTrRr1qh6V2T7xbJGx4DHh0QMW8nyKLV
         o0Tg==
X-Gm-Message-State: APjAAAUGtsENQcWg+5r9b1ylZUaD6lmvggnGSJuAeZxTXvU8ZAMCkskn
        nGwwV5TTs9sCgH4pes8bmcxALvEo8NhKFMMr
X-Google-Smtp-Source: APXvYqyvE17Ktf90q//5caEB52GUMD+k1a+Mf7evBAzlL7BJUQsHnJxHH7v1XEs5TIEVebT6Jl56MQ==
X-Received: by 2002:a19:ae04:: with SMTP id f4mr10756577lfc.64.1578953404088;
        Mon, 13 Jan 2020 14:10:04 -0800 (PST)
Received: from localhost.localdomain (c-5ac9225c.014-348-6c756e10.bbcust.telenor.se. [92.34.201.90])
        by smtp.gmail.com with ESMTPSA id y29sm6468141ljd.88.2020.01.13.14.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 14:10:03 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] gpio: Drop the chained IRQ handler assign function
Date:   Mon, 13 Jan 2020 23:08:00 +0100
Message-Id: <20200113220800.77817-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

gpiochip_set_chained_irqchip() would assign a chained handler
to a GPIO chip. We now populate struct gpio_irq_chip for all
chained GPIO irqchips so drop this function.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
This requires me to pull in the Intel pinctrl changes that
are pending first, but once there we can do this.
---
 Documentation/driver-api/gpio/driver.rst |  5 -----
 drivers/gpio/gpio-mt7621.c               |  3 +--
 drivers/gpio/gpio-xgs-iproc.c            |  3 +--
 drivers/gpio/gpiolib.c                   | 25 +-----------------------
 include/linux/gpio/driver.h              |  5 -----
 5 files changed, 3 insertions(+), 38 deletions(-)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
index 2ff743105927..871922529332 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -507,11 +507,6 @@ available but we try to move away from this:
   cascaded irq has to be handled by a threaded interrupt handler.
   Apart from that it works exactly like the chained irqchip.
 
-- DEPRECATED: gpiochip_set_chained_irqchip(): sets up a chained cascaded irq
-  handler for a gpio_chip from a parent IRQ and passes the struct gpio_chip*
-  as handler data. Notice that we pass is as the handler data, since the
-  irqchip data is likely used by the parent irqchip.
-
 - gpiochip_set_nested_irqchip(): sets up a nested cascaded irq handler for a
   gpio_chip from a parent IRQ. As the parent IRQ has usually been
   explicitly requested by the driver, this does very little more than
diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index d1d785f983a7..b992321bb852 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -253,8 +253,7 @@ mediatek_gpio_bank_probe(struct device *dev,
 
 		/*
 		 * Directly request the irq here instead of passing
-		 * a flow-handler to gpiochip_set_chained_irqchip,
-		 * because the irq is shared.
+		 * a flow-handler because the irq is shared.
 		 */
 		ret = devm_request_irq(dev, mtk->gpio_irq,
 				       mediatek_gpio_irq_handler, IRQF_SHARED,
diff --git a/drivers/gpio/gpio-xgs-iproc.c b/drivers/gpio/gpio-xgs-iproc.c
index b21c2e436b61..ad5489a65d54 100644
--- a/drivers/gpio/gpio-xgs-iproc.c
+++ b/drivers/gpio/gpio-xgs-iproc.c
@@ -251,8 +251,7 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 
 		/*
 		 * Directly request the irq here instead of passing
-		 * a flow-handler to gpiochip_set_chained_irqchip,
-		 * because the irq is shared.
+		 * a flow-handler because the irq is shared.
 		 */
 		ret = devm_request_irq(dev, irq, iproc_gpio_irq_handler,
 				       IRQF_SHARED, chip->gc.label, &chip->gc);
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 967371377a9d..ce9724d341f5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1800,7 +1800,7 @@ EXPORT_SYMBOL_GPL(gpiochip_irqchip_irq_valid);
  * gpiochip_set_cascaded_irqchip() - connects a cascaded irqchip to a gpiochip
  * @gc: the gpiochip to set the irqchip chain to
  * @parent_irq: the irq number corresponding to the parent IRQ for this
- * chained irqchip
+ * cascaded irqchip
  * @parent_handler: the parent interrupt handler for the accumulated IRQ
  * coming out of the gpiochip. If the interrupt is nested rather than
  * cascaded, pass NULL in this handler argument
@@ -1842,29 +1842,6 @@ static void gpiochip_set_cascaded_irqchip(struct gpio_chip *gc,
 	}
 }
 
-/**
- * gpiochip_set_chained_irqchip() - connects a chained irqchip to a gpiochip
- * @gpiochip: the gpiochip to set the irqchip chain to
- * @irqchip: the irqchip to chain to the gpiochip
- * @parent_irq: the irq number corresponding to the parent IRQ for this
- * chained irqchip
- * @parent_handler: the parent interrupt handler for the accumulated IRQ
- * coming out of the gpiochip.
- */
-void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
-				  struct irq_chip *irqchip,
-				  unsigned int parent_irq,
-				  irq_flow_handler_t parent_handler)
-{
-	if (gpiochip->irq.threaded) {
-		chip_err(gpiochip, "tried to chain a threaded gpiochip\n");
-		return;
-	}
-
-	gpiochip_set_cascaded_irqchip(gpiochip, parent_irq, parent_handler);
-}
-EXPORT_SYMBOL_GPL(gpiochip_set_chained_irqchip);
-
 /**
  * gpiochip_set_nested_irqchip() - connects a nested irqchip to a gpiochip
  * @gpiochip: the gpiochip to set the irqchip nested handler to
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 4f032de10bae..e829ad788987 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -585,11 +585,6 @@ int gpiochip_irq_domain_activate(struct irq_domain *domain,
 void gpiochip_irq_domain_deactivate(struct irq_domain *domain,
 				    struct irq_data *data);
 
-void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
-		struct irq_chip *irqchip,
-		unsigned int parent_irq,
-		irq_flow_handler_t parent_handler);
-
 void gpiochip_set_nested_irqchip(struct gpio_chip *gpiochip,
 		struct irq_chip *irqchip,
 		unsigned int parent_irq);
-- 
2.23.0

