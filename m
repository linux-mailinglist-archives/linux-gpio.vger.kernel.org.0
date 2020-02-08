Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7363D15645D
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Feb 2020 14:03:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727173AbgBHNDe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 Feb 2020 08:03:34 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:39473 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727131AbgBHNDe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 8 Feb 2020 08:03:34 -0500
Received: from localhost.localdomain ([37.4.249.150]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N4yNG-1jhDG63lHY-010xUE; Sat, 08 Feb 2020 14:03:19 +0100
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 2/4] pinctrl: bcm2835: Refactor platform data
Date:   Sat,  8 Feb 2020 14:02:53 +0100
Message-Id: <1581166975-22949-3-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581166975-22949-1-git-send-email-stefan.wahren@i2se.com>
References: <1581166975-22949-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:uGjHYXYsoUjn7jcdElSEse07P4rKkudkAWc75trRLVK7NNyLgPs
 T+EAYDcjQyv2ng5IJ6G1ooPLNRU+i+UqfAgOlvRghOYExKScy9bWF5hEZx4myvVDgukqtgH
 G7JJylsxITYmpHfq4pTH1rsrKJG9AOS45G2eaDoGkjJetfFKCb5ZweFPWLLrTfm3falruzr
 UloZe3+Dimm54S23tCszw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:14f1Up/WEKY=:PT3+SP10fiNt/Lqu2fyEMJ
 pUI3is9ANn/SR8uU9YwW0DTC5Tz4GiNiiizxtMKocQzqCq+rSZfb9wAze4enakuH/s3/7dZiE
 JVT3ZMvX/ZtOA8AXx7fN8ckc7QCk1u7LOtZbocCbDEP9HdI6W4SE7LFChl7Ocmu6dMc5SbDHf
 XSgW/LNEWe2aOuauhIkAlIwnDYA1eDNzdI7q14jezejK4o9Ahj361VDA9STpKg8oVnacQ+uF6
 TDWhyTGm/Bam+gMnMnUF1BI3b2bK5MgR6FFTnLxlLa/Q/tDjsIv7DF8iQXqpQ/cYhqU+cbp6y
 lmYX5KKIue48BSLRtGYB0J8rKs1l75C6IKjhlYNE1C5jE7k2p+9sGiShUA+/N0rTfxIQEC8Js
 w9sTe7U/eGiBaO+wOxZjg0DJm4IqjelNb/40KO8W+AL7ND0AUpT7BYPH87357k9fmyJ4S+HR5
 hkRze67/3Av+R71/m0wzcVA0tJMcrRMh7rO/q8SIVQkhsrWCIuO4xPepVaLCiQgf98dTOchgq
 4v97hwAFDFmedW44cqjn0bYhyZcuU4EaS3qQl3jbJW/cxuH9Ypld+S/uePKIIhnVkB4fZqdId
 hR798M+/mnIbsEBUTj61+Df8CAr2uub2bL/300cmWu35XM9NWY+I6uNSesCNdS/Dy216JR+l2
 CyOVQhdQjDSCRGnT7jqFra9F1xl518QQarYCu7LSD/KF3necKcYPz5aUVsSmWtnpawb6e8AVF
 wTdZQrGwrDoXkVDAyMLtaozQnBPMsuI4XqkcNZoFBXvhjutRJhAX1Z0JA7J5sonetk736e4Zy
 TrtV7sooEN4qnynOEDi5VHDNQnJyttgqlDl4HzEP0dlaQPeXL2ZM28gkiUiKd7MMii3iiPl
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
index 3fc2638..7f0a9c6 100644
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
@@ -1082,6 +1111,7 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
+	const struct bcm_plat_data *pdata;
 	struct bcm2835_pinctrl *pc;
 	struct gpio_irq_chip *girq;
 	struct resource iomem;
@@ -1108,7 +1138,13 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(pc->base))
 		return PTR_ERR(pc->base);
 
-	pc->gpio_chip = bcm2835_gpio_chip;
+	match = of_match_node(bcm2835_pinctrl_match, pdev->dev.of_node);
+	if (!match)
+		return -EINVAL;
+
+	pdata = match->data;
+
+	pc->gpio_chip = *pdata->gpio_chip;
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
+	pc->pctl_desc = *pdata->pctl_desc;
+	pc->pctl_dev = devm_pinctrl_register(dev, &pc->pctl_desc, pc);
 	if (IS_ERR(pc->pctl_dev)) {
 		gpiochip_remove(&pc->gpio_chip);
 		return PTR_ERR(pc->pctl_dev);
 	}
 
-	pc->gpio_range = bcm2835_pinctrl_gpio_range;
+	pc->gpio_range = *pdata->gpio_range;
 	pc->gpio_range.base = pc->gpio_chip.base;
 	pc->gpio_range.gc = &pc->gpio_chip;
 	pinctrl_add_gpio_range(pc->pctl_dev, &pc->gpio_range);
-- 
2.7.4

