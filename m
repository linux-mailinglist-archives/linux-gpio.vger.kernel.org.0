Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C32C2B144C
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Nov 2020 03:34:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgKMCeC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 21:34:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbgKMCeC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Nov 2020 21:34:02 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 087FEC0613D1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2020 18:34:02 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id c20so6340013pfr.8
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2020 18:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ejXfZ1mmSlVkQ2SZPpazp5/sRAvJ9j7gM/7PmisIs44=;
        b=L7o8rnKl1i3/GnXdAdJsZ0BuC8Dna41VHg392jjZJ/9ysLWdVQ11ctb51lczabtxvF
         3Q8nAeGzDBssZhIIECvAvBrPY7pDCXBilvYYueknPN3rD969H525/eidIBpwcXVias0D
         5E0f6fXlB6u1SBR3RpdpY330IKkJIiyQ2JjU7jTH75wwIvZwo7USJFdIcLZi0UkqT5xY
         pS4gZWM2IYV11CL82MiujdwhU310DuOX1sXuRX7npwFD7LdRgJJiC37h1vl7zC4vSe/3
         jGr7wMBgiv92ZU8QrzO0wGOQ1n4p2TnFfUqgswkywyas18zNpIjnoH1UasXfGlE/NPtm
         kVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ejXfZ1mmSlVkQ2SZPpazp5/sRAvJ9j7gM/7PmisIs44=;
        b=lPso3Uu+5W+DkocQcnf6thdD4YPtfZBsSdXwwrol3KxCIuKWUDLhccp3gIrZixTLzM
         EeboaK0oW0zTh4Gg8ytQNRkuv7qCNvacambV8rJwlJ44fCVwxDwXoSze3Hy4fKFrsbUP
         fR+JyOOCMzE4/JlgMrz7o9AjsYGj+Gbm0SUNpSLGyPxhhDeoP+FweQiM2Gixjhj1FV2w
         Do4XShgC9v8DTzCadqvpFeI5qj+VgaWXkbHUIognSxaRWdhgJYR/HsBYf4tTotcjTza+
         RhYczBjMRXPi/puuDSpXbDAIeLOqAnrvCOj0os1qIgpBd+qByNzrIBoUVmXL6rod/EEp
         sJdQ==
X-Gm-Message-State: AOAM5312kBkp4B/Cl4MNA5DWNznUE3Tj5uXYELuaJJNEh595zXpjE5MP
        bNNJUfuo4icn2ga4A3cPpmCnvg==
X-Google-Smtp-Source: ABdhPJy7ett4bGSjt7SpZThhU12xUM8cvoPkfFBbEY47GmSwkAbDvZianrCuK2vKnIeT0YKcNJaSTg==
X-Received: by 2002:a17:90b:150c:: with SMTP id le12mr303788pjb.139.1605234841458;
        Thu, 12 Nov 2020 18:34:01 -0800 (PST)
Received: from hsinchu02.internal.sifive.com (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
        by smtp.gmail.com with ESMTPSA id mm23sm8476315pjb.31.2020.11.12.18.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 18:34:00 -0800 (PST)
From:   Greentime Hu <greentime.hu@sifive.com>
To:     greentime.hu@sifive.com, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com,
        andy.shevchenko@gmail.com, yash.shah@sifive.com
Subject: [PATCH v3] gpio: sifive: To get gpio irq offset from device tree data
Date:   Fri, 13 Nov 2020 10:33:55 +0800
Message-Id: <20201113023355.43406-1-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We can get hwirq number of the gpio by its irq_data->hwirq so that we don't
need to add more macros for different platforms. This patch is tested in
SiFive Unleashed board and SiFive Unmatched board.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 drivers/gpio/gpio-sifive.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index c54dd08f2cbf..630bddec48e5 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -29,7 +29,6 @@
 #define SIFIVE_GPIO_OUTPUT_XOR	0x40
 
 #define SIFIVE_GPIO_MAX		32
-#define SIFIVE_GPIO_IRQ_OFFSET	7
 
 struct sifive_gpio {
 	void __iomem		*base;
@@ -37,7 +36,7 @@ struct sifive_gpio {
 	struct regmap		*regs;
 	unsigned long		irq_state;
 	unsigned int		trigger[SIFIVE_GPIO_MAX];
-	unsigned int		irq_parent[SIFIVE_GPIO_MAX];
+	unsigned int		irq_number[SIFIVE_GPIO_MAX];
 };
 
 static void sifive_gpio_set_ie(struct sifive_gpio *chip, unsigned int offset)
@@ -144,8 +143,12 @@ static int sifive_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
 					     unsigned int *parent,
 					     unsigned int *parent_type)
 {
+	struct sifive_gpio *chip = gpiochip_get_data(gc);
+	struct irq_data *d = irq_get_irq_data(chip->irq_number[child]);
+
 	*parent_type = IRQ_TYPE_NONE;
-	*parent = child + SIFIVE_GPIO_IRQ_OFFSET;
+	*parent = irqd_to_hwirq(d);
+
 	return 0;
 }
 
@@ -165,7 +168,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	struct irq_domain *parent;
 	struct gpio_irq_chip *girq;
 	struct sifive_gpio *chip;
-	int ret, ngpio;
+	int ret, ngpio, i;
 
 	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
@@ -200,6 +203,9 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	for (i = 0; i < ngpio; i++)
+		chip->irq_number[i] = platform_get_irq(pdev, i);
+
 	ret = bgpio_init(&chip->gc, dev, 4,
 			 chip->base + SIFIVE_GPIO_INPUT_VAL,
 			 chip->base + SIFIVE_GPIO_OUTPUT_VAL,
-- 
2.29.2

