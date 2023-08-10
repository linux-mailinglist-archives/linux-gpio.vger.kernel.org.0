Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73EDE77835A
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Aug 2023 00:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbjHJWBI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Aug 2023 18:01:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbjHJWBF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 18:01:05 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E444C2123
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 15:01:03 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-48716a85f16so567309e0c.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 15:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691704863; x=1692309663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b93YvQ87W3kKiABcS6x2RDdTLzlHoAfWDWBJ2KpGfIw=;
        b=inPcUud7vMA/8JN5ZfLRakdPDH77kHDTzdFaYGqLQ94tL1WM6pQttWEcUkCKYciohN
         6aEFtDJpE63jPr0TBaqUR0K2l2YjaPGIPIZPv7FYDYEscOY9UhsQKFlXBLSO5hN7uMNw
         ASLI1dFDehCCRD1DjMyTwykVrO4UsqgJFK3LFTNKJUw8nOO9I1HJlyt0Npo4h8G2js8u
         C6efPbO0LXQP7htTK2yilHiedCK/WGB1nv4TZdKi6H+FNdSyL7Z/XvFiQecRz2uCdeZ/
         W/hLwYA8JNK09hr1hjhEUGeVe3JFRw5LF7WEdWR9C6/9pcQeZX1wxEJ8W9wAzQyeAow5
         EW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691704863; x=1692309663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b93YvQ87W3kKiABcS6x2RDdTLzlHoAfWDWBJ2KpGfIw=;
        b=DbdS7Eg2Mr3WhTEtfkBiYhffcOrpa+vdf1oN58JwzCjc7d7EGpMyWLIPuVB8vUA37+
         Pwe19wKW001X78BFDc2A+9kR1Qp10Sq+fWZ6lPBXSUFOkprtIY6bNN+eYzh49kDnWFze
         kKPQT5a+rcxoz+RtWu+njm8jM5NwyaSaLs8naymasw96G//6up1/QKJaaZYaUnbnHBSC
         WCN3rW3LK253DsS3WcouJa9mYK5Tx2zScfIKSF83gykfS6ZFQxW4wuHCNzb2d9N8/zPg
         LCIbBTd72DrhOnVMB016pCH1J2HU6SM+HdatMVBBe8eIYpOr+8cz6mmNlQu49BjS/W+m
         2Qow==
X-Gm-Message-State: AOJu0Yyr3gFU7JIYHKqVyDHROvQGRyTJH7T6VMkCSYmS6yOgeF5BpaGG
        tSCpUWM+7MoB5Utg+y4igNLv/A==
X-Google-Smtp-Source: AGHT+IFY4jLrdT1VwC53exDKKFh3bKUhsoCO5FoWZLgV4X4Gffpa5kdHrqURrnpcWOczXpZNDfjemA==
X-Received: by 2002:a1f:41d3:0:b0:487:16e2:b653 with SMTP id o202-20020a1f41d3000000b0048716e2b653mr282905vka.13.1691704862970;
        Thu, 10 Aug 2023 15:01:02 -0700 (PDT)
Received: from fedora.. (072-189-067-006.res.spectrum.com. [72.189.67.6])
        by smtp.gmail.com with ESMTPSA id r17-20020a056122009100b004872b997d3bsm387105vka.1.2023.08.10.15.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 15:01:02 -0700 (PDT)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        William Breathitt Gray <william.gray@linaro.org>
Subject: [RESEND PATCH 4/7] gpio: idio-16: Remove unused legacy interface
Date:   Thu, 10 Aug 2023 18:00:41 -0400
Message-ID: <2fc8169c2b0a3f9e955079f4a5b9f42e8ff2a39d.1691703928.git.william.gray@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1691703927.git.william.gray@linaro.org>
References: <cover.1691703927.git.william.gray@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

All idio-16 library consumers have migrated to the new interface
leveraging the gpio-regmap API. Legacy interface functions and code are
removed as no longer needed.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/r/651cff1cc3eb57b455a8048121cf6a4d4367f018.1680618405.git.william.gray@linaro.org/
Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
---
 drivers/gpio/gpio-idio-16.c | 131 +-----------------------------------
 drivers/gpio/gpio-idio-16.h |  65 ------------------
 2 files changed, 1 insertion(+), 195 deletions(-)

diff --git a/drivers/gpio/gpio-idio-16.c b/drivers/gpio/gpio-idio-16.c
index f9349e8d7fdc..53b1eb876a12 100644
--- a/drivers/gpio/gpio-idio-16.c
+++ b/drivers/gpio/gpio-idio-16.c
@@ -3,15 +3,13 @@
  * GPIO library for the ACCES IDIO-16 family
  * Copyright (C) 2022 William Breathitt Gray
  */
-#include <linux/bitmap.h>
+#include <linux/bits.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/export.h>
 #include <linux/gpio/regmap.h>
-#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
-#include <linux/spinlock.h>
 #include <linux/types.h>
 
 #include "gpio-idio-16.h"
@@ -169,133 +167,6 @@ int devm_idio_16_regmap_register(struct device *const dev,
 }
 EXPORT_SYMBOL_GPL(devm_idio_16_regmap_register);
 
-/**
- * idio_16_get - get signal value at signal offset
- * @reg:	ACCES IDIO-16 device registers
- * @state:	ACCES IDIO-16 device state
- * @offset:	offset of signal to get
- *
- * Returns the signal value (0=low, 1=high) for the signal at @offset.
- */
-int idio_16_get(struct idio_16 __iomem *const reg,
-		struct idio_16_state *const state, const unsigned long offset)
-{
-	const unsigned long mask = BIT(offset);
-
-	if (offset < IDIO_16_NOUT)
-		return test_bit(offset, state->out_state);
-
-	if (offset < 24)
-		return !!(ioread8(&reg->in0_7) & (mask >> IDIO_16_NOUT));
-
-	if (offset < 32)
-		return !!(ioread8(&reg->in8_15) & (mask >> 24));
-
-	return -EINVAL;
-}
-EXPORT_SYMBOL_GPL(idio_16_get);
-
-/**
- * idio_16_get_multiple - get multiple signal values at multiple signal offsets
- * @reg:	ACCES IDIO-16 device registers
- * @state:	ACCES IDIO-16 device state
- * @mask:	mask of signals to get
- * @bits:	bitmap to store signal values
- *
- * Stores in @bits the values (0=low, 1=high) for the signals defined by @mask.
- */
-void idio_16_get_multiple(struct idio_16 __iomem *const reg,
-			  struct idio_16_state *const state,
-			  const unsigned long *const mask,
-			  unsigned long *const bits)
-{
-	unsigned long flags;
-	const unsigned long out_mask = GENMASK(IDIO_16_NOUT - 1, 0);
-
-	spin_lock_irqsave(&state->lock, flags);
-
-	bitmap_replace(bits, bits, state->out_state, &out_mask, IDIO_16_NOUT);
-	if (*mask & GENMASK(23, 16))
-		bitmap_set_value8(bits, ioread8(&reg->in0_7), 16);
-	if (*mask & GENMASK(31, 24))
-		bitmap_set_value8(bits, ioread8(&reg->in8_15), 24);
-
-	spin_unlock_irqrestore(&state->lock, flags);
-}
-EXPORT_SYMBOL_GPL(idio_16_get_multiple);
-
-/**
- * idio_16_set - set signal value at signal offset
- * @reg:	ACCES IDIO-16 device registers
- * @state:	ACCES IDIO-16 device state
- * @offset:	offset of signal to set
- * @value:	value of signal to set
- *
- * Assigns output @value for the signal at @offset.
- */
-void idio_16_set(struct idio_16 __iomem *const reg,
-		 struct idio_16_state *const state, const unsigned long offset,
-		 const unsigned long value)
-{
-	unsigned long flags;
-
-	if (offset >= IDIO_16_NOUT)
-		return;
-
-	spin_lock_irqsave(&state->lock, flags);
-
-	__assign_bit(offset, state->out_state, value);
-	if (offset < 8)
-		iowrite8(bitmap_get_value8(state->out_state, 0), &reg->out0_7);
-	else
-		iowrite8(bitmap_get_value8(state->out_state, 8), &reg->out8_15);
-
-	spin_unlock_irqrestore(&state->lock, flags);
-}
-EXPORT_SYMBOL_GPL(idio_16_set);
-
-/**
- * idio_16_set_multiple - set signal values at multiple signal offsets
- * @reg:	ACCES IDIO-16 device registers
- * @state:	ACCES IDIO-16 device state
- * @mask:	mask of signals to set
- * @bits:	bitmap of signal output values
- *
- * Assigns output values defined by @bits for the signals defined by @mask.
- */
-void idio_16_set_multiple(struct idio_16 __iomem *const reg,
-			  struct idio_16_state *const state,
-			  const unsigned long *const mask,
-			  const unsigned long *const bits)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&state->lock, flags);
-
-	bitmap_replace(state->out_state, state->out_state, bits, mask,
-		       IDIO_16_NOUT);
-	if (*mask & GENMASK(7, 0))
-		iowrite8(bitmap_get_value8(state->out_state, 0), &reg->out0_7);
-	if (*mask & GENMASK(15, 8))
-		iowrite8(bitmap_get_value8(state->out_state, 8), &reg->out8_15);
-
-	spin_unlock_irqrestore(&state->lock, flags);
-}
-EXPORT_SYMBOL_GPL(idio_16_set_multiple);
-
-/**
- * idio_16_state_init - initialize idio_16_state structure
- * @state:	ACCES IDIO-16 device state
- *
- * Initializes the ACCES IDIO-16 device @state for use in idio-16 library
- * functions.
- */
-void idio_16_state_init(struct idio_16_state *const state)
-{
-	spin_lock_init(&state->lock);
-}
-EXPORT_SYMBOL_GPL(idio_16_state_init);
-
 MODULE_AUTHOR("William Breathitt Gray");
 MODULE_DESCRIPTION("ACCES IDIO-16 GPIO Library");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpio/gpio-idio-16.h b/drivers/gpio/gpio-idio-16.h
index 255bd8504ed7..93b08ad73065 100644
--- a/drivers/gpio/gpio-idio-16.h
+++ b/drivers/gpio/gpio-idio-16.h
@@ -3,9 +3,6 @@
 #ifndef _IDIO_16_H_
 #define _IDIO_16_H_
 
-#include <linux/spinlock.h>
-#include <linux/types.h>
-
 struct device;
 struct regmap;
 struct regmap_irq;
@@ -30,68 +27,6 @@ struct idio_16_regmap_config {
 	bool filters;
 };
 
-/**
- * struct idio_16 - IDIO-16 registers structure
- * @out0_7:	Read: FET Drive Outputs 0-7
- *		Write: FET Drive Outputs 0-7
- * @in0_7:	Read: Isolated Inputs 0-7
- *		Write: Clear Interrupt
- * @irq_ctl:	Read: Enable IRQ
- *		Write: Disable IRQ
- * @filter_ctl:	Read: Activate Input Filters 0-15
- *		Write: Deactivate Input Filters 0-15
- * @out8_15:	Read: FET Drive Outputs 8-15
- *		Write: FET Drive Outputs 8-15
- * @in8_15:	Read: Isolated Inputs 8-15
- *		Write: Unused
- * @irq_status:	Read: Interrupt status
- *		Write: Unused
- */
-struct idio_16 {
-	u8 out0_7;
-	u8 in0_7;
-	u8 irq_ctl;
-	u8 filter_ctl;
-	u8 out8_15;
-	u8 in8_15;
-	u8 irq_status;
-};
-
-#define IDIO_16_NOUT 16
-
-/**
- * struct idio_16_state - IDIO-16 state structure
- * @lock:	synchronization lock for accessing device state
- * @out_state:	output signals state
- */
-struct idio_16_state {
-	spinlock_t lock;
-	DECLARE_BITMAP(out_state, IDIO_16_NOUT);
-};
-
-/**
- * idio_16_get_direction - get the I/O direction for a signal offset
- * @offset:	offset of signal to get direction
- *
- * Returns the signal direction (0=output, 1=input) for the signal at @offset.
- */
-static inline int idio_16_get_direction(const unsigned long offset)
-{
-	return (offset >= IDIO_16_NOUT) ? 1 : 0;
-}
-
-int idio_16_get(struct idio_16 __iomem *reg, struct idio_16_state *state,
-		unsigned long offset);
-void idio_16_get_multiple(struct idio_16 __iomem *reg,
-			  struct idio_16_state *state,
-			  const unsigned long *mask, unsigned long *bits);
-void idio_16_set(struct idio_16 __iomem *reg, struct idio_16_state *state,
-		 unsigned long offset, unsigned long value);
-void idio_16_set_multiple(struct idio_16 __iomem *reg,
-			  struct idio_16_state *state,
-			  const unsigned long *mask, const unsigned long *bits);
-void idio_16_state_init(struct idio_16_state *state);
-
 int devm_idio_16_regmap_register(struct device *dev, const struct idio_16_regmap_config *config);
 
 #endif /* _IDIO_16_H_ */
-- 
2.41.0

