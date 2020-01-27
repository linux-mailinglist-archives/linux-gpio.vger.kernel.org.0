Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA6E614A999
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jan 2020 19:15:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbgA0SPv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jan 2020 13:15:51 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:46227 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgA0SPu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jan 2020 13:15:50 -0500
Received: from localhost.localdomain ([37.4.249.152]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MIxFi-1jB3PL0sMU-00KPSh; Mon, 27 Jan 2020 19:15:41 +0100
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [RFC PATCH 3/4] pinctrl: bcm2835: Add support for all GPIOs on BCM2711
Date:   Mon, 27 Jan 2020 19:15:07 +0100
Message-Id: <1580148908-4863-4-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580148908-4863-1-git-send-email-stefan.wahren@i2se.com>
References: <1580148908-4863-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:X6IS1XjHy4cJfxjoudVoDX/cZvMR/vfdQSMdLzkgWq1irgCvB38
 RaAG8s5bLq+gwxv7sq4OOzzzIjMwUf3oUytVqdip8Emtgr3GiNEl2vBd272/sh3B1OJanK8
 goehy07Y9M/B0RMRS8QYkknz5PIlSimkZBJKjNE686UdoJg1We/vhXibKmf8z5kreTjrWe3
 q1JcyYfqP1itQAVjziUtQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LyL94am3zLA=:BmnKGYucrjNaj35BCZWbP5
 JzGddQvqDkhH/CCngNEO2dMwjvlnPKHh/PEbdrGp6m9QHAmq4UkqMbHYKp4XqoYGKvPoozwfP
 FP1S21DqEh5BYA0hhWgk2maxuudk085Kg/UXpitwP437bovAei4bfR+gXu53083PnNenJAm4p
 xAhXuwmTwnWKv+qAem9IrQUBQtWZqTLIoviS/rBI58lKIF9owSsmboh1lagz+7EGkpnXhcae1
 0MbckaZUNlfNjiRnq4V+VHRLEiPKWNxiGYMIefuH9JuPr6WXJPFk7fJo8OZ45VvNntUoYSSpc
 j0n6iO9I7UbYvyi7+SAmts7a4bZF+1qLxOl9S9cCBKPRGH2Z3kUCuTwNYlPjcUQyn6uqO0Mlx
 c+13a6OSMjdDPVRDOntBqI0l4rsK062Ig/ZwiteVVX/T7ZtOdNR2v9sRVAnh/w8iyF4VHZ0GC
 ULTnZeoeqfXKRaXEz7sGaOev/A5I1h35g02J5m9TlwjHQiNzKPNc45U2Rab8osp5QUPpRpD1N
 4TUS9baKQp8dfAHyEkc1gBlk0cb1zDcQJMX7bQVUSSxSFx0otQCiojOcWf2PP2Hf1NREQw+82
 UV3Z09N/3ny3u6Qu0dI11Kin/x4ZubPCk2Z9H663jrHUxQP4afxI/ZCeRjqTIpU8chYef1IHT
 v3ZX4UpNi6S2kossS/nmFNqzdzxsOnNFseX4lA9Pp5DREJwDVh4t9UFpY49YOKaWkmqBFAAh4
 O7NlyceEWWYXkJh8pRPkdftSVQVKKjtoc+mmNdZ6A/MFCjlN4hQ4NzpeCvIGk1Jp/tUXAyMDV
 jBtNPE8cgg54eLvhAbGLfFWVNbu8UAkmntw7HjfU+o9g9ylEQ02IihlbByt5l+e7GdgBJm5
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The BCM2711 supports 58 GPIOs. So extend pinctrl and GPIOs accordingly.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 54 +++++++++++++++++++++++++++--------
 1 file changed, 42 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index ffd069a..41e7bf9 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -37,6 +37,7 @@
 
 #define MODULE_NAME "pinctrl-bcm2835"
 #define BCM2835_NUM_GPIOS 54
+#define BCM2711_NUM_GPIOS 58
 #define BCM2835_NUM_BANKS 2
 #define BCM2835_NUM_IRQS  3
 
@@ -78,7 +79,7 @@ struct bcm2835_pinctrl {
 
 	/* note: locking assumes each bank will have its own unsigned long */
 	unsigned long enabled_irq_map[BCM2835_NUM_BANKS];
-	unsigned int irq_type[BCM2835_NUM_GPIOS];
+	unsigned int irq_type[BCM2711_NUM_GPIOS];
 
 	struct pinctrl_dev *pctl_dev;
 	struct gpio_chip gpio_chip;
@@ -145,6 +146,10 @@ static struct pinctrl_pin_desc bcm2835_gpio_pins[] = {
 	BCM2835_GPIO_PIN(51),
 	BCM2835_GPIO_PIN(52),
 	BCM2835_GPIO_PIN(53),
+	BCM2835_GPIO_PIN(54),
+	BCM2835_GPIO_PIN(55),
+	BCM2835_GPIO_PIN(56),
+	BCM2835_GPIO_PIN(57),
 };
 
 /* one pin per group */
@@ -203,6 +208,10 @@ static const char * const bcm2835_gpio_groups[] = {
 	"gpio51",
 	"gpio52",
 	"gpio53",
+	"gpio54",
+	"gpio55",
+	"gpio56",
+	"gpio57",
 };
 
 enum bcm2835_fsel {
@@ -353,6 +362,22 @@ static const struct gpio_chip bcm2835_gpio_chip = {
 	.can_sleep = false,
 };
 
+static const struct gpio_chip bcm2711_gpio_chip = {
+	.label = "pinctrl-bcm2711",
+	.owner = THIS_MODULE,
+	.request = gpiochip_generic_request,
+	.free = gpiochip_generic_free,
+	.direction_input = bcm2835_gpio_direction_input,
+	.direction_output = bcm2835_gpio_direction_output,
+	.get_direction = bcm2835_gpio_get_direction,
+	.get = bcm2835_gpio_get,
+	.set = bcm2835_gpio_set,
+	.set_config = gpiochip_generic_config,
+	.base = -1,
+	.ngpio = BCM2711_NUM_GPIOS,
+	.can_sleep = false,
+};
+
 static void bcm2835_gpio_irq_handle_bank(struct bcm2835_pinctrl *pc,
 					 unsigned int bank, u32 mask)
 {
@@ -399,7 +424,7 @@ static void bcm2835_gpio_irq_handler(struct irq_desc *desc)
 		bcm2835_gpio_irq_handle_bank(pc, 0, 0xf0000000);
 		bcm2835_gpio_irq_handle_bank(pc, 1, 0x00003fff);
 		break;
-	case 2: /* IRQ2 covers GPIOs 46-53 */
+	case 2: /* IRQ2 covers GPIOs 46-57 */
 		bcm2835_gpio_irq_handle_bank(pc, 1, 0x003fc000);
 		break;
 	}
@@ -618,7 +643,7 @@ static struct irq_chip bcm2835_gpio_irq_chip = {
 
 static int bcm2835_pctl_get_groups_count(struct pinctrl_dev *pctldev)
 {
-	return ARRAY_SIZE(bcm2835_gpio_groups);
+	return BCM2835_NUM_GPIOS;
 }
 
 static const char *bcm2835_pctl_get_group_name(struct pinctrl_dev *pctldev,
@@ -776,7 +801,7 @@ static int bcm2835_pctl_dt_node_to_map(struct pinctrl_dev *pctldev,
 		err = of_property_read_u32_index(np, "brcm,pins", i, &pin);
 		if (err)
 			goto out;
-		if (pin >= ARRAY_SIZE(bcm2835_gpio_pins)) {
+		if (pin >= pc->pctl_desc.npins) {
 			dev_err(pc->dev, "%pOF: invalid brcm,pins value %d\n",
 				np, pin);
 			err = -EINVAL;
@@ -852,7 +877,7 @@ static int bcm2835_pmx_get_function_groups(struct pinctrl_dev *pctldev,
 {
 	/* every pin can do every function */
 	*groups = bcm2835_gpio_groups;
-	*num_groups = ARRAY_SIZE(bcm2835_gpio_groups);
+	*num_groups = BCM2835_NUM_GPIOS;
 
 	return 0;
 }
@@ -1055,7 +1080,7 @@ static const struct pinconf_ops bcm2711_pinconf_ops = {
 static const struct pinctrl_desc bcm2835_pinctrl_desc = {
 	.name = MODULE_NAME,
 	.pins = bcm2835_gpio_pins,
-	.npins = ARRAY_SIZE(bcm2835_gpio_pins),
+	.npins = BCM2835_NUM_GPIOS,
 	.pctlops = &bcm2835_pctl_ops,
 	.pmxops = &bcm2835_pmx_ops,
 	.confops = &bcm2835_pinconf_ops,
@@ -1063,9 +1088,9 @@ static const struct pinctrl_desc bcm2835_pinctrl_desc = {
 };
 
 static const struct pinctrl_desc bcm2711_pinctrl_desc = {
-	.name = MODULE_NAME,
+	.name = "pinctrl-bcm2711",
 	.pins = bcm2835_gpio_pins,
-	.npins = ARRAY_SIZE(bcm2835_gpio_pins),
+	.npins = BCM2711_NUM_GPIOS,
 	.pctlops = &bcm2835_pctl_ops,
 	.pmxops = &bcm2835_pmx_ops,
 	.confops = &bcm2711_pinconf_ops,
@@ -1077,6 +1102,11 @@ static const struct pinctrl_gpio_range bcm2835_pinctrl_gpio_range = {
 	.npins = BCM2835_NUM_GPIOS,
 };
 
+static const struct pinctrl_gpio_range bcm2711_pinctrl_gpio_range = {
+	.name = "pinctrl-bcm2711",
+	.npins = BCM2711_NUM_GPIOS,
+};
+
 struct bcm_plat_data {
 	const struct gpio_chip *gpio_chip;
 	const struct pinctrl_desc *pctl_desc;
@@ -1090,9 +1120,9 @@ static const struct bcm_plat_data bcm2835_plat_data = {
 };
 
 static const struct bcm_plat_data bcm2711_plat_data = {
-	.gpio_chip = &bcm2835_gpio_chip,
+	.gpio_chip = &bcm2711_gpio_chip,
 	.pctl_desc = &bcm2711_pinctrl_desc,
-	.gpio_range = &bcm2835_pinctrl_gpio_range,
+	.gpio_range = &bcm2711_pinctrl_gpio_range,
 };
 
 static const struct of_device_id bcm2835_pinctrl_match[] = {
@@ -1118,8 +1148,8 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 	int err, i;
 	const struct of_device_id *match;
 
-	BUILD_BUG_ON(ARRAY_SIZE(bcm2835_gpio_pins) != BCM2835_NUM_GPIOS);
-	BUILD_BUG_ON(ARRAY_SIZE(bcm2835_gpio_groups) != BCM2835_NUM_GPIOS);
+	BUILD_BUG_ON(ARRAY_SIZE(bcm2835_gpio_pins) != BCM2711_NUM_GPIOS);
+	BUILD_BUG_ON(ARRAY_SIZE(bcm2835_gpio_groups) != BCM2711_NUM_GPIOS);
 
 	pc = devm_kzalloc(dev, sizeof(*pc), GFP_KERNEL);
 	if (!pc)
-- 
2.7.4

