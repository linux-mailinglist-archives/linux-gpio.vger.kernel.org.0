Return-Path: <linux-gpio+bounces-3094-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3168284DEEE
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 11:58:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55B181C23365
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 10:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28047B3C7;
	Thu,  8 Feb 2024 10:54:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa2.ltts.com (unknown [14.140.155.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E136F068;
	Thu,  8 Feb 2024 10:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.140.155.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707389650; cv=none; b=pKi6vQjix6u9aDnFpwJAYVyFzqj0MvZso0Kmdk612YVH0HUosb261mCS5LU+h4fvmNpgwKvlRgR8MQisnSxjCQsj1X+c1Z8SrvHEL040cULuk2E0z5SSMNNQvhMMQpaZwRqasP5Ad9+3/gcJZDAk2U1m50HSeeVGS+/lHT7Q1u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707389650; c=relaxed/simple;
	bh=Jgaf/jzHy8p2sB9+IkC8dt0TVv03n32g24J6ahx08+A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nsZkBz9K/LJRI53oTt95dhMFL/AJO7h1rxmpyL39ld1HKiX2pyBVTwj8d7TbaWJN5WNgSrEAdYkVt+XFxAYk7bfeb0bE6yhTT5a0ZrgWOEW/yUOKlCuwJF5k6rAefsaaBlPBabVipxtJuYoIPk4QgiZJ1Q+o4mAwL2D0ionDg2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ltts.com; spf=pass smtp.mailfrom=ltts.com; arc=none smtp.client-ip=14.140.155.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ltts.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ltts.com
IronPort-SDR: Yg+pcsEZGCm3zEBksvCbqheCM4kv0bZMtN24AAUc9XB6TozSh1kbZudTROe6oXasHube2mSVzf
 gHvC0cBQIyVQ==
Received: from unknown (HELO localhost.localdomain) ([192.168.34.55])
  by esa2.ltts.com with ESMTP; 08 Feb 2024 16:24:00 +0530
From: Bhargav Raviprakash <bhargav.r@ltts.com>
To: linux-kernel@vger.kernel.org
Cc: m.nirmaladevi@ltts.com,
	lee@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jpanis@baylibre.com,
	devicetree@vger.kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	nm@ti.com,
	vigneshr@ti.com,
	kristo@kernel.org
Subject: [RESEND PATCH v1 01/13] mfd: tps6594: Add register definitions for TI TPS65224 PMIC
Date: Thu,  8 Feb 2024 16:23:31 +0530
Message-Id: <20240208105343.1212902-2-bhargav.r@ltts.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240208105343.1212902-1-bhargav.r@ltts.com>
References: <20240208105343.1212902-1-bhargav.r@ltts.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nirmala Devi Mal Nadar <m.nirmaladevi@ltts.com>

Extend TPS6594 PMIC register and field definitions to support TPS65224
power management IC.

TPS65224 is software compatible to TPS6594 and can re-use many of the
same definitions, new definitions are added to support additional
controls available on TPS65224.

Signed-off-by: Nirmala Devi Mal Nadar <m.nirmaladevi@ltts.com>
---
 include/linux/mfd/tps6594.h | 354 ++++++++++++++++++++++++++++++++++--
 1 file changed, 342 insertions(+), 12 deletions(-)

diff --git a/include/linux/mfd/tps6594.h b/include/linux/mfd/tps6594.h
index 3f7c5e23c..1d8969594 100644
--- a/include/linux/mfd/tps6594.h
+++ b/include/linux/mfd/tps6594.h
@@ -18,12 +18,13 @@ enum pmic_id {
 	TPS6594,
 	TPS6593,
 	LP8764,
+	TPS65224,
 };
 
 /* Macro to get page index from register address */
 #define TPS6594_REG_TO_PAGE(reg)	((reg) >> 8)
 
-/* Registers for page 0 of TPS6594 */
+/* Registers for page 0 */
 #define TPS6594_REG_DEV_REV				0x01
 
 #define TPS6594_REG_NVM_CODE_1				0x02
@@ -56,9 +57,6 @@ enum pmic_id {
 #define TPS6594_REG_GPIOX_OUT(gpio_inst)		(TPS6594_REG_GPIO_OUT_1 + (gpio_inst) / 8)
 #define TPS6594_REG_GPIOX_IN(gpio_inst)			(TPS6594_REG_GPIO_IN_1 + (gpio_inst) / 8)
 
-#define TPS6594_REG_GPIO_IN_1				0x3f
-#define TPS6594_REG_GPIO_IN_2				0x40
-
 #define TPS6594_REG_RAIL_SEL_1				0x41
 #define TPS6594_REG_RAIL_SEL_2				0x42
 #define TPS6594_REG_RAIL_SEL_3				0x43
@@ -70,13 +68,15 @@ enum pmic_id {
 #define TPS6594_REG_FSM_TRIG_MASK_3			0x48
 
 #define TPS6594_REG_MASK_BUCK1_2			0x49
+#define TPS65224_REG_MASK_BUCKS				0x49
 #define TPS6594_REG_MASK_BUCK3_4			0x4a
 #define TPS6594_REG_MASK_BUCK5				0x4b
 #define TPS6594_REG_MASK_LDO1_2				0x4c
+#define TPS65224_REG_MASK_LDOS				0x4c
 #define TPS6594_REG_MASK_LDO3_4				0x4d
 #define TPS6594_REG_MASK_VMON				0x4e
-#define TPS6594_REG_MASK_GPIO1_8_FALL			0x4f
-#define TPS6594_REG_MASK_GPIO1_8_RISE			0x50
+#define TPS6594_REG_MASK_GPIO_FALL			0x4f
+#define TPS6594_REG_MASK_GPIO_RISE			0x50
 #define TPS6594_REG_MASK_GPIO9_11			0x51
 #define TPS6594_REG_MASK_STARTUP			0x52
 #define TPS6594_REG_MASK_MISC				0x53
@@ -174,6 +174,10 @@ enum pmic_id {
 
 #define TPS6594_REG_REGISTER_LOCK			0xa1
 
+#define TPS65224_REG_SRAM_ACCESS_1			0xa2
+#define TPS65224_REG_SRAM_ACCESS_2			0xa3
+#define TPS65224_REG_SRAM_ADDR_CTRL			0xa4
+#define TPS65224_REG_RECOV_CNT_PFSM_INCR		0xa5
 #define TPS6594_REG_MANUFACTURING_VER			0xa6
 
 #define TPS6594_REG_CUSTOMER_NVM_ID_REG			0xa7
@@ -182,6 +186,9 @@ enum pmic_id {
 
 #define TPS6594_REG_SOFT_REBOOT_REG			0xab
 
+#define TPS65224_REG_ADC_CTRL				0xac
+#define TPS65224_REG_ADC_RESULT_REG_1			0xad
+#define TPS65224_REG_ADC_RESULT_REG_2			0xae
 #define TPS6594_REG_RTC_SECONDS				0xb5
 #define TPS6594_REG_RTC_MINUTES				0xb6
 #define TPS6594_REG_RTC_HOURS				0xb7
@@ -199,6 +206,7 @@ enum pmic_id {
 
 #define TPS6594_REG_RTC_CTRL_1				0xc2
 #define TPS6594_REG_RTC_CTRL_2				0xc3
+#define TPS65224_REG_STARTUP_CTRL			0xc3
 #define TPS6594_REG_RTC_STATUS				0xc4
 #define TPS6594_REG_RTC_INTERRUPTS			0xc5
 #define TPS6594_REG_RTC_COMP_LSB			0xc6
@@ -214,13 +222,17 @@ enum pmic_id {
 #define TPS6594_REG_PFSM_DELAY_REG_2			0xce
 #define TPS6594_REG_PFSM_DELAY_REG_3			0xcf
 #define TPS6594_REG_PFSM_DELAY_REG_4			0xd0
+#define TPS65224_REG_ADC_GAIN_COMP_REG			0xd0
+#define TPS65224_REG_CRC_CALC_CONTROL			0xef
+#define TPS65224_REG_REGMAP_USER_CRC_LOW		0xf0
+#define TPS65224_REG_REGMAP_USER_CRC_HIGH		0xf1
 
-/* Registers for page 1 of TPS6594 */
+/* Registers for page 1 */
 #define TPS6594_REG_SERIAL_IF_CONFIG			0x11a
 #define TPS6594_REG_I2C1_ID				0x122
 #define TPS6594_REG_I2C2_ID				0x123
 
-/* Registers for page 4 of TPS6594 */
+/* Registers for page 4 */
 #define TPS6594_REG_WD_ANSWER_REG			0x401
 #define TPS6594_REG_WD_QUESTION_ANSW_CNT		0x402
 #define TPS6594_REG_WD_WIN1_CFG				0x403
@@ -241,16 +253,26 @@ enum pmic_id {
 #define TPS6594_BIT_BUCK_PLDN				BIT(5)
 #define TPS6594_BIT_BUCK_RV_SEL				BIT(7)
 
-/* BUCKX_CONF register field definition */
+/* TPS6594 BUCKX_CONF register field definition */
 #define TPS6594_MASK_BUCK_SLEW_RATE			GENMASK(2, 0)
 #define TPS6594_MASK_BUCK_ILIM				GENMASK(5, 3)
 
-/* BUCKX_PG_WINDOW register field definition */
+/* TPS65224 BUCKX_CONF register field definition */
+#define TPS65224_MASK_BUCK_SLEW_RATE			GENMASK(1, 0)
+
+/* TPS6594 BUCKX_PG_WINDOW register field definition */
 #define TPS6594_MASK_BUCK_OV_THR			GENMASK(2, 0)
 #define TPS6594_MASK_BUCK_UV_THR			GENMASK(5, 3)
 
-/* BUCKX VSET */
-#define TPS6594_MASK_BUCKS_VSET GENMASK(7, 0)
+/* TPS65224 BUCKX_PG_WINDOW register field definition */
+#define TPS65224_MASK_BUCK_VMON_THR			GENMASK(1, 0)
+
+/* TPS6594 BUCKX_VOUT register field definition */
+#define TPS6594_MASK_BUCKS_VSET				GENMASK(7, 0)
+
+/* TPS65224 BUCKX_VOUT register field definition */
+#define TPS65224_MASK_BUCK1_VSET			GENMASK(7, 0)
+#define TPS65224_MASK_BUCKS_VSET			GENMASK(6, 0)
 
 /* LDOX_CTRL register field definition */
 #define TPS6594_BIT_LDO_EN				BIT(0)
@@ -258,6 +280,7 @@ enum pmic_id {
 #define TPS6594_BIT_LDO_VMON_EN				BIT(4)
 #define TPS6594_MASK_LDO_PLDN				GENMASK(6, 5)
 #define TPS6594_BIT_LDO_RV_SEL				BIT(7)
+#define TPS65224_BIT_LDO_DISCHARGE_EN			BIT(5)
 
 /* LDORTC_CTRL register field definition */
 #define TPS6594_BIT_LDORTC_DIS				BIT(0)
@@ -271,6 +294,9 @@ enum pmic_id {
 #define TPS6594_MASK_LDO_OV_THR				GENMASK(2, 0)
 #define TPS6594_MASK_LDO_UV_THR				GENMASK(5, 3)
 
+/* LDOX_PG_WINDOW register field definition */
+#define TPS65224_MASK_LDO_VMON_THR			GENMASK(1, 0)
+
 /* VCCA_VMON_CTRL register field definition */
 #define TPS6594_BIT_VMON_EN				BIT(0)
 #define TPS6594_BIT_VMON1_EN				BIT(1)
@@ -278,10 +304,12 @@ enum pmic_id {
 #define TPS6594_BIT_VMON2_EN				BIT(3)
 #define TPS6594_BIT_VMON2_RV_SEL			BIT(4)
 #define TPS6594_BIT_VMON_DEGLITCH_SEL			BIT(5)
+#define TPS65224_BIT_VMON_DEGLITCH_SEL			GENMASK(7, 5)
 
 /* VCCA_PG_WINDOW register field definition */
 #define TPS6594_MASK_VCCA_OV_THR			GENMASK(2, 0)
 #define TPS6594_MASK_VCCA_UV_THR			GENMASK(5, 3)
+#define TPS65224_MASK_VCCA_VMON_THR			GENMASK(1, 0)
 #define TPS6594_BIT_VCCA_PG_SET				BIT(6)
 
 /* VMONX_PG_WINDOW register field definition */
@@ -289,6 +317,9 @@ enum pmic_id {
 #define TPS6594_MASK_VMONX_UV_THR			GENMASK(5, 3)
 #define TPS6594_BIT_VMONX_RANGE				BIT(6)
 
+/* VMONX_PG_WINDOW register field definition */
+#define TPS65224_MASK_VMONX_THR				GENMASK(1, 0)
+
 /* GPIOX_CONF register field definition */
 #define TPS6594_BIT_GPIO_DIR				BIT(0)
 #define TPS6594_BIT_GPIO_OD				BIT(1)
@@ -296,6 +327,8 @@ enum pmic_id {
 #define TPS6594_BIT_GPIO_PU_PD_EN			BIT(3)
 #define TPS6594_BIT_GPIO_DEGLITCH_EN			BIT(4)
 #define TPS6594_MASK_GPIO_SEL				GENMASK(7, 5)
+#define TPS65224_MASK_GPIO_SEL				GENMASK(6, 5)
+#define TPS65224_MASK_GPIO_SEL_GPIO6			GENMASK(7, 5)
 
 /* NPWRON_CONF register field definition */
 #define TPS6594_BIT_NRSTOUT_OD				BIT(0)
@@ -305,6 +338,12 @@ enum pmic_id {
 #define TPS6594_BIT_ENABLE_POL				BIT(5)
 #define TPS6594_MASK_NPWRON_SEL				GENMASK(7, 6)
 
+/* POWER_ON_CONFIG register field definition */
+#define TPS65224_BIT_NINT_ENDRV_PU_SEL			BIT(0)
+#define TPS65224_BIT_NINT_ENDRV_SEL			BIT(1)
+#define TPS65224_BIT_EN_PB_DEGL				BIT(5)
+#define TPS65224_MASK_EN_PB_VSENSE_CONFIG		GENMASK(7, 6)
+
 /* GPIO_OUT_X register field definition */
 #define TPS6594_BIT_GPIOX_OUT(gpio_inst)		BIT((gpio_inst) % 8)
 
@@ -312,6 +351,12 @@ enum pmic_id {
 #define TPS6594_BIT_GPIOX_IN(gpio_inst)			BIT((gpio_inst) % 8)
 #define TPS6594_BIT_NPWRON_IN				BIT(3)
 
+/* GPIO_OUT_X register field definition */
+#define TPS65224_BIT_GPIOX_OUT(gpio_inst)		BIT((gpio_inst))
+
+/* GPIO_IN_X register field definition */
+#define TPS65224_BIT_GPIOX_IN(gpio_inst)		BIT((gpio_inst))
+
 /* RAIL_SEL_1 register field definition */
 #define TPS6594_MASK_BUCK1_GRP_SEL			GENMASK(1, 0)
 #define TPS6594_MASK_BUCK2_GRP_SEL			GENMASK(3, 2)
@@ -343,6 +388,9 @@ enum pmic_id {
 #define TPS6594_BIT_GPIOX_FSM_MASK(gpio_inst)		BIT(((gpio_inst) << 1) % 8)
 #define TPS6594_BIT_GPIOX_FSM_MASK_POL(gpio_inst)	BIT(((gpio_inst) << 1) % 8 + 1)
 
+#define TPS65224_BIT_GPIOX_FSM_MASK(gpio_inst)		BIT(((gpio_inst) << 1) % 6)
+#define TPS65224_BIT_GPIOX_FSM_MASK_POL(gpio_inst)	BIT(((gpio_inst) << 1) % 6 + 1)
+
 /* MASK_BUCKX register field definition */
 #define TPS6594_BIT_BUCKX_OV_MASK(buck_inst)		BIT(((buck_inst) << 2) % 8)
 #define TPS6594_BIT_BUCKX_UV_MASK(buck_inst)		BIT(((buck_inst) << 2) % 8 + 1)
@@ -361,22 +409,46 @@ enum pmic_id {
 #define TPS6594_BIT_VMON2_OV_MASK			BIT(5)
 #define TPS6594_BIT_VMON2_UV_MASK			BIT(6)
 
+/* MASK_BUCK Register field definition */
+#define TPS65224_BIT_BUCK1_UVOV_MASK			BIT(0)
+#define TPS65224_BIT_BUCK2_UVOV_MASK			BIT(1)
+#define TPS65224_BIT_BUCK3_UVOV_MASK			BIT(2)
+#define TPS65224_BIT_BUCK4_UVOV_MASK			BIT(4)
+
+/* MASK_LDO_VMON register field definition */
+#define TPS65224_BIT_LDO1_UVOV_MASK			BIT(0)
+#define TPS65224_BIT_LDO2_UVOV_MASK			BIT(1)
+#define TPS65224_BIT_LDO3_UVOV_MASK			BIT(2)
+#define TPS65224_BIT_VCCA_UVOV_MASK			BIT(4)
+#define TPS65224_BIT_VMON1_UVOV_MASK			BIT(5)
+#define TPS65224_BIT_VMON2_UVOV_MASK			BIT(6)
+
 /* MASK_GPIOX register field definition */
 #define TPS6594_BIT_GPIOX_FALL_MASK(gpio_inst)		BIT((gpio_inst) < 8 ? \
 							    (gpio_inst) : (gpio_inst) % 8)
 #define TPS6594_BIT_GPIOX_RISE_MASK(gpio_inst)		BIT((gpio_inst) < 8 ? \
 							    (gpio_inst) : (gpio_inst) % 8 + 3)
+/* MASK_GPIOX register field definition */
+#define TPS65224_BIT_GPIOX_FALL_MASK(gpio_inst)		BIT((gpio_inst))
+#define TPS65224_BIT_GPIOX_RISE_MASK(gpio_inst)		BIT((gpio_inst))
 
 /* MASK_STARTUP register field definition */
 #define TPS6594_BIT_NPWRON_START_MASK			BIT(0)
 #define TPS6594_BIT_ENABLE_MASK				BIT(1)
 #define TPS6594_BIT_FSD_MASK				BIT(4)
 #define TPS6594_BIT_SOFT_REBOOT_MASK			BIT(5)
+#define TPS65224_BIT_VSENSE_MASK			BIT(0)
+#define TPS65224_BIT_PB_SHORT_MASK			BIT(2)
 
 /* MASK_MISC register field definition */
 #define TPS6594_BIT_BIST_PASS_MASK			BIT(0)
 #define TPS6594_BIT_EXT_CLK_MASK			BIT(1)
+#define TPS65224_BIT_REG_UNLOCK_MASK			BIT(2)
 #define TPS6594_BIT_TWARN_MASK				BIT(3)
+#define TPS65224_BIT_PB_LONG_MASK			BIT(4)
+#define TPS65224_BIT_PB_FALL_MASK			BIT(5)
+#define TPS65224_BIT_PB_RISE_MASK			BIT(6)
+#define TPS65224_BIT_ADC_CONV_READY_MASK		BIT(7)
 
 /* MASK_MODERATE_ERR register field definition */
 #define TPS6594_BIT_BIST_FAIL_MASK			BIT(1)
@@ -391,6 +463,8 @@ enum pmic_id {
 #define TPS6594_BIT_ORD_SHUTDOWN_MASK			BIT(1)
 #define TPS6594_BIT_MCU_PWR_ERR_MASK			BIT(2)
 #define TPS6594_BIT_SOC_PWR_ERR_MASK			BIT(3)
+#define TPS65224_BIT_COMM_ERR_MASK			BIT(4)
+#define TPS65224_BIT_I2C2_ERR_MASK			BIT(5)
 
 /* MASK_COMM_ERR register field definition */
 #define TPS6594_BIT_COMM_FRM_ERR_MASK			BIT(0)
@@ -426,6 +500,12 @@ enum pmic_id {
 #define TPS6594_BIT_BUCK3_4_INT				BIT(1)
 #define TPS6594_BIT_BUCK5_INT				BIT(2)
 
+/* INT_BUCK register field definition */
+#define TPS65224_BIT_BUCK1_UVOV_INT			BIT(0)
+#define TPS65224_BIT_BUCK2_UVOV_INT			BIT(1)
+#define TPS65224_BIT_BUCK3_UVOV_INT			BIT(2)
+#define TPS65224_BIT_BUCK4_UVOV_INT			BIT(3)
+
 /* INT_BUCKX register field definition */
 #define TPS6594_BIT_BUCKX_OV_INT(buck_inst)		BIT(((buck_inst) << 2) % 8)
 #define TPS6594_BIT_BUCKX_UV_INT(buck_inst)		BIT(((buck_inst) << 2) % 8 + 1)
@@ -437,6 +517,14 @@ enum pmic_id {
 #define TPS6594_BIT_LDO3_4_INT				BIT(1)
 #define TPS6594_BIT_VCCA_INT				BIT(4)
 
+/* INT_LDO_VMON register field definition */
+#define TPS65224_BIT_LDO1_UVOV_INT			BIT(0)
+#define TPS65224_BIT_LDO2_UVOV_INT			BIT(1)
+#define TPS65224_BIT_LDO3_UVOV_INT			BIT(2)
+#define TPS65224_BIT_VCCA_UVOV_INT			BIT(4)
+#define TPS65224_BIT_VMON1_UVOV_INT			BIT(5)
+#define TPS65224_BIT_VMON2_UVOV_INT			BIT(6)
+
 /* INT_LDOX register field definition */
 #define TPS6594_BIT_LDOX_OV_INT(ldo_inst)		BIT(((ldo_inst) << 2) % 8)
 #define TPS6594_BIT_LDOX_UV_INT(ldo_inst)		BIT(((ldo_inst) << 2) % 8 + 1)
@@ -462,17 +550,32 @@ enum pmic_id {
 /* INT_GPIOX register field definition */
 #define TPS6594_BIT_GPIOX_INT(gpio_inst)		BIT(gpio_inst)
 
+/* INT_GPIO register field definition */
+#define TPS65224_BIT_GPIO1_INT				BIT(0)
+#define TPS65224_BIT_GPIO2_INT				BIT(1)
+#define TPS65224_BIT_GPIO3_INT				BIT(2)
+#define TPS65224_BIT_GPIO4_INT				BIT(3)
+#define TPS65224_BIT_GPIO5_INT				BIT(4)
+#define TPS65224_BIT_GPIO6_INT				BIT(5)
+
 /* INT_STARTUP register field definition */
 #define TPS6594_BIT_NPWRON_START_INT			BIT(0)
+#define TPS65224_BIT_VSENSE_INT				BIT(0)
 #define TPS6594_BIT_ENABLE_INT				BIT(1)
 #define TPS6594_BIT_RTC_INT				BIT(2)
+#define TPS65224_BIT_PB_SHORT_INT			BIT(2)
 #define TPS6594_BIT_FSD_INT				BIT(4)
 #define TPS6594_BIT_SOFT_REBOOT_INT			BIT(5)
 
 /* INT_MISC register field definition */
 #define TPS6594_BIT_BIST_PASS_INT			BIT(0)
 #define TPS6594_BIT_EXT_CLK_INT				BIT(1)
+#define TPS65224_BIT_REG_UNLOCK_INT			BIT(2)
 #define TPS6594_BIT_TWARN_INT				BIT(3)
+#define TPS65224_BIT_PB_LONG_INT			BIT(4)
+#define TPS65224_BIT_PB_FALL_INT			BIT(5)
+#define TPS65224_BIT_PB_RISE_INT			BIT(6)
+#define TPS65224_BIT_ADC_CONV_READY_INT			BIT(7)
 
 /* INT_MODERATE_ERR register field definition */
 #define TPS6594_BIT_TSD_ORD_INT				BIT(0)
@@ -488,6 +591,7 @@ enum pmic_id {
 #define TPS6594_BIT_TSD_IMM_INT				BIT(0)
 #define TPS6594_BIT_VCCA_OVP_INT			BIT(1)
 #define TPS6594_BIT_PFSM_ERR_INT			BIT(2)
+#define TPS65224_BIT_BG_XMON_INT			BIT(3)
 
 /* INT_FSM_ERR register field definition */
 #define TPS6594_BIT_IMM_SHUTDOWN_INT			BIT(0)
@@ -496,6 +600,7 @@ enum pmic_id {
 #define TPS6594_BIT_SOC_PWR_ERR_INT			BIT(3)
 #define TPS6594_BIT_COMM_ERR_INT			BIT(4)
 #define TPS6594_BIT_READBACK_ERR_INT			BIT(5)
+#define TPS65224_BIT_I2C2_ERR_INT			BIT(5)
 #define TPS6594_BIT_ESM_INT				BIT(6)
 #define TPS6594_BIT_WD_INT				BIT(7)
 
@@ -536,8 +641,18 @@ enum pmic_id {
 #define TPS6594_BIT_VMON2_OV_STAT			BIT(5)
 #define TPS6594_BIT_VMON2_UV_STAT			BIT(6)
 
+/* STAT_LDO_VMON register field definition */
+#define TPS65224_BIT_LDO1_UVOV_STAT			BIT(0)
+#define TPS65224_BIT_LDO2_UVOV_STAT			BIT(1)
+#define TPS65224_BIT_LDO3_UVOV_STAT			BIT(2)
+#define TPS65224_BIT_VCCA_UVOV_STAT			BIT(4)
+#define TPS65224_BIT_VMON1_UVOV_STAT			BIT(5)
+#define TPS65224_BIT_VMON2_UVOV_STAT			BIT(6)
+
 /* STAT_STARTUP register field definition */
+#define TPS65224_BIT_VSENSE_STAT			BIT(0)
 #define TPS6594_BIT_ENABLE_STAT				BIT(1)
+#define TPS65224_BIT_PB_LEVEL_STAT			BIT(2)
 
 /* STAT_MISC register field definition */
 #define TPS6594_BIT_EXT_CLK_STAT			BIT(1)
@@ -549,6 +664,7 @@ enum pmic_id {
 /* STAT_SEVERE_ERR register field definition */
 #define TPS6594_BIT_TSD_IMM_STAT			BIT(0)
 #define TPS6594_BIT_VCCA_OVP_STAT			BIT(1)
+#define TPS65224_BIT_BG_XMON_STAT			BIT(3)
 
 /* STAT_READBACK_ERR register field definition */
 #define TPS6594_BIT_EN_DRV_READBACK_STAT		BIT(0)
@@ -597,6 +713,8 @@ enum pmic_id {
 #define TPS6594_BIT_BB_CHARGER_EN			BIT(0)
 #define TPS6594_BIT_BB_ICHR				BIT(1)
 #define TPS6594_MASK_BB_VEOC				GENMASK(3, 2)
+#define TPS65224_BIT_I2C1_SPI_CRC_EN			BIT(4)
+#define TPS65224_BIT_I2C2_CRC_EN			BIT(5)
 #define TPS6594_BB_EOC_RDY				BIT(7)
 
 /* ENABLE_DRV_REG register field definition */
@@ -617,6 +735,7 @@ enum pmic_id {
 #define TPS6594_BIT_NRSTOUT_SOC_IN			BIT(2)
 #define TPS6594_BIT_FORCE_EN_DRV_LOW			BIT(3)
 #define TPS6594_BIT_SPMI_LPM_EN				BIT(4)
+#define TPS65224_BIT_TSD_DISABLE			BIT(5)
 
 /* RECOV_CNT_REG_1 register field definition */
 #define TPS6594_MASK_RECOV_CNT				GENMASK(3, 0)
@@ -671,15 +790,27 @@ enum pmic_id {
 /* ESM_SOC_START_REG register field definition */
 #define TPS6594_BIT_ESM_SOC_START			BIT(0)
 
+/* ESM_MCU_START_REG register field definition */
+#define TPS65224_BIT_ESM_MCU_START			BIT(0)
+
 /* ESM_SOC_MODE_CFG register field definition */
 #define TPS6594_MASK_ESM_SOC_ERR_CNT_TH			GENMASK(3, 0)
 #define TPS6594_BIT_ESM_SOC_ENDRV			BIT(5)
 #define TPS6594_BIT_ESM_SOC_EN				BIT(6)
 #define TPS6594_BIT_ESM_SOC_MODE			BIT(7)
 
+/* ESM_MCU_MODE_CFG register field definition */
+#define TPS65224_MASK_ESM_MCU_ERR_CNT_TH		GENMASK(3, 0)
+#define TPS65224_BIT_ESM_MCU_ENDRV			BIT(5)
+#define TPS65224_BIT_ESM_MCU_EN				BIT(6)
+#define TPS65224_BIT_ESM_MCU_MODE			BIT(7)
+
 /* ESM_SOC_ERR_CNT_REG register field definition */
 #define TPS6594_MASK_ESM_SOC_ERR_CNT			GENMASK(4, 0)
 
+/* ESM_MCU_ERR_CNT_REG register field definition */
+#define TPS6594_MASK_ESM_MCU_ERR_CNT			GENMASK(4, 0)
+
 /* REGISTER_LOCK register field definition */
 #define TPS6594_BIT_REGISTER_LOCK_STATUS		BIT(0)
 
@@ -687,6 +818,29 @@ enum pmic_id {
 #define TPS6594_MASK_VMON1_SLEW_RATE			GENMASK(2, 0)
 #define TPS6594_MASK_VMON2_SLEW_RATE			GENMASK(5, 3)
 
+/* SRAM_ACCESS_1 Register field definition */
+#define TPS65224_MASk_SRAM_UNLOCK_SEQ			GENMASK(7, 0)
+
+/* SRAM_ACCESS_2 Register field definition */
+#define TPS65224_BIT_SRAM_WRITE_MODE			BIT(0)
+#define TPS65224_BIT_OTP_PROG_USER			BIT(1)
+#define TPS65224_BIT_OTP_PROG_PFSM			BIT(2)
+#define TPS65224_BIT_OTP_PROG_STATUS			BIT(3)
+#define TPS65224_BIT_SRAM_UNLOCKED			BIT(6)
+#define TPS65224_USER_PROG_ALLOWED			BIT(7)
+
+/* SRAM_ADDR_CTRL Register field definition */
+#define TPS65224_MASk_SRAM_SEL				GENMASK(1, 0)
+
+/* RECOV_CNT_PFSM_INCR Register field definition */
+#define TPS65224_BIT_INCREMENT_RECOV_CNT		BIT(0)
+
+/* MANUFACTURING_VER Register field definition */
+#define TPS65224_MASK_SILICON_REV			GENMASK(7, 0)
+
+/* CUSTOMER_NVM_ID_REG Register field definition */
+#define TPS65224_MASK_CUSTOMER_NVM_ID			GENMASK(7, 0)
+
 /* SOFT_REBOOT_REG register field definition */
 #define TPS6594_BIT_SOFT_REBOOT				BIT(0)
 
@@ -755,14 +909,83 @@ enum pmic_id {
 #define TPS6594_BIT_I2C2_CRC_EN				BIT(2)
 #define TPS6594_MASK_T_CRC				GENMASK(7, 3)
 
+/* ADC_CTRL Register field definition */
+#define TPS65224_BIT_ADC_START				BIT(0)
+#define TPS65224_BIT_ADC_CONT_CONV			BIT(1)
+#define TPS65224_BIT_ADC_THERMAL_SEL			BIT(2)
+#define TPS65224_BIT_ADC_RDIV_EN			BIT(3)
+#define TPS65224_BIT_ADC_STATUS				BIT(7)
+
+/* ADC_RESULT_REG_1 Register field definition */
+#define TPS65224_MASK_ADC_RESULT_11_4			GENMASK(7, 0)
+
+/* ADC_RESULT_REG_2 Register field definition */
+#define TPS65224_MASK_ADC_RESULT_3_0			GENMASK(7, 4)
+
+/* STARTUP_CTRL Register field definition */
+#define TPS65224_MASK_STARTUP_DEST			GENMASK(6, 5)
+#define TPS65224_BIT_FIRST_STARTUP_DONE			BIT(7)
+
+/* SCRATCH_PAD_REG_1 Register field definition */
+#define TPS6594_MASK_SCRATCH_PAD_1			GENMASK(7, 0)
+
+/* SCRATCH_PAD_REG_2 Register field definition */
+#define TPS6594_MASK_SCRATCH_PAD_2			GENMASK(7, 0)
+
+/* SCRATCH_PAD_REG_3 Register field definition */
+#define TPS6594_MASK_SCRATCH_PAD_3			GENMASK(7, 0)
+
+/* SCRATCH_PAD_REG_4 Register field definition */
+#define TPS6594_MASK_SCRATCH_PAD_4			GENMASK(7, 0)
+
+/* PFSM_DELAY_REG_1 Register field definition */
+#define TPS6594_MASK_PFSM_DELAY1			GENMASK(7, 0)
+
+/* PFSM_DELAY_REG_2 Register field definition */
+#define TPS6594_MASK_PFSM_DELAY2			GENMASK(7, 0)
+
+/* PFSM_DELAY_REG_3 Register field definition */
+#define TPS6594_MASK_PFSM_DELAY3			GENMASK(7, 0)
+
+/* PFSM_DELAY_REG_4 Register field definition */
+#define TPS6594_MASK_PFSM_DELAY4			GENMASK(7, 0)
+
+/* CRC_CALC_CONTROL Register field definition */
+#define TPS65224_BIT_RUN_CRC_BIST			BIT(0)
+#define TPS65224_BIT_RUN_CRC_UPDATE			BIT(1)
+
+/* ADC_GAIN_COMP_REG Register field definition */
+#define TPS65224_MASK_ADC_GAIN_COMP			GENMASK(7, 0)
+
+/* REGMAP_USER_CRC_LOW Register field definition */
+#define TPS65224_MASK_REGMAP_USER_CRC16_LOW		GENMASK(7, 0)
+
+/* REGMAP_USER_CRC_HIGH Register field definition */
+#define TPS65224_MASK_REGMAP_USER_CRC16_HIGH		GENMASK(7, 0)
+
+/* WD_ANSWER_REG Register field definition */
+#define TPS6594_MASK_WD_ANSWER				GENMASK(7, 0)
+
 /* WD_QUESTION_ANSW_CNT register field definition */
 #define TPS6594_MASK_WD_QUESTION			GENMASK(3, 0)
 #define TPS6594_MASK_WD_ANSW_CNT			GENMASK(5, 4)
+#define TPS65224_BIT_INT_TOP_STATUS			BIT(7)
+
+/* WD WIN1_CFG register field definition */
+#define TPS6594_MASK_WD_WIN1_CFG			GENMASK(6, 0)
+
+/* WD WIN2_CFG register field definition */
+#define TPS6594_MASK_WD_WIN2_CFG			GENMASK(6, 0)
+
+/* WD LongWin register field definition */
+#define TPS6594_MASK_WD_LONGWIN_CFG			GENMASK(7, 0)
 
 /* WD_MODE_REG register field definition */
 #define TPS6594_BIT_WD_RETURN_LONGWIN			BIT(0)
 #define TPS6594_BIT_WD_MODE_SELECT			BIT(1)
 #define TPS6594_BIT_WD_PWRHOLD				BIT(2)
+#define TPS65224_BIT_WD_ENDRV_SEL			BIT(6)
+#define TPS65224_BIT_WD_CNT_SEL				BIT(7)
 
 /* WD_QA_CFG register field definition */
 #define TPS6594_MASK_WD_QUESTION_SEED			GENMASK(3, 0)
@@ -993,6 +1216,113 @@ enum tps6594_irqs {
 #define TPS6594_IRQ_NAME_ALARM			"alarm"
 #define TPS6594_IRQ_NAME_POWERUP		"powerup"
 
+/* IRQs */
+enum tps65224_irqs {
+	/* INT_BUCK register */
+	TPS65224_IRQ_BUCK1_UVOV,
+	TPS65224_IRQ_BUCK2_UVOV,
+	TPS65224_IRQ_BUCK3_UVOV,
+	TPS65224_IRQ_BUCK4_UVOV,
+	/* INT_LDO_VMON register */
+	TPS65224_IRQ_LDO1_UVOV,
+	TPS65224_IRQ_LDO2_UVOV,
+	TPS65224_IRQ_LDO3_UVOV,
+	TPS65224_IRQ_VCCA_UVOV,
+	TPS65224_IRQ_VMON1_UVOV,
+	TPS65224_IRQ_VMON2_UVOV,
+	/* INT_GPIO register */
+	TPS65224_IRQ_GPIO1,
+	TPS65224_IRQ_GPIO2,
+	TPS65224_IRQ_GPIO3,
+	TPS65224_IRQ_GPIO4,
+	TPS65224_IRQ_GPIO5,
+	TPS65224_IRQ_GPIO6,
+	/* INT_STARTUP register */
+	TPS65224_IRQ_VSENSE,
+	TPS65224_IRQ_ENABLE,
+	TPS65224_IRQ_PB_SHORT,
+	TPS65224_IRQ_FSD,
+	TPS65224_IRQ_SOFT_REBOOT,
+	/* INT_MISC register */
+	TPS65224_IRQ_BIST_PASS,
+	TPS65224_IRQ_EXT_CLK,
+	TPS65224_IRQ_REG_UNLOCK,
+	TPS65224_IRQ_TWARN,
+	TPS65224_IRQ_PB_LONG,
+	TPS65224_IRQ_PB_FALL,
+	TPS65224_IRQ_PB_RISE,
+	TPS65224_IRQ_ADC_CONV_READY,
+	/* INT_MODERATE_ERR register */
+	TPS65224_IRQ_TSD_ORD,
+	TPS65224_IRQ_BIST_FAIL,
+	TPS65224_IRQ_REG_CRC_ERR,
+	TPS65224_IRQ_RECOV_CNT,
+	/* INT_SEVERE_ERR register */
+	TPS65224_IRQ_TSD_IMM,
+	TPS65224_IRQ_VCCA_OVP,
+	TPS65224_IRQ_PFSM_ERR,
+	TPS65224_IRQ_BG_XMON,
+	/* INT_FSM_ERR register */
+	TPS65224_IRQ_IMM_SHUTDOWN,
+	TPS65224_IRQ_ORD_SHUTDOWN,
+	TPS65224_IRQ_MCU_PWR_ERR,
+	TPS65224_IRQ_SOC_PWR_ERR,
+	TPS65224_IRQ_COMM_ERR,
+	TPS65224_IRQ_I2C2_ERR,
+	/* INT_ESM register */
+	TPS65224_IRQ_ESM_MCU_PIN,
+	TPS65224_IRQ_ESM_MCU_FAIL,
+	TPS65224_IRQ_ESM_MCU_RST,
+};
+
+#define TPS65224_IRQ_NAME_BUCK1_UVOV		"buck1_uvov"
+#define TPS65224_IRQ_NAME_BUCK2_UVOV		"buck2_uvov"
+#define TPS65224_IRQ_NAME_BUCK3_UVOV		"buck3_uvov"
+#define TPS65224_IRQ_NAME_BUCK4_UVOV		"buck4_uvov"
+#define TPS65224_IRQ_NAME_LDO1_UVOV		"ldo1_uvov"
+#define TPS65224_IRQ_NAME_LDO2_UVOV		"ldo2_uvov"
+#define TPS65224_IRQ_NAME_LDO3_UVOV		"ldo3_uvov"
+#define TPS65224_IRQ_NAME_VCCA_UVOV		"vcca_uvov"
+#define TPS65224_IRQ_NAME_VMON1_UVOV		"vmon1_uvov"
+#define TPS65224_IRQ_NAME_VMON2_UVOV		"vmon2_uvov"
+#define TPS65224_IRQ_NAME_GPIO1			"gpio1"
+#define TPS65224_IRQ_NAME_GPIO2			"gpio2"
+#define TPS65224_IRQ_NAME_GPIO3			"gpio3"
+#define TPS65224_IRQ_NAME_GPIO4			"gpio4"
+#define TPS65224_IRQ_NAME_GPIO5			"gpio5"
+#define TPS65224_IRQ_NAME_GPIO6			"gpio6"
+#define TPS65224_IRQ_NAME_VSENSE	        "vsense"
+#define TPS65224_IRQ_NAME_ENABLE		"enable"
+#define TPS65224_IRQ_NAME_PB_SHORT		"pb_short"
+#define TPS65224_IRQ_NAME_FSD			"fsd"
+#define TPS65224_IRQ_NAME_SOFT_REBOOT		"soft_reboot"
+#define TPS65224_IRQ_NAME_BIST_PASS		"bist_pass"
+#define TPS65224_IRQ_NAME_EXT_CLK		"ext_clk"
+#define TPS65224_IRQ_NAME_REG_UNLOCK		"reg_unlock"
+#define TPS65224_IRQ_NAME_TWARN			"twarn"
+#define TPS65224_IRQ_NAME_PB_LONG		"pb_long"
+#define TPS65224_IRQ_NAME_PB_FALL		"pb_fall"
+#define TPS65224_IRQ_NAME_PB_RISE		"pb_rise"
+#define TPS65224_IRQ_NAME_ADC_CONV_READY	"adc_conv_ready"
+#define TPS65224_IRQ_NAME_TSD_ORD		"tsd_ord"
+#define TPS65224_IRQ_NAME_BIST_FAIL		"bist_fail"
+#define TPS65224_IRQ_NAME_REG_CRC_ERR		"reg_crc_err"
+#define TPS65224_IRQ_NAME_RECOV_CNT		"recov_cnt"
+#define TPS65224_IRQ_NAME_TSD_IMM		"tsd_imm"
+#define TPS65224_IRQ_NAME_VCCA_OVP		"vcca_ovp"
+#define TPS65224_IRQ_NAME_PFSM_ERR		"pfsm_err"
+#define TPS65224_IRQ_NAME_BG_XMON		"bg_xmon"
+#define TPS65224_IRQ_NAME_IMM_SHUTDOWN		"imm_shutdown"
+#define TPS65224_IRQ_NAME_ORD_SHUTDOWN		"ord_shutdown"
+#define TPS65224_IRQ_NAME_MCU_PWR_ERR		"mcu_pwr_err"
+#define TPS65224_IRQ_NAME_SOC_PWR_ERR		"soc_pwr_err"
+#define TPS65224_IRQ_NAME_COMM_ERR		"comm_err"
+#define TPS65224_IRQ_NAME_I2C2_ERR		"i2c2_err"
+#define TPS65224_IRQ_NAME_ESM_MCU_PIN		"esm_mcu_pin"
+#define TPS65224_IRQ_NAME_ESM_MCU_FAIL		"esm_mcu_fail"
+#define TPS65224_IRQ_NAME_ESM_MCU_RST		"esm_mcu_rst"
+#define TPS65224_IRQ_NAME_POWERUP		"powerup"
+
 /**
  * struct tps6594 - device private data structure
  *
-- 
2.25.1


