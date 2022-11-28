Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3F2263B461
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Nov 2022 22:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233778AbiK1VqK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Nov 2022 16:46:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233403AbiK1VqI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Nov 2022 16:46:08 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE5EA2FC16
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 13:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669671863;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JMnrRho9OQOGXDAMjv1JNg9wZ8w7tYaVKUwPtg4BbDc=;
        b=Z9ibAxllGgVVVJh+BFCtXNadWi9Re2gHd+sLi4DY05Z8I7N0v7p+FFn/aZwh4bao3WShG/
        o1nb4H6XC4RpGdtIb8LXyLPkYhTjscTLPcfAERHDJfV0Q5wtzhS6Bq832PqYfePH4GoxCe
        e1r4YLe16pPLH31ThKjM6XBVTuIa7SI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-nT4qwJbyOy-dhu4ed9nbAA-1; Mon, 28 Nov 2022 16:44:18 -0500
X-MC-Unique: nT4qwJbyOy-dhu4ed9nbAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44D8C1C0512C;
        Mon, 28 Nov 2022 21:44:18 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.115])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AF8B340C6EC2;
        Mon, 28 Nov 2022 21:44:16 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: [PATCH 3/5] gpio: tps68470: Add support for the indicator LED outputs
Date:   Mon, 28 Nov 2022 22:44:06 +0100
Message-Id: <20221128214408.165726-4-hdegoede@redhat.com>
In-Reply-To: <20221128214408.165726-1-hdegoede@redhat.com>
References: <20221128214408.165726-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The tps68470 has support for 2 indicator LED outputs called
ileda and iledb, at support for these as GPIO pins 10 + 11.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpio/gpio-tps68470.c | 46 +++++++++++++++++++++++++-----------
 include/linux/mfd/tps68470.h |  4 ++++
 2 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-tps68470.c b/drivers/gpio/gpio-tps68470.c
index 2ca86fbe1d84..33febd96c001 100644
--- a/drivers/gpio/gpio-tps68470.c
+++ b/drivers/gpio/gpio-tps68470.c
@@ -19,24 +19,43 @@
 
 #define TPS68470_N_LOGIC_OUTPUT	3
 #define TPS68470_N_REGULAR_GPIO	7
-#define TPS68470_N_GPIO	(TPS68470_N_LOGIC_OUTPUT + TPS68470_N_REGULAR_GPIO)
+#define TPS68470_N_ILEDS 2
+#define TPS68470_N_GPIO	(TPS68470_N_LOGIC_OUTPUT + TPS68470_N_REGULAR_GPIO + TPS68470_N_ILEDS)
 
 struct tps68470_gpio_data {
 	struct regmap *tps68470_regmap;
 	struct gpio_chip gc;
 };
 
+static void tps68470_gpio_get_reg_and_mask(bool get, unsigned int offset,
+					   unsigned int *reg, int *mask)
+{
+	if (offset < TPS68470_N_REGULAR_GPIO) {
+		if (get)
+			*reg = TPS68470_REG_GPDI;
+		else
+			*reg = TPS68470_REG_GPDO;
+		*mask = BIT(offset);
+	} else if (offset < (TPS68470_N_REGULAR_GPIO + TPS68470_N_LOGIC_OUTPUT)) {
+		*reg = TPS68470_REG_SGPO;
+		*mask = BIT(offset - TPS68470_N_REGULAR_GPIO);
+	} else {
+		*reg = TPS68470_REG_ILEDCTL;
+		if (offset == (TPS68470_N_REGULAR_GPIO + TPS68470_N_LOGIC_OUTPUT))
+			*mask = TPS68470_ILEDCTL_ENA;
+		else
+			*mask = TPS68470_ILEDCTL_ENB;
+	}
+}
+
 static int tps68470_gpio_get(struct gpio_chip *gc, unsigned int offset)
 {
 	struct tps68470_gpio_data *tps68470_gpio = gpiochip_get_data(gc);
 	struct regmap *regmap = tps68470_gpio->tps68470_regmap;
-	unsigned int reg = TPS68470_REG_GPDI;
-	int val, ret;
+	int val, mask, ret;
+	unsigned int reg;
 
-	if (offset >= TPS68470_N_REGULAR_GPIO) {
-		offset -= TPS68470_N_REGULAR_GPIO;
-		reg = TPS68470_REG_SGPO;
-	}
+	tps68470_gpio_get_reg_and_mask(true, offset, &reg, &mask);
 
 	ret = regmap_read(regmap, reg, &val);
 	if (ret) {
@@ -44,7 +63,7 @@ static int tps68470_gpio_get(struct gpio_chip *gc, unsigned int offset)
 			TPS68470_REG_SGPO);
 		return ret;
 	}
-	return !!(val & BIT(offset));
+	return !!(val & mask);
 }
 
 static int tps68470_gpio_get_direction(struct gpio_chip *gc,
@@ -75,14 +94,12 @@ static void tps68470_gpio_set(struct gpio_chip *gc, unsigned int offset,
 {
 	struct tps68470_gpio_data *tps68470_gpio = gpiochip_get_data(gc);
 	struct regmap *regmap = tps68470_gpio->tps68470_regmap;
-	unsigned int reg = TPS68470_REG_GPDO;
+	unsigned int reg;
+	int mask;
 
-	if (offset >= TPS68470_N_REGULAR_GPIO) {
-		reg = TPS68470_REG_SGPO;
-		offset -= TPS68470_N_REGULAR_GPIO;
-	}
+	tps68470_gpio_get_reg_and_mask(false, offset, &reg, &mask);
 
-	regmap_update_bits(regmap, reg, BIT(offset), value ? BIT(offset) : 0);
+	regmap_update_bits(regmap, reg, mask, value ? mask : 0);
 }
 
 static int tps68470_gpio_output(struct gpio_chip *gc, unsigned int offset,
@@ -120,6 +137,7 @@ static const char *tps68470_names[TPS68470_N_GPIO] = {
 	"gpio.0", "gpio.1", "gpio.2", "gpio.3",
 	"gpio.4", "gpio.5", "gpio.6",
 	"s_enable", "s_idle", "s_resetn",
+	"ileda", "iledb",
 };
 
 static int tps68470_gpio_probe(struct platform_device *pdev)
diff --git a/include/linux/mfd/tps68470.h b/include/linux/mfd/tps68470.h
index 7807fa329db0..2a1b6de65540 100644
--- a/include/linux/mfd/tps68470.h
+++ b/include/linux/mfd/tps68470.h
@@ -34,6 +34,7 @@
 #define TPS68470_REG_SGPO		0x22
 #define TPS68470_REG_GPDI		0x26
 #define TPS68470_REG_GPDO		0x27
+#define TPS68470_REG_ILEDCTL		0x28
 #define TPS68470_REG_VCMVAL		0x3C
 #define TPS68470_REG_VAUX1VAL		0x3D
 #define TPS68470_REG_VAUX2VAL		0x3E
@@ -94,4 +95,7 @@
 #define TPS68470_GPIO_MODE_OUT_CMOS	2
 #define TPS68470_GPIO_MODE_OUT_ODRAIN	3
 
+#define TPS68470_ILEDCTL_ENA		BIT(2)
+#define TPS68470_ILEDCTL_ENB		BIT(6)
+
 #endif /* __LINUX_MFD_TPS68470_H */
-- 
2.38.1

