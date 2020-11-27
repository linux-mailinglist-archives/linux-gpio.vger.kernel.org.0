Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0C482C5F8B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Nov 2020 06:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgK0FU7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Nov 2020 00:20:59 -0500
Received: from m12-14.163.com ([220.181.12.14]:40349 "EHLO m12-14.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729100AbgK0FU7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 27 Nov 2020 00:20:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=lmgddvHtAi5SdHCftt
        KJz4DYN1iYMVB/xgJ/V1LKoCk=; b=IAn+C8K3nZ//qxxcqnBLP5k7vmmjR2OEXL
        UjkFJzI/7GSepnhuooVVYneWUzftEo8xnWmldjuYcCluRcGg11aysMtJlHZjvt/0
        oxmZEw/AbmQ0CdNHgZxkGm81EgKz+F2vR+lcHfIOzdyHtY8u0ziBWUcAZE5FT3qi
        1ow2LnaiY=
Received: from localhost.localdomain (unknown [115.238.52.186])
        by smtp10 (Coremail) with SMTP id DsCowAC37vJijMBfOncJYA--.30588S3;
        Fri, 27 Nov 2020 13:19:45 +0800 (CST)
From:   linsheng_111@163.com
To:     linus.walleij@linaro.org, khilman@baylibre.com,
        narmstrong@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com, linshenghuan@hangtu-china.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lin shenghuan <linsheng_111@163.com>
Subject: [PATCH] add amlogic gpio to irq
Date:   Fri, 27 Nov 2020 13:19:27 +0800
Message-Id: <1606454367-3493-1-git-send-email-linsheng_111@163.com>
X-Mailer: git-send-email 2.7.4
Signed-off-by: Lin shenghuan <linshenghuan@hangtu-china.com>
X-CM-TRANSID: DsCowAC37vJijMBfOncJYA--.30588S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxJFy3Zr4xtw47Kr45Kr48WFg_yoW5WF45pF
        43GFyYyr13JF47WryrAanrAFW3K3WxJFW2gay7Ka97uw13GFyDtFy29FW5Zrs8WrW5CF4r
        Jr4rGFWUWr45AFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UHBTrUUUUU=
X-Originating-IP: [115.238.52.186]
X-CM-SenderInfo: polq2x5hqjsiirr6il2tof0z/1tbipBHpOlr7rnYrLgAAsa
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Lin shenghuan <linsheng_111@163.com>

---
 drivers/pinctrl/meson/pinctrl-meson.c | 36 +++++++++++++++++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson.h |  1 +
 2 files changed, 37 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 20683cd..b91ff2c 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -51,6 +51,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/seq_file.h>
+#include <linux/of_irq.h>
 
 #include "../core.h"
 #include "../pinctrl-utils.h"
@@ -598,6 +599,34 @@ static int meson_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	return !!(val & BIT(bit));
 }
 
+static int meson_gpio_to_irq(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct meson_pinctrl *pc = gpiochip_get_data(chip);
+	struct meson_bank *bank;
+	struct irq_fwspec fwspec;
+	int hwirq;
+
+	if (meson_get_bank(pc, gpio, &bank))
+		return -EINVAL;
+
+	if (bank->irq_first < 0) {
+		dev_warn(pc->dev, "no support irq for pin[%d]\n", gpio);
+		return -EINVAL;
+	}
+	if (!pc->of_irq) {
+		dev_err(pc->dev, "invalid device node of gpio INTC\n");
+		return -EINVAL;
+	}
+
+	hwirq = gpio - bank->first + bank->irq_first;
+	fwspec.fwnode = of_node_to_fwnode(pc->of_irq);
+	fwspec.param_count = 2;
+	fwspec.param[0] = hwirq;
+	fwspec.param[1] = IRQ_TYPE_NONE;
+
+	return irq_create_fwspec_mapping(&fwspec);
+}
+
 static int meson_gpiolib_register(struct meson_pinctrl *pc)
 {
 	int ret;
@@ -612,6 +641,7 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
 	pc->chip.direction_output = meson_gpio_direction_output;
 	pc->chip.get = meson_gpio_get;
 	pc->chip.set = meson_gpio_set;
+	pc->chip.to_irq = meson_gpio_to_irq;
 	pc->chip.base = -1;
 	pc->chip.ngpio = pc->data->num_pins;
 	pc->chip.can_sleep = false;
@@ -682,6 +712,12 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
 
 	pc->of_node = gpio_np;
 
+	pc->of_irq = of_find_compatible_node(NULL,
+			NULL, "amlogic,meson-gpio-intc");
+	if (!pc->of_irq)
+		pc->of_irq = of_find_compatible_node(NULL,
+			NULL, "amlogic,meson-gpio-intc-ext");
+
 	pc->reg_mux = meson_map_resource(pc, gpio_np, "mux");
 	if (IS_ERR_OR_NULL(pc->reg_mux)) {
 		dev_err(pc->dev, "mux registers not found\n");
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index f8b0ff9..0f808bb 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -131,6 +131,7 @@ struct meson_pinctrl {
 	struct regmap *reg_ds;
 	struct gpio_chip chip;
 	struct device_node *of_node;
+	struct device_node *of_irq;
 };
 
 #define FUNCTION(fn)							\
-- 
2.7.4


