Return-Path: <linux-gpio+bounces-16759-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83314A491AC
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 07:41:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB96F16FCC2
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 06:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB88D1C54B2;
	Fri, 28 Feb 2025 06:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="hBbyRbTL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4BE1C7001
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 06:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740724850; cv=none; b=aLzcnIysPQZpCMotZnNrbhxW/vHLFaMQBQfGAusGSYFZBKFO0juovlQGkEYXSQ1fOQSvrMjxVEWMi13iA56WGK25G2Xa6WpJXF4VU6EfN/sZQv0SxIM+LBvzCHvvYXVTdDH4hogRgLzZBxrbQCxMknf8RSto6b4PA6T/2x66aXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740724850; c=relaxed/simple;
	bh=0bpob+67UHq+p8q1kx5ACx/3cnV/NqNROB/a9o3x/9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9dj6JQG5eEelstA9C44iHPt8djEv+8gcN0flGCTU1ObmOFCBoDN31K4JUSboOUu+bY+hr1qkGQF3Yjfr+b2QSF/4Wse5W1QqSaU3tyoMYpMbTzV5VGXUPCd/b/qnPLFyKerqVXR9ficz+CgWYhj1e/EAeBUk9WZDBSAXpTnGlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=hBbyRbTL; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1740724848; bh=ReMG9IM/U1aD2slrBnAEbsViYSgz5/jCcUvBMlxCVew=;
 b=hBbyRbTLK+if3CIF4LAk/kPIJVqSo8JvKXfOHVbZPuUJg4J6uFJfG9f/jM93ubAZ0421JEDpS
 RaD41S3iEQMwDSdQ1IulNnpOT+mRzf7iAgvlaP01ftj9oEI3MLkUnf4T/0xCWGRlCZaJUcXfoMV
 QupE/q3G+7shIcprlDyymE6FPOkZ19C9ZeDtp9PWcl4M2I32LgVutT5Zo3IItZ1oPQY1IxWcGfT
 FvYQFkdARAi/+N025XsG+DAKr0jhj+SGFTH1876sxZ6d5g0LUGGh8hIzxawjFCCmFTYxCPS/KW3
 2EIhk2+pSPBSA/2lJLUL1fiODtk5M3FcqJfHTrXOuZCA==
X-Forward-Email-ID: 67c15a6bbcf1d1bd23db01d5
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Steven Liu <steven.liu@rock-chips.com>
Subject: [PATCH 3/7] pinctrl: rockchip: Add support for RK3528
Date: Fri, 28 Feb 2025 06:40:09 +0000
Message-ID: <20250228064024.3200000-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228064024.3200000-1-jonas@kwiboo.se>
References: <20250228064024.3200000-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Steven Liu <steven.liu@rock-chips.com>

Add gpio and pinctrl support for the 5 GPIO banks on RK3528.

Signed-off-by: Steven Liu <steven.liu@rock-chips.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/pinctrl/pinctrl-rockchip.c | 160 ++++++++++++++++++++++++++++-
 drivers/pinctrl/pinctrl-rockchip.h |   1 +
 2 files changed, 160 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 15145882950f..930c454e0cec 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -2003,6 +2003,115 @@ static int rk3399_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 	return 0;
 }
 
+#define RK3528_DRV_BITS_PER_PIN		8
+#define RK3528_DRV_PINS_PER_REG		2
+#define RK3528_DRV_GPIO0_OFFSET		0x100
+#define RK3528_DRV_GPIO1_OFFSET		0x20120
+#define RK3528_DRV_GPIO2_OFFSET		0x30160
+#define RK3528_DRV_GPIO3_OFFSET		0x20190
+#define RK3528_DRV_GPIO4_OFFSET		0x101C0
+
+static int rk3528_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
+				       int pin_num, struct regmap **regmap,
+				       int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+
+	if (bank->bank_num == 0)
+		*reg = RK3528_DRV_GPIO0_OFFSET;
+	else if (bank->bank_num == 1)
+		*reg = RK3528_DRV_GPIO1_OFFSET;
+	else if (bank->bank_num == 2)
+		*reg = RK3528_DRV_GPIO2_OFFSET;
+	else if (bank->bank_num == 3)
+		*reg = RK3528_DRV_GPIO3_OFFSET;
+	else if (bank->bank_num == 4)
+		*reg = RK3528_DRV_GPIO4_OFFSET;
+	else
+		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
+
+	*reg += ((pin_num / RK3528_DRV_PINS_PER_REG) * 4);
+	*bit = pin_num % RK3528_DRV_PINS_PER_REG;
+	*bit *= RK3528_DRV_BITS_PER_PIN;
+
+	return 0;
+}
+
+#define RK3528_PULL_BITS_PER_PIN		2
+#define RK3528_PULL_PINS_PER_REG		8
+#define RK3528_PULL_GPIO0_OFFSET		0x200
+#define RK3528_PULL_GPIO1_OFFSET		0x20210
+#define RK3528_PULL_GPIO2_OFFSET		0x30220
+#define RK3528_PULL_GPIO3_OFFSET		0x20230
+#define RK3528_PULL_GPIO4_OFFSET		0x10240
+
+static int rk3528_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
+					int pin_num, struct regmap **regmap,
+					int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+
+	if (bank->bank_num == 0)
+		*reg = RK3528_PULL_GPIO0_OFFSET;
+	else if (bank->bank_num == 1)
+		*reg = RK3528_PULL_GPIO1_OFFSET;
+	else if (bank->bank_num == 2)
+		*reg = RK3528_PULL_GPIO2_OFFSET;
+	else if (bank->bank_num == 3)
+		*reg = RK3528_PULL_GPIO3_OFFSET;
+	else if (bank->bank_num == 4)
+		*reg = RK3528_PULL_GPIO4_OFFSET;
+	else
+		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
+
+	*reg += ((pin_num / RK3528_PULL_PINS_PER_REG) * 4);
+	*bit = pin_num % RK3528_PULL_PINS_PER_REG;
+	*bit *= RK3528_PULL_BITS_PER_PIN;
+
+	return 0;
+}
+
+#define RK3528_SMT_BITS_PER_PIN		1
+#define RK3528_SMT_PINS_PER_REG		8
+#define RK3528_SMT_GPIO0_OFFSET		0x400
+#define RK3528_SMT_GPIO1_OFFSET		0x20410
+#define RK3528_SMT_GPIO2_OFFSET		0x30420
+#define RK3528_SMT_GPIO3_OFFSET		0x20430
+#define RK3528_SMT_GPIO4_OFFSET		0x10440
+
+static int rk3528_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
+					   int pin_num,
+					   struct regmap **regmap,
+					   int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+
+	if (bank->bank_num == 0)
+		*reg = RK3528_SMT_GPIO0_OFFSET;
+	else if (bank->bank_num == 1)
+		*reg = RK3528_SMT_GPIO1_OFFSET;
+	else if (bank->bank_num == 2)
+		*reg = RK3528_SMT_GPIO2_OFFSET;
+	else if (bank->bank_num == 3)
+		*reg = RK3528_SMT_GPIO3_OFFSET;
+	else if (bank->bank_num == 4)
+		*reg = RK3528_SMT_GPIO4_OFFSET;
+	else
+		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
+
+	*reg += ((pin_num / RK3528_SMT_PINS_PER_REG) * 4);
+	*bit = pin_num % RK3528_SMT_PINS_PER_REG;
+	*bit *= RK3528_SMT_BITS_PER_PIN;
+
+	return 0;
+}
+
 #define RK3562_DRV_BITS_PER_PIN		8
 #define RK3562_DRV_PINS_PER_REG		2
 #define RK3562_DRV_GPIO0_OFFSET		0x20070
@@ -2640,7 +2749,8 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 		rmask_bits = RK3588_DRV_BITS_PER_PIN;
 		ret = strength;
 		goto config;
-	} else if (ctrl->type == RK3562 ||
+	} else if (ctrl->type == RK3528 ||
+		   ctrl->type == RK3562 ||
 		   ctrl->type == RK3568) {
 		rmask_bits = RK3568_DRV_BITS_PER_PIN;
 		ret = (1 << (strength + 1)) - 1;
@@ -2785,6 +2895,7 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
 	case RK3328:
 	case RK3368:
 	case RK3399:
+	case RK3528:
 	case RK3562:
 	case RK3568:
 	case RK3576:
@@ -2846,6 +2957,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 	case RK3328:
 	case RK3368:
 	case RK3399:
+	case RK3528:
 	case RK3562:
 	case RK3568:
 	case RK3576:
@@ -3115,6 +3227,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 	case RK3328:
 	case RK3368:
 	case RK3399:
+	case RK3528:
 	case RK3562:
 	case RK3568:
 	case RK3576:
@@ -4237,6 +4350,49 @@ static struct rockchip_pin_ctrl rk3399_pin_ctrl = {
 		.drv_calc_reg		= rk3399_calc_drv_reg_and_bit,
 };
 
+static struct rockchip_pin_bank rk3528_pin_banks[] = {
+	PIN_BANK_IOMUX_FLAGS_OFFSET(0, 32, "gpio0",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0, 0, 0, 0),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(1, 32, "gpio1",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x20020, 0x20028, 0x20030, 0x20038),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(2, 32, "gpio2",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x30040, 0, 0, 0),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(3, 32, "gpio3",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x20060, 0x20068, 0x20070, 0),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(4, 32, "gpio4",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x10080, 0x10088, 0x10090, 0x10098),
+};
+
+static struct rockchip_pin_ctrl rk3528_pin_ctrl = {
+	.pin_banks		= rk3528_pin_banks,
+	.nr_banks		= ARRAY_SIZE(rk3528_pin_banks),
+	.label			= "RK3528-GPIO",
+	.type			= RK3528,
+	.pull_calc_reg		= rk3528_calc_pull_reg_and_bit,
+	.drv_calc_reg		= rk3528_calc_drv_reg_and_bit,
+	.schmitt_calc_reg	= rk3528_calc_schmitt_reg_and_bit,
+};
+
 static struct rockchip_pin_bank rk3562_pin_banks[] = {
 	PIN_BANK_IOMUX_FLAGS_OFFSET(0, 32, "gpio0",
 				    IOMUX_WIDTH_4BIT,
@@ -4404,6 +4560,8 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 		.data = &rk3368_pin_ctrl },
 	{ .compatible = "rockchip,rk3399-pinctrl",
 		.data = &rk3399_pin_ctrl },
+	{ .compatible = "rockchip,rk3528-pinctrl",
+		.data = &rk3528_pin_ctrl },
 	{ .compatible = "rockchip,rk3562-pinctrl",
 		.data = &rk3562_pin_ctrl },
 	{ .compatible = "rockchip,rk3568-pinctrl",
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index 87a20cec8e21..35cd38079d1e 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -196,6 +196,7 @@ enum rockchip_pinctrl_type {
 	RK3328,
 	RK3368,
 	RK3399,
+	RK3528,
 	RK3562,
 	RK3568,
 	RK3576,
-- 
2.48.1


