Return-Path: <linux-gpio+bounces-5960-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE1F8B7D3C
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2024 18:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66D2B287154
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2024 16:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91192194C94;
	Tue, 30 Apr 2024 16:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ltts.com header.i=@ltts.com header.b="GgkSqMcb";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="kdMlCHWc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from c180-44.smtp-out.ap-south-1.amazonses.com (c180-44.smtp-out.ap-south-1.amazonses.com [76.223.180.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF88190682;
	Tue, 30 Apr 2024 16:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=76.223.180.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714494961; cv=none; b=EMkRiNg6ddF83GCWi2bJrDNKO1f9v8pgeOUuxcFgB8KuMiOjGFJCJ5yioY9C5v3IzifRNdx+LgW5+9RcH9NrRSi7JRcHUoMmvT2VMvWp+Z0TOuES/0DqhkRtvjNBAkradmzTI/57VsbAZ2FPHCVeLq8pBMmIMYsJCTQ2erI+gtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714494961; c=relaxed/simple;
	bh=U5q5fjCota3r7fGv2m8SgLC4EOAJNecaWYcS23E9BkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hwOPIbhMx4M3sCCmADXPGcVRkDLlG7HuBN3F9iRpaVNPTv20raFZf9r7jmYEMUUyNsIJqdFhvAU0LJtSfOm7H9I8UwYgP/vlmihW1tQdOORvi4xr44s6UHsm8aT2FCTi/tIagvjLtDeEkQzryo08rfMOgU0cE8w7s9jhF+Z8jWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ltts.com; spf=pass smtp.mailfrom=ap-south-1.amazonses.com; dkim=pass (2048-bit key) header.d=ltts.com header.i=@ltts.com header.b=GgkSqMcb; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=kdMlCHWc; arc=none smtp.client-ip=76.223.180.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ltts.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ap-south-1.amazonses.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=i3fe3efcd4pbz7ipgssfqjhzqx347xbc; d=ltts.com; t=1714494956;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=U5q5fjCota3r7fGv2m8SgLC4EOAJNecaWYcS23E9BkM=;
	b=GgkSqMcbiYsyfUZ1ePkGkBkR4Sgfk7Cp/69idJmCKfP/MyU30VTWSRRfTS8sc/PY
	FFm86QwYpTABa2LqhaZpfRVUek5RzIESsCsD0kbcFKsOATHeokUkqhVu/DDfMtCf4eH
	DlMNQc2dRvAaACqZK/K0xSTMicQyJLWbqQKBSjss+bG5A9J4HjLfy7YWlJ5tzhr7La3
	kVboOdCQXTn3GhS824bLcPmzYPSGIPC9YsaIPfUjmCetiPX5H/Ul0LZ2E2j5xoo8nV0
	PtU/sdZ3+CEpMkOHPq6YXeazjjR4RRd6weWws2BtI/KIzp8fIiFXovtkKY9KyfOZ8XH
	39JAZ1zc4w==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zpkik46mrueu52d3326ufxxchortqmoc; d=amazonses.com; t=1714494956;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=U5q5fjCota3r7fGv2m8SgLC4EOAJNecaWYcS23E9BkM=;
	b=kdMlCHWc9+xrft0WY4usqB3jCLx2MLaryQWMEx0L1l9bHHvrkj/mxXIKkN/3IVeg
	uLYVOdVxoOV7ehgkio0lw1B5VAjTEUQFh53djP+g5b8cCPlRKhSoz8dpxlmsX3jv4DJ
	02StRNhl+o2Ir5czVgab453qHFUZ28tXBHvTOkMI=
From: Bhargav Raviprakash <bhargav.r@ltts.com>
To: linux-kernel@vger.kernel.org
Cc: bhargav.r@ltts.com, arnd@arndb.de, broonie@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, eblanc@baylibre.com, 
	gregkh@linuxfoundation.org, jpanis@baylibre.com, kristo@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, lee@kernel.org, 
	lgirdwood@gmail.com, linus.walleij@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	m.nirmaladevi@ltts.com, nm@ti.com, robh+dt@kernel.org, 
	vigneshr@ti.com
Subject: [PATCH v8 09/10] pinctrl: pinctrl-tps6594: Add TPS65224 PMIC pinctrl and GPIO
Date: Tue, 30 Apr 2024 16:35:55 +0000
Message-ID: <0109018f2fdce15d-c13bd809-a11b-4202-9b7f-c9380d51b070-000000@ap-south-1.amazonses.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <0109018f2f24c15e-c50bfc29-5f1d-4368-a4b8-2c9f1d398abb-000000@ap-south-1.amazonses.com>
References: <0109018f2f24c15e-c50bfc29-5f1d-4368-a4b8-2c9f1d398abb-000000@ap-south-1.amazonses.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: 1.ap-south-1./RC/PI2M8xOxQmTMPi0M1Q8h2FX69egpT62QKSaMPIA=:AmazonSES
X-SES-Outgoing: 2024.04.30-76.223.180.44

From: Nirmala Devi Mal Nadar <m.nirmaladevi@ltts.com>

Add support for TPS65224 pinctrl and GPIOs to TPS6594 driver as they have
significant functional overlap.
TPS65224 PMIC has 6 GPIOS which can be configured as GPIO or other
dedicated device functions.

Signed-off-by: Nirmala Devi Mal Nadar <m.nirmaladevi@ltts.com>
Signed-off-by: Bhargav Raviprakash <bhargav.r@ltts.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-tps6594.c | 277 ++++++++++++++++++++++++------
 1 file changed, 225 insertions(+), 52 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tps6594.c b/drivers/pinctrl/pinctrl-tps6594.c
index 66985e54b..085047320 100644
--- a/drivers/pinctrl/pinctrl-tps6594.c
+++ b/drivers/pinctrl/pinctrl-tps6594.c
@@ -14,8 +14,6 @@
 
 #include <linux/mfd/tps6594.h>
 
-#define TPS6594_PINCTRL_PINS_NB 11
-
 #define TPS6594_PINCTRL_GPIO_FUNCTION 0
 #define TPS6594_PINCTRL_SCL_I2C2_CS_SPI_FUNCTION 1
 #define TPS6594_PINCTRL_TRIG_WDOG_FUNCTION 1
@@ -40,17 +38,40 @@
 #define TPS6594_PINCTRL_SYNCCLKOUT_FUNCTION_GPIO8 3
 #define TPS6594_PINCTRL_CLK32KOUT_FUNCTION_GPIO9 3
 
+/* TPS65224 pin muxval */
+#define TPS65224_PINCTRL_SDA_I2C2_SDO_SPI_FUNCTION 1
+#define TPS65224_PINCTRL_SCL_I2C2_CS_SPI_FUNCTION 1
+#define TPS65224_PINCTRL_VMON1_FUNCTION 1
+#define TPS65224_PINCTRL_VMON2_FUNCTION 1
+#define TPS65224_PINCTRL_WKUP_FUNCTION 1
+#define TPS65224_PINCTRL_NSLEEP2_FUNCTION 2
+#define TPS65224_PINCTRL_NSLEEP1_FUNCTION 2
+#define TPS65224_PINCTRL_SYNCCLKIN_FUNCTION 2
+#define TPS65224_PINCTRL_NERR_MCU_FUNCTION 2
+#define TPS65224_PINCTRL_NINT_FUNCTION 3
+#define TPS65224_PINCTRL_TRIG_WDOG_FUNCTION 3
+#define TPS65224_PINCTRL_PB_FUNCTION 3
+#define TPS65224_PINCTRL_ADC_IN_FUNCTION 3
+
+/* TPS65224 Special muxval for recalcitrant pins */
+#define TPS65224_PINCTRL_NSLEEP2_FUNCTION_GPIO5 1
+#define TPS65224_PINCTRL_WKUP_FUNCTION_GPIO5 4
+#define TPS65224_PINCTRL_SYNCCLKIN_FUNCTION_GPIO5 3
+
 #define TPS6594_OFFSET_GPIO_SEL 5
 
-#define FUNCTION(fname, v)									\
+#define TPS65224_NGPIO_PER_REG 6
+#define TPS6594_NGPIO_PER_REG  8
+
+#define FUNCTION(dev_name, fname, v)							\
 {											\
 	.pinfunction = PINCTRL_PINFUNCTION(#fname,					\
-					tps6594_##fname##_func_group_names,		\
-					ARRAY_SIZE(tps6594_##fname##_func_group_names)),\
+					dev_name##_##fname##_func_group_names,		\
+					ARRAY_SIZE(dev_name##_##fname##_func_group_names)),\
 	.muxval = v,									\
 }
 
-static const struct pinctrl_pin_desc tps6594_pins[TPS6594_PINCTRL_PINS_NB] = {
+static const struct pinctrl_pin_desc tps6594_pins[] = {
 	PINCTRL_PIN(0, "GPIO0"),   PINCTRL_PIN(1, "GPIO1"),
 	PINCTRL_PIN(2, "GPIO2"),   PINCTRL_PIN(3, "GPIO3"),
 	PINCTRL_PIN(4, "GPIO4"),   PINCTRL_PIN(5, "GPIO5"),
@@ -143,30 +164,127 @@ static const char *const tps6594_syncclkin_func_group_names[] = {
 	"GPIO9",
 };
 
+static const struct pinctrl_pin_desc tps65224_pins[] = {
+	PINCTRL_PIN(0, "GPIO0"),   PINCTRL_PIN(1, "GPIO1"),
+	PINCTRL_PIN(2, "GPIO2"),   PINCTRL_PIN(3, "GPIO3"),
+	PINCTRL_PIN(4, "GPIO4"),   PINCTRL_PIN(5, "GPIO5"),
+};
+
+static const char *const tps65224_gpio_func_group_names[] = {
+	"GPIO0", "GPIO1", "GPIO2", "GPIO3", "GPIO4", "GPIO5",
+};
+
+static const char *const tps65224_sda_i2c2_sdo_spi_func_group_names[] = {
+	"GPIO0",
+};
+
+static const char *const tps65224_nsleep2_func_group_names[] = {
+	"GPIO0", "GPIO5",
+};
+
+static const char *const tps65224_nint_func_group_names[] = {
+	"GPIO0",
+};
+
+static const char *const tps65224_scl_i2c2_cs_spi_func_group_names[] = {
+	"GPIO1",
+};
+
+static const char *const tps65224_nsleep1_func_group_names[] = {
+	"GPIO1", "GPIO2", "GPIO3",
+};
+
+static const char *const tps65224_trig_wdog_func_group_names[] = {
+	"GPIO1",
+};
+
+static const char *const tps65224_vmon1_func_group_names[] = {
+	"GPIO2",
+};
+
+static const char *const tps65224_pb_func_group_names[] = {
+	"GPIO2",
+};
+
+static const char *const tps65224_vmon2_func_group_names[] = {
+	"GPIO3",
+};
+
+static const char *const tps65224_adc_in_func_group_names[] = {
+	"GPIO3", "GPIO4",
+};
+
+static const char *const tps65224_wkup_func_group_names[] = {
+	"GPIO4", "GPIO5",
+};
+
+static const char *const tps65224_syncclkin_func_group_names[] = {
+	"GPIO4", "GPIO5",
+};
+
+static const char *const tps65224_nerr_mcu_func_group_names[] = {
+	"GPIO5",
+};
+
 struct tps6594_pinctrl_function {
 	struct pinfunction pinfunction;
 	u8 muxval;
 };
 
+struct muxval_remap {
+	unsigned int group;
+	u8 muxval;
+	u8 remap;
+};
+
+struct muxval_remap tps65224_muxval_remap[] = {
+	{5, TPS6594_PINCTRL_DISABLE_WDOG_FUNCTION, TPS65224_PINCTRL_WKUP_FUNCTION_GPIO5},
+	{5, TPS65224_PINCTRL_SYNCCLKIN_FUNCTION, TPS65224_PINCTRL_SYNCCLKIN_FUNCTION_GPIO5},
+	{5, TPS65224_PINCTRL_NSLEEP2_FUNCTION, TPS65224_PINCTRL_NSLEEP2_FUNCTION_GPIO5},
+};
+
+struct muxval_remap tps6594_muxval_remap[] = {
+	{8, TPS6594_PINCTRL_DISABLE_WDOG_FUNCTION, TPS6594_PINCTRL_DISABLE_WDOG_FUNCTION_GPIO8},
+	{8, TPS6594_PINCTRL_SYNCCLKOUT_FUNCTION, TPS6594_PINCTRL_SYNCCLKOUT_FUNCTION_GPIO8},
+	{9, TPS6594_PINCTRL_CLK32KOUT_FUNCTION, TPS6594_PINCTRL_CLK32KOUT_FUNCTION_GPIO9},
+};
+
 static const struct tps6594_pinctrl_function pinctrl_functions[] = {
-	FUNCTION(gpio, TPS6594_PINCTRL_GPIO_FUNCTION),
-	FUNCTION(nsleep1, TPS6594_PINCTRL_NSLEEP1_FUNCTION),
-	FUNCTION(nsleep2, TPS6594_PINCTRL_NSLEEP2_FUNCTION),
-	FUNCTION(wkup1, TPS6594_PINCTRL_WKUP1_FUNCTION),
-	FUNCTION(wkup2, TPS6594_PINCTRL_WKUP2_FUNCTION),
-	FUNCTION(scl_i2c2_cs_spi, TPS6594_PINCTRL_SCL_I2C2_CS_SPI_FUNCTION),
-	FUNCTION(nrstout_soc, TPS6594_PINCTRL_NRSTOUT_SOC_FUNCTION),
-	FUNCTION(trig_wdog, TPS6594_PINCTRL_TRIG_WDOG_FUNCTION),
-	FUNCTION(sda_i2c2_sdo_spi, TPS6594_PINCTRL_SDA_I2C2_SDO_SPI_FUNCTION),
-	FUNCTION(clk32kout, TPS6594_PINCTRL_CLK32KOUT_FUNCTION),
-	FUNCTION(nerr_soc, TPS6594_PINCTRL_NERR_SOC_FUNCTION),
-	FUNCTION(sclk_spmi, TPS6594_PINCTRL_SCLK_SPMI_FUNCTION),
-	FUNCTION(sdata_spmi, TPS6594_PINCTRL_SDATA_SPMI_FUNCTION),
-	FUNCTION(nerr_mcu, TPS6594_PINCTRL_NERR_MCU_FUNCTION),
-	FUNCTION(syncclkout, TPS6594_PINCTRL_SYNCCLKOUT_FUNCTION),
-	FUNCTION(disable_wdog, TPS6594_PINCTRL_DISABLE_WDOG_FUNCTION),
-	FUNCTION(pdog, TPS6594_PINCTRL_PDOG_FUNCTION),
-	FUNCTION(syncclkin, TPS6594_PINCTRL_SYNCCLKIN_FUNCTION),
+	FUNCTION(tps6594, gpio, TPS6594_PINCTRL_GPIO_FUNCTION),
+	FUNCTION(tps6594, nsleep1, TPS6594_PINCTRL_NSLEEP1_FUNCTION),
+	FUNCTION(tps6594, nsleep2, TPS6594_PINCTRL_NSLEEP2_FUNCTION),
+	FUNCTION(tps6594, wkup1, TPS6594_PINCTRL_WKUP1_FUNCTION),
+	FUNCTION(tps6594, wkup2, TPS6594_PINCTRL_WKUP2_FUNCTION),
+	FUNCTION(tps6594, scl_i2c2_cs_spi, TPS6594_PINCTRL_SCL_I2C2_CS_SPI_FUNCTION),
+	FUNCTION(tps6594, nrstout_soc, TPS6594_PINCTRL_NRSTOUT_SOC_FUNCTION),
+	FUNCTION(tps6594, trig_wdog, TPS6594_PINCTRL_TRIG_WDOG_FUNCTION),
+	FUNCTION(tps6594, sda_i2c2_sdo_spi, TPS6594_PINCTRL_SDA_I2C2_SDO_SPI_FUNCTION),
+	FUNCTION(tps6594, clk32kout, TPS6594_PINCTRL_CLK32KOUT_FUNCTION),
+	FUNCTION(tps6594, nerr_soc, TPS6594_PINCTRL_NERR_SOC_FUNCTION),
+	FUNCTION(tps6594, sclk_spmi, TPS6594_PINCTRL_SCLK_SPMI_FUNCTION),
+	FUNCTION(tps6594, sdata_spmi, TPS6594_PINCTRL_SDATA_SPMI_FUNCTION),
+	FUNCTION(tps6594, nerr_mcu, TPS6594_PINCTRL_NERR_MCU_FUNCTION),
+	FUNCTION(tps6594, syncclkout, TPS6594_PINCTRL_SYNCCLKOUT_FUNCTION),
+	FUNCTION(tps6594, disable_wdog, TPS6594_PINCTRL_DISABLE_WDOG_FUNCTION),
+	FUNCTION(tps6594, pdog, TPS6594_PINCTRL_PDOG_FUNCTION),
+	FUNCTION(tps6594, syncclkin, TPS6594_PINCTRL_SYNCCLKIN_FUNCTION),
+};
+
+static const struct tps6594_pinctrl_function tps65224_pinctrl_functions[] = {
+	FUNCTION(tps65224, gpio, TPS6594_PINCTRL_GPIO_FUNCTION),
+	FUNCTION(tps65224, sda_i2c2_sdo_spi, TPS65224_PINCTRL_SDA_I2C2_SDO_SPI_FUNCTION),
+	FUNCTION(tps65224, nsleep2, TPS65224_PINCTRL_NSLEEP2_FUNCTION),
+	FUNCTION(tps65224, nint, TPS65224_PINCTRL_NINT_FUNCTION),
+	FUNCTION(tps65224, scl_i2c2_cs_spi, TPS65224_PINCTRL_SCL_I2C2_CS_SPI_FUNCTION),
+	FUNCTION(tps65224, nsleep1, TPS65224_PINCTRL_NSLEEP1_FUNCTION),
+	FUNCTION(tps65224, trig_wdog, TPS65224_PINCTRL_TRIG_WDOG_FUNCTION),
+	FUNCTION(tps65224, vmon1, TPS65224_PINCTRL_VMON1_FUNCTION),
+	FUNCTION(tps65224, pb, TPS65224_PINCTRL_PB_FUNCTION),
+	FUNCTION(tps65224, vmon2, TPS65224_PINCTRL_VMON2_FUNCTION),
+	FUNCTION(tps65224, adc_in, TPS65224_PINCTRL_ADC_IN_FUNCTION),
+	FUNCTION(tps65224, wkup, TPS65224_PINCTRL_WKUP_FUNCTION),
+	FUNCTION(tps65224, syncclkin, TPS65224_PINCTRL_SYNCCLKIN_FUNCTION),
+	FUNCTION(tps65224, nerr_mcu, TPS65224_PINCTRL_NERR_MCU_FUNCTION),
 };
 
 struct tps6594_pinctrl {
@@ -175,6 +293,31 @@ struct tps6594_pinctrl {
 	struct pinctrl_dev *pctl_dev;
 	const struct tps6594_pinctrl_function *funcs;
 	const struct pinctrl_pin_desc *pins;
+	int func_cnt;
+	int num_pins;
+	u8 mux_sel_mask;
+	unsigned int remap_cnt;
+	struct muxval_remap *remap;
+};
+
+static struct tps6594_pinctrl tps65224_template_pinctrl = {
+	.funcs = tps65224_pinctrl_functions,
+	.func_cnt = ARRAY_SIZE(tps65224_pinctrl_functions),
+	.pins = tps65224_pins,
+	.num_pins = ARRAY_SIZE(tps65224_pins),
+	.mux_sel_mask = TPS65224_MASK_GPIO_SEL,
+	.remap = tps65224_muxval_remap,
+	.remap_cnt = ARRAY_SIZE(tps65224_muxval_remap),
+};
+
+static struct tps6594_pinctrl tps6594_template_pinctrl = {
+	.funcs = pinctrl_functions,
+	.func_cnt = ARRAY_SIZE(pinctrl_functions),
+	.pins = tps6594_pins,
+	.num_pins = ARRAY_SIZE(tps6594_pins),
+	.mux_sel_mask = TPS6594_MASK_GPIO_SEL,
+	.remap = tps6594_muxval_remap,
+	.remap_cnt = ARRAY_SIZE(tps6594_muxval_remap),
 };
 
 static int tps6594_gpio_regmap_xlate(struct gpio_regmap *gpio,
@@ -201,7 +344,9 @@ static int tps6594_gpio_regmap_xlate(struct gpio_regmap *gpio,
 
 static int tps6594_pmx_func_cnt(struct pinctrl_dev *pctldev)
 {
-	return ARRAY_SIZE(pinctrl_functions);
+	struct tps6594_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pinctrl->func_cnt;
 }
 
 static const char *tps6594_pmx_func_name(struct pinctrl_dev *pctldev,
@@ -229,10 +374,16 @@ static int tps6594_pmx_set(struct tps6594_pinctrl *pinctrl, unsigned int pin,
 			   u8 muxval)
 {
 	u8 mux_sel_val = muxval << TPS6594_OFFSET_GPIO_SEL;
+	u8 mux_sel_mask = pinctrl->mux_sel_mask;
+
+	if (pinctrl->tps->chip_id == TPS65224 && pin == 5) {
+		/* GPIO6 has a different mask in TPS65224*/
+		mux_sel_mask = TPS65224_MASK_GPIO_SEL_GPIO6;
+	}
 
 	return regmap_update_bits(pinctrl->tps->regmap,
 				  TPS6594_REG_GPIOX_CONF(pin),
-				  TPS6594_MASK_GPIO_SEL, mux_sel_val);
+				  mux_sel_mask, mux_sel_val);
 }
 
 static int tps6594_pmx_set_mux(struct pinctrl_dev *pctldev,
@@ -240,16 +391,14 @@ static int tps6594_pmx_set_mux(struct pinctrl_dev *pctldev,
 {
 	struct tps6594_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctldev);
 	u8 muxval = pinctrl->funcs[function].muxval;
-
-	/* Some pins don't have the same muxval for the same function... */
-	if (group == 8) {
-		if (muxval == TPS6594_PINCTRL_DISABLE_WDOG_FUNCTION)
-			muxval = TPS6594_PINCTRL_DISABLE_WDOG_FUNCTION_GPIO8;
-		else if (muxval == TPS6594_PINCTRL_SYNCCLKOUT_FUNCTION)
-			muxval = TPS6594_PINCTRL_SYNCCLKOUT_FUNCTION_GPIO8;
-	} else if (group == 9) {
-		if (muxval == TPS6594_PINCTRL_CLK32KOUT_FUNCTION)
-			muxval = TPS6594_PINCTRL_CLK32KOUT_FUNCTION_GPIO9;
+	unsigned int remap_cnt = pinctrl->remap_cnt;
+	struct muxval_remap *remap = pinctrl->remap;
+
+	for (unsigned int i = 0; i < remap_cnt; i++) {
+		if (group == remap[i].group && muxval == remap[i].muxval) {
+			muxval = remap[i].remap;
+			break;
+		}
 	}
 
 	return tps6594_pmx_set(pinctrl, group, muxval);
@@ -276,7 +425,9 @@ static const struct pinmux_ops tps6594_pmx_ops = {
 
 static int tps6594_groups_cnt(struct pinctrl_dev *pctldev)
 {
-	return ARRAY_SIZE(tps6594_pins);
+	struct tps6594_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pinctrl->num_pins;
 }
 
 static int tps6594_group_pins(struct pinctrl_dev *pctldev,
@@ -318,33 +469,54 @@ static int tps6594_pinctrl_probe(struct platform_device *pdev)
 	pctrl_desc = devm_kzalloc(dev, sizeof(*pctrl_desc), GFP_KERNEL);
 	if (!pctrl_desc)
 		return -ENOMEM;
-	pctrl_desc->name = dev_name(dev);
-	pctrl_desc->owner = THIS_MODULE;
-	pctrl_desc->pins = tps6594_pins;
-	pctrl_desc->npins = ARRAY_SIZE(tps6594_pins);
-	pctrl_desc->pctlops = &tps6594_pctrl_ops;
-	pctrl_desc->pmxops = &tps6594_pmx_ops;
 
 	pinctrl = devm_kzalloc(dev, sizeof(*pinctrl), GFP_KERNEL);
 	if (!pinctrl)
 		return -ENOMEM;
-	pinctrl->tps = dev_get_drvdata(dev->parent);
-	pinctrl->funcs = pinctrl_functions;
-	pinctrl->pins = tps6594_pins;
-	pinctrl->pctl_dev = devm_pinctrl_register(dev, pctrl_desc, pinctrl);
-	if (IS_ERR(pinctrl->pctl_dev))
-		return dev_err_probe(dev, PTR_ERR(pinctrl->pctl_dev),
-				     "Couldn't register pinctrl driver\n");
+
+	switch (tps->chip_id) {
+	case TPS65224:
+		pctrl_desc->pins = tps65224_pins;
+		pctrl_desc->npins = ARRAY_SIZE(tps65224_pins);
+
+		*pinctrl = tps65224_template_pinctrl;
+
+		config.ngpio = ARRAY_SIZE(tps65224_gpio_func_group_names);
+		config.ngpio_per_reg = TPS65224_NGPIO_PER_REG;
+		break;
+	case TPS6593:
+	case TPS6594:
+		pctrl_desc->pins = tps6594_pins;
+		pctrl_desc->npins = ARRAY_SIZE(tps6594_pins);
+
+		*pinctrl = tps6594_template_pinctrl;
+
+		config.ngpio = ARRAY_SIZE(tps6594_gpio_func_group_names);
+		config.ngpio_per_reg = TPS6594_NGPIO_PER_REG;
+		break;
+	default:
+		break;
+	}
+
+	pinctrl->tps = tps;
+
+	pctrl_desc->name = dev_name(dev);
+	pctrl_desc->owner = THIS_MODULE;
+	pctrl_desc->pctlops = &tps6594_pctrl_ops;
+	pctrl_desc->pmxops = &tps6594_pmx_ops;
 
 	config.parent = tps->dev;
 	config.regmap = tps->regmap;
-	config.ngpio = TPS6594_PINCTRL_PINS_NB;
-	config.ngpio_per_reg = 8;
 	config.reg_dat_base = TPS6594_REG_GPIO_IN_1;
 	config.reg_set_base = TPS6594_REG_GPIO_OUT_1;
 	config.reg_dir_out_base = TPS6594_REG_GPIOX_CONF(0);
 	config.reg_mask_xlate = tps6594_gpio_regmap_xlate;
 
+	pinctrl->pctl_dev = devm_pinctrl_register(dev, pctrl_desc, pinctrl);
+	if (IS_ERR(pinctrl->pctl_dev))
+		return dev_err_probe(dev, PTR_ERR(pinctrl->pctl_dev),
+				     "Couldn't register pinctrl driver\n");
+
 	pinctrl->gpio_regmap = devm_gpio_regmap_register(dev, &config);
 	if (IS_ERR(pinctrl->gpio_regmap))
 		return dev_err_probe(dev, PTR_ERR(pinctrl->gpio_regmap),
@@ -369,5 +541,6 @@ static struct platform_driver tps6594_pinctrl_driver = {
 module_platform_driver(tps6594_pinctrl_driver);
 
 MODULE_AUTHOR("Esteban Blanc <eblanc@baylibre.com>");
+MODULE_AUTHOR("Nirmala Devi Mal Nadar <m.nirmaladevi@ltts.com>");
 MODULE_DESCRIPTION("TPS6594 pinctrl and GPIO driver");
 MODULE_LICENSE("GPL");
-- 
2.25.1


