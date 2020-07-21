Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C361F227BDE
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 11:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728870AbgGUJf5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 05:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728632AbgGUJfx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 05:35:53 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5204BC061794;
        Tue, 21 Jul 2020 02:35:53 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id g10so1790829wmc.1;
        Tue, 21 Jul 2020 02:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b92BE/hZKY+gjwucuuS/CMUVSb/8weeCwi6EiQ13/T0=;
        b=BYZzWnhKho+7IhZbgt1uwwO5vjJXiLRuXun3UhFahfYTJ9Ecqy4SM8OKuxFjrv3OFA
         eHZu+VN7npH4nrETvKSGQ6I6MX7+Zju3UcHhCyeSsbaiWJArCw+lAP+CcS6j11mEKRwc
         LmP4xlcQ1ypQ8CqlVpGLRDnzPKbckj/XQDVj7P6vndTFkAxcF11fSISP9/djDj7V8+BE
         KBIhZG5gnTylkmsjLGqWnoiFB1C0cKsyEu9Lt9ICMGm5P0KahqsfsbjBhATY5VCE0s7X
         qjrpfUr4zRDRQq9Vir5WZlF9X+tR/ltmMpFPxlbx+vLc3bq4EF9oXK1bJUQdz3YhCBRr
         bKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b92BE/hZKY+gjwucuuS/CMUVSb/8weeCwi6EiQ13/T0=;
        b=V4qsdyUjUwxozodrvjSa00sU0Fpa0RnhFRdJhdKO4VUQ2lQerX6P4uKVSXh4uNZPU8
         uPr74+j4Kk/E+NIiAmjRZsh0lM0O1TEJWAepr5vM5ODKhTt2ji2XGLeR1QDUhWCUzJXR
         91iSvTOYEOBgd7UpD5uVrFPU5llBsjvZKbZUACvjNeI2zyjkLdncVASrqXJGBINMCwmZ
         GmYXYMFIXgJuKA2+DNXzAKFlXSRWR2cInFuG8CpzzMf4iqmANf4Y/jwUwgrfPtoLlf08
         vkBA3DOPAEBmE+VcK+XQ4clbBODDmIYPz1dAWvl7lxJbUcZ/8EqqEASkrzHXBeCPcdRe
         AzyA==
X-Gm-Message-State: AOAM5331NPks3aarZfOHT3TdIYcQCKokQdqgw9yiyFTJ48+oGCUK8ObC
        QvXb/miQ+ZLlYqH6j0qp7BxThvKUARc=
X-Google-Smtp-Source: ABdhPJyBNyJwPjy80glpvSMcfdPeLiN3zcdkRiJc4bBAr4n/kW0yC9pJQMTiAI4QuWitczTvA0pYYw==
X-Received: by 2002:a1c:e008:: with SMTP id x8mr1604694wmg.129.1595324152053;
        Tue, 21 Jul 2020 02:35:52 -0700 (PDT)
Received: from localhost ([41.37.22.226])
        by smtp.gmail.com with ESMTPSA id 1sm2678392wmf.0.2020.07.21.02.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 02:35:51 -0700 (PDT)
From:   Abanoub Sameh <abanoubsameh8@gmail.com>
X-Google-Original-From: Abanoub Sameh <abanoubsameh@protonmail.com>
To:     andy.shevchenko@gmail.com
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Subject: [PATCH 5/7] gpio: fixed coding style issues in gpio-msic.c
Date:   Tue, 21 Jul 2020 11:35:20 +0200
Message-Id: <20200721093522.2309530-5-abanoubsameh@protonmail.com>
X-Mailer: git-send-email 2.28.0.rc0
In-Reply-To: <20200721093522.2309530-1-abanoubsameh@protonmail.com>
References: <20200721093522.2309530-1-abanoubsameh@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Signed-off-by: Abanoub Sameh <abanoubsameh@protonmail.com>
---
 drivers/gpio/gpio-msic.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-msic.c b/drivers/gpio/gpio-msic.c
index 7e3c96e4ab2c..37664e7b3ddd 100644
--- a/drivers/gpio/gpio-msic.c
+++ b/drivers/gpio/gpio-msic.c
@@ -43,9 +43,9 @@ struct msic_gpio {
 	struct mutex		buslock;
 	struct gpio_chip	chip;
 	int			irq;
-	unsigned		irq_base;
+	unsigned int		irq_base;
 	unsigned long		trig_change_mask;
-	unsigned		trig_type;
+	unsigned int		trig_type;
 };
 
 /*
@@ -58,7 +58,7 @@ struct msic_gpio {
  * GPIO1HV0..GPIO1HV3: high voltage, bank 1, gpio_base + 20
  */
 
-static int msic_gpio_to_ireg(unsigned offset)
+static int msic_gpio_to_ireg(unsigned int offset)
 {
 	if (offset >= MSIC_NUM_GPIO)
 		return -EINVAL;
@@ -73,7 +73,7 @@ static int msic_gpio_to_ireg(unsigned offset)
 	return INTEL_MSIC_GPIO1HV0CTLI - offset + 20;
 }
 
-static int msic_gpio_to_oreg(unsigned offset)
+static int msic_gpio_to_oreg(unsigned int offset)
 {
 	if (offset >= MSIC_NUM_GPIO)
 		return -EINVAL;
@@ -88,7 +88,7 @@ static int msic_gpio_to_oreg(unsigned offset)
 	return INTEL_MSIC_GPIO1HV0CTLO - offset + 20;
 }
 
-static int msic_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+static int msic_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	int reg;
 
@@ -100,10 +100,10 @@ static int msic_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 }
 
 static int msic_gpio_direction_output(struct gpio_chip *chip,
-			unsigned offset, int value)
+			unsigned int offset, int value)
 {
 	int reg;
-	unsigned mask;
+	unsigned int mask;
 
 	value = (!!value) | MSIC_GPIO_DIR_OUT;
 	mask = MSIC_GPIO_DIR_MASK | MSIC_GPIO_DOUT_MASK;
@@ -115,7 +115,7 @@ static int msic_gpio_direction_output(struct gpio_chip *chip,
 	return intel_msic_reg_update(reg, value, mask);
 }
 
-static int msic_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int msic_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	u8 r;
 	int ret;
@@ -132,7 +132,7 @@ static int msic_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(r & MSIC_GPIO_DIN_MASK);
 }
 
-static void msic_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void msic_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	int reg;
 
@@ -140,7 +140,7 @@ static void msic_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	if (reg < 0)
 		return;
 
-	intel_msic_reg_update(reg, !!value , MSIC_GPIO_DOUT_MASK);
+	intel_msic_reg_update(reg, !!value, MSIC_GPIO_DOUT_MASK);
 }
 
 /*
@@ -148,7 +148,7 @@ static void msic_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
  * irq_desc->lock held. We can not access the scu bus here, so we
  * store the change and update in the bus_sync_unlock() function below
  */
-static int msic_irq_type(struct irq_data *data, unsigned type)
+static int msic_irq_type(struct irq_data *data, unsigned int type)
 {
 	struct msic_gpio *mg = irq_data_get_irq_chip_data(data);
 	u32 gpio = data->irq - mg->irq_base;
@@ -163,15 +163,17 @@ static int msic_irq_type(struct irq_data *data, unsigned type)
 	return 0;
 }
 
-static int msic_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
+static int msic_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	struct msic_gpio *mg = gpiochip_get_data(chip);
+
 	return mg->irq_base + offset;
 }
 
 static void msic_bus_lock(struct irq_data *data)
 {
 	struct msic_gpio *mg = irq_data_get_irq_chip_data(data);
+
 	mutex_lock(&mg->buslock);
 }
 
@@ -183,8 +185,9 @@ static void msic_bus_sync_unlock(struct irq_data *data)
 	u8 trig = 0;
 
 	/* We can only get one change at a time as the buslock covers the
-	   entire transaction. The irq_desc->lock is dropped before we are
-	   called but that is fine */
+	 * entire transaction. The irq_desc->lock is dropped before we are
+	 * called but that is fine
+	 */
 	if (mg->trig_change_mask) {
 		offset = __ffs(mg->trig_change_mask);
 
-- 
2.28.0.rc0

