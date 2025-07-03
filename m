Return-Path: <linux-gpio+bounces-22708-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23533AF7259
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 13:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D97B74E5031
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 11:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1728E2E49A2;
	Thu,  3 Jul 2025 11:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ciMW+WHm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29072620E4;
	Thu,  3 Jul 2025 11:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542331; cv=none; b=So2mzTYBGh04aRfSC9dQp2u9JnO8PB79iXKUecspsipziO59AiBrfxxJriYkWfXPa53PKv1hVy9Bn/9sIInn41VMgLtWhV5RZPtyiu2p+iZSNRoE0/nmoaTG27qU3dyzXDeS/QsRoConExh+4fn0Aq33SElVtshOcWHyCXRImHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542331; c=relaxed/simple;
	bh=1g8W1abvL7Vcuqx0UYFfKEzwpdKegawahvzBf/6GJ5s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fmxmJ00SeGRlp+gshvF9XIlUuIvxir98REUBt2xRqoJoi82TrCvrSlZGc5T/cLQEe72IJ/x5tMZ4u2DqKp5ywKH08NvxtyJk9zbJ8BVlkyXqiLFn06FNl+5U0FruCpB8iz7tGBKwJqlBKpKDYv5KQrTJRq26KJWEhZJSXkcOpBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ciMW+WHm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F07AC4CEE3;
	Thu,  3 Jul 2025 11:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751542330;
	bh=1g8W1abvL7Vcuqx0UYFfKEzwpdKegawahvzBf/6GJ5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ciMW+WHmP7wm0WgqjYMel6mZbxsh2mWcbTyR0CZ0lfqSO1990ev0K2YaDJT7WwOGz
	 P9Kxs1gyBvAJbcmQjd8D2VsAkg+vNJfB7HCMYU0XGlATmYnyimRNjXcN9y3QFs/cKE
	 faHtvDdjze1uTY01uaOngNnIqdYk3/f7vPQYlnAaAlRmFBF5po579nf2HniBdmMbA8
	 tpS4wBjXkVdwnrTG6NJi8syU/HIJxMSn2OWZufsPh3qrPmHP0KQKwIx+He84gSkz6l
	 R6sDRe7PAAdXYLUaJPKUPwWG4XLaSngYClGHoIYepasetEnUQuJdn/M/UE1V5srcq9
	 CInQm2HjY2FJQ==
From: Michael Walle <mwalle@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Panis <jpanis@baylibre.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v3 2/8] mfd: tps6594: Add TI TPS652G1 support
Date: Thu,  3 Jul 2025 13:31:47 +0200
Message-Id: <20250703113153.2447110-3-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250703113153.2447110-1-mwalle@kernel.org>
References: <20250703113153.2447110-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TPS652G1 is a stripped down version of the TPS65224. From a software
point of view, it lacks any voltage monitoring, the watchdog, the ESM
and the ADC.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mfd/tps6594-core.c  | 88 ++++++++++++++++++++++++++++++++++---
 drivers/mfd/tps6594-i2c.c   | 10 ++++-
 drivers/mfd/tps6594-spi.c   | 10 ++++-
 include/linux/mfd/tps6594.h |  1 +
 4 files changed, 99 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/tps6594-core.c b/drivers/mfd/tps6594-core.c
index a7223e873cd1..c16c37e36617 100644
--- a/drivers/mfd/tps6594-core.c
+++ b/drivers/mfd/tps6594-core.c
@@ -1,6 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Core functions for TI TPS65224/TPS6594/TPS6593/LP8764 PMICs
+ * Core functions for following TI PMICs:
+ *  - LP8764
+ *  - TPS65224
+ *  - TPS652G1
+ *  - TPS6593
+ *  - TPS6594
  *
  * Copyright (C) 2023 BayLibre Incorporated - https://www.baylibre.com/
  */
@@ -414,6 +419,61 @@ static const unsigned int tps65224_irq_reg[] = {
 	TPS6594_REG_INT_FSM_ERR,
 };
 
+/* TPS652G1 Resources */
+
+static const struct mfd_cell tps652g1_common_cells[] = {
+	MFD_CELL_RES("tps6594-pfsm", tps65224_pfsm_resources),
+	MFD_CELL_RES("tps6594-pinctrl", tps65224_pinctrl_resources),
+	MFD_CELL_NAME("tps6594-regulator"),
+};
+
+static const struct regmap_irq tps652g1_irqs[] = {
+	/* INT_GPIO register */
+	REGMAP_IRQ_REG(TPS65224_IRQ_GPIO1, 2, TPS65224_BIT_GPIO1_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_GPIO2, 2, TPS65224_BIT_GPIO2_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_GPIO3, 2, TPS65224_BIT_GPIO3_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_GPIO4, 2, TPS65224_BIT_GPIO4_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_GPIO5, 2, TPS65224_BIT_GPIO5_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_GPIO6, 2, TPS65224_BIT_GPIO6_INT),
+
+	/* INT_STARTUP register */
+	REGMAP_IRQ_REG(TPS65224_IRQ_VSENSE, 3, TPS65224_BIT_VSENSE_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_ENABLE, 3, TPS6594_BIT_ENABLE_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_PB_SHORT, 3, TPS65224_BIT_PB_SHORT_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_FSD, 3, TPS6594_BIT_FSD_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_SOFT_REBOOT, 3, TPS6594_BIT_SOFT_REBOOT_INT),
+
+	/* INT_MISC register */
+	REGMAP_IRQ_REG(TPS65224_IRQ_BIST_PASS, 4, TPS6594_BIT_BIST_PASS_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_EXT_CLK, 4, TPS6594_BIT_EXT_CLK_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_REG_UNLOCK, 4, TPS65224_BIT_REG_UNLOCK_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_TWARN, 4, TPS6594_BIT_TWARN_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_PB_LONG, 4, TPS65224_BIT_PB_LONG_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_PB_FALL, 4, TPS65224_BIT_PB_FALL_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_PB_RISE, 4, TPS65224_BIT_PB_RISE_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_ADC_CONV_READY, 4, TPS65224_BIT_ADC_CONV_READY_INT),
+
+	/* INT_MODERATE_ERR register */
+	REGMAP_IRQ_REG(TPS65224_IRQ_TSD_ORD, 5, TPS6594_BIT_TSD_ORD_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_BIST_FAIL, 5, TPS6594_BIT_BIST_FAIL_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_REG_CRC_ERR, 5, TPS6594_BIT_REG_CRC_ERR_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_RECOV_CNT, 5, TPS6594_BIT_RECOV_CNT_INT),
+
+	/* INT_SEVERE_ERR register */
+	REGMAP_IRQ_REG(TPS65224_IRQ_TSD_IMM, 6, TPS6594_BIT_TSD_IMM_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_VCCA_OVP, 6, TPS6594_BIT_VCCA_OVP_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_PFSM_ERR, 6, TPS6594_BIT_PFSM_ERR_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_BG_XMON, 6, TPS65224_BIT_BG_XMON_INT),
+
+	/* INT_FSM_ERR register */
+	REGMAP_IRQ_REG(TPS65224_IRQ_IMM_SHUTDOWN, 7, TPS6594_BIT_IMM_SHUTDOWN_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_ORD_SHUTDOWN, 7, TPS6594_BIT_ORD_SHUTDOWN_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_MCU_PWR_ERR, 7, TPS6594_BIT_MCU_PWR_ERR_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_SOC_PWR_ERR, 7, TPS6594_BIT_SOC_PWR_ERR_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_COMM_ERR, 7, TPS6594_BIT_COMM_ERR_INT),
+	REGMAP_IRQ_REG(TPS65224_IRQ_I2C2_ERR, 7, TPS65224_BIT_I2C2_ERR_INT),
+};
+
 static inline unsigned int tps6594_get_irq_reg(struct regmap_irq_chip_data *data,
 					       unsigned int base, int index)
 {
@@ -443,7 +503,7 @@ static int tps6594_handle_post_irq(void *irq_drv_data)
 	 * a new interrupt.
 	 */
 	if (tps->use_crc) {
-		if (tps->chip_id == TPS65224) {
+		if (tps->chip_id == TPS65224 || tps->chip_id == TPS652G1) {
 			regmap_reg = TPS6594_REG_INT_FSM_ERR;
 			mask_val = TPS6594_BIT_COMM_ERR_INT;
 		} else {
@@ -481,6 +541,18 @@ static struct regmap_irq_chip tps65224_irq_chip = {
 	.handle_post_irq = tps6594_handle_post_irq,
 };
 
+static struct regmap_irq_chip tps652g1_irq_chip = {
+	.ack_base = TPS6594_REG_INT_BUCK,
+	.ack_invert = 1,
+	.clear_ack = 1,
+	.init_ack_masked = 1,
+	.num_regs = ARRAY_SIZE(tps65224_irq_reg),
+	.irqs = tps652g1_irqs,
+	.num_irqs = ARRAY_SIZE(tps652g1_irqs),
+	.get_irq_reg = tps65224_get_irq_reg,
+	.handle_post_irq = tps6594_handle_post_irq,
+};
+
 static const struct regmap_range tps6594_volatile_ranges[] = {
 	regmap_reg_range(TPS6594_REG_INT_TOP, TPS6594_REG_STAT_READBACK_ERR),
 	regmap_reg_range(TPS6594_REG_RTC_STATUS, TPS6594_REG_RTC_STATUS),
@@ -507,7 +579,7 @@ static int tps6594_check_crc_mode(struct tps6594 *tps, bool primary_pmic)
 	int ret;
 	unsigned int regmap_reg, mask_val;
 
-	if (tps->chip_id == TPS65224) {
+	if (tps->chip_id == TPS65224 || tps->chip_id == TPS652G1) {
 		regmap_reg = TPS6594_REG_CONFIG_2;
 		mask_val = TPS65224_BIT_I2C1_SPI_CRC_EN;
 	} else {
@@ -537,7 +609,7 @@ static int tps6594_set_crc_feature(struct tps6594 *tps)
 	int ret;
 	unsigned int regmap_reg, mask_val;
 
-	if (tps->chip_id == TPS65224) {
+	if (tps->chip_id == TPS65224 || tps->chip_id == TPS652G1) {
 		regmap_reg = TPS6594_REG_CONFIG_2;
 		mask_val = TPS65224_BIT_I2C1_SPI_CRC_EN;
 	} else {
@@ -628,6 +700,10 @@ int tps6594_device_init(struct tps6594 *tps, bool enable_crc)
 		irq_chip = &tps65224_irq_chip;
 		n_cells = ARRAY_SIZE(tps65224_common_cells);
 		cells = tps65224_common_cells;
+	} else if (tps->chip_id == TPS652G1) {
+		irq_chip = &tps652g1_irq_chip;
+		n_cells = ARRAY_SIZE(tps652g1_common_cells);
+		cells = tps652g1_common_cells;
 	} else {
 		irq_chip = &tps6594_irq_chip;
 		n_cells = ARRAY_SIZE(tps6594_common_cells);
@@ -651,8 +727,8 @@ int tps6594_device_init(struct tps6594 *tps, bool enable_crc)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add common child devices\n");
 
-	/* No RTC for LP8764 and TPS65224 */
-	if (tps->chip_id != LP8764 && tps->chip_id != TPS65224) {
+	/* No RTC for LP8764, TPS65224 and TPS652G1 */
+	if (tps->chip_id != LP8764 && tps->chip_id != TPS65224 && tps->chip_id != TPS652G1) {
 		ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, tps6594_rtc_cells,
 					   ARRAY_SIZE(tps6594_rtc_cells), NULL, 0,
 					   regmap_irq_get_domain(tps->irq_data));
diff --git a/drivers/mfd/tps6594-i2c.c b/drivers/mfd/tps6594-i2c.c
index 4ab91c34d9fb..7ff7516286fd 100644
--- a/drivers/mfd/tps6594-i2c.c
+++ b/drivers/mfd/tps6594-i2c.c
@@ -1,6 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * I2C access driver for TI TPS65224/TPS6594/TPS6593/LP8764 PMICs
+ * I2C access driver for the following TI PMICs:
+ *  - LP8764
+ *  - TPS65224
+ *  - TPS652G1
+ *  - TPS6593
+ *  - TPS6594
  *
  * Copyright (C) 2023 BayLibre Incorporated - https://www.baylibre.com/
  */
@@ -197,6 +202,7 @@ static const struct of_device_id tps6594_i2c_of_match_table[] = {
 	{ .compatible = "ti,tps6593-q1", .data = (void *)TPS6593, },
 	{ .compatible = "ti,lp8764-q1",  .data = (void *)LP8764,  },
 	{ .compatible = "ti,tps65224-q1", .data = (void *)TPS65224, },
+	{ .compatible = "ti,tps652g1", .data = (void *)TPS652G1, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, tps6594_i2c_of_match_table);
@@ -222,7 +228,7 @@ static int tps6594_i2c_probe(struct i2c_client *client)
 		return dev_err_probe(dev, -EINVAL, "Failed to find matching chip ID\n");
 	tps->chip_id = (unsigned long)match->data;
 
-	if (tps->chip_id == TPS65224)
+	if (tps->chip_id == TPS65224 || tps->chip_id == TPS652G1)
 		tps6594_i2c_regmap_config.volatile_table = &tps65224_volatile_table;
 
 	tps->regmap = devm_regmap_init(dev, NULL, client, &tps6594_i2c_regmap_config);
diff --git a/drivers/mfd/tps6594-spi.c b/drivers/mfd/tps6594-spi.c
index 6ebccb79f0cc..944b7313a1d9 100644
--- a/drivers/mfd/tps6594-spi.c
+++ b/drivers/mfd/tps6594-spi.c
@@ -1,6 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * SPI access driver for TI TPS65224/TPS6594/TPS6593/LP8764 PMICs
+ * SPI access driver for the following TI PMICs:
+ *  - LP8764
+ *  - TPS65224
+ *  - TPS652G1
+ *  - TPS6593
+ *  - TPS6594
  *
  * Copyright (C) 2023 BayLibre Incorporated - https://www.baylibre.com/
  */
@@ -82,6 +87,7 @@ static const struct of_device_id tps6594_spi_of_match_table[] = {
 	{ .compatible = "ti,tps6593-q1", .data = (void *)TPS6593, },
 	{ .compatible = "ti,lp8764-q1",  .data = (void *)LP8764,  },
 	{ .compatible = "ti,tps65224-q1", .data = (void *)TPS65224, },
+	{ .compatible = "ti,tps652g1", .data = (void *)TPS652G1, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, tps6594_spi_of_match_table);
@@ -107,7 +113,7 @@ static int tps6594_spi_probe(struct spi_device *spi)
 		return dev_err_probe(dev, -EINVAL, "Failed to find matching chip ID\n");
 	tps->chip_id = (unsigned long)match->data;
 
-	if (tps->chip_id == TPS65224)
+	if (tps->chip_id == TPS65224 || tps->chip_id == TPS652G1)
 		tps6594_spi_regmap_config.volatile_table = &tps65224_volatile_table;
 
 	tps->regmap = devm_regmap_init(dev, NULL, spi, &tps6594_spi_regmap_config);
diff --git a/include/linux/mfd/tps6594.h b/include/linux/mfd/tps6594.h
index 16543fd4d83e..021db8875963 100644
--- a/include/linux/mfd/tps6594.h
+++ b/include/linux/mfd/tps6594.h
@@ -19,6 +19,7 @@ enum pmic_id {
 	TPS6593,
 	LP8764,
 	TPS65224,
+	TPS652G1,
 };
 
 /* Macro to get page index from register address */
-- 
2.39.5


