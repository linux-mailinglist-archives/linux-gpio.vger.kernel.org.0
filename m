Return-Path: <linux-gpio+bounces-13737-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EC69EC428
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 06:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0267D168F01
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 05:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1A71C07E4;
	Wed, 11 Dec 2024 05:14:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB05D1C07C4;
	Wed, 11 Dec 2024 05:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.61.185.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733894057; cv=none; b=on6s9ItDjVU1xHoruI3YTiKtM7twyHE9J+NmXmF5hCFqcgpa/syoTxuACFTytnagxKGx+wSkjoVY+7Y2hd2tW4RB/VCRPLV/NZsygT3eRWJe4m4WEUeB5aLs2ncy2dT8hhz54p+Zc17EKxEud1Rofp98CVlEAGFM+1yhGH21JCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733894057; c=relaxed/simple;
	bh=xOKJ7qt0WfS0XyDsy5u7icGNxiFNPCNQRKosTSntKOk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pcPCd6RKH79z4Wno8EkVVHvSmvpEBm4jlUqF60eQH8mgYqZI7lO4pZFhHQOukAA3c+8GFwuEcUdpgeNn7NvVmScBXIU1qfYCGpJF5N27J+UC3BTlzZFbVzXI3vgtmSQcsdYd56GHlpKIZu0JU4kvkXAuVZ6+nyHRKrE/SE3ox48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn; spf=pass smtp.mailfrom=189.cn; arc=none smtp.client-ip=183.61.185.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=189.cn
HMM_SOURCE_IP:10.158.243.18:7884.121043416
HMM_ATTACHE_NUM:0000
HMM_SOURCE_TYPE:SMTP
Received: from clientip-123.150.8.42 (unknown [10.158.243.18])
	by 189.cn (HERMES) with SMTP id 1E938100208;
	Wed, 11 Dec 2024 13:10:21 +0800 (CST)
Received: from  ([123.150.8.42])
	by gateway-153622-dep-5c5f88b874-pd459 with ESMTP id 4e5728c57c8d4093b2d6a3afacd6fde7 for krzk@kernel.org;
	Wed, 11 Dec 2024 13:10:22 CST
X-Transaction-ID: 4e5728c57c8d4093b2d6a3afacd6fde7
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
Subject: [PATCH v2] regulator:s5m8767: Fully convert to GPIO descriptors
Date: Wed, 11 Dec 2024 13:10:19 +0800
Message-Id: <20241211051019.176131-1-chensong_2000@189.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This converts s5m8767 regulator driver to use GPIO descriptors.

---
v1 - v2:
1, reedit commit message.
2, remove development code.
3, print error msg in dev_err_probe.
4, doesn't set gpiod directions until successfully requesting
   all gpiods. It's pretty much equivalent with original code.

Signed-off-by: Song Chen <chensong_2000@189.cn>
---
 drivers/regulator/s5m8767.c      | 106 ++++++++++++++-----------------
 include/linux/mfd/samsung/core.h |   4 +-
 2 files changed, 48 insertions(+), 62 deletions(-)

diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index d25cd81e3f36..b23df037336b 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -5,7 +5,7 @@
 
 #include <linux/cleanup.h>
 #include <linux/err.h>
-#include <linux/of_gpio.h>
+#include <linux/of.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -35,8 +35,8 @@ struct s5m8767_info {
 	u8 buck2_vol[8];
 	u8 buck3_vol[8];
 	u8 buck4_vol[8];
-	int buck_gpios[3];
-	int buck_ds[3];
+	struct gpio_desc *buck_gpios[3];
+	struct gpio_desc *buck_ds[3];
 	int buck_gpioindex;
 };
 
@@ -272,9 +272,9 @@ static inline int s5m8767_set_high(struct s5m8767_info *s5m8767)
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
@@ -283,9 +283,9 @@ static inline int s5m8767_set_low(struct s5m8767_info *s5m8767)
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
@@ -486,16 +486,19 @@ static int s5m8767_pmic_dt_parse_dvs_gpio(struct sec_pmic_dev *iodev,
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
-			return -EINVAL;
-		}
-		pdata->buck_gpios[i] = gpio;
+		snprintf(label, sizeof(label), "%s%d", "S5M8767 SET", i + 1);
+		pdata->buck_gpios[i] = devm_fwnode_gpiod_get_index(
+					iodev->dev,
+					of_fwnode_handle(pmic_np),
+					"s5m8767,pmic-buck-dvs",
+					i, GPIOD_OUT_LOW, label);
+		if (IS_ERR(pdata->buck_gpios[i]))
+			return dev_err_probe(iodev->dev, PTR_ERR(pdata->buck_gpios[i]),
+						"can't get GPIO\n");
 	}
 	return 0;
 }
@@ -504,16 +507,19 @@ static int s5m8767_pmic_dt_parse_ds_gpio(struct sec_pmic_dev *iodev,
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
-			return -EINVAL;
-		}
-		pdata->buck_ds[i] = gpio;
+		snprintf(label, sizeof(label), "%s%d", "S5M8767 DS", i + 2);
+		pdata->buck_ds[i] = devm_fwnode_gpiod_get_index(
+					iodev->dev,
+					of_fwnode_handle(pmic_np),
+					"s5m8767,pmic-buck-ds",
+					i, GPIOD_OUT_LOW, label);
+		if (IS_ERR(pdata->buck_ds[i]))
+			return dev_err_probe(iodev->dev, PTR_ERR(pdata->buck_ds[i]),
+						"can't get GPIO\n");
 	}
 	return 0;
 }
@@ -788,57 +794,37 @@ static int s5m8767_pmic_probe(struct platform_device *pdev)
 	if (pdata->buck2_gpiodvs || pdata->buck3_gpiodvs ||
 						pdata->buck4_gpiodvs) {
 
-		if (!gpio_is_valid(pdata->buck_gpios[0]) ||
-			!gpio_is_valid(pdata->buck_gpios[1]) ||
-			!gpio_is_valid(pdata->buck_gpios[2])) {
+		if (IS_ERR(pdata->buck_gpios[0]) ||
+			IS_ERR(pdata->buck_gpios[1]) ||
+			IS_ERR(pdata->buck_gpios[2])) {
 			dev_err(&pdev->dev, "GPIO NOT VALID\n");
 			return -EINVAL;
 		}
 
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
 		/* SET1 GPIO */
-		gpio_direction_output(pdata->buck_gpios[0],
+		gpiod_direction_output(pdata->buck_gpios[0],
 				(s5m8767->buck_gpioindex >> 2) & 0x1);
 		/* SET2 GPIO */
-		gpio_direction_output(pdata->buck_gpios[1],
+		gpiod_direction_output(pdata->buck_gpios[1],
 				(s5m8767->buck_gpioindex >> 1) & 0x1);
 		/* SET3 GPIO */
-		gpio_direction_output(pdata->buck_gpios[2],
+		gpiod_direction_output(pdata->buck_gpios[2],
 				(s5m8767->buck_gpioindex >> 0) & 0x1);
 	}
 
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
+	if (IS_ERR(pdata->buck_ds[0]) ||
+		IS_ERR(pdata->buck_ds[1]) ||
+		IS_ERR(pdata->buck_ds[2])) {
+		dev_err(&pdev->dev, "GPIO NOT VALID\n");
+		return -EINVAL;
+	}
 
 	/* DS2 GPIO */
-	gpio_direction_output(pdata->buck_ds[0], 0x0);
+	gpiod_direction_output(pdata->buck_ds[0], 0x0);
 	/* DS3 GPIO */
-	gpio_direction_output(pdata->buck_ds[1], 0x0);
+	gpiod_direction_output(pdata->buck_ds[1], 0x0);
 	/* DS4 GPIO */
-	gpio_direction_output(pdata->buck_ds[2], 0x0);
+	gpiod_direction_output(pdata->buck_ds[2], 0x0);
 
 	regmap_update_bits(s5m8767->iodev->regmap_pmic,
 			   S5M8767_REG_BUCK2CTRL, 1 << 1,
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index 750274d41fc0..c06fff66e755 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -79,8 +79,8 @@ struct sec_platform_data {
 	struct sec_opmode_data		*opmode;
 	int				num_regulators;
 
-	int				buck_gpios[3];
-	int				buck_ds[3];
+	struct gpio_desc		*buck_gpios[3];
+	struct gpio_desc		*buck_ds[3];
 	unsigned int			buck2_voltage[8];
 	bool				buck2_gpiodvs;
 	unsigned int			buck3_voltage[8];
-- 
2.25.1


