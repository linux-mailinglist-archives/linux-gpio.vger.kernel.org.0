Return-Path: <linux-gpio+bounces-9006-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE2E95BF40
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 21:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFE87281F74
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 19:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0271D0DED;
	Thu, 22 Aug 2024 19:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="kYyRCuzP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414CB1D0DD4;
	Thu, 22 Aug 2024 19:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724356670; cv=pass; b=FLAAlxsPFtN1rUqGSsNDNdn/RDWee05+KX0v+tdy30ltByBZBFc4/eF0UIDEGVAQ18JIGlhIdll2mwrB4yQbM3mlqAfmm21UvgX1La+vP98lhoWzw3LIHXY6zWUNoilFTxstkOnx48fcVVR2THRih19Rzw/GB+h+wvZpzA3dLbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724356670; c=relaxed/simple;
	bh=6wbINRFfJ8KEBYLiNj1sXj//kIp5IMy3cY6yFY1J8Gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D4CvI/ZIo9pS1m9l3+6bpia3q1NyRveVFf1GMv/VgvxNGphgCR1ewBPOAnXNdJ1c+ZjGVJ9aTC5Avd991RMDoSvtDd5RFCRGfAVAGG8ujL9B5nKgZDtUaFolZdocyHfgeTLXQSa+rc/k6Z4cm/WVLqqpF4XdEAB0x6OV0gfVp3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=kYyRCuzP; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: sebastian.reichel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724356648; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=d8vVOmD6ZaM86Ycas0w0pewSCPBOCrqXJ5ZQV01el2CvMJbafxP732pzVBtpGRTfdTa4KS2Yreex/H2HO7Ee3ODKj6vk8BfPbDxqS2ATHtzDp/QszMVkO1xFl3YhRHolSRaUQbSNt1BgVDB8Hab3yagk7BcpDpshDK7+D78lCjg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724356648; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rA0n8ctmZw8+6tnYG8ZA868nqC3mPN3m1J5XHjs9lP4=; 
	b=dJ7uymxB/vOh2i8aUfER864DECnrxrZ/Rq0bNyFLOOnDQ64BlhLOUfdHg6z4+YVXtRDSDHwNUTla7Fb//o5QZu6kBVRRf6ERRxT+pPsNHhOQHY5jaKdwv8S4BvwjI2ej04EYt0kQUkB3sghEO6rt1XVX33HWZelQGCK/nXC/bG4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724356648;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=rA0n8ctmZw8+6tnYG8ZA868nqC3mPN3m1J5XHjs9lP4=;
	b=kYyRCuzP77hPlz1x9xGNMtiS83CnMZsfljbRBa7ukhftodXoks+B3wO75D1KmMi1
	xMlXc9soKT6JN9FGV08GkdO5Qw/SnA4g5OP8uwOxiEI9n/nLIBn7laS96hJq7vyk+1U
	xpnPU5EFj3YD5cArgtTXrSGSqV0eBaBgHi52yPcI=
Received: by mx.zohomail.com with SMTPS id 1724356646585207.36059246604952;
	Thu, 22 Aug 2024 12:57:26 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Steven Liu <steven.liu@rock-chips.com>
Subject: [PATCH v4 4/4] pinctrl: rockchip: Add rk3576 pinctrl support
Date: Thu, 22 Aug 2024 15:53:39 -0400
Message-ID: <20240822195706.920567-5-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240822195706.920567-1-detlev.casanova@collabora.com>
References: <20240822195706.920567-1-detlev.casanova@collabora.com>
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

Signed-off-by: Steven Liu <steven.liu@rock-chips.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 207 +++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.h |   1 +
 2 files changed, 208 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 0eacaf10c640..914b27b5838d 100644
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
+			reg += 0x1ff4; /* GPIO0_IOC_GPIO0B_IOMUX_SEL_H */
+	}
+
 	if (ctrl->type == RK3588) {
 		if (bank->bank_num == 0) {
 			if ((pin >= RK_PB4) && (pin <= RK_PD7)) {
@@ -1234,6 +1260,11 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 	if (bank->recalced_mask & BIT(pin))
 		rockchip_get_recalced_mux(bank, pin, &reg, &bit, &mask);
 
+	if (ctrl->type == RK3576) {
+		if ((bank->bank_num == 0) && (pin >= RK_PB4) && (pin <= RK_PB7))
+			reg += 0x1ff4; /* GPIO0_IOC_GPIO0B_IOMUX_SEL_H */
+	}
+
 	if (ctrl->type == RK3588) {
 		if (bank->bank_num == 0) {
 			if ((pin >= RK_PB4) && (pin <= RK_PD7)) {
@@ -2038,6 +2069,142 @@ static int rk3568_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
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
@@ -2332,6 +2499,10 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 		rmask_bits = RK3568_DRV_BITS_PER_PIN;
 		ret = (1 << (strength + 1)) - 1;
 		goto config;
+	} else if (ctrl->type == RK3576) {
+		rmask_bits = RK3576_DRV_BITS_PER_PIN;
+		ret = ((strength & BIT(2)) >> 2) | ((strength & BIT(0)) << 2) | (strength & BIT(1));
+		goto config;
 	}
 
 	if (ctrl->type == RV1126) {
@@ -2469,6 +2640,7 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
 	case RK3368:
 	case RK3399:
 	case RK3568:
+	case RK3576:
 	case RK3588:
 		pull_type = bank->pull_type[pin_num / 8];
 		data >>= bit;
@@ -2528,6 +2700,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 	case RK3368:
 	case RK3399:
 	case RK3568:
+	case RK3576:
 	case RK3588:
 		pull_type = bank->pull_type[pin_num / 8];
 		ret = -EINVAL;
@@ -2793,6 +2966,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 	case RK3368:
 	case RK3399:
 	case RK3568:
+	case RK3576:
 	case RK3588:
 		return (pull != PIN_CONFIG_BIAS_PULL_PIN_DEFAULT);
 	}
@@ -3949,6 +4123,37 @@ static struct rockchip_pin_ctrl rk3568_pin_ctrl = {
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
@@ -4005,6 +4210,8 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 		.data = &rk3399_pin_ctrl },
 	{ .compatible = "rockchip,rk3568-pinctrl",
 		.data = &rk3568_pin_ctrl },
+	{ .compatible = "rockchip,rk3576-pinctrl",
+		.data = &rk3576_pin_ctrl },
 	{ .compatible = "rockchip,rk3588-pinctrl",
 		.data = &rk3588_pin_ctrl },
 	{},
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index 849266f8b191..6ebbb0a88ce7 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -197,6 +197,7 @@ enum rockchip_pinctrl_type {
 	RK3368,
 	RK3399,
 	RK3568,
+	RK3576,
 	RK3588,
 };
 
-- 
2.46.0


