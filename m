Return-Path: <linux-gpio+bounces-29916-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C849CCDF927
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 12:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 625813009418
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 11:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D482E2737E3;
	Sat, 27 Dec 2025 11:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="RCJgeWAt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m49204.qiye.163.com (mail-m49204.qiye.163.com [45.254.49.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DFD28371;
	Sat, 27 Dec 2025 11:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766836214; cv=none; b=I4L21h8VP9AOMNYOREV7rnCMYXnNpC7EVJgKB3OLnCW64LgQ54xAHj2BNq+XvwXjAjaPqWj1gPvIsfuBU9ls28sDmUXRIMFiDtLwwhTayVEbKA/V/sKMwdaCIXbavcSoz4DE1U9BmVhkitJwXD95cjq0faIb6uDgoKcsAmlkCRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766836214; c=relaxed/simple;
	bh=Afl4+DpjlnJLjISs5DirEutfNhPrxCPl5dKQVqWTRD8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O7AEoBdhL8lJFwMk3sdZkvA2Pvx/aQ0fw91JtqbXCt4RvecGP6n9tm96EZTobq9Hmatux+r99JQ1IKWQArsUBUY8fG5P2XDY/VMcz6/59dbivT7Hdol6whuYxB4sbHIQGUXEFEIjguQPgVI8i/kDr4vepVjz2jaJR9igxjaZ0T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=RCJgeWAt; arc=none smtp.client-ip=45.254.49.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ebf64dfd;
	Sat, 27 Dec 2025 19:50:01 +0800 (GMT+08:00)
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
Subject: [PATCH v4 2/7] pinctrl: rockchip: Add rv1126b pinctrl support
Date: Sat, 27 Dec 2025 19:49:52 +0800
Message-Id: <20251227114957.3287944-3-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251227114957.3287944-1-ye.zhang@rock-chips.com>
References: <20251227114957.3287944-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b5fa4e98e09d8kunm85cc97d2e30931
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0JMTlZNTUoZSktNTEwaTkpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=RCJgeWAt7POpx8Weu55Yu2P1nMiwKTGMPATkZZ9D+2c9leuyNi5xZBw7faqr2385tC27jwBUBDfcriqRxI+ZVlJmTTprhdpmLFJuh6wdeXQwf7SNr1/5s+U8fItuhAmUPRwrU+CVL8D+YuJyKQnohTKZC8ECNl1lklh4C6CejZQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=53wx/l9Bicx82HEIi48rhqopVN+cJfr8QQsKHaeSvYs=;
	h=date:mime-version:subject:message-id:from;

Add gpio and pinctrl support for the 8 GPIO banks on RV1126B.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 181 ++++++++++++++++++++++++++++-
 drivers/pinctrl/pinctrl-rockchip.h |   1 +
 2 files changed, 181 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index e44ef262beec..dc7ef12dfcb0 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -307,6 +307,20 @@
 #define RK3588_PIN_BANK_FLAGS(ID, PIN, LABEL, M, P)			\
 	PIN_BANK_IOMUX_FLAGS_PULL_FLAGS(ID, PIN, LABEL, M, M, M, M, P, P, P, P)
 
+#define PIN_BANK_IOMUX_4_OFFSET_DRV_8(id, pins, label, offset0,		\
+				      offset1, offset2, offset3)	\
+	PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS(id, pins, label,		\
+					      IOMUX_WIDTH_4BIT,		\
+					      IOMUX_WIDTH_4BIT,		\
+					      IOMUX_WIDTH_4BIT,		\
+					      IOMUX_WIDTH_4BIT,		\
+					      offset0, offset1,		\
+					      offset2, offset3,		\
+					      DRV_TYPE_IO_LEVEL_8_BIT,	\
+					      DRV_TYPE_IO_LEVEL_8_BIT,	\
+					      DRV_TYPE_IO_LEVEL_8_BIT,	\
+					      DRV_TYPE_IO_LEVEL_8_BIT)
+
 static struct regmap_config rockchip_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -1701,6 +1715,136 @@ static int rv1126_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 	return 0;
 }
 
+#define RV1126B_DRV_BITS_PER_PIN		8
+#define RV1126B_DRV_PINS_PER_REG		2
+#define RV1126B_DRV_GPIO0_A_OFFSET		0x100
+#define RV1126B_DRV_GPIO0_C_OFFSET		0x8120
+#define RV1126B_DRV_GPIO_OFFSET(GPION)		(0x8100 + GPION * 0x8040)
+
+static int rv1126b_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
+				       int pin_num, struct regmap **regmap,
+				       int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	switch (bank->bank_num) {
+	case 0:
+		if (pin_num < 16)
+			*reg = RV1126B_DRV_GPIO0_A_OFFSET;
+		else
+			*reg = RV1126B_DRV_GPIO0_C_OFFSET - 0x20;
+		break;
+
+	case 1:
+	case 2:
+	case 3:
+	case 4:
+	case 5:
+	case 6:
+	case 7:
+		*reg = RV1126B_DRV_GPIO_OFFSET(bank->bank_num);
+		break;
+
+	default:
+		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
+		break;
+	}
+
+	*reg += ((pin_num / RV1126B_DRV_PINS_PER_REG) * 4);
+	*bit = pin_num % RV1126B_DRV_PINS_PER_REG;
+	*bit *= RV1126B_DRV_BITS_PER_PIN;
+
+	return 0;
+}
+
+#define RV1126B_PULL_BITS_PER_PIN		2
+#define RV1126B_PULL_PINS_PER_REG		8
+#define RV1126B_PULL_GPIO0_A_OFFSET		0x300
+#define RV1126B_PULL_GPIO0_C_OFFSET		0x8308
+#define RV1126B_PULL_GPIO_OFFSET(GPION)		(0x8300 + GPION * 0x8010)
+
+static int rv1126b_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
+					int pin_num, struct regmap **regmap,
+					int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	switch (bank->bank_num) {
+	case 0:
+		if (pin_num < 16)
+			*reg = RV1126B_PULL_GPIO0_A_OFFSET;
+		else
+			*reg = RV1126B_PULL_GPIO0_C_OFFSET - 0x8;
+		break;
+
+	case 1:
+	case 2:
+	case 3:
+	case 4:
+	case 5:
+	case 6:
+	case 7:
+		*reg = RV1126B_PULL_GPIO_OFFSET(bank->bank_num);
+		break;
+
+	default:
+		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
+		break;
+	}
+
+	*reg += ((pin_num / RV1126B_PULL_PINS_PER_REG) * 4);
+	*bit = pin_num % RV1126B_PULL_PINS_PER_REG;
+	*bit *= RV1126B_PULL_BITS_PER_PIN;
+
+	return 0;
+}
+
+#define RV1126B_SMT_BITS_PER_PIN		1
+#define RV1126B_SMT_PINS_PER_REG		8
+#define RV1126B_SMT_GPIO0_A_OFFSET		0x500
+#define RV1126B_SMT_GPIO0_C_OFFSET		0x8508
+#define RV1126B_SMT_GPIO_OFFSET(GPION)		(0x8500 + GPION * 0x8010)
+
+static int rv1126b_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
+					   int pin_num,
+					   struct regmap **regmap,
+					   int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	switch (bank->bank_num) {
+	case 0:
+		if (pin_num < 16)
+			*reg = RV1126B_SMT_GPIO0_A_OFFSET;
+		else
+			*reg = RV1126B_SMT_GPIO0_C_OFFSET - 0x8;
+		break;
+
+	case 1:
+	case 2:
+	case 3:
+	case 4:
+	case 5:
+	case 6:
+	case 7:
+		*reg = RV1126B_SMT_GPIO_OFFSET(bank->bank_num);
+		break;
+
+	default:
+		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
+		break;
+	}
+
+	*reg += ((pin_num / RV1126B_SMT_PINS_PER_REG) * 4);
+	*bit = pin_num % RV1126B_SMT_PINS_PER_REG;
+	*bit *= RV1126B_SMT_BITS_PER_PIN;
+
+	return 0;
+}
+
 #define RK3308_SCHMITT_PINS_PER_REG		8
 #define RK3308_SCHMITT_BANK_STRIDE		16
 #define RK3308_SCHMITT_GRF_OFFSET		0x1a0
@@ -3071,7 +3215,8 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 		rmask_bits = RK3588_DRV_BITS_PER_PIN;
 		ret = strength;
 		goto config;
-	} else if (ctrl->type == RK3506 ||
+	} else if (ctrl->type == RV1126B ||
+		   ctrl->type == RK3506 ||
 		   ctrl->type == RK3528 ||
 		   ctrl->type == RK3562 ||
 		   ctrl->type == RK3568) {
@@ -3237,6 +3382,7 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
 				: PIN_CONFIG_BIAS_DISABLE;
 	case PX30:
 	case RV1108:
+	case RV1126B:
 	case RK3188:
 	case RK3288:
 	case RK3308:
@@ -3299,6 +3445,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 	case PX30:
 	case RV1108:
 	case RV1126:
+	case RV1126B:
 	case RK3188:
 	case RK3288:
 	case RK3308:
@@ -3582,6 +3729,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 	case PX30:
 	case RV1108:
 	case RV1126:
+	case RV1126B:
 	case RK3188:
 	case RK3288:
 	case RK3308:
@@ -4386,6 +4534,35 @@ static struct rockchip_pin_ctrl rv1126_pin_ctrl = {
 	.schmitt_calc_reg	= rv1126_calc_schmitt_reg_and_bit,
 };
 
+static struct rockchip_pin_bank rv1126b_pin_banks[] = {
+	PIN_BANK_IOMUX_4_OFFSET_DRV_8(0, 32, "gpio0",
+				      0x0, 0x8, 0x8010, 0x8018),
+	PIN_BANK_IOMUX_4_OFFSET_DRV_8(1, 32, "gpio1",
+				      0x10020, 0x10028, 0x10030, 0x10038),
+	PIN_BANK_IOMUX_4_OFFSET_DRV_8(2, 32, "gpio2",
+				      0x18040, 0x18048, 0x18050, 0x18058),
+	PIN_BANK_IOMUX_4_OFFSET_DRV_8(3, 32, "gpio3",
+				      0x20060, 0x20068, 0x20070, 0x20078),
+	PIN_BANK_IOMUX_4_OFFSET_DRV_8(4, 32, "gpio4",
+				      0x28080, 0x28088, 0x28090, 0x28098),
+	PIN_BANK_IOMUX_4_OFFSET_DRV_8(5, 32, "gpio5",
+				      0x300a0, 0x300a8, 0x300b0, 0x300b8),
+	PIN_BANK_IOMUX_4_OFFSET_DRV_8(6, 32, "gpio6",
+				      0x380c0, 0x380c8, 0x380d0, 0x380d8),
+	PIN_BANK_IOMUX_4_OFFSET_DRV_8(7, 32, "gpio7",
+				      0x400e0, 0x400e8, 0x400f0, 0x400f8),
+};
+
+static struct rockchip_pin_ctrl rv1126b_pin_ctrl __maybe_unused = {
+	.pin_banks		= rv1126b_pin_banks,
+	.nr_banks		= ARRAY_SIZE(rv1126b_pin_banks),
+	.label			= "RV1126B-GPIO",
+	.type			= RV1126B,
+	.pull_calc_reg		= rv1126b_calc_pull_reg_and_bit,
+	.drv_calc_reg		= rv1126b_calc_drv_reg_and_bit,
+	.schmitt_calc_reg	= rv1126b_calc_schmitt_reg_and_bit,
+};
+
 static struct rockchip_pin_bank rk2928_pin_banks[] = {
 	PIN_BANK(0, 32, "gpio0"),
 	PIN_BANK(1, 32, "gpio1"),
@@ -4960,6 +5137,8 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 		.data = &rv1108_pin_ctrl },
 	{ .compatible = "rockchip,rv1126-pinctrl",
 		.data = &rv1126_pin_ctrl },
+	{ .compatible = "rockchip,rv1126b-pinctrl",
+		.data = &rv1126b_pin_ctrl },
 	{ .compatible = "rockchip,rk2928-pinctrl",
 		.data = &rk2928_pin_ctrl },
 	{ .compatible = "rockchip,rk3036-pinctrl",
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index 4f4aff42a80a..fe18b62ed994 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -187,6 +187,7 @@ enum rockchip_pinctrl_type {
 	PX30,
 	RV1108,
 	RV1126,
+	RV1126B,
 	RK2928,
 	RK3066B,
 	RK3128,
-- 
2.34.1


