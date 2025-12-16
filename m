Return-Path: <linux-gpio+bounces-29613-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71165CC2728
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 12:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8D42304746D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 11:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA1134167A;
	Tue, 16 Dec 2025 11:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="e7GYhTYL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m15567.qiye.163.com (mail-m15567.qiye.163.com [101.71.155.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC90341AD7;
	Tue, 16 Dec 2025 11:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765884986; cv=none; b=tvlImDXUWyzpEmaFTStqT2QknowDZdCKEQZzWLppSJxgCQ8HeB3nkHHECEm61RPdXiBBObgd80+6QZ+PxEAvmYjj7UlQr3TheAixW2b1n4JrusvzuOzOMbjwlgGusHPfxYbLKOzqix1iogr1mUlraSYzmLl/5pFLydaqDPcnYnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765884986; c=relaxed/simple;
	bh=uJLxsx+M+TYSuECEaUagyshhClRSnSXo34fV/cYEO9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u/cI2Z/Zc/v3nAv6A8ZZ4+4RgWWl0uP3cvvchV1fYGK8m1BUdaW7sDCgAVhIa/0i8voFH1wpmq5mYiCh69K2E1xdx8Hgqsd0wD0WJVuCCwWYR3Eo3kexfDbaPqu7dJ2/UIzVycLYRVszQg4HahzHzwJmbJvhnXMvm0Egnou7r/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=e7GYhTYL; arc=none smtp.client-ip=101.71.155.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2d6ee1f8c;
	Tue, 16 Dec 2025 19:20:55 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com
Subject: [PATCH v3 1/7] pinctrl: rockchip: Add rk3506 pinctrl support
Date: Tue, 16 Dec 2025 19:20:47 +0800
Message-Id: <20251216112053.1927852-2-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
References: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b26e44f7d09d8kunm7ab62e1d2a7b15f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR8eSFYYGEhMH05MTBhIQx9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=e7GYhTYLB+b7Wyb5RZ1i0TDvQ5elhRItqzkCK4ZOPfNZ2/xqHr0JHH95C/5mX0O23KAotvowTWywcXNXO6o2di8UXH1tPVPKor9nsem4UmspT2okMlLBZnVB5l+NmivmqLX8MWwz1rwmlkBBE3K9RloodQQ7AU26R4fkgJKaDzY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=cEUSMTJqXVhFXHDM3PhEXrbmuyFDisSFE/XmvNfacUQ=;
	h=date:mime-version:subject:message-id:from;

Add pinctrl support for the Rockchip RK3506 SoC, including:

1. Driver support for the 5 GPIO banks
2. Device tree binding compatible string

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/pinctrl/pinctrl-rockchip.c | 442 ++++++++++++++++++++++++++++-
 drivers/pinctrl/pinctrl-rockchip.h |   4 +
 2 files changed, 438 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 7a68a6237649..e44ef262beec 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -105,6 +105,29 @@
 		.pull_type[3] = pull3,					\
 	}
 
+#define PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS(id, pins, label, iom0,	\
+					       iom1, iom2, iom3,	\
+					       offset0, offset1,	\
+					       offset2, offset3, drv0,	\
+					       drv1, drv2, drv3)	\
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
+		.drv		= {					\
+			{ .drv_type = drv0, .offset = -1 },		\
+			{ .drv_type = drv1, .offset = -1 },		\
+			{ .drv_type = drv2, .offset = -1 },		\
+			{ .drv_type = drv3, .offset = -1 },		\
+		},							\
+	}
+
 #define PIN_BANK_DRV_FLAGS(id, pins, label, type0, type1, type2, type3) \
 	{								\
 		.bank_num	= id,					\
@@ -233,6 +256,35 @@
 		.pull_type[3] = pull3,					\
 	}
 
+#define PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS_PULL_FLAGS(id, pins,	\
+						label, iom0, iom1,	\
+						iom2, iom3, offset0,	\
+						offset1, offset2,	\
+						offset3, drv0, drv1,	\
+						drv2, drv3, pull0,	\
+						pull1, pull2, pull3)	\
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
+		.drv		= {					\
+			{ .drv_type = drv0, .offset = -1 },		\
+			{ .drv_type = drv1, .offset = -1 },		\
+			{ .drv_type = drv2, .offset = -1 },		\
+			{ .drv_type = drv3, .offset = -1 },		\
+		},							\
+		.pull_type[0] = pull0,					\
+		.pull_type[1] = pull1,					\
+		.pull_type[2] = pull2,					\
+		.pull_type[3] = pull3,					\
+	}
+
 #define PIN_BANK_MUX_ROUTE_FLAGS(ID, PIN, FUNC, REG, VAL, FLAG)		\
 	{								\
 		.bank_num	= ID,					\
@@ -1120,6 +1172,13 @@ static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
 	else
 		regmap = info->regmap_base;
 
+	if (ctrl->type == RK3506) {
+		if (bank->bank_num == 1)
+			regmap = info->regmap_ioc1;
+		else if (bank->bank_num == 4)
+			return 0;
+	}
+
 	/* get basic quadrupel of mux registers and the correct reg inside */
 	mux_type = bank->iomux[iomux_num].type;
 	reg = bank->iomux[iomux_num].offset;
@@ -1239,6 +1298,13 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 	else
 		regmap = info->regmap_base;
 
+	if (ctrl->type == RK3506) {
+		if (bank->bank_num == 1)
+			regmap = info->regmap_ioc1;
+		else if (bank->bank_num == 4)
+			return 0;
+	}
+
 	/* get basic quadrupel of mux registers and the correct reg inside */
 	mux_type = bank->iomux[iomux_num].type;
 	reg = bank->iomux[iomux_num].offset;
@@ -2003,6 +2069,262 @@ static int rk3399_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 	return 0;
 }
 
+#define RK3506_DRV_BITS_PER_PIN		8
+#define RK3506_DRV_PINS_PER_REG		2
+#define RK3506_DRV_GPIO0_A_OFFSET	0x100
+#define RK3506_DRV_GPIO0_D_OFFSET	0x830
+#define RK3506_DRV_GPIO1_OFFSET		0x140
+#define RK3506_DRV_GPIO2_OFFSET		0x180
+#define RK3506_DRV_GPIO3_OFFSET		0x1c0
+#define RK3506_DRV_GPIO4_OFFSET		0x840
+
+static int rk3506_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
+					int pin_num, struct regmap **regmap,
+					int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+	int ret = 0;
+
+	switch (bank->bank_num) {
+	case 0:
+		*regmap = info->regmap_pmu;
+		if (pin_num > 24) {
+			ret = -EINVAL;
+		} else if (pin_num < 24) {
+			*reg = RK3506_DRV_GPIO0_A_OFFSET;
+		} else {
+			*reg = RK3506_DRV_GPIO0_D_OFFSET;
+			*bit = 3;
+
+			return 0;
+		}
+		break;
+
+	case 1:
+		*regmap = info->regmap_ioc1;
+		if (pin_num < 28)
+			*reg = RK3506_DRV_GPIO1_OFFSET;
+		else
+			ret = -EINVAL;
+		break;
+
+	case 2:
+		*regmap = info->regmap_base;
+		if (pin_num < 17)
+			*reg = RK3506_DRV_GPIO2_OFFSET;
+		else
+			ret = -EINVAL;
+		break;
+
+	case 3:
+		*regmap = info->regmap_base;
+		if (pin_num < 15)
+			*reg = RK3506_DRV_GPIO3_OFFSET;
+		else
+			ret = -EINVAL;
+		break;
+
+	case 4:
+		*regmap = info->regmap_base;
+		if (pin_num < 8 || pin_num > 11) {
+			ret = -EINVAL;
+		} else {
+			*reg = RK3506_DRV_GPIO4_OFFSET;
+			*bit = 10;
+
+			return 0;
+		}
+		break;
+
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	if (ret) {
+		dev_err(info->dev, "unsupported bank_num %d pin_num %d\n", bank->bank_num, pin_num);
+
+		return ret;
+	}
+
+	*reg += ((pin_num / RK3506_DRV_PINS_PER_REG) * 4);
+	*bit = pin_num % RK3506_DRV_PINS_PER_REG;
+	*bit *= RK3506_DRV_BITS_PER_PIN;
+
+	return 0;
+}
+
+#define RK3506_PULL_BITS_PER_PIN	2
+#define RK3506_PULL_PINS_PER_REG	8
+#define RK3506_PULL_GPIO0_A_OFFSET	0x200
+#define RK3506_PULL_GPIO0_D_OFFSET	0x830
+#define RK3506_PULL_GPIO1_OFFSET	0x210
+#define RK3506_PULL_GPIO2_OFFSET	0x220
+#define RK3506_PULL_GPIO3_OFFSET	0x230
+#define RK3506_PULL_GPIO4_OFFSET	0x840
+
+static int rk3506_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
+					 int pin_num, struct regmap **regmap,
+					 int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+	int ret = 0;
+
+	switch (bank->bank_num) {
+	case 0:
+		*regmap = info->regmap_pmu;
+		if (pin_num > 24) {
+			ret = -EINVAL;
+		} else if (pin_num < 24) {
+			*reg = RK3506_PULL_GPIO0_A_OFFSET;
+		} else {
+			*reg = RK3506_PULL_GPIO0_D_OFFSET;
+			*bit = 5;
+
+			return 0;
+		}
+		break;
+
+	case 1:
+		*regmap = info->regmap_ioc1;
+		if (pin_num < 28)
+			*reg = RK3506_PULL_GPIO1_OFFSET;
+		else
+			ret = -EINVAL;
+		break;
+
+	case 2:
+		*regmap = info->regmap_base;
+		if (pin_num < 17)
+			*reg = RK3506_PULL_GPIO2_OFFSET;
+		else
+			ret = -EINVAL;
+		break;
+
+	case 3:
+		*regmap = info->regmap_base;
+		if (pin_num < 15)
+			*reg = RK3506_PULL_GPIO3_OFFSET;
+		else
+			ret = -EINVAL;
+		break;
+
+	case 4:
+		*regmap = info->regmap_base;
+		if (pin_num < 8 || pin_num > 11) {
+			ret = -EINVAL;
+		} else {
+			*reg = RK3506_PULL_GPIO4_OFFSET;
+			*bit = 13;
+
+			return 0;
+		}
+		break;
+
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	if (ret) {
+		dev_err(info->dev, "unsupported bank_num %d pin_num %d\n", bank->bank_num, pin_num);
+
+		return ret;
+	}
+
+	*reg += ((pin_num / RK3506_PULL_PINS_PER_REG) * 4);
+	*bit = pin_num % RK3506_PULL_PINS_PER_REG;
+	*bit *= RK3506_PULL_BITS_PER_PIN;
+
+	return 0;
+}
+
+#define RK3506_SMT_BITS_PER_PIN		1
+#define RK3506_SMT_PINS_PER_REG		8
+#define RK3506_SMT_GPIO0_A_OFFSET	0x400
+#define RK3506_SMT_GPIO0_D_OFFSET	0x830
+#define RK3506_SMT_GPIO1_OFFSET		0x410
+#define RK3506_SMT_GPIO2_OFFSET		0x420
+#define RK3506_SMT_GPIO3_OFFSET		0x430
+#define RK3506_SMT_GPIO4_OFFSET		0x840
+
+static int rk3506_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
+					   int pin_num,
+					   struct regmap **regmap,
+					   int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+	int ret = 0;
+
+	switch (bank->bank_num) {
+	case 0:
+		*regmap = info->regmap_pmu;
+		if (pin_num > 24) {
+			ret = -EINVAL;
+		} else if (pin_num < 24) {
+			*reg = RK3506_SMT_GPIO0_A_OFFSET;
+		} else {
+			*reg = RK3506_SMT_GPIO0_D_OFFSET;
+			*bit = 9;
+
+			return 0;
+		}
+		break;
+
+	case 1:
+		*regmap = info->regmap_ioc1;
+		if (pin_num < 28)
+			*reg = RK3506_SMT_GPIO1_OFFSET;
+		else
+			ret = -EINVAL;
+		break;
+
+	case 2:
+		*regmap = info->regmap_base;
+		if (pin_num < 17)
+			*reg = RK3506_SMT_GPIO2_OFFSET;
+		else
+			ret = -EINVAL;
+		break;
+
+	case 3:
+		*regmap = info->regmap_base;
+		if (pin_num < 15)
+			*reg = RK3506_SMT_GPIO3_OFFSET;
+		else
+			ret = -EINVAL;
+		break;
+
+	case 4:
+		*regmap = info->regmap_base;
+		if (pin_num < 8 || pin_num > 11) {
+			ret = -EINVAL;
+		} else {
+			*reg = RK3506_SMT_GPIO4_OFFSET;
+			*bit = 8;
+
+			return 0;
+		}
+		break;
+
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	if (ret) {
+		dev_err(info->dev, "unsupported bank_num %d pin_num %d\n", bank->bank_num, pin_num);
+
+		return ret;
+	}
+
+	*reg += ((pin_num / RK3506_SMT_PINS_PER_REG) * 4);
+	*bit = pin_num % RK3506_SMT_PINS_PER_REG;
+	*bit *= RK3506_SMT_BITS_PER_PIN;
+
+	return 0;
+}
+
 #define RK3528_DRV_BITS_PER_PIN		8
 #define RK3528_DRV_PINS_PER_REG		2
 #define RK3528_DRV_GPIO0_OFFSET		0x100
@@ -2749,7 +3071,8 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 		rmask_bits = RK3588_DRV_BITS_PER_PIN;
 		ret = strength;
 		goto config;
-	} else if (ctrl->type == RK3528 ||
+	} else if (ctrl->type == RK3506 ||
+		   ctrl->type == RK3528 ||
 		   ctrl->type == RK3562 ||
 		   ctrl->type == RK3568) {
 		rmask_bits = RK3568_DRV_BITS_PER_PIN;
@@ -2828,12 +3151,37 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 	case DRV_TYPE_IO_1V8_ONLY:
 		rmask_bits = RK3288_DRV_BITS_PER_PIN;
 		break;
+	case DRV_TYPE_IO_LEVEL_2_BIT:
+		ret = regmap_read(regmap, reg, &data);
+		if (ret)
+			return ret;
+		data >>= bit;
+
+		return data & 0x3;
+	case DRV_TYPE_IO_LEVEL_8_BIT:
+		ret = regmap_read(regmap, reg, &data);
+		if (ret)
+			return ret;
+		data >>= bit;
+		data &= (1 << 8) - 1;
+
+		ret = hweight8(data);
+		if (ret > 0)
+			return ret - 1;
+		else
+			return -EINVAL;
 	default:
 		dev_err(dev, "unsupported pinctrl drive type: %d\n", drv_type);
 		return -EINVAL;
 	}
 
 config:
+	if (ctrl->type == RK3506) {
+		if ((bank->bank_num == 0 && pin_num == 24) || bank->bank_num == 4) {
+			rmask_bits = 2;
+			ret = strength;
+		}
+	}
 	/* enable the write to the equivalent lower bits */
 	data = ((1 << rmask_bits) - 1) << (bit + 16);
 	rmask = data | (data >> 16);
@@ -2957,6 +3305,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 	case RK3328:
 	case RK3368:
 	case RK3399:
+	case RK3506:
 	case RK3528:
 	case RK3562:
 	case RK3568:
@@ -3077,6 +3426,10 @@ static int rockchip_get_schmitt(struct rockchip_pin_bank *bank, int pin_num)
 		break;
 	}
 
+	if (ctrl->type == RK3506)
+		if ((bank->bank_num == 0 && pin_num == 24) ||  bank->bank_num == 4)
+			return data & 0x3;
+
 	return data & 0x1;
 }
 
@@ -3112,6 +3465,14 @@ static int rockchip_set_schmitt(struct rockchip_pin_bank *bank,
 		break;
 	}
 
+	if (ctrl->type == RK3506) {
+		if ((bank->bank_num == 0 && pin_num == 24) || bank->bank_num == 4) {
+			data = 0x3 << (bit + 16);
+			rmask = data | (data >> 16);
+			data |= ((enable ? 0x3 : 0) << bit);
+		}
+	}
+
 	return regmap_update_bits(regmap, reg, rmask, data);
 }
 
@@ -3227,6 +3588,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 	case RK3328:
 	case RK3368:
 	case RK3399:
+	case RK3506:
 	case RK3528:
 	case RK3562:
 	case RK3568:
@@ -3880,13 +4242,10 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	/* try to find the optional reference to the pmu syscon */
-	node = of_parse_phandle(np, "rockchip,pmu", 0);
-	if (node) {
-		info->regmap_pmu = syscon_node_to_regmap(node);
-		of_node_put(node);
-		if (IS_ERR(info->regmap_pmu))
-			return PTR_ERR(info->regmap_pmu);
-	}
+	info->regmap_pmu = syscon_regmap_lookup_by_phandle_optional(np, "rockchip,pmu");
+
+	/* try to find the optional reference to the ioc1 syscon */
+	info->regmap_ioc1 = syscon_regmap_lookup_by_phandle_optional(np, "rockchip,ioc1");
 
 	ret = rockchip_pinctrl_register(pdev, info);
 	if (ret)
@@ -4350,6 +4709,71 @@ static struct rockchip_pin_ctrl rk3399_pin_ctrl = {
 		.drv_calc_reg		= rk3399_calc_drv_reg_and_bit,
 };
 
+static struct rockchip_pin_bank rk3506_pin_banks[] = {
+	PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS_PULL_FLAGS(0, 32, "gpio0",
+				    IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
+				    IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
+				    IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
+				    IOMUX_WIDTH_2BIT | IOMUX_SOURCE_PMU,
+				    0x0, 0x8, 0x10, 0x830,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_2_BIT,
+				    0, 0, 0, 1),
+	PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS(1, 32, "gpio1",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x20, 0x28, 0x30, 0x38,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT),
+	PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS(2, 32, "gpio2",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x40, 0x48, 0x50, 0x58,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT),
+	PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS(3, 32, "gpio3",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x60, 0x68, 0x70, 0x78,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT),
+	PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS_PULL_FLAGS(4, 32, "gpio4",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x80, 0x88, 0x90, 0x98,
+				    DRV_TYPE_IO_LEVEL_2_BIT,
+				    DRV_TYPE_IO_LEVEL_2_BIT,
+				    DRV_TYPE_IO_LEVEL_2_BIT,
+				    DRV_TYPE_IO_LEVEL_2_BIT,
+				    1, 1, 1, 1),
+};
+
+static struct rockchip_pin_ctrl rk3506_pin_ctrl __maybe_unused = {
+	.pin_banks		= rk3506_pin_banks,
+	.nr_banks		= ARRAY_SIZE(rk3506_pin_banks),
+	.label			= "RK3506-GPIO",
+	.type			= RK3506,
+	.pull_calc_reg		= rk3506_calc_pull_reg_and_bit,
+	.drv_calc_reg		= rk3506_calc_drv_reg_and_bit,
+	.schmitt_calc_reg	= rk3506_calc_schmitt_reg_and_bit,
+};
+
 static struct rockchip_pin_bank rk3528_pin_banks[] = {
 	PIN_BANK_IOMUX_FLAGS_OFFSET(0, 32, "gpio0",
 				    IOMUX_WIDTH_4BIT,
@@ -4560,6 +4984,8 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 		.data = &rk3368_pin_ctrl },
 	{ .compatible = "rockchip,rk3399-pinctrl",
 		.data = &rk3399_pin_ctrl },
+	{ .compatible = "rockchip,rk3506-pinctrl",
+		.data = &rk3506_pin_ctrl },
 	{ .compatible = "rockchip,rk3528-pinctrl",
 		.data = &rk3528_pin_ctrl },
 	{ .compatible = "rockchip,rk3562-pinctrl",
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index 35cd38079d1e..4f4aff42a80a 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -196,6 +196,7 @@ enum rockchip_pinctrl_type {
 	RK3328,
 	RK3368,
 	RK3399,
+	RK3506,
 	RK3528,
 	RK3562,
 	RK3568,
@@ -260,6 +261,8 @@ enum rockchip_pin_drv_type {
 	DRV_TYPE_IO_1V8_ONLY,
 	DRV_TYPE_IO_1V8_3V0_AUTO,
 	DRV_TYPE_IO_3V3_ONLY,
+	DRV_TYPE_IO_LEVEL_2_BIT,
+	DRV_TYPE_IO_LEVEL_8_BIT,
 	DRV_TYPE_MAX
 };
 
@@ -458,6 +461,7 @@ struct rockchip_pinctrl {
 	int				reg_size;
 	struct regmap			*regmap_pull;
 	struct regmap			*regmap_pmu;
+	struct regmap			*regmap_ioc1;
 	struct device			*dev;
 	struct rockchip_pin_ctrl	*ctrl;
 	struct pinctrl_desc		pctl;
-- 
2.34.1


