Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF0614A994
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jan 2020 19:15:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgA0SPu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jan 2020 13:15:50 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:54839 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbgA0SPt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jan 2020 13:15:49 -0500
Received: from localhost.localdomain ([37.4.249.152]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MdvVu-1jTpmM3Tfy-00b6tv; Mon, 27 Jan 2020 19:15:40 +0100
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [RFC PATCH 2/4] pinctrl: bcm2835: Refactor platform data
Date:   Mon, 27 Jan 2020 19:15:06 +0100
Message-Id: <1580148908-4863-3-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580148908-4863-1-git-send-email-stefan.wahren@i2se.com>
References: <1580148908-4863-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:VruPCfmk9mM3xiAf4DG/6aoXzCy4UDEsxr5SC+GDP4iRdgXZX29
 MFCNoD27qBqcSq1LjDl1+NGtNJ3+c1twK3aKoFUdWC05HKxzJPuizB6xDkWYoCIsLzUx75H
 HiA0SBUlw/LN+bHlzoczcUQzu+qFL0N3XAwKX9HxzpPzSFwl1lRDgLB6suBZjq4VTFrw6QP
 xptjL6VDFkgqBb05XjOfA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:f2Tec5CMQUc=:niiLUGM7C+e//7RIjf+wMq
 wLFHtqjv1ynGaEgrTEwtjnWYqI/r72m4A6fdxd06jGD2Uyp8tpT//zGZgAMatxGP2tJCKPrs8
 H50QvZYrkhyeWT1e/b/43xnEBFcJ26c6kKbSdwNEaPpeQ2pSXrJ+fWFg4rgyr2kyb0a6fODwi
 glMJlRcbMvRam6bDw57BliG4DhkYgMl0WB+vE3ztB/xJo+NhTzPKfEpK10WVhz1N+MdOE8gPM
 Ed3HaUcq1KYSZvZRKVS8rOnqLfx2aLsXvrn+YKEvs5xzV1w8QpRWEIYZcLOwKvY23kJzQG9eq
 MIIG4Or4qhijuBXiW2q6mwUPh2z1lLVKOHwzEHdCAb+4bDlzo8dAxIoc40B0H6ZxVg4/5LHFJ
 La0bD0qwfKTemPRPvdCrUGRjVY38hB0RBGSXLrWBfL0PkTsuaEeRZvCVEY80YYfxmOaIKNCZI
 KTZTGrVvZWUrz2smObUJlIIzYVznL4L5rWMZjNaLpWxwyNpAg0eDTqVYFmDT+qIxNN4PgQhRy
 tSUqMKFEgm7xT/YoZD4jdOe5rJJ0dEmy9DgnlvjmjzCBjXAGdPFrFO9kKivLmdSPaubJ7DdcC
 tcrGiqydtDkturFJvTsQYH+PmTQvbe4oBqgNIRZo8f1X5RgRS0fFLp3LA8/+FKUufNNqrLMao
 +41TZ2JeFAJBnB9x8z5VMa7EVYvu5Vv7a6UPbF0i7yUPlzFy4OB0vDTMzjH7rW414iarBNvIy
 QDypz6a5PwveJ4Fe9ATD7LILVISmcIjM7r29JF4LAmFeYo0lVn6a4kM0PnIwd/wQsax1Rp9/Y
 J1/TI8TQICVBl0N9CsxgAPc+X49YqHbFXpoqbsqqK9BIb3Bj+cJJ6Owe9HtjZLb6ifZLnyA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This prepares the platform data to be easier to extend for more GPIOs.
Except of this there is no functional change.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 57 +++++++++++++++++++++++++++--------
 1 file changed, 44 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 3fc2638..ffd069a 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -82,6 +82,7 @@ struct bcm2835_pinctrl {
 
 	struct pinctrl_dev *pctl_dev;
 	struct gpio_chip gpio_chip;
+	struct pinctrl_desc pctl_desc;
 	struct pinctrl_gpio_range gpio_range;
 
 	raw_spinlock_t irq_lock[BCM2835_NUM_BANKS];
@@ -1051,7 +1052,7 @@ static const struct pinconf_ops bcm2711_pinconf_ops = {
 	.pin_config_set = bcm2711_pinconf_set,
 };
 
-static struct pinctrl_desc bcm2835_pinctrl_desc = {
+static const struct pinctrl_desc bcm2835_pinctrl_desc = {
 	.name = MODULE_NAME,
 	.pins = bcm2835_gpio_pins,
 	.npins = ARRAY_SIZE(bcm2835_gpio_pins),
@@ -1061,19 +1062,47 @@ static struct pinctrl_desc bcm2835_pinctrl_desc = {
 	.owner = THIS_MODULE,
 };
 
-static struct pinctrl_gpio_range bcm2835_pinctrl_gpio_range = {
+static const struct pinctrl_desc bcm2711_pinctrl_desc = {
+	.name = MODULE_NAME,
+	.pins = bcm2835_gpio_pins,
+	.npins = ARRAY_SIZE(bcm2835_gpio_pins),
+	.pctlops = &bcm2835_pctl_ops,
+	.pmxops = &bcm2835_pmx_ops,
+	.confops = &bcm2711_pinconf_ops,
+	.owner = THIS_MODULE,
+};
+
+static const struct pinctrl_gpio_range bcm2835_pinctrl_gpio_range = {
 	.name = MODULE_NAME,
 	.npins = BCM2835_NUM_GPIOS,
 };
 
+struct bcm_plat_data {
+	const struct gpio_chip *gpio_chip;
+	const struct pinctrl_desc *pctl_desc;
+	const struct pinctrl_gpio_range *gpio_range;
+};
+
+static const struct bcm_plat_data bcm2835_plat_data = {
+	.gpio_chip = &bcm2835_gpio_chip,
+	.pctl_desc = &bcm2835_pinctrl_desc,
+	.gpio_range = &bcm2835_pinctrl_gpio_range,
+};
+
+static const struct bcm_plat_data bcm2711_plat_data = {
+	.gpio_chip = &bcm2835_gpio_chip,
+	.pctl_desc = &bcm2711_pinctrl_desc,
+	.gpio_range = &bcm2835_pinctrl_gpio_range,
+};
+
 static const struct of_device_id bcm2835_pinctrl_match[] = {
 	{
 		.compatible = "brcm,bcm2835-gpio",
-		.data = &bcm2835_pinconf_ops,
+		.data = &bcm2835_plat_data,
 	},
 	{
 		.compatible = "brcm,bcm2711-gpio",
-		.data = &bcm2711_pinconf_ops,
+		.data = &bcm2711_plat_data,
 	},
 	{}
 };
@@ -1083,6 +1112,7 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct bcm2835_pinctrl *pc;
+	struct bcm_plat_data *pdata;
 	struct gpio_irq_chip *girq;
 	struct resource iomem;
 	int err, i;
@@ -1108,7 +1138,13 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(pc->base))
 		return PTR_ERR(pc->base);
 
-	pc->gpio_chip = bcm2835_gpio_chip;
+	match = of_match_node(bcm2835_pinctrl_match, pdev->dev.of_node);
+	if (!match)
+		return -EINVAL;
+
+	pdata = (struct bcm_plat_data *)match->data;
+
+	memcpy(&pc->gpio_chip, pdata->gpio_chip, sizeof(pc->gpio_chip));
 	pc->gpio_chip.parent = dev;
 	pc->gpio_chip.of_node = np;
 
@@ -1159,19 +1195,14 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	match = of_match_node(bcm2835_pinctrl_match, pdev->dev.of_node);
-	if (match) {
-		bcm2835_pinctrl_desc.confops =
-			(const struct pinconf_ops *)match->data;
-	}
-
-	pc->pctl_dev = devm_pinctrl_register(dev, &bcm2835_pinctrl_desc, pc);
+	memcpy(&pc->pctl_desc, pdata->pctl_desc, sizeof(pc->pctl_desc));
+	pc->pctl_dev = devm_pinctrl_register(dev, &pc->pctl_desc, pc);
 	if (IS_ERR(pc->pctl_dev)) {
 		gpiochip_remove(&pc->gpio_chip);
 		return PTR_ERR(pc->pctl_dev);
 	}
 
-	pc->gpio_range = bcm2835_pinctrl_gpio_range;
+	memcpy(&pc->gpio_range, pdata->gpio_range, sizeof(pc->gpio_range));
 	pc->gpio_range.base = pc->gpio_chip.base;
 	pc->gpio_range.gc = &pc->gpio_chip;
 	pinctrl_add_gpio_range(pc->pctl_dev, &pc->gpio_range);
-- 
2.7.4

