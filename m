Return-Path: <linux-gpio+bounces-8751-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E78319525C2
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2024 00:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 746631F25997
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2024 22:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4838314A609;
	Wed, 14 Aug 2024 22:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="lYAqMsm6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CE5149003;
	Wed, 14 Aug 2024 22:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723674680; cv=pass; b=Us1MsOj6LaAjzVppir2lyCNk10I1UR73oKZCxGzaXE1wLimjoEUy/sWqB2HxzHL5dLUAQ3cZdr6uaXelzCx7rnnZf1MmGxQJmA/5eG/eFRt8okFRZ3l9k1KNLzlnorcERgwrld9sqqxwoxe5pl8Qm64zbg9cTohx15elZYdZtmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723674680; c=relaxed/simple;
	bh=y5rEC7HOrQCuIdt3pnIJzC+RrLsH889/N2ljdUkf1/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kG0niTW4TaPKjQaMgt4AXCmi0uGK0nrOy+te8tGB1Q75Dzz0JPs5p7jtTrUVWl1DFrHy30JD2R3Y/tDnnGlutmi3TwWtLTke+Q9pFiuauGwHo4SKjhUFMwWW+zjODMOd0eME2iJrNtV/d8qUeIWGxBP8xIDlOn82ulAwCdKAJio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=lYAqMsm6; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723674655; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ltkxwCQBH1ZikuqplfjgWZh2qmHyLaaBOrqdBeMk5JoGZ7IKsOnFAb9k9R9xgtM9j4DyZR0UIDE7Nfwm2pfO84s7TXd1Nzx3CV2QmtjkMcmGZiCmLCT9lED8DagH2kMEQ0vAaooTd8DEuRx7m3rKnK4M1zpifing2eWTF30hLHw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1723674655; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ANxrj9smJhFSWlWopLki+KqmcObn+uf98MhfUbOw30M=; 
	b=ACDeiZImr+OBaOmOorITKE5NQE3O5WijWIm2fEh460zlADOpWdl5vQK5z6l7QzX6NhjSblQnh3Df4IQEPz+btvT4WbCEucXetwh78RT7VaIAhLcAr3lNE++i7oBn73p4jv7Tj+8DC3/+U7+AZP1Z737SqNgJnngeJCyJohKwpqo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723674655;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ANxrj9smJhFSWlWopLki+KqmcObn+uf98MhfUbOw30M=;
	b=lYAqMsm6yfLj9tUxvjjzrnrtGkk1RV1VRhadGtz2yKNSiTlNGhH1wVhyKT4bT4lN
	2on/MDBypj62SQfsZuLaKyo/QF5DvIMVIACOUUYinoIhY+vdttaMjaSIYwCBEiCTFAU
	YXLdd/UTB0gZS4dxTFpBmaUKwFamAIvp8f3QfbdY=
Received: by mx.zohomail.com with SMTPS id 1723674653532685.2219647904639;
	Wed, 14 Aug 2024 15:30:53 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Steven Liu <steven.liu@rock-chips.com>,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v3 2/2] pinctrl: rockchip: Add rk3576 pinctrl support
Date: Wed, 14 Aug 2024 18:30:39 -0400
Message-ID: <20240814223217.3498-3-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814223217.3498-1-detlev.casanova@collabora.com>
References: <20240814223217.3498-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Steven Liu <steven.liu@rock-chips.com>

Add support for the 5 rk3576 GPIO banks.

This also adds support for optionnal support of the sys-grf syscon,
used for i3c software controlled weak pull-up.

Signed-off-by: Steven Liu <steven.liu@rock-chips.com>
[rebase, reword commit message]
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 228 +++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.h |   2 +
 2 files changed, 230 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 0eacaf10c640f..110ed81d650be 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -84,6 +84,27 @@
 		},							\
 	}
 
+#define PIN_BANK_IOMUX_FLAGS_OFFSET_PULL_FLAGS(id, pins, label, iom0,	\
+					       iom1, iom2, iom3,	\
+					       offset0, offset1,	\
+					       offset2, offset3, pull0,	\
+					       pull1, pull2, pull3)	\
+	{								\
+		.bank_num	= id,					\
+		.nr_pins	= pins,					\
+		.name		= label,				\
+		.iomux		= {					\
+			{ .type = iom0, .offset = offset0 },		\
+			{ .type = iom1, .offset = offset1 },		\
+			{ .type = iom2, .offset = offset2 },		\
+			{ .type = iom3, .offset = offset3 },		\
+		},							\
+		.pull_type[0] = pull0,					\
+		.pull_type[1] = pull1,					\
+		.pull_type[2] = pull2,					\
+		.pull_type[3] = pull3,					\
+	}
+
 #define PIN_BANK_DRV_FLAGS(id, pins, label, type0, type1, type2, type3) \
 	{								\
 		.bank_num	= id,					\
@@ -1120,6 +1141,11 @@ static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
 	if (bank->recalced_mask & BIT(pin))
 		rockchip_get_recalced_mux(bank, pin, &reg, &bit, &mask);
 
+	if (ctrl->type == RK3576) {
+		if ((bank->bank_num == 0) && (pin >= RK_PB4) && (pin <= RK_PB7))
+			reg += 0x1FF4; /* GPIO0_IOC_GPIO0B_IOMUX_SEL_H */
+	}
+
 	if (ctrl->type == RK3588) {
 		if (bank->bank_num == 0) {
 			if ((pin >= RK_PB4) && (pin <= RK_PD7)) {
@@ -1193,6 +1219,7 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 	struct device *dev = info->dev;
 	int iomux_num = (pin / 8);
 	struct regmap *regmap;
+	struct regmap *regmap_sys;
 	int reg, ret, mask, mux_type;
 	u8 bit;
 	u32 data, rmask, route_location, route_reg, route_val;
@@ -1213,6 +1240,8 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 	else
 		regmap = info->regmap_base;
 
+	regmap_sys = info->regmap_sys_grf;
+
 	/* get basic quadrupel of mux registers and the correct reg inside */
 	mux_type = bank->iomux[iomux_num].type;
 	reg = bank->iomux[iomux_num].offset;
@@ -1234,6 +1263,20 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 	if (bank->recalced_mask & BIT(pin))
 		rockchip_get_recalced_mux(bank, pin, &reg, &bit, &mask);
 
+	if (ctrl->type == RK3576) {
+		if ((bank->bank_num == 0) && (pin >= RK_PB4) && (pin <= RK_PB7))
+			reg += 0x1FF4; /* GPIO0_IOC_GPIO0B_IOMUX_SEL_H */
+		/* i3c0 weakpull controlled by software */
+		if (((bank->bank_num == 0) && (pin == RK_PC5) && (mux == 0xb)) ||
+		    ((bank->bank_num == 1) && (pin == RK_PD1) && (mux == 0xa)))
+			regmap_update_bits(regmap_sys, 0x4, 0xc000c0, 0xc000c0);
+		/* i3c1 weakpull controlled by software */
+		if (((bank->bank_num == 2) && (pin == RK_PA5) && (mux == 0xe)) ||
+		    ((bank->bank_num == 2) && (pin == RK_PD6) && (mux == 0xc)) ||
+		    ((bank->bank_num == 3) && (pin == RK_PD1) && (mux == 0xb)))
+			regmap_update_bits(regmap_sys, 0x4, 0x3000300, 0x3000300);
+	}
+
 	if (ctrl->type == RK3588) {
 		if (bank->bank_num == 0) {
 			if ((pin >= RK_PB4) && (pin <= RK_PD7)) {
@@ -2038,6 +2081,142 @@ static int rk3568_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 	return 0;
 }
 
+#define RK3576_DRV_BITS_PER_PIN		4
+#define RK3576_DRV_PINS_PER_REG		4
+#define RK3576_DRV_GPIO0_AL_OFFSET	0x10
+#define RK3576_DRV_GPIO0_BH_OFFSET	0x2014
+#define RK3576_DRV_GPIO1_OFFSET		0x6020
+#define RK3576_DRV_GPIO2_OFFSET		0x6040
+#define RK3576_DRV_GPIO3_OFFSET		0x6060
+#define RK3576_DRV_GPIO4_AL_OFFSET	0x6080
+#define RK3576_DRV_GPIO4_CL_OFFSET	0xA090
+#define RK3576_DRV_GPIO4_DL_OFFSET	0xB098
+
+static int rk3576_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
+					int pin_num, struct regmap **regmap,
+					int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+
+	if (bank->bank_num == 0 && pin_num < 12)
+		*reg = RK3576_DRV_GPIO0_AL_OFFSET;
+	else if (bank->bank_num == 0)
+		*reg = RK3576_DRV_GPIO0_BH_OFFSET - 0xc;
+	else if (bank->bank_num == 1)
+		*reg = RK3576_DRV_GPIO1_OFFSET;
+	else if (bank->bank_num == 2)
+		*reg = RK3576_DRV_GPIO2_OFFSET;
+	else if (bank->bank_num == 3)
+		*reg = RK3576_DRV_GPIO3_OFFSET;
+	else if (bank->bank_num == 4 && pin_num < 16)
+		*reg = RK3576_DRV_GPIO4_AL_OFFSET;
+	else if (bank->bank_num == 4 && pin_num < 24)
+		*reg = RK3576_DRV_GPIO4_CL_OFFSET - 0x10;
+	else if (bank->bank_num == 4)
+		*reg = RK3576_DRV_GPIO4_DL_OFFSET - 0x18;
+	else
+		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
+
+	*reg += ((pin_num / RK3576_DRV_PINS_PER_REG) * 4);
+	*bit = pin_num % RK3576_DRV_PINS_PER_REG;
+	*bit *= RK3576_DRV_BITS_PER_PIN;
+
+	return 0;
+}
+
+#define RK3576_PULL_BITS_PER_PIN	2
+#define RK3576_PULL_PINS_PER_REG	8
+#define RK3576_PULL_GPIO0_AL_OFFSET	0x20
+#define RK3576_PULL_GPIO0_BH_OFFSET	0x2028
+#define RK3576_PULL_GPIO1_OFFSET	0x6110
+#define RK3576_PULL_GPIO2_OFFSET	0x6120
+#define RK3576_PULL_GPIO3_OFFSET	0x6130
+#define RK3576_PULL_GPIO4_AL_OFFSET	0x6140
+#define RK3576_PULL_GPIO4_CL_OFFSET	0xA148
+#define RK3576_PULL_GPIO4_DL_OFFSET	0xB14C
+
+static int rk3576_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
+					 int pin_num, struct regmap **regmap,
+					 int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+
+	if (bank->bank_num == 0 && pin_num < 12)
+		*reg = RK3576_PULL_GPIO0_AL_OFFSET;
+	else if (bank->bank_num == 0)
+		*reg = RK3576_PULL_GPIO0_BH_OFFSET - 0x4;
+	else if (bank->bank_num == 1)
+		*reg = RK3576_PULL_GPIO1_OFFSET;
+	else if (bank->bank_num == 2)
+		*reg = RK3576_PULL_GPIO2_OFFSET;
+	else if (bank->bank_num == 3)
+		*reg = RK3576_PULL_GPIO3_OFFSET;
+	else if (bank->bank_num == 4 && pin_num < 16)
+		*reg = RK3576_PULL_GPIO4_AL_OFFSET;
+	else if (bank->bank_num == 4 && pin_num < 24)
+		*reg = RK3576_PULL_GPIO4_CL_OFFSET - 0x8;
+	else if (bank->bank_num == 4)
+		*reg = RK3576_PULL_GPIO4_DL_OFFSET - 0xc;
+	else
+		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
+
+	*reg += ((pin_num / RK3576_PULL_PINS_PER_REG) * 4);
+	*bit = pin_num % RK3576_PULL_PINS_PER_REG;
+	*bit *= RK3576_PULL_BITS_PER_PIN;
+
+	return 0;
+}
+
+#define RK3576_SMT_BITS_PER_PIN		1
+#define RK3576_SMT_PINS_PER_REG		8
+#define RK3576_SMT_GPIO0_AL_OFFSET	0x30
+#define RK3576_SMT_GPIO0_BH_OFFSET	0x2040
+#define RK3576_SMT_GPIO1_OFFSET		0x6210
+#define RK3576_SMT_GPIO2_OFFSET		0x6220
+#define RK3576_SMT_GPIO3_OFFSET		0x6230
+#define RK3576_SMT_GPIO4_AL_OFFSET	0x6240
+#define RK3576_SMT_GPIO4_CL_OFFSET	0xA248
+#define RK3576_SMT_GPIO4_DL_OFFSET	0xB24C
+
+static int rk3576_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
+					   int pin_num,
+					   struct regmap **regmap,
+					   int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+
+	if (bank->bank_num == 0 && pin_num < 12)
+		*reg = RK3576_SMT_GPIO0_AL_OFFSET;
+	else if (bank->bank_num == 0)
+		*reg = RK3576_SMT_GPIO0_BH_OFFSET - 0x4;
+	else if (bank->bank_num == 1)
+		*reg = RK3576_SMT_GPIO1_OFFSET;
+	else if (bank->bank_num == 2)
+		*reg = RK3576_SMT_GPIO2_OFFSET;
+	else if (bank->bank_num == 3)
+		*reg = RK3576_SMT_GPIO3_OFFSET;
+	else if (bank->bank_num == 4 && pin_num < 16)
+		*reg = RK3576_SMT_GPIO4_AL_OFFSET;
+	else if (bank->bank_num == 4 && pin_num < 24)
+		*reg = RK3576_SMT_GPIO4_CL_OFFSET - 0x8;
+	else if (bank->bank_num == 4)
+		*reg = RK3576_SMT_GPIO4_DL_OFFSET - 0xc;
+	else
+		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
+
+	*reg += ((pin_num / RK3576_SMT_PINS_PER_REG) * 4);
+	*bit = pin_num % RK3576_SMT_PINS_PER_REG;
+	*bit *= RK3576_SMT_BITS_PER_PIN;
+
+	return 0;
+}
+
 #define RK3588_PMU1_IOC_REG		(0x0000)
 #define RK3588_PMU2_IOC_REG		(0x4000)
 #define RK3588_BUS_IOC_REG		(0x8000)
@@ -2332,6 +2511,10 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 		rmask_bits = RK3568_DRV_BITS_PER_PIN;
 		ret = (1 << (strength + 1)) - 1;
 		goto config;
+	} else if (ctrl->type == RK3576) {
+		rmask_bits = RK3576_DRV_BITS_PER_PIN;
+		ret = ((strength & BIT(2)) >> 2) | ((strength & BIT(0)) << 2) | (strength & BIT(1));
+		goto config;
 	}
 
 	if (ctrl->type == RV1126) {
@@ -2469,6 +2652,7 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
 	case RK3368:
 	case RK3399:
 	case RK3568:
+	case RK3576:
 	case RK3588:
 		pull_type = bank->pull_type[pin_num / 8];
 		data >>= bit;
@@ -2528,6 +2712,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 	case RK3368:
 	case RK3399:
 	case RK3568:
+	case RK3576:
 	case RK3588:
 		pull_type = bank->pull_type[pin_num / 8];
 		ret = -EINVAL;
@@ -2793,6 +2978,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 	case RK3368:
 	case RK3399:
 	case RK3568:
+	case RK3576:
 	case RK3588:
 		return (pull != PIN_CONFIG_BIAS_PULL_PIN_DEFAULT);
 	}
@@ -3439,6 +3625,15 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 		}
 	}
 
+	/* try to find the optional reference to the sys_grf syscon */
+	node = of_parse_phandle(np, "rockchip,sys-grf", 0);
+	if (node) {
+		info->regmap_sys_grf = syscon_node_to_regmap(node);
+		of_node_put(node);
+		if (IS_ERR(info->regmap_sys_grf))
+			return PTR_ERR(info->regmap_sys_grf);
+	}
+
 	/* try to find the optional reference to the pmu syscon */
 	node = of_parse_phandle(np, "rockchip,pmu", 0);
 	if (node) {
@@ -3949,6 +4144,37 @@ static struct rockchip_pin_ctrl rk3568_pin_ctrl = {
 	.schmitt_calc_reg	= rk3568_calc_schmitt_reg_and_bit,
 };
 
+#define RK3576_PIN_BANK(ID, LABEL, OFFSET0, OFFSET1, OFFSET2, OFFSET3)	\
+	PIN_BANK_IOMUX_FLAGS_OFFSET_PULL_FLAGS(ID, 32, LABEL,		\
+					       IOMUX_WIDTH_4BIT,	\
+					       IOMUX_WIDTH_4BIT,	\
+					       IOMUX_WIDTH_4BIT,	\
+					       IOMUX_WIDTH_4BIT,	\
+					       OFFSET0, OFFSET1,	\
+					       OFFSET2, OFFSET3,	\
+					       PULL_TYPE_IO_1V8_ONLY,	\
+					       PULL_TYPE_IO_1V8_ONLY,	\
+					       PULL_TYPE_IO_1V8_ONLY,	\
+					       PULL_TYPE_IO_1V8_ONLY)
+
+static struct rockchip_pin_bank rk3576_pin_banks[] = {
+	RK3576_PIN_BANK(0, "gpio0", 0, 0x8, 0x2004, 0x200C),
+	RK3576_PIN_BANK(1, "gpio1", 0x4020, 0x4028, 0x4030, 0x4038),
+	RK3576_PIN_BANK(2, "gpio2", 0x4040, 0x4048, 0x4050, 0x4058),
+	RK3576_PIN_BANK(3, "gpio3", 0x4060, 0x4068, 0x4070, 0x4078),
+	RK3576_PIN_BANK(4, "gpio4", 0x4080, 0x4088, 0xA390, 0xB398),
+};
+
+static struct rockchip_pin_ctrl rk3576_pin_ctrl __maybe_unused = {
+	.pin_banks		= rk3576_pin_banks,
+	.nr_banks		= ARRAY_SIZE(rk3576_pin_banks),
+	.label			= "RK3576-GPIO",
+	.type			= RK3576,
+	.pull_calc_reg		= rk3576_calc_pull_reg_and_bit,
+	.drv_calc_reg		= rk3576_calc_drv_reg_and_bit,
+	.schmitt_calc_reg	= rk3576_calc_schmitt_reg_and_bit,
+};
+
 static struct rockchip_pin_bank rk3588_pin_banks[] = {
 	RK3588_PIN_BANK_FLAGS(0, 32, "gpio0",
 			      IOMUX_WIDTH_4BIT, PULL_TYPE_IO_1V8_ONLY),
@@ -4005,6 +4231,8 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 		.data = &rk3399_pin_ctrl },
 	{ .compatible = "rockchip,rk3568-pinctrl",
 		.data = &rk3568_pin_ctrl },
+	{ .compatible = "rockchip,rk3576-pinctrl",
+		.data = &rk3576_pin_ctrl },
 	{ .compatible = "rockchip,rk3588-pinctrl",
 		.data = &rk3588_pin_ctrl },
 	{},
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index 849266f8b1913..0b2b56014b173 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -197,6 +197,7 @@ enum rockchip_pinctrl_type {
 	RK3368,
 	RK3399,
 	RK3568,
+	RK3576,
 	RK3588,
 };
 
@@ -455,6 +456,7 @@ struct rockchip_pinctrl {
 	int				reg_size;
 	struct regmap			*regmap_pull;
 	struct regmap			*regmap_pmu;
+	struct regmap			*regmap_sys_grf;
 	struct device			*dev;
 	struct rockchip_pin_ctrl	*ctrl;
 	struct pinctrl_desc		pctl;
-- 
2.46.0


