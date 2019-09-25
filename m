Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83579BDA22
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2019 10:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442893AbfIYIqQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Sep 2019 04:46:16 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:39921 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2442875AbfIYIqM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Sep 2019 04:46:12 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B85E41C0003;
        Wed, 25 Sep 2019 08:46:09 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v2 5/5] gpio: syscon: Add support for the Xylon LogiCVC GPIOs
Date:   Wed, 25 Sep 2019 10:45:55 +0200
Message-Id: <20190925084555.147771-6-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190925084555.147771-1-paul.kocialkowski@bootlin.com>
References: <20190925084555.147771-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The LogiCVC display hardware block comes with GPIO capabilities
that must be exposed separately from the main driver (as GPIOs) for
use with regulators and panels. A syscon is used to share the same
regmap across the two drivers.

Since the GPIO capabilities are pretty simple, add them to the syscon
GPIO driver.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/gpio/gpio-syscon.c | 68 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
index 05c537ed73f1..cdcb913b8f0c 100644
--- a/drivers/gpio/gpio-syscon.c
+++ b/drivers/gpio/gpio-syscon.c
@@ -190,6 +190,70 @@ static const struct syscon_gpio_data keystone_dsp_gpio = {
 	.set		= keystone_gpio_set,
 };
 
+#define LOGICVC_CTRL_REG		0x40
+#define LOGICVC_CTRL_GPIO_SHIFT		11
+#define LOGICVC_CTRL_GPIO_BITS		5
+
+#define LOGICVC_POWER_CTRL_REG		0x78
+#define LOGICVC_POWER_CTRL_GPIO_SHIFT	0
+#define LOGICVC_POWER_CTRL_GPIO_BITS	4
+
+static void logicvc_gpio_offset(struct syscon_gpio_priv *priv,
+				unsigned offset, unsigned int *reg,
+				unsigned int *bit)
+{
+	if (offset >= LOGICVC_CTRL_GPIO_BITS) {
+		*reg = LOGICVC_POWER_CTRL_REG;
+
+		/* To the (virtual) power ctrl offset. */
+		offset -= LOGICVC_CTRL_GPIO_BITS;
+		/* To the actual bit offset in reg. */
+		offset += LOGICVC_POWER_CTRL_GPIO_SHIFT;
+	} else {
+		*reg = LOGICVC_CTRL_REG;
+
+		/* To the actual bit offset in reg. */
+		offset += LOGICVC_CTRL_GPIO_SHIFT;
+	}
+
+	*bit = BIT(offset);
+}
+
+static int logicvc_gpio_get(struct gpio_chip *chip, unsigned offset)
+{
+	struct syscon_gpio_priv *priv = gpiochip_get_data(chip);
+	unsigned int reg;
+	unsigned int bit;
+	unsigned int value;
+	int ret;
+
+	logicvc_gpio_offset(priv, offset, &reg, &bit);
+
+	ret = regmap_read(priv->syscon, reg, &value);
+	if (ret)
+		return ret;
+
+	return !!(value & bit);
+}
+
+static void logicvc_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
+{
+	struct syscon_gpio_priv *priv = gpiochip_get_data(chip);
+	unsigned int reg;
+	unsigned int bit;
+
+	logicvc_gpio_offset(priv, offset, &reg, &bit);
+
+	regmap_update_bits(priv->syscon, reg, bit, val ? bit : 0);
+}
+
+static const struct syscon_gpio_data logicvc_gpio = {
+	.flags		= GPIO_SYSCON_FEAT_OUT,
+	.bit_count	= LOGICVC_CTRL_GPIO_BITS + LOGICVC_POWER_CTRL_GPIO_BITS,
+	.get		= logicvc_gpio_get,
+	.set		= logicvc_gpio_set,
+};
+
 static const struct of_device_id syscon_gpio_ids[] = {
 	{
 		.compatible	= "cirrus,ep7209-mctrl-gpio",
@@ -203,6 +267,10 @@ static const struct of_device_id syscon_gpio_ids[] = {
 		.compatible	= "rockchip,rk3328-grf-gpio",
 		.data		= &rockchip_rk3328_gpio_mute,
 	},
+	{
+		.compatible	= "xylon,logicvc-3.02.a-gpio",
+		.data		= &logicvc_gpio,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, syscon_gpio_ids);
-- 
2.23.0

