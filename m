Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41F092282AD
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 16:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728156AbgGUOuB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 10:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbgGUOuA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 10:50:00 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF0DFC061794;
        Tue, 21 Jul 2020 07:49:59 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z15so21464210wrl.8;
        Tue, 21 Jul 2020 07:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cZetXmbyWOvYbaVmJBjZ5gofoHIdQ4s4qUgojNYE0NQ=;
        b=DnwDwXp4wL6zVNDnjCGyaDNgMco25mow4mMGKMYYhdsDg3IMlTbW4JpAI9dkVUMuRH
         cYvHsG/iKx9pnDUlkZclECjcqeRGyGemQzE2oxp7Mba5edjQ9SapscM5aDESEC2c43mI
         7ugAj0HF4Z8VMjH+wnt/TfoSoWts/hYFeQI49JZZbhroBQI7UrAl/zR4pe0oRZI/b2dt
         ZGislyjgmUeXRYWcsw3TEhkKPYyg5BWwt0NiANdn8jEHvO37OLNSuqKMsgGRb8YcHK+r
         D3U52VBZKQRI8iBchD28z+ug6/15blHAYYU+VTQF70CY3Y+U/hZRrvXqvE+mSgvf4wyi
         sbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cZetXmbyWOvYbaVmJBjZ5gofoHIdQ4s4qUgojNYE0NQ=;
        b=QgNl9ydKuudpQLKZYqPXN1nfu92bNGZZ4huQ1I3tHznWhyy5pUGJcB+A9Lzr2BFwb/
         ZF2PP1gLbTYgXMoKOoeBfWAx/3X6YBQ1qOBMeLu1caclurhvI3zPvHZtWnmdW48aHDTG
         Kv7Qc1IYPjA/1Q8Z2L2zb4AA5jfwtcxqROtiGP2wQGRVsA2Tk5mk6Hgh7HKS6KJpuNl3
         bjiYG8CSfhtn7jIYgJZX5qy/Vl7M4qLhJD5vcLi56n8mm05eqOn9WooA/eFNfOh65kUs
         /R53jfKTfUD2c4TTj4KRcKaPnKuBho5o7UW4Aynul6g6TcpFjls2gYbpaZOrn4s4ImUN
         YqlA==
X-Gm-Message-State: AOAM532GAeMe3dDeALAjB45W0pQAfHYnUJxx5vAoE5GWPpL0tyQ+f9dz
        sPQktILSvBhE3EprXxfNYGM=
X-Google-Smtp-Source: ABdhPJxMlO7SX2mv21SVZrwacERp2Kn6/XeGsafSLImZ7lHVv9gtHqxOM9idG4VV2/3723aVn0bIeA==
X-Received: by 2002:adf:fb06:: with SMTP id c6mr2161007wrr.261.1595342998675;
        Tue, 21 Jul 2020 07:49:58 -0700 (PDT)
Received: from localhost ([156.204.74.63])
        by smtp.gmail.com with ESMTPSA id n189sm3239334wmf.38.2020.07.21.07.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 07:49:58 -0700 (PDT)
From:   Abanoub Sameh <abanoubsameh8@gmail.com>
X-Google-Original-From: Abanoub Sameh <abanoubsameh@protonmail.com>
To:     andy.shevchenko@gmail.com
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Subject: [PATCH 1/3] gpio: gpio-intel-mid.c: changed every 'unsigned' to 'unsigned int'
Date:   Tue, 21 Jul 2020 16:49:40 +0200
Message-Id: <20200721144942.762495-1-abanoubsameh@protonmail.com>
X-Mailer: git-send-email 2.28.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Changed 'unsigned' to 'unsigned int'.
This makes the code more uniform, and compliant with the kernel coding style.

Signed-off-by: Abanoub Sameh <abanoubsameh@protonmail.com>
---
 drivers/gpio/gpio-intel-mid.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mid.c
index 86a10c808ef6..6487acab104c 100644
--- a/drivers/gpio/gpio-intel-mid.c
+++ b/drivers/gpio/gpio-intel-mid.c
@@ -64,27 +64,27 @@ struct intel_mid_gpio {
 	struct pci_dev			*pdev;
 };
 
-static void __iomem *gpio_reg(struct gpio_chip *chip, unsigned offset,
+static void __iomem *gpio_reg(struct gpio_chip *chip, unsigned int offset,
 			      enum GPIO_REG reg_type)
 {
 	struct intel_mid_gpio *priv = gpiochip_get_data(chip);
-	unsigned nreg = chip->ngpio / 32;
+	unsigned int nreg = chip->ngpio / 32;
 	u8 reg = offset / 32;
 
 	return priv->reg_base + reg_type * nreg * 4 + reg * 4;
 }
 
-static void __iomem *gpio_reg_2bit(struct gpio_chip *chip, unsigned offset,
+static void __iomem *gpio_reg_2bit(struct gpio_chip *chip, unsigned int offset,
 				   enum GPIO_REG reg_type)
 {
 	struct intel_mid_gpio *priv = gpiochip_get_data(chip);
-	unsigned nreg = chip->ngpio / 32;
+	unsigned int nreg = chip->ngpio / 32;
 	u8 reg = offset / 16;
 
 	return priv->reg_base + reg_type * nreg * 4 + reg * 4;
 }
 
-static int intel_gpio_request(struct gpio_chip *chip, unsigned offset)
+static int intel_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	void __iomem *gafr = gpio_reg_2bit(chip, offset, GAFR);
 	u32 value = readl(gafr);
@@ -97,14 +97,14 @@ static int intel_gpio_request(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static int intel_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int intel_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	void __iomem *gplr = gpio_reg(chip, offset, GPLR);
 
 	return !!(readl(gplr) & BIT(offset % 32));
 }
 
-static void intel_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void intel_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	void __iomem *gpsr, *gpcr;
 
@@ -117,7 +117,7 @@ static void intel_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	}
 }
 
-static int intel_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+static int intel_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	struct intel_mid_gpio *priv = gpiochip_get_data(chip);
 	void __iomem *gpdr = gpio_reg(chip, offset, GPDR);
@@ -140,7 +140,7 @@ static int intel_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 }
 
 static int intel_gpio_direction_output(struct gpio_chip *chip,
-			unsigned offset, int value)
+			unsigned int offset, int value)
 {
 	struct intel_mid_gpio *priv = gpiochip_get_data(chip);
 	void __iomem *gpdr = gpio_reg(chip, offset, GPDR);
@@ -163,7 +163,7 @@ static int intel_gpio_direction_output(struct gpio_chip *chip,
 	return 0;
 }
 
-static int intel_mid_irq_type(struct irq_data *d, unsigned type)
+static int intel_mid_irq_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct intel_mid_gpio *priv = gpiochip_get_data(gc);
@@ -297,7 +297,7 @@ static int intel_mid_irq_init_hw(struct gpio_chip *chip)
 {
 	struct intel_mid_gpio *priv = gpiochip_get_data(chip);
 	void __iomem *reg;
-	unsigned base;
+	unsigned int base;
 
 	for (base = 0; base < priv->chip.ngpio; base += 32) {
 		/* Clear the rising-edge detect register */
-- 
2.28.0.rc0

