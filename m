Return-Path: <linux-gpio+bounces-13574-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B69AB9E66B8
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2024 06:17:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AECA28577B
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2024 05:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D63198E89;
	Fri,  6 Dec 2024 05:17:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50D21957E7;
	Fri,  6 Dec 2024 05:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.61.185.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733462265; cv=none; b=FqRy7Qpl2cm6nV4RkslAiS+L02MQKnDzGJmbjGKo4Lxn2QA92tri97+HvRDHsiDNno21LECDTgh94TrylXKkvwODmv/n3FWbBOtpXA4g+JX+U2BYnMmkDDWTyoLatDlGop1ueGS4NFqBB+Z0+IerzgWDDEfydH7QaJmt+mZ5rkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733462265; c=relaxed/simple;
	bh=htWnPQEOdyY5bfg02Phqku26+mG3fe+DlxFNe4nH85o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nyukigSefwsD6J9cqr+Y0lOdVFWJs7qauVZoB+9gkUAoiR1i+CVLQ727q2ft5vv4wSiAIn8NBnhVzkRx4hzYSH4MvUf7OrntPBqTWStpoh3r6CqKl9YbLSBYYXPsTjMfybDhwgAjK8RC4mRr4kyPChiFV5i8lHjGVP4VERte5TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn; spf=pass smtp.mailfrom=189.cn; arc=none smtp.client-ip=183.61.185.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=189.cn
HMM_SOURCE_IP:10.158.242.145:63557.884707989
HMM_ATTACHE_NUM:0000
HMM_SOURCE_TYPE:SMTP
Received: from clientip-123.150.8.42 (unknown [10.158.242.145])
	by 189.cn (HERMES) with SMTP id 2B0DE1001C9;
	Fri,  6 Dec 2024 13:14:00 +0800 (CST)
Received: from  ([123.150.8.42])
	by gateway-153622-dep-5c5f88b874-qw5z2 with ESMTP id 41a007c610964447a52ad752c2c17d3f for krzk@kernel.org;
	Fri, 06 Dec 2024 13:14:01 CST
X-Transaction-ID: 41a007c610964447a52ad752c2c17d3f
X-Real-From: chensong_2000@189.cn
X-Receive-IP: 123.150.8.42
X-MEDUSA-Status: 0
Sender: chensong_2000@189.cn
From: Song Chen <chensong_2000@189.cn>
To: krzk@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	lee@kernel.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Song Chen <chensong_2000@189.cn>
Subject: [PATCH] regulator:s5m8767 Fully convert to GPIO descriptors
Date: Fri,  6 Dec 2024 13:13:58 +0800
Message-Id: <20241206051358.496832-1-chensong_2000@189.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This converts s5m8767 regulator driver to use GPIO
descriptors.

Signed-off-by: Song Chen <chensong_2000@189.cn>
---
 drivers/regulator/s5m8767.c      | 110 ++++++++++---------------------
 include/linux/mfd/samsung/core.h |   5 +-
 2 files changed, 37 insertions(+), 78 deletions(-)

diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index d25cd81e3f36..d0b1eed4dfa0 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -5,7 +5,7 @@
 
 #include <linux/cleanup.h>
 #include <linux/err.h>
-#include <linux/of_gpio.h>
+//#include <linux/of_gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -15,6 +15,7 @@
 #include <linux/mfd/samsung/s5m8767.h>
 #include <linux/regulator/of_regulator.h>
 #include <linux/regmap.h>
+#include <linux/of.h>
 
 #define S5M8767_OPMODE_NORMAL_MODE 0x1
 
@@ -23,6 +24,8 @@ struct s5m8767_info {
 	struct sec_pmic_dev *iodev;
 	int num_regulators;
 	struct sec_opmode_data *opmode;
+	struct gpio_desc *buck_gpios[3];
+	struct gpio_desc *buck_ds[3];
 
 	int ramp_delay;
 	bool buck2_ramp;
@@ -35,8 +38,7 @@ struct s5m8767_info {
 	u8 buck2_vol[8];
 	u8 buck3_vol[8];
 	u8 buck4_vol[8];
-	int buck_gpios[3];
-	int buck_ds[3];
+
 	int buck_gpioindex;
 };
 
@@ -272,9 +274,9 @@ static inline int s5m8767_set_high(struct s5m8767_info *s5m8767)
 {
 	int temp_index = s5m8767->buck_gpioindex;
 
-	gpio_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
-	gpio_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
-	gpio_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
+	gpiod_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
+	gpiod_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
+	gpiod_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
 
 	return 0;
 }
@@ -283,9 +285,9 @@ static inline int s5m8767_set_low(struct s5m8767_info *s5m8767)
 {
 	int temp_index = s5m8767->buck_gpioindex;
 
-	gpio_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
-	gpio_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
-	gpio_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
+	gpiod_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
+	gpiod_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
+	gpiod_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
 
 	return 0;
 }
@@ -486,16 +488,22 @@ static int s5m8767_pmic_dt_parse_dvs_gpio(struct sec_pmic_dev *iodev,
 			struct sec_platform_data *pdata,
 			struct device_node *pmic_np)
 {
-	int i, gpio;
+	int i;
+	char label[32];
 
 	for (i = 0; i < 3; i++) {
-		gpio = of_get_named_gpio(pmic_np,
-					"s5m8767,pmic-buck-dvs-gpios", i);
-		if (!gpio_is_valid(gpio)) {
-			dev_err(iodev->dev, "invalid gpio[%d]: %d\n", i, gpio);
+		pdata->buck_gpios[i] = devm_gpiod_get_index(iodev->dev,
+					"s5m8767,pmic-buck-dvs", i, GPIOD_OUT_LOW);
+		if (IS_ERR(pdata->buck_gpios[i])) {
+			dev_err(iodev->dev, "invalid gpio[%d]\n", i);
 			return -EINVAL;
 		}
-		pdata->buck_gpios[i] = gpio;
+
+		/* SET GPIO*/
+		snprintf(label, sizeof(label), "%s%d", "S5M8767 SET", i + 1);
+		gpiod_set_consumer_name(pdata->buck_gpios[i], label);
+		gpiod_direction_output(pdata->buck_gpios[i],
+					(pdata->buck_default_idx >> (2 - i)) & 0x1);
 	}
 	return 0;
 }
@@ -504,16 +512,21 @@ static int s5m8767_pmic_dt_parse_ds_gpio(struct sec_pmic_dev *iodev,
 			struct sec_platform_data *pdata,
 			struct device_node *pmic_np)
 {
-	int i, gpio;
+	int i;
+	char label[32];
 
 	for (i = 0; i < 3; i++) {
-		gpio = of_get_named_gpio(pmic_np,
-					"s5m8767,pmic-buck-ds-gpios", i);
-		if (!gpio_is_valid(gpio)) {
-			dev_err(iodev->dev, "invalid gpio[%d]: %d\n", i, gpio);
+		pdata->buck_ds[i] = devm_gpiod_get_index(iodev->dev,
+					"s5m8767,pmic-buck-ds", i, GPIOD_OUT_LOW);
+		if (IS_ERR(pdata->buck_ds[i])) {
+			dev_err(iodev->dev, "invalid gpio[%d]\n", i);
 			return -EINVAL;
 		}
-		pdata->buck_ds[i] = gpio;
+
+		/* SET GPIO*/
+		snprintf(label, sizeof(label), "%s%d", "S5M8767 DS", i + 2);
+		gpiod_set_consumer_name(pdata->buck_gpios[i], label);
+		gpiod_direction_output(pdata->buck_gpios[i], 0);
 	}
 	return 0;
 }
@@ -785,61 +798,6 @@ static int s5m8767_pmic_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (pdata->buck2_gpiodvs || pdata->buck3_gpiodvs ||
-						pdata->buck4_gpiodvs) {
-
-		if (!gpio_is_valid(pdata->buck_gpios[0]) ||
-			!gpio_is_valid(pdata->buck_gpios[1]) ||
-			!gpio_is_valid(pdata->buck_gpios[2])) {
-			dev_err(&pdev->dev, "GPIO NOT VALID\n");
-			return -EINVAL;
-		}
-
-		ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[0],
-					"S5M8767 SET1");
-		if (ret)
-			return ret;
-
-		ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[1],
-					"S5M8767 SET2");
-		if (ret)
-			return ret;
-
-		ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[2],
-					"S5M8767 SET3");
-		if (ret)
-			return ret;
-
-		/* SET1 GPIO */
-		gpio_direction_output(pdata->buck_gpios[0],
-				(s5m8767->buck_gpioindex >> 2) & 0x1);
-		/* SET2 GPIO */
-		gpio_direction_output(pdata->buck_gpios[1],
-				(s5m8767->buck_gpioindex >> 1) & 0x1);
-		/* SET3 GPIO */
-		gpio_direction_output(pdata->buck_gpios[2],
-				(s5m8767->buck_gpioindex >> 0) & 0x1);
-	}
-
-	ret = devm_gpio_request(&pdev->dev, pdata->buck_ds[0], "S5M8767 DS2");
-	if (ret)
-		return ret;
-
-	ret = devm_gpio_request(&pdev->dev, pdata->buck_ds[1], "S5M8767 DS3");
-	if (ret)
-		return ret;
-
-	ret = devm_gpio_request(&pdev->dev, pdata->buck_ds[2], "S5M8767 DS4");
-	if (ret)
-		return ret;
-
-	/* DS2 GPIO */
-	gpio_direction_output(pdata->buck_ds[0], 0x0);
-	/* DS3 GPIO */
-	gpio_direction_output(pdata->buck_ds[1], 0x0);
-	/* DS4 GPIO */
-	gpio_direction_output(pdata->buck_ds[2], 0x0);
-
 	regmap_update_bits(s5m8767->iodev->regmap_pmic,
 			   S5M8767_REG_BUCK2CTRL, 1 << 1,
 			   (pdata->buck2_gpiodvs) ? (1 << 1) : (0 << 1));
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index 750274d41fc0..b757f15877a3 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -33,6 +33,7 @@
 #define STEP_12_5_MV		12500
 #define STEP_6_25_MV		6250
 
+#define BULK_GPIO_COUNT		3
 struct gpio_desc;
 
 enum sec_device_type {
@@ -77,10 +78,10 @@ int sec_irq_resume(struct sec_pmic_dev *sec_pmic);
 struct sec_platform_data {
 	struct sec_regulator_data	*regulators;
 	struct sec_opmode_data		*opmode;
+	struct gpio_desc			*buck_gpios[3];
+	struct gpio_desc			*buck_ds[3];
 	int				num_regulators;
 
-	int				buck_gpios[3];
-	int				buck_ds[3];
 	unsigned int			buck2_voltage[8];
 	bool				buck2_gpiodvs;
 	unsigned int			buck3_voltage[8];
-- 
2.25.1


