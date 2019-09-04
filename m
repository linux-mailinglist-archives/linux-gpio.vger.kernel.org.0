Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE59A883B
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2019 21:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730619AbfIDOBp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 10:01:45 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41576 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731061AbfIDOBM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 10:01:12 -0400
Received: by mail-lj1-f193.google.com with SMTP id a4so4684365ljk.8
        for <linux-gpio@vger.kernel.org>; Wed, 04 Sep 2019 07:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Az8CLX3NhNywISvF2UniXxJFBdJE667r99MivUrsA0=;
        b=LP/yuHnVln1QN4iuOnKf7iMoIX6ytjnZU1vHInoU4n+rZVec1OZzYsY5mSICs3lxFj
         2HnXItelCN41mO1t9gh9C6m/ppic4NeWxpG+hrRvdGyXdrXrEsnt6Yqa3nHHxFEqj3Js
         rW2RlzFvfyc9giHIumFSy1DOVQmeJrWYwCT63d/bjunc4kzfpGijCsVDc9Ysu1lvU0nn
         hgqe+4qQTTczO8oDOiOnxk/FHvs1YNlnFkl0b69tgOBubCibRZ56xiJxwHk1bzaMDo3a
         c+TQygLzzIajYVKqXT3FqE6bKgRzgCNAjZFE648tpF+sN/hblHQKHD20eeqKbAzst0AY
         mgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Az8CLX3NhNywISvF2UniXxJFBdJE667r99MivUrsA0=;
        b=Le3bw2NMUHawTainaFL+Wypz3WHcGR1nOmfHd4FxSfyss0JTAsHgtLLn4wnVofnV1R
         6MLJdzOGbETexVmuqDs8MrbbhdeReLoSu/TMWscfU703g3XHVPnmNCq5tku/1WtEtuKF
         ad9BPgCI5oZykWBsBseNFrdHp29utIundkSd9DlOXQnhtdKru3zaTv/CanrNIjPO7+Et
         BHAqcynBLnrPk0x2p4L5gZQObv2bDVd2vOyYyicATAlX42RYX3DZZKRnaPlDRvFvTBbM
         sHg/fJvwjVvMDNawnp/BXPqglFXTbujE13/QskwaEpEjGOcaQfezpJzvtVAxgpb/aSGI
         Y7ww==
X-Gm-Message-State: APjAAAXgSmTMo+Xj60/CC0GuA8UDgsyw9zk4PPWJZwtTYcoDR5Np3DFH
        BgqqVkTBzQvGflxImWfi1+2pgeSq/qs=
X-Google-Smtp-Source: APXvYqz8c/BjpxRc53JM4vgMLpNQMtlSsY4PCQ7mIXjKRBECG87GX6e5DxsU1tHBsT934LeckOQfBw==
X-Received: by 2002:a2e:988c:: with SMTP id b12mr16850039ljj.212.1567605669986;
        Wed, 04 Sep 2019 07:01:09 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id d22sm3859482lji.99.2019.09.04.07.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 07:01:09 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        Andrew Lunn <andrew@lunn.ch>, Andrew Jeffery <andrew@aj.id.au>,
        Joel Stanley <joel@jms.id.au>,
        Thierry Reding <treding@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] gpio: Initialize the irqchip valid_mask with a callback
Date:   Wed,  4 Sep 2019 16:01:04 +0200
Message-Id: <20190904140104.32426-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

After changing the valid_mask for the struct gpio_chip
to detect the need and presence of a valid mask with the
presence of a .init_valid_mask() callback to fill it in,
we augment the gpio_irq_chip to use the same logic.

Switch all driver using the gpio_irq_chio valid_mask
over to this new method.

This makes sure the valid_mask for the gpio_irq_chip gets
filled in when we add the gpio_chip, which makes it a
little easier to switch over drivers using the old
way of setting up gpio_irq_chip over to the new method
of passing the gpio_irq_chip along with the gpio_chip.
(See drivers/gpio/TODO for details.)

Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Thierry Reding <treding@nvidia.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
All is compile tested on top of the gpio "devel" branch.

Andy: I guess this would collide with my attempted
rewrites of some Intel-related drivers, we can either
merge this first and I will rebase and resend the
other changes, or you can send me a pull request
if you think some of my changes are working and I
will instead rebase this on top of that, thanks.

Hans de Goede: I actually think that patch
48057ed1840fde9239b1e000bea1a0a1f07c5e99
"gpio: Fix irqchip initialization order" fixes the
issues you saw with the rewrite of int0002 earlier,
and we suggested setting up the mask as part of the
chip addition then, but this change is nice to have
anyways.
---
 drivers/gpio/gpio-aspeed.c                 | 13 ++++---
 drivers/gpio/gpio-stmpe.c                  | 36 +++++++++++++------
 drivers/gpio/gpio-tqmx86.c                 | 21 ++++++-----
 drivers/gpio/gpiolib.c                     | 12 ++++---
 drivers/pinctrl/intel/pinctrl-baytrail.c   | 16 ++++++++-
 drivers/pinctrl/intel/pinctrl-cherryview.c | 42 +++++++++++++---------
 drivers/platform/x86/intel_int0002_vgpio.c | 11 ++++--
 include/linux/gpio/driver.h                | 16 ++++++---
 8 files changed, 112 insertions(+), 55 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 9defe25d4721..7bcd83dbc3e3 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -689,8 +689,11 @@ static struct irq_chip aspeed_gpio_irqchip = {
 	.irq_set_type	= aspeed_gpio_set_type,
 };
 
-static void set_irq_valid_mask(struct aspeed_gpio *gpio)
+static void aspeed_init_irq_valid_mask(struct gpio_chip *gc,
+				       unsigned long *valid_mask,
+				       unsigned int ngpios)
 {
+	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
 	const struct aspeed_bank_props *props = gpio->config->props;
 
 	while (!is_bank_props_sentinel(props)) {
@@ -704,7 +707,7 @@ static void set_irq_valid_mask(struct aspeed_gpio *gpio)
 			if (i >= gpio->config->nr_gpios)
 				break;
 
-			clear_bit(i, gpio->chip.irq.valid_mask);
+			clear_bit(i, valid_mask);
 		}
 
 		props++;
@@ -1203,7 +1206,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 		girq->parents[0] = gpio->irq;
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_bad_irq;
-		girq->need_valid_mask = true;
+		girq->init_valid_mask = aspeed_init_irq_valid_mask;
 	}
 
 	gpio->offset_timer =
@@ -1215,10 +1218,6 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	if (rc < 0)
 		return rc;
 
-	/* Now the valid mask is allocated */
-	if (gpio->irq)
-		set_irq_valid_mask(gpio);
-
 	return 0;
 }
 
diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index dbf9cbe36b2b..994d542daf53 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -429,6 +429,23 @@ static irqreturn_t stmpe_gpio_irq(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+static void stmpe_init_irq_valid_mask(struct gpio_chip *gc,
+				      unsigned long *valid_mask,
+				      unsigned int ngpios)
+{
+	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(gc);
+	int i;
+
+	if (!stmpe_gpio->norequest_mask)
+		return;
+
+	/* Forbid unused lines to be mapped as IRQs */
+	for (i = 0; i < sizeof(u32); i++) {
+		if (stmpe_gpio->norequest_mask & BIT(i))
+			clear_bit(i, valid_mask);
+	}
+}
+
 static int stmpe_gpio_probe(struct platform_device *pdev)
 {
 	struct stmpe *stmpe = dev_get_drvdata(pdev->dev.parent);
@@ -454,14 +471,21 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 	stmpe_gpio->chip.parent = &pdev->dev;
 	stmpe_gpio->chip.of_node = np;
 	stmpe_gpio->chip.base = -1;
+	/*
+	 * REVISIT: this makes sure the valid mask gets allocated and
+	 * filled in when adding the gpio_chip, but the rest of the
+	 * gpio_irqchip is still filled in using the old method
+	 * in gpiochip_irqchip_add_nested() so clean this up once we
+	 * get the gpio_irqchip to initialize while adding the
+	 * gpio_chip also for threaded irqchips.
+	 */
+	stmpe_gpio->chip.irq.init_valid_mask = stmpe_init_irq_valid_mask;
 
 	if (IS_ENABLED(CONFIG_DEBUG_FS))
                 stmpe_gpio->chip.dbg_show = stmpe_dbg_show;
 
 	of_property_read_u32(np, "st,norequest-mask",
 			&stmpe_gpio->norequest_mask);
-	if (stmpe_gpio->norequest_mask)
-		stmpe_gpio->chip.irq.need_valid_mask = true;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -487,14 +511,6 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "unable to get irq: %d\n", ret);
 			goto out_disable;
 		}
-		if (stmpe_gpio->norequest_mask) {
-			int i;
-
-			/* Forbid unused lines to be mapped as IRQs */
-			for (i = 0; i < sizeof(u32); i++)
-				if (stmpe_gpio->norequest_mask & BIT(i))
-					clear_bit(i, stmpe_gpio->chip.irq.valid_mask);
-		}
 		ret =  gpiochip_irqchip_add_nested(&stmpe_gpio->chip,
 						   &stmpe_gpio_irq_chip,
 						   0,
diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index 07050cdbadb9..a3109bcaa0ac 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -214,6 +214,17 @@ static const struct dev_pm_ops tqmx86_gpio_dev_pm_ops = {
 			   tqmx86_gpio_runtime_resume, NULL)
 };
 
+static void tqmx86_init_irq_valid_mask(struct gpio_chip *chip,
+				       unsigned long *valid_mask,
+				       unsigned int ngpios)
+{
+	/* Only GPIOs 4-7 are valid for interrupts. Clear the others */
+	clear_bit(0, valid_mask);
+	clear_bit(1, valid_mask);
+	clear_bit(2, valid_mask);
+	clear_bit(3, valid_mask);
+}
+
 static int tqmx86_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -260,7 +271,6 @@ static int tqmx86_gpio_probe(struct platform_device *pdev)
 	chip->get = tqmx86_gpio_get;
 	chip->set = tqmx86_gpio_set;
 	chip->ngpio = TQMX86_NGPIO;
-	chip->irq.need_valid_mask = true;
 	chip->parent = pdev->dev.parent;
 
 	pm_runtime_enable(&pdev->dev);
@@ -296,6 +306,7 @@ static int tqmx86_gpio_probe(struct platform_device *pdev)
 		girq->parents[0] = irq;
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_simple_irq;
+		girq->init_valid_mask = tqmx86_init_irq_valid_mask;
 	}
 
 	ret = devm_gpiochip_add_data(dev, chip, gpio);
@@ -304,14 +315,6 @@ static int tqmx86_gpio_probe(struct platform_device *pdev)
 		goto out_pm_dis;
 	}
 
-	/* Only GPIOs 4-7 are valid for interrupts. Clear the others */
-	if (irq) {
-		clear_bit(0, girq->valid_mask);
-		clear_bit(1, girq->valid_mask);
-		clear_bit(2, girq->valid_mask);
-		clear_bit(3, girq->valid_mask);
-	}
-
 	dev_info(dev, "GPIO functionality initialized with %d pins\n",
 		 chip->ngpio);
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5163e87969e7..d3ec5b37ded1 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1606,15 +1606,19 @@ static struct gpio_chip *find_chip_by_name(const char *name)
  * The following is irqchip helper code for gpiochips.
  */
 
-static int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gpiochip)
+static int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gc)
 {
-	if (!gpiochip->irq.need_valid_mask)
+	struct gpio_irq_chip *girq = &gc->irq;
+
+	if (!girq->init_valid_mask)
 		return 0;
 
-	gpiochip->irq.valid_mask = gpiochip_allocate_mask(gpiochip);
-	if (!gpiochip->irq.valid_mask)
+	girq->valid_mask = gpiochip_allocate_mask(gc);
+	if (!girq->valid_mask)
 		return -ENOMEM;
 
+	girq->init_valid_mask(gc, girq->valid_mask, gc->ngpio);
+
 	return 0;
 }
 
diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index e5a112a8e067..297b7b5fcb28 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1455,6 +1455,20 @@ static void byt_gpio_irq_handler(struct irq_desc *desc)
 	chip->irq_eoi(data);
 }
 
+static void byt_init_irq_valid_mask(struct gpio_chip *chip,
+				    unsigned long *valid_mask,
+				    unsigned int ngpios)
+{
+	/*
+	 * FIXME: currently the valid_mask is filled in as part of
+	 * initializing the irq_chip below in byt_gpio_irq_init_hw().
+	 * when converting this driver to the new way of passing the
+	 * gpio_irq_chip along when adding the gpio_chip, move the
+	 * mask initialization into this callback instead. Right now
+	 * this callback is here to make sure the mask gets allocated.
+	 */
+}
+
 static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
 {
 	struct gpio_chip *gc = &vg->chip;
@@ -1525,7 +1539,7 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 	gc->can_sleep	= false;
 	gc->parent	= &vg->pdev->dev;
 	gc->ngpio	= vg->soc_data->npins;
-	gc->irq.need_valid_mask	= true;
+	gc->irq.init_valid_mask	= byt_init_irq_valid_mask;
 
 #ifdef CONFIG_PM_SLEEP
 	vg->saved_context = devm_kcalloc(&vg->pdev->dev, gc->ngpio,
diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 03ec7a5d9d0b..ab681d1a3a74 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1543,6 +1543,30 @@ static const struct dmi_system_id chv_no_valid_mask[] = {
 	{}
 };
 
+static void chv_init_irq_valid_mask(struct gpio_chip *chip,
+				    unsigned long *valid_mask,
+				    unsigned int ngpios)
+{
+	struct chv_pinctrl *pctrl = gpiochip_get_data(chip);
+	const struct chv_community *community = pctrl->community;
+	int i;
+
+	/* Do not add GPIOs that can only generate GPEs to the IRQ domain */
+	for (i = 0; i < community->npins; i++) {
+		const struct pinctrl_pin_desc *desc;
+		u32 intsel;
+
+		desc = &community->pins[i];
+
+		intsel = readl(chv_padreg(pctrl, desc->number, CHV_PADCTRL0));
+		intsel &= CHV_PADCTRL0_INTSEL_MASK;
+		intsel >>= CHV_PADCTRL0_INTSEL_SHIFT;
+
+		if (intsel >= community->nirqs)
+			clear_bit(i, valid_mask);
+	}
+}
+
 static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 {
 	const struct chv_gpio_pinrange *range;
@@ -1557,7 +1581,8 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 	chip->label = dev_name(pctrl->dev);
 	chip->parent = pctrl->dev;
 	chip->base = -1;
-	chip->irq.need_valid_mask = need_valid_mask;
+	if (need_valid_mask)
+		chip->irq.init_valid_mask = chv_init_irq_valid_mask;
 
 	ret = devm_gpiochip_add_data(pctrl->dev, chip, pctrl);
 	if (ret) {
@@ -1576,21 +1601,6 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 		}
 	}
 
-	/* Do not add GPIOs that can only generate GPEs to the IRQ domain */
-	for (i = 0; i < community->npins; i++) {
-		const struct pinctrl_pin_desc *desc;
-		u32 intsel;
-
-		desc = &community->pins[i];
-
-		intsel = readl(chv_padreg(pctrl, desc->number, CHV_PADCTRL0));
-		intsel &= CHV_PADCTRL0_INTSEL_MASK;
-		intsel >>= CHV_PADCTRL0_INTSEL_SHIFT;
-
-		if (need_valid_mask && intsel >= community->nirqs)
-			clear_bit(i, chip->irq.valid_mask);
-	}
-
 	/*
 	 * The same set of machines in chv_no_valid_mask[] have incorrectly
 	 * configured GPIOs that generate spurious interrupts so we use
diff --git a/drivers/platform/x86/intel_int0002_vgpio.c b/drivers/platform/x86/intel_int0002_vgpio.c
index d9542c661ddc..f57bbbeb2495 100644
--- a/drivers/platform/x86/intel_int0002_vgpio.c
+++ b/drivers/platform/x86/intel_int0002_vgpio.c
@@ -152,6 +152,13 @@ static const struct x86_cpu_id int0002_cpu_ids[] = {
 	{}
 };
 
+static void int0002_init_irq_valid_mask(struct gpio_chip *chip,
+					unsigned long *valid_mask,
+					unsigned int ngpios)
+{
+	bitmap_clear(valid_mask, 0, GPE0A_PME_B0_VIRT_GPIO_PIN);
+}
+
 static int int0002_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -184,7 +191,7 @@ static int int0002_probe(struct platform_device *pdev)
 	chip->direction_output = int0002_gpio_direction_output;
 	chip->base = -1;
 	chip->ngpio = GPE0A_PME_B0_VIRT_GPIO_PIN + 1;
-	chip->irq.need_valid_mask = true;
+	chip->irq.init_valid_mask = int0002_init_irq_valid_mask;
 
 	ret = devm_gpiochip_add_data(&pdev->dev, chip, NULL);
 	if (ret) {
@@ -192,8 +199,6 @@ static int int0002_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	bitmap_clear(chip->irq.valid_mask, 0, GPE0A_PME_B0_VIRT_GPIO_PIN);
-
 	/*
 	 * We manually request the irq here instead of passing a flow-handler
 	 * to gpiochip_set_chained_irqchip, because the irq is shared.
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index d72e05244035..9270c462526b 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -202,11 +202,17 @@ struct gpio_irq_chip {
 	bool threaded;
 
 	/**
-	 * @need_valid_mask:
-	 *
-	 * If set core allocates @valid_mask with all bits set to one.
-	 */
-	bool need_valid_mask;
+	 * @init_valid_mask: optional routine to initialize @valid_mask, to be
+	 * used if not all GPIO lines are valid interrupts. Sometimes some
+	 * lines just cannot fire interrupts, and this routine, when defined,
+	 * is passed a bitmap in "valid_mask" and it will have ngpios
+	 * bits from 0..(ngpios-1) set to "1" as in valid. The callback can
+	 * then directly set some bits to "0" if they cannot be used for
+	 * interrupts.
+	 */
+	void (*init_valid_mask)(struct gpio_chip *chip,
+				unsigned long *valid_mask,
+				unsigned int ngpios);
 
 	/**
 	 * @valid_mask:
-- 
2.21.0

