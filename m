Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28B14C8875
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2019 14:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727456AbfJBM2f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 08:28:35 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34525 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbfJBM2e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 08:28:34 -0400
Received: by mail-wm1-f66.google.com with SMTP id y135so4823030wmc.1;
        Wed, 02 Oct 2019 05:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CBafHZOcPLRsPg6HMh6RW3fmvKDiW2MODjit57xEepE=;
        b=TsA9TpB72Q02EPmaBqcc4zzucsjsdc5mtjgAgTak5YrKh+mRT2HMioWeCxrLu5Cl+6
         66PhcUzrRtOnct3yEqC1hueFX+K8TsDr1bJq2f3L5LqA9rYz5Hdk93jVmwyEKtrPUOa5
         DNgu/r4ppuWX/d9nuLpVLcFGOzWYjz/GSfyRm/B0MNSsiIFx/VfjsK6OQk48uN2gyMPf
         LsirANA0HYZPyXaUFBkchtTE71HqGFSIzJGUSVGm12Z26puMZ9GiUid1l1XJjdDuFfhU
         3k9TQnvLEpZDHArb2G8JrwRI8fRZ/OBDLPyKvH/EEdDYa/FfJOzliZBqMgVFpXpXGTZ6
         7YAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CBafHZOcPLRsPg6HMh6RW3fmvKDiW2MODjit57xEepE=;
        b=MVU3M5NDj2W8TitA2MM98hE9Vgb07UODtrRolwf9TaeTgf2XRMgYAWr9v5zaHvBU2q
         4q/HPqbn0WAW3OBfSQLW6CFcdiHOkjfR+r8tKHpNMNBbeDrj1DeeKE/A25plLXxg+Ypz
         1bKJe6DPvjIqLvrpVmPADaRtsAkgDFTt/h41ti2uTwS5xq4qEf1mwz6lFyJkGyf+Qjb5
         pnViJ3Lv89RLBvJwWj0j2t/EzzznPZn9xP663YkNrUNRYrAM7ZBauvK7kMyf8LnKo96E
         +niJu7OV4PnRspOC8AS3PPM4DHGctXZl6QMcJ1LyPwBkd8EHJioV1iDJKqHQIbxew46f
         AzCA==
X-Gm-Message-State: APjAAAWbRYKoHNSgs+vkRdoNeam2jbbuVKAFxN3ysahEdBul5DIjNFsz
        JRjkPkilW+LPTwy2EmDLNUE=
X-Google-Smtp-Source: APXvYqyfSTFvcH9+iLVzVGJ5KDEauN0ssdr9eBfIIdRWe8prWnP7KBGuKItc0GAk8lMLMDzdLKlWtw==
X-Received: by 2002:a1c:7306:: with SMTP id d6mr2864027wmb.62.1570019311374;
        Wed, 02 Oct 2019 05:28:31 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id 90sm3179450wrr.1.2019.10.02.05.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 05:28:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Timo Alho <talho@nvidia.com>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] gpio: max77620: Fix interrupt handling
Date:   Wed,  2 Oct 2019 14:28:25 +0200
Message-Id: <20191002122825.3948322-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191002122825.3948322-1-thierry.reding@gmail.com>
References: <20191002122825.3948322-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Timo Alho <talho@nvidia.com>

The interrupt-related register fields on the MAX77620 GPIO controller
share registers with GPIO related fields. If the IRQ chip is implemented
with regmap-irq, this causes the IRQ controller code to overwrite fields
previously configured by the GPIO controller code.

Two examples where this causes problems are the NVIDIA Jetson TX1 and
Jetson TX2 boards, where some of the GPIOs are used to enable vital
power regulators. The MAX77620 GPIO controller also provides the USB OTG
ID pin. If configured as an interrupt, this causes some of the
regulators to be powered off.

Signed-off-by: Timo Alho <talho@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-max77620.c | 231 ++++++++++++++++++-----------------
 1 file changed, 117 insertions(+), 114 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index c58b56e5291e..c5b64a4ac172 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -18,109 +18,115 @@ struct max77620_gpio {
 	struct gpio_chip	gpio_chip;
 	struct regmap		*rmap;
 	struct device		*dev;
+	struct mutex		buslock; /* irq_bus_lock */
+	unsigned int		irq_type[8];
+	bool			irq_enabled[8];
 };
 
-static const struct regmap_irq max77620_gpio_irqs[] = {
-	[0] = {
-		.reg_offset = 0,
-		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE0,
-		.type = {
-			.type_rising_val = MAX77620_CNFG_GPIO_INT_RISING,
-			.type_falling_val = MAX77620_CNFG_GPIO_INT_FALLING,
-			.type_reg_mask = MAX77620_CNFG_GPIO_INT_MASK,
-			.type_reg_offset = 0,
-			.types_supported = IRQ_TYPE_EDGE_BOTH,
-		},
-	},
-	[1] = {
-		.reg_offset = 0,
-		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE1,
-		.type = {
-			.type_rising_val = MAX77620_CNFG_GPIO_INT_RISING,
-			.type_falling_val = MAX77620_CNFG_GPIO_INT_FALLING,
-			.type_reg_mask = MAX77620_CNFG_GPIO_INT_MASK,
-			.type_reg_offset = 1,
-			.types_supported = IRQ_TYPE_EDGE_BOTH,
-		},
-	},
-	[2] = {
-		.reg_offset = 0,
-		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE2,
-		.type = {
-			.type_rising_val = MAX77620_CNFG_GPIO_INT_RISING,
-			.type_falling_val = MAX77620_CNFG_GPIO_INT_FALLING,
-			.type_reg_mask = MAX77620_CNFG_GPIO_INT_MASK,
-			.type_reg_offset = 2,
-			.types_supported = IRQ_TYPE_EDGE_BOTH,
-		},
-	},
-	[3] = {
-		.reg_offset = 0,
-		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE3,
-		.type = {
-			.type_rising_val = MAX77620_CNFG_GPIO_INT_RISING,
-			.type_falling_val = MAX77620_CNFG_GPIO_INT_FALLING,
-			.type_reg_mask = MAX77620_CNFG_GPIO_INT_MASK,
-			.type_reg_offset = 3,
-			.types_supported = IRQ_TYPE_EDGE_BOTH,
-		},
-	},
-	[4] = {
-		.reg_offset = 0,
-		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE4,
-		.type = {
-			.type_rising_val = MAX77620_CNFG_GPIO_INT_RISING,
-			.type_falling_val = MAX77620_CNFG_GPIO_INT_FALLING,
-			.type_reg_mask = MAX77620_CNFG_GPIO_INT_MASK,
-			.type_reg_offset = 4,
-			.types_supported = IRQ_TYPE_EDGE_BOTH,
-		},
-	},
-	[5] = {
-		.reg_offset = 0,
-		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE5,
-		.type = {
-			.type_rising_val = MAX77620_CNFG_GPIO_INT_RISING,
-			.type_falling_val = MAX77620_CNFG_GPIO_INT_FALLING,
-			.type_reg_mask = MAX77620_CNFG_GPIO_INT_MASK,
-			.type_reg_offset = 5,
-			.types_supported = IRQ_TYPE_EDGE_BOTH,
-		},
-	},
-	[6] = {
-		.reg_offset = 0,
-		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE6,
-		.type = {
-			.type_rising_val = MAX77620_CNFG_GPIO_INT_RISING,
-			.type_falling_val = MAX77620_CNFG_GPIO_INT_FALLING,
-			.type_reg_mask = MAX77620_CNFG_GPIO_INT_MASK,
-			.type_reg_offset = 6,
-			.types_supported = IRQ_TYPE_EDGE_BOTH,
-		},
-	},
-	[7] = {
-		.reg_offset = 0,
-		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE7,
-		.type = {
-			.type_rising_val = MAX77620_CNFG_GPIO_INT_RISING,
-			.type_falling_val = MAX77620_CNFG_GPIO_INT_FALLING,
-			.type_reg_mask = MAX77620_CNFG_GPIO_INT_MASK,
-			.type_reg_offset = 7,
-			.types_supported = IRQ_TYPE_EDGE_BOTH,
-		},
-	},
-};
+static irqreturn_t max77620_gpio_irqhandler(int irq, void *data)
+{
+	struct max77620_gpio *gpio = data;
+	unsigned int value, offset;
+	unsigned long pending;
+	int err;
+
+	err = regmap_read(gpio->rmap, MAX77620_REG_IRQ_LVL2_GPIO, &value);
+	if (err < 0) {
+		dev_err(gpio->dev, "REG_IRQ_LVL2_GPIO read failed: %d\n", err);
+		return IRQ_NONE;
+	}
+
+	pending = value;
+
+	for_each_set_bit(offset, &pending, 8) {
+		unsigned int virq;
+
+		virq = irq_find_mapping(gpio->gpio_chip.irq.domain, offset);
+		handle_nested_irq(virq);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void max77620_gpio_irq_mask(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct max77620_gpio *gpio = gpiochip_get_data(chip);
+
+	gpio->irq_enabled[data->hwirq] = false;
+}
 
-static const struct regmap_irq_chip max77620_gpio_irq_chip = {
-	.name = "max77620-gpio",
-	.irqs = max77620_gpio_irqs,
-	.num_irqs = ARRAY_SIZE(max77620_gpio_irqs),
-	.num_regs = 1,
-	.num_type_reg = 8,
-	.irq_reg_stride = 1,
-	.type_reg_stride = 1,
-	.status_base = MAX77620_REG_IRQ_LVL2_GPIO,
-	.type_base = MAX77620_REG_GPIO0,
+static void max77620_gpio_irq_unmask(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct max77620_gpio *gpio = gpiochip_get_data(chip);
+
+	gpio->irq_enabled[data->hwirq] = true;
+}
+
+static int max77620_gpio_set_irq_type(struct irq_data *data, unsigned int type)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct max77620_gpio *gpio = gpiochip_get_data(chip);
+	unsigned int irq_type;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+		irq_type = MAX77620_CNFG_GPIO_INT_RISING;
+		break;
+
+	case IRQ_TYPE_EDGE_FALLING:
+		irq_type = MAX77620_CNFG_GPIO_INT_FALLING;
+		break;
+
+	case IRQ_TYPE_EDGE_BOTH:
+		irq_type = MAX77620_CNFG_GPIO_INT_RISING |
+			   MAX77620_CNFG_GPIO_INT_FALLING;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	gpio->irq_type[data->hwirq] = irq_type;
+
+	return 0;
+}
+
+static void max77620_gpio_bus_lock(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct max77620_gpio *gpio = gpiochip_get_data(chip);
+
+	mutex_lock(&gpio->buslock);
+}
+
+static void max77620_gpio_bus_sync_unlock(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct max77620_gpio *gpio = gpiochip_get_data(chip);
+	unsigned int value, offset = data->hwirq;
+	int err;
+
+	value = gpio->irq_enabled[offset] ? gpio->irq_type[offset] : 0;
+
+	err = regmap_update_bits(gpio->rmap, GPIO_REG_ADDR(offset),
+				 MAX77620_CNFG_GPIO_INT_MASK, value);
+	if (err < 0)
+		dev_err(chip->parent, "failed to update interrupt mask: %d\n",
+			err);
+
+	mutex_unlock(&gpio->buslock);
+}
+
+static struct irq_chip max77620_gpio_irqchip = {
+	.name		= "max77620-gpio",
+	.irq_mask	= max77620_gpio_irq_mask,
+	.irq_unmask	= max77620_gpio_irq_unmask,
+	.irq_set_type	= max77620_gpio_set_irq_type,
+	.irq_bus_lock	= max77620_gpio_bus_lock,
+	.irq_bus_sync_unlock = max77620_gpio_bus_sync_unlock,
+	.flags		= IRQCHIP_MASK_ON_SUSPEND,
 };
 
 static int max77620_gpio_dir_input(struct gpio_chip *gc, unsigned int offset)
@@ -254,14 +260,6 @@ static int max77620_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 	return -ENOTSUPP;
 }
 
-static int max77620_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
-{
-	struct max77620_gpio *mgpio = gpiochip_get_data(gc);
-	struct max77620_chip *chip = dev_get_drvdata(mgpio->dev->parent);
-
-	return regmap_irq_get_virq(chip->gpio_irq_data, offset);
-}
-
 static int max77620_gpio_probe(struct platform_device *pdev)
 {
 	struct max77620_chip *chip =  dev_get_drvdata(pdev->dev.parent);
@@ -287,7 +285,6 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	mgpio->gpio_chip.direction_output = max77620_gpio_dir_output;
 	mgpio->gpio_chip.set = max77620_gpio_set;
 	mgpio->gpio_chip.set_config = max77620_gpio_set_config;
-	mgpio->gpio_chip.to_irq = max77620_gpio_to_irq;
 	mgpio->gpio_chip.ngpio = MAX77620_GPIO_NR;
 	mgpio->gpio_chip.can_sleep = 1;
 	mgpio->gpio_chip.base = -1;
@@ -303,15 +300,21 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_regmap_add_irq_chip(&pdev->dev, chip->rmap, gpio_irq,
-				       IRQF_ONESHOT, 0,
-				       &max77620_gpio_irq_chip,
-				       &chip->gpio_irq_data);
+	mutex_init(&mgpio->buslock);
+
+	gpiochip_irqchip_add_nested(&mgpio->gpio_chip, &max77620_gpio_irqchip,
+				    0, handle_edge_irq, IRQ_TYPE_NONE);
+
+	ret = request_threaded_irq(gpio_irq, NULL, max77620_gpio_irqhandler,
+				   IRQF_ONESHOT, "max77620-gpio", mgpio);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to add gpio irq_chip %d\n", ret);
+		dev_err(&pdev->dev, "failed to request IRQ: %d\n", ret);
 		return ret;
 	}
 
+	gpiochip_set_nested_irqchip(&mgpio->gpio_chip, &max77620_gpio_irqchip,
+				    gpio_irq);
+
 	return 0;
 }
 
-- 
2.23.0

