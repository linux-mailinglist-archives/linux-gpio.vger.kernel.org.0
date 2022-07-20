Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA58257B7C4
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Jul 2022 15:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238689AbiGTNqU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Jul 2022 09:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239023AbiGTNqP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Jul 2022 09:46:15 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2610C54C97
        for <linux-gpio@vger.kernel.org>; Wed, 20 Jul 2022 06:46:13 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id n2so12261506qkk.8
        for <linux-gpio@vger.kernel.org>; Wed, 20 Jul 2022 06:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vlq7M6D1RgY2JkdmVKHZ7KjiNHRg1IRrY27s7K5hCY8=;
        b=aLvTOabHg3I4O45W/B22dM5QNdw7yK9FFTg8gxNzE1Z73RZeekYfDopSWikaqmeP4U
         qNDZqPDMeLOtS48YDyB9tSHSYxJCywnwBNzsehRzTymI4P2Ij2D+DJe70p6my7hMRFk1
         uNCP7YES0ZUc97Xb3EOYIhYrs2j/pymiHfK5B3Js/m1eWxPPuQ4WNWNzPzf7OoDObqEL
         TZRHN6mbBdPOTlkDjvZqWVwFUHDttrK1HT6MjdSwFLhh3Dm7KPG6tMR0cSH47C30ksHx
         Fu9F02doCcOUikOLrWrZ/WROoLpJkrCNhq4VYBQeI0FAIDdQLejC57ZZRGFTwv9L7ZOh
         LhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vlq7M6D1RgY2JkdmVKHZ7KjiNHRg1IRrY27s7K5hCY8=;
        b=8RNy+Kx1fPcGJvqkAcMo0yiRsOfjme7fZxTyQIKW2WLBY0MDotmtpolG9yWOtKBvG4
         kNP5SLsv7F2QGvf7MSJ/xPYJkInqaqGu1FFFGYWxeH6uPRdEMXdM+PuC4RBgJLKWygaD
         HKoAIg2FRgxSQWfp48IFR5sYwSZOCWh3k3rwhatUcHSl/KqkLr43W4xzKIMFQoH/f4xd
         WfNf19KfRqzo5jz6FbJWUpDkw4l1yrPsgRtk/l1aKMMMUl0D8b/wEQXvUt7UTwE00K+A
         YfyXQMrhy9Q7UP0eQaZE64o2k7tt5ET2NUu89FkeIcdGdOEOplO4Wkgo/Nc6hY9jwUA4
         +cHA==
X-Gm-Message-State: AJIora8CMnkgvYXsiuOTgM20vN0j1M/rq7zS4EGkL0A7meBkkYY6qo4n
        2uth1AZYXa/r7yzHxrpAeVGEIQ==
X-Google-Smtp-Source: AGRyM1urUwvhh+4elSRnmsBL8N9rv/WFY8C2Vs9O3bozqPvlj6Fhp5JBBr+RckufX5jPcTerRMKSmw==
X-Received: by 2002:a05:620a:31a4:b0:6b5:fe46:c84a with SMTP id bi36-20020a05620a31a400b006b5fe46c84amr5725569qkb.433.1658324771945;
        Wed, 20 Jul 2022 06:46:11 -0700 (PDT)
Received: from fedora.attlocal.net (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id bl13-20020a05620a1a8d00b006b5f8f32a8fsm5289853qkb.114.2022.07.20.06.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 06:46:11 -0700 (PDT)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     linus.walleij@linaro.org, brgl@bgdev.pl
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        William Breathitt Gray <william.gray@linaro.org>,
        Fred Eckert <Frede@cmslaser.com>,
        John Hentges <jhentges@accesio.com>,
        Jay Dolan <jay.dolan@accesio.com>
Subject: [RESEND PATCH v4 2/6] gpio: 104-idio-16: Implement and utilize register structures
Date:   Wed, 20 Jul 2022 09:45:58 -0400
Message-Id: <6f937754757cefe06ab7ee4adeace9379e29cf63.1658324498.git.william.gray@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1658324498.git.william.gray@linaro.org>
References: <cover.1658324498.git.william.gray@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Reduce magic numbers and improve code readability by implementing and
utilizing named register data structures.

Tested-by: Fred Eckert <Frede@cmslaser.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Cc: John Hentges <jhentges@accesio.com>
Cc: Jay Dolan <jay.dolan@accesio.com>
Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
---
Changes in v4:
 - Replace superfluous <linux/bitops.h> include with <linux/bits.h>

 drivers/gpio/gpio-104-idio-16.c | 60 +++++++++++++++++++++++----------
 1 file changed, 42 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio-16.c
index 45f7ad8573e1..65a5f581d981 100644
--- a/drivers/gpio/gpio-104-idio-16.c
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -6,7 +6,7 @@
  * This driver supports the following ACCES devices: 104-IDIO-16,
  * 104-IDIO-16E, 104-IDO-16, 104-IDIO-8, 104-IDIO-8E, and 104-IDO-8.
  */
-#include <linux/bitops.h>
+#include <linux/bits.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/gpio/driver.h>
@@ -19,6 +19,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/spinlock.h>
+#include <linux/types.h>
 
 #define IDIO_16_EXTENT 8
 #define MAX_NUM_IDIO_16 max_num_isa_dev(IDIO_16_EXTENT)
@@ -32,19 +33,42 @@ static unsigned int irq[MAX_NUM_IDIO_16];
 module_param_hw_array(irq, uint, irq, NULL, 0);
 MODULE_PARM_DESC(irq, "ACCES 104-IDIO-16 interrupt line numbers");
 
+/**
+ * struct idio_16_reg - device registers structure
+ * @out0_7:	Read: N/A
+ *		Write: FET Drive Outputs 0-7
+ * @in0_7:	Read: Isolated Inputs 0-7
+ *		Write: Clear Interrupt
+ * @irq_ctl:	Read: Enable IRQ
+ *		Write: Disable IRQ
+ * @unused:	N/A
+ * @out8_15:	Read: N/A
+ *		Write: FET Drive Outputs 8-15
+ * @in8_15:	Read: Isolated Inputs 8-15
+ *		Write: N/A
+ */
+struct idio_16_reg {
+	u8 out0_7;
+	u8 in0_7;
+	u8 irq_ctl;
+	u8 unused;
+	u8 out8_15;
+	u8 in8_15;
+};
+
 /**
  * struct idio_16_gpio - GPIO device private data structure
  * @chip:	instance of the gpio_chip
  * @lock:	synchronization lock to prevent I/O race conditions
  * @irq_mask:	I/O bits affected by interrupts
- * @base:	base port address of the GPIO device
+ * @reg:	I/O address offset for the device registers
  * @out_state:	output bits state
  */
 struct idio_16_gpio {
 	struct gpio_chip chip;
 	raw_spinlock_t lock;
 	unsigned long irq_mask;
-	void __iomem *base;
+	struct idio_16_reg __iomem *reg;
 	unsigned int out_state;
 };
 
@@ -79,9 +103,9 @@ static int idio_16_gpio_get(struct gpio_chip *chip, unsigned int offset)
 		return -EINVAL;
 
 	if (offset < 24)
-		return !!(ioread8(idio16gpio->base + 1) & mask);
+		return !!(ioread8(&idio16gpio->reg->in0_7) & mask);
 
-	return !!(ioread8(idio16gpio->base + 5) & (mask>>8));
+	return !!(ioread8(&idio16gpio->reg->in8_15) & (mask>>8));
 }
 
 static int idio_16_gpio_get_multiple(struct gpio_chip *chip,
@@ -91,9 +115,9 @@ static int idio_16_gpio_get_multiple(struct gpio_chip *chip,
 
 	*bits = 0;
 	if (*mask & GENMASK(23, 16))
-		*bits |= (unsigned long)ioread8(idio16gpio->base + 1) << 16;
+		*bits |= (unsigned long)ioread8(&idio16gpio->reg->in0_7) << 16;
 	if (*mask & GENMASK(31, 24))
-		*bits |= (unsigned long)ioread8(idio16gpio->base + 5) << 24;
+		*bits |= (unsigned long)ioread8(&idio16gpio->reg->in8_15) << 24;
 
 	return 0;
 }
@@ -116,9 +140,9 @@ static void idio_16_gpio_set(struct gpio_chip *chip, unsigned int offset,
 		idio16gpio->out_state &= ~mask;
 
 	if (offset > 7)
-		iowrite8(idio16gpio->out_state >> 8, idio16gpio->base + 4);
+		iowrite8(idio16gpio->out_state >> 8, &idio16gpio->reg->out8_15);
 	else
-		iowrite8(idio16gpio->out_state, idio16gpio->base);
+		iowrite8(idio16gpio->out_state, &idio16gpio->reg->out0_7);
 
 	raw_spin_unlock_irqrestore(&idio16gpio->lock, flags);
 }
@@ -135,9 +159,9 @@ static void idio_16_gpio_set_multiple(struct gpio_chip *chip,
 	idio16gpio->out_state |= *mask & *bits;
 
 	if (*mask & 0xFF)
-		iowrite8(idio16gpio->out_state, idio16gpio->base);
+		iowrite8(idio16gpio->out_state, &idio16gpio->reg->out0_7);
 	if ((*mask >> 8) & 0xFF)
-		iowrite8(idio16gpio->out_state >> 8, idio16gpio->base + 4);
+		iowrite8(idio16gpio->out_state >> 8, &idio16gpio->reg->out8_15);
 
 	raw_spin_unlock_irqrestore(&idio16gpio->lock, flags);
 }
@@ -158,7 +182,7 @@ static void idio_16_irq_mask(struct irq_data *data)
 	if (!idio16gpio->irq_mask) {
 		raw_spin_lock_irqsave(&idio16gpio->lock, flags);
 
-		iowrite8(0, idio16gpio->base + 2);
+		iowrite8(0, &idio16gpio->reg->irq_ctl);
 
 		raw_spin_unlock_irqrestore(&idio16gpio->lock, flags);
 	}
@@ -177,7 +201,7 @@ static void idio_16_irq_unmask(struct irq_data *data)
 	if (!prev_irq_mask) {
 		raw_spin_lock_irqsave(&idio16gpio->lock, flags);
 
-		ioread8(idio16gpio->base + 2);
+		ioread8(&idio16gpio->reg->irq_ctl);
 
 		raw_spin_unlock_irqrestore(&idio16gpio->lock, flags);
 	}
@@ -212,7 +236,7 @@ static irqreturn_t idio_16_irq_handler(int irq, void *dev_id)
 
 	raw_spin_lock(&idio16gpio->lock);
 
-	iowrite8(0, idio16gpio->base + 1);
+	iowrite8(0, &idio16gpio->reg->in0_7);
 
 	raw_spin_unlock(&idio16gpio->lock);
 
@@ -232,8 +256,8 @@ static int idio_16_irq_init_hw(struct gpio_chip *gc)
 	struct idio_16_gpio *const idio16gpio = gpiochip_get_data(gc);
 
 	/* Disable IRQ by default */
-	iowrite8(0, idio16gpio->base + 2);
-	iowrite8(0, idio16gpio->base + 1);
+	iowrite8(0, &idio16gpio->reg->irq_ctl);
+	iowrite8(0, &idio16gpio->reg->in0_7);
 
 	return 0;
 }
@@ -255,8 +279,8 @@ static int idio_16_probe(struct device *dev, unsigned int id)
 		return -EBUSY;
 	}
 
-	idio16gpio->base = devm_ioport_map(dev, base[id], IDIO_16_EXTENT);
-	if (!idio16gpio->base)
+	idio16gpio->reg = devm_ioport_map(dev, base[id], IDIO_16_EXTENT);
+	if (!idio16gpio->reg)
 		return -ENOMEM;
 
 	idio16gpio->chip.label = name;
-- 
2.36.1

