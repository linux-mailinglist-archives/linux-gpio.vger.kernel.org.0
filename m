Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4526E193F0
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2019 23:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbfEIVB3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 May 2019 17:01:29 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36087 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725992AbfEIVBZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 May 2019 17:01:25 -0400
Received: by mail-pl1-f193.google.com with SMTP id d21so1722589plr.3;
        Thu, 09 May 2019 14:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XIfv0w8R9hbMpIkYecRyvbKImnAIaPLF4+t0eBmtucc=;
        b=eicyC2LYjnQM70p4GVW8AY2eMq2ucpBRLYd8qbc6RiNh7HpQ+14/Imu7oCe49giLcz
         OsQs4iFWp1m2yWVTc9GJxU0BX1mZt9QFFP/uKk2rNpjj2WK/PHPgUsz95JyOdh8DkPO9
         68TuxjHgop54Tp3vJ3Pr2DD/xvW6b+a5UYYQ9wuznYgD00LtCRJgQ1+c2R1H+4l7hw20
         MexlNgZRhdzMQszkqV95NLYZnslJCDDG5TbQ2DvwqWxIZXJjBJEzLC3KsIzDlzE87mI5
         gRG+kqvBlZLFW1WcEKgtqB/7HD85ZuUERRV9G5KNHIgQTkzv/3dSnB+oCs5b/H1e3AqV
         k8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=XIfv0w8R9hbMpIkYecRyvbKImnAIaPLF4+t0eBmtucc=;
        b=lttqEPtNRccugZZEjYg6bztwPZPSPbSRjkT2dWY31MELVT/0aK8ZaQB3wGkEekCo7a
         pUKKQcdoDAfDceHdqOemE4goXSYCcA/6e9hybrsHQwQp6X5u/jEx/4jLD+P5JgbFxJ1D
         yoAOuGWVDkXrcZWIM2Y8sjP+hZma5CvbWiNa9R1igrVn1oi6Kif103SW1Q5vAXzh5M3d
         Ofv2GLhPp4ZS1M4NCSDyMjfHhS8IENIy3tAAIlt5R2X2ddauImo7sL/OYVOo0ex1aiC3
         d8xaTeunkOf+bB1/JjFl5K826UNjSX3n72nYR3Xep6Q8u8ZayC7J+phkAbAtKkNvh/e+
         2GIA==
X-Gm-Message-State: APjAAAVJO3fMFS93qxE/0VU456dtBD/ZnjkWMO93+G8yne3yf3nLGiin
        kVDAjasnCicufW2VnDCbkwI=
X-Google-Smtp-Source: APXvYqwcw7GiVnjrYj1XiTQi0Bq0hzC69oqOsJ7LlYVQptq7h8VhaR08IPnOqeMHrT9EEpuiPK89Cg==
X-Received: by 2002:a17:902:9a83:: with SMTP id w3mr8129940plp.241.1557435684380;
        Thu, 09 May 2019 14:01:24 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.250])
        by smtp.gmail.com with ESMTPSA id d15sm10989209pfm.186.2019.05.09.14.01.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 14:01:23 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Al Cooper <alcooperx@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE...),
        Eric Anholt <eric@anholt.net>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Doug Berger <opendmb@gmail.com>,
        Matheus Castello <matheus@castello.eng.br>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
        Lukas Wunner <lukas@wunner.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2835
        ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/3] pinctrl: bcm2835: bcm7211: Add support for 7211 pull-up functionality
Date:   Thu,  9 May 2019 13:59:55 -0700
Message-Id: <20190509205955.27842-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190509205955.27842-1-f.fainelli@gmail.com>
References: <20190509205955.27842-1-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Al Cooper <alcooperx@gmail.com>

The 7211 has a new way of selecting the pull-up/pull-down setting
for a GPIO pin. The registers used for the bcm2837, GP_PUD and
GP_PUDCLKn0, are no longer connected. A new set of registers,
GP_GPIO_PUP_PDN_CNTRL_REGx must be used. This commit will add
a new compatible string "brcm,bcm7211-gpio" and the kernel
driver will use it to select which method is used to select
pull-up/pull-down.

Signed-off-by: Al Cooper <alcooperx@gmail.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 85 +++++++++++++++++++++++++--
 1 file changed, 80 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 183d1ffe6a75..35d9f9593000 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -57,15 +57,26 @@
 #define GPAFEN0		0x88	/* Pin Async Falling Edge Detect */
 #define GPPUD		0x94	/* Pin Pull-up/down Enable */
 #define GPPUDCLK0	0x98	/* Pin Pull-up/down Enable Clock */
+#define GP_GPIO_PUP_PDN_CNTRL_REG0 0xe4 /* 7211 Pin Pull-up/down select */
 
 #define FSEL_REG(p)		(GPFSEL0 + (((p) / 10) * 4))
 #define FSEL_SHIFT(p)		(((p) % 10) * 3)
 #define GPIO_REG_OFFSET(p)	((p) / 32)
 #define GPIO_REG_SHIFT(p)	((p) % 32)
 
+#define PUD_7211_MASK		0x3
+#define PUD_7211_REG_OFFSET(p)	((p) / 16)
+#define PUD_7211_REG_SHIFT(p)	(((p) % 16) * 2)
+
 /* argument: bcm2835_pinconf_pull */
 #define BCM2835_PINCONF_PARAM_PULL	(PIN_CONFIG_END + 1)
 
+enum bcm7211_pinconf_pull {
+	BCM7211_PINCONFIG_PULL_NONE,
+	BCM7211_PINCONFIG_PULL_UP,
+	BCM7211_PINCONFIG_PULL_DOWN,
+};
+
 struct bcm2835_pinctrl {
 	struct device *dev;
 	void __iomem *base;
@@ -975,6 +986,55 @@ static const struct pinconf_ops bcm2835_pinconf_ops = {
 	.pin_config_set = bcm2835_pinconf_set,
 };
 
+static int bcm7211_pinconf_set(struct pinctrl_dev *pctldev,
+			       unsigned int pin, unsigned long *configs,
+			       unsigned int num_configs)
+{
+	struct bcm2835_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+	u32 param, arg;
+	u32 shifter;
+	u32 value;
+	u32 off;
+	int i;
+
+	for (i = 0; i < num_configs; i++) {
+		param = pinconf_to_config_param(configs[i]);
+		if (param != BCM2835_PINCONF_PARAM_PULL)
+			return -EINVAL;
+		arg = pinconf_to_config_argument(configs[i]);
+
+		/* convert to 7211 value */
+		switch (arg) {
+		case PIN_CONFIG_BIAS_DISABLE:
+			arg = BCM7211_PINCONFIG_PULL_NONE;
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			arg = BCM7211_PINCONFIG_PULL_DOWN;
+			break;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			arg = BCM7211_PINCONFIG_PULL_UP;
+			break;
+		}
+
+		off = PUD_7211_REG_OFFSET(pin);
+		shifter = PUD_7211_REG_SHIFT(pin);
+
+		value = bcm2835_gpio_rd(pc, GP_GPIO_PUP_PDN_CNTRL_REG0 +
+					(off * 4));
+		value &= ~(PUD_7211_MASK << shifter);
+		value |= (arg << shifter);
+		bcm2835_gpio_wr(pc, GP_GPIO_PUP_PDN_CNTRL_REG0 + (off * 4),
+				value);
+	} /* for each config */
+
+	return 0;
+}
+
+static const struct pinconf_ops bcm7211_pinconf_ops = {
+	.pin_config_get = bcm2835_pinconf_get,
+	.pin_config_set = bcm7211_pinconf_set,
+};
+
 static struct pinctrl_desc bcm2835_pinctrl_desc = {
 	.name = MODULE_NAME,
 	.pins = bcm2835_gpio_pins,
@@ -990,6 +1050,18 @@ static struct pinctrl_gpio_range bcm2835_pinctrl_gpio_range = {
 	.npins = BCM2835_NUM_GPIOS,
 };
 
+static const struct of_device_id bcm2835_pinctrl_match[] = {
+	{
+		.compatible = "brcm,bcm2835-gpio",
+		.data = &bcm2835_pinconf_ops,
+	},
+	{
+		.compatible = "brcm,bcm7211-gpio",
+		.data = &bcm7211_pinconf_ops,
+	},
+	{}
+};
+
 static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -997,6 +1069,8 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 	struct bcm2835_pinctrl *pc;
 	struct resource iomem;
 	int err, i;
+	const struct of_device_id *match;
+
 	BUILD_BUG_ON(ARRAY_SIZE(bcm2835_gpio_pins) != BCM2835_NUM_GPIOS);
 	BUILD_BUG_ON(ARRAY_SIZE(bcm2835_gpio_groups) != BCM2835_NUM_GPIOS);
 
@@ -1073,6 +1147,12 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 					     bcm2835_gpio_irq_handler);
 	}
 
+	match = of_match_node(bcm2835_pinctrl_match, pdev->dev.of_node);
+	if (match) {
+		bcm2835_pinctrl_desc.confops =
+			(const struct pinconf_ops *)match->data;
+	}
+
 	pc->pctl_dev = devm_pinctrl_register(dev, &bcm2835_pinctrl_desc, pc);
 	if (IS_ERR(pc->pctl_dev)) {
 		gpiochip_remove(&pc->gpio_chip);
@@ -1087,11 +1167,6 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id bcm2835_pinctrl_match[] = {
-	{ .compatible = "brcm,bcm2835-gpio" },
-	{}
-};
-
 static struct platform_driver bcm2835_pinctrl_driver = {
 	.probe = bcm2835_pinctrl_probe,
 	.driver = {
-- 
2.17.1

