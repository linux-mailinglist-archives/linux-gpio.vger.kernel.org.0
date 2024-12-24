Return-Path: <linux-gpio+bounces-14203-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0239FBDBE
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 14:05:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B849E164C10
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 13:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7BC1B3936;
	Tue, 24 Dec 2024 13:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="hmzS8D4R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m155106.qiye.163.com (mail-m155106.qiye.163.com [101.71.155.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75051DDD1
	for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2024 13:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735045543; cv=none; b=ogoo5cNXMKVTELLbSV/eVg9GWli9G5PAJzShPodMC2Ef5zBILYNETl276jtLVChUPSrbMuFyurz9Cc/UEp3kCibGR0SNuo9GL5YCCoiopGhU7f7s8fme3qbe3uwBkVyfEBMxJjz0L4Icu2WVOh+Khu3ivWNgWJUESpwGKaK/mJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735045543; c=relaxed/simple;
	bh=Zr+M+YFF/t6JNccvZJB6h1naKNJY/hoBAidFqIfCrDo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iWeVcogiPoaVKIjA02KSrEUPZt1dYRYRCqYEvWIT7p3jLlMmdAla4oqJJ0zdYMs3IRR3wXCHwtzjLzAFOg9V9WTf7SuFRfktrJR4pWlg0SgCOnuV4i48gwCLNrf9jL0q37mI0HB9H1uyHq1CeVa17ireGDwHoksVPAL3hzbDHkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=hmzS8D4R; arc=none smtp.client-ip=101.71.155.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6aa78f78;
	Tue, 24 Dec 2024 17:36:20 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>
Subject: [PATCH v2 2/2] pinctrl: rockchip: add rk3562 support
Date: Tue, 24 Dec 2024 17:36:20 +0800
Message-Id: <20241224093620.3815705-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkMeSVZCSx8aTE1PTEseGR9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a93f806460303afkunm6aa78f78
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nz46Axw*CjIQHEoVFxUSHj0h
	PQIaCRxVSlVKTEhOS0hJQkNJSUNPVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFDQ0lNNwY+
DKIM-Signature:a=rsa-sha256;
	b=hmzS8D4R0XYs/GitxAp6G2XJG97JR0805L/+AUukE8jt+rscSabtO/kVx+ZBxVsUtRs0vXR4jpwiTiC6zZqVaC9rQXHlxLRzQF5FW/fssDKKWQLx8eRFEw4iRvJAOCEpjDsUjXP9Je95XfunBktoCjJHQw3HSg7J9I+xqHyg7Bg=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=sPdm4i2gmspq8ydS+ozzIZpPwIyse6GSBJIfGwfydBA=;
	h=date:mime-version:subject:message-id:from;

From: Steven Liu <steven.liu@rock-chips.com>

Add support for the 5 GPIO banks in the rk3562.

Signed-off-by: Steven Liu <steven.liu@rock-chips.com>
Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---

Changes in v2:
- collect review tag

 drivers/pinctrl/pinctrl-rockchip.c | 200 ++++++++++++++++++++++++++++-
 drivers/pinctrl/pinctrl-rockchip.h |   3 +-
 2 files changed, 200 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 36d4eaf0ebd1..15145882950f 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Pinctrl driver for Rockchip SoCs
- *
+ * Copyright (c) 2020-2024 Rockchip Electronics Co., Ltd.
  * Copyright (c) 2013 MundoReader S.L.
  * Author: Heiko Stuebner <heiko@sntech.de>
  *
@@ -2003,6 +2003,151 @@ static int rk3399_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 	return 0;
 }
 
+#define RK3562_DRV_BITS_PER_PIN		8
+#define RK3562_DRV_PINS_PER_REG		2
+#define RK3562_DRV_GPIO0_OFFSET		0x20070
+#define RK3562_DRV_GPIO1_OFFSET		0x200
+#define RK3562_DRV_GPIO2_OFFSET		0x240
+#define RK3562_DRV_GPIO3_OFFSET		0x10280
+#define RK3562_DRV_GPIO4_OFFSET		0x102C0
+
+static int rk3562_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
+				       int pin_num, struct regmap **regmap,
+				       int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	switch (bank->bank_num) {
+	case 0:
+		*reg = RK3562_DRV_GPIO0_OFFSET;
+		break;
+
+	case 1:
+		*reg = RK3562_DRV_GPIO1_OFFSET;
+		break;
+
+	case 2:
+		*reg = RK3562_DRV_GPIO2_OFFSET;
+		break;
+
+	case 3:
+		*reg = RK3562_DRV_GPIO3_OFFSET;
+		break;
+
+	case 4:
+		*reg = RK3562_DRV_GPIO4_OFFSET;
+		break;
+
+	default:
+		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
+		break;
+	}
+
+	*reg += ((pin_num / RK3562_DRV_PINS_PER_REG) * 4);
+	*bit = pin_num % RK3562_DRV_PINS_PER_REG;
+	*bit *= RK3562_DRV_BITS_PER_PIN;
+
+	return 0;
+}
+
+#define RK3562_PULL_BITS_PER_PIN		2
+#define RK3562_PULL_PINS_PER_REG		8
+#define RK3562_PULL_GPIO0_OFFSET		0x20020
+#define RK3562_PULL_GPIO1_OFFSET		0x80
+#define RK3562_PULL_GPIO2_OFFSET		0x90
+#define RK3562_PULL_GPIO3_OFFSET		0x100A0
+#define RK3562_PULL_GPIO4_OFFSET		0x100B0
+
+static int rk3562_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
+					int pin_num, struct regmap **regmap,
+					int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	switch (bank->bank_num) {
+	case 0:
+		*reg = RK3562_PULL_GPIO0_OFFSET;
+		break;
+
+	case 1:
+		*reg = RK3562_PULL_GPIO1_OFFSET;
+		break;
+
+	case 2:
+		*reg = RK3562_PULL_GPIO2_OFFSET;
+		break;
+
+	case 3:
+		*reg = RK3562_PULL_GPIO3_OFFSET;
+		break;
+
+	case 4:
+		*reg = RK3562_PULL_GPIO4_OFFSET;
+		break;
+
+	default:
+		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
+		break;
+	}
+
+	*reg += ((pin_num / RK3562_PULL_PINS_PER_REG) * 4);
+	*bit = pin_num % RK3562_PULL_PINS_PER_REG;
+	*bit *= RK3562_PULL_BITS_PER_PIN;
+
+	return 0;
+}
+
+#define RK3562_SMT_BITS_PER_PIN		2
+#define RK3562_SMT_PINS_PER_REG		8
+#define RK3562_SMT_GPIO0_OFFSET		0x20030
+#define RK3562_SMT_GPIO1_OFFSET		0xC0
+#define RK3562_SMT_GPIO2_OFFSET		0xD0
+#define RK3562_SMT_GPIO3_OFFSET		0x100E0
+#define RK3562_SMT_GPIO4_OFFSET		0x100F0
+
+static int rk3562_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
+					   int pin_num,
+					   struct regmap **regmap,
+					   int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	switch (bank->bank_num) {
+	case 0:
+		*reg = RK3562_SMT_GPIO0_OFFSET;
+		break;
+
+	case 1:
+		*reg = RK3562_SMT_GPIO1_OFFSET;
+		break;
+
+	case 2:
+		*reg = RK3562_SMT_GPIO2_OFFSET;
+		break;
+
+	case 3:
+		*reg = RK3562_SMT_GPIO3_OFFSET;
+		break;
+
+	case 4:
+		*reg = RK3562_SMT_GPIO4_OFFSET;
+		break;
+
+	default:
+		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
+		break;
+	}
+
+	*reg += ((pin_num / RK3562_SMT_PINS_PER_REG) * 4);
+	*bit = pin_num % RK3562_SMT_PINS_PER_REG;
+	*bit *= RK3562_SMT_BITS_PER_PIN;
+
+	return 0;
+}
+
 #define RK3568_PULL_PMU_OFFSET		0x20
 #define RK3568_PULL_GRF_OFFSET		0x80
 #define RK3568_PULL_BITS_PER_PIN	2
@@ -2495,7 +2640,8 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 		rmask_bits = RK3588_DRV_BITS_PER_PIN;
 		ret = strength;
 		goto config;
-	} else if (ctrl->type == RK3568) {
+	} else if (ctrl->type == RK3562 ||
+		   ctrl->type == RK3568) {
 		rmask_bits = RK3568_DRV_BITS_PER_PIN;
 		ret = (1 << (strength + 1)) - 1;
 		goto config;
@@ -2639,6 +2785,7 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
 	case RK3328:
 	case RK3368:
 	case RK3399:
+	case RK3562:
 	case RK3568:
 	case RK3576:
 	case RK3588:
@@ -2699,6 +2846,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 	case RK3328:
 	case RK3368:
 	case RK3399:
+	case RK3562:
 	case RK3568:
 	case RK3576:
 	case RK3588:
@@ -2810,6 +2958,7 @@ static int rockchip_get_schmitt(struct rockchip_pin_bank *bank, int pin_num)
 
 	data >>= bit;
 	switch (ctrl->type) {
+	case RK3562:
 	case RK3568:
 		return data & ((1 << RK3568_SCHMITT_BITS_PER_PIN) - 1);
 	default:
@@ -2839,6 +2988,7 @@ static int rockchip_set_schmitt(struct rockchip_pin_bank *bank,
 
 	/* enable the write to the equivalent lower bits */
 	switch (ctrl->type) {
+	case RK3562:
 	case RK3568:
 		data = ((1 << RK3568_SCHMITT_BITS_PER_PIN) - 1) << (bit + 16);
 		rmask = data | (data >> 16);
@@ -2965,6 +3115,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 	case RK3328:
 	case RK3368:
 	case RK3399:
+	case RK3562:
 	case RK3568:
 	case RK3576:
 	case RK3588:
@@ -4086,6 +4237,49 @@ static struct rockchip_pin_ctrl rk3399_pin_ctrl = {
 		.drv_calc_reg		= rk3399_calc_drv_reg_and_bit,
 };
 
+static struct rockchip_pin_bank rk3562_pin_banks[] = {
+	PIN_BANK_IOMUX_FLAGS_OFFSET(0, 32, "gpio0",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x20000, 0x20008, 0x20010, 0x20018),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(1, 32, "gpio1",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0, 0x08, 0x10, 0x18),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(2, 32, "gpio2",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x20, 0, 0, 0),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(3, 32, "gpio3",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x10040, 0x10048, 0x10050, 0x10058),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(4, 16, "gpio4",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0,
+				    0,
+				    0x10060, 0x10068, 0, 0),
+};
+
+static struct rockchip_pin_ctrl rk3562_pin_ctrl __maybe_unused = {
+	.pin_banks		= rk3562_pin_banks,
+	.nr_banks		= ARRAY_SIZE(rk3562_pin_banks),
+	.label			= "RK3562-GPIO",
+	.type			= RK3562,
+	.pull_calc_reg		= rk3562_calc_pull_reg_and_bit,
+	.drv_calc_reg		= rk3562_calc_drv_reg_and_bit,
+	.schmitt_calc_reg	= rk3562_calc_schmitt_reg_and_bit,
+};
+
 static struct rockchip_pin_bank rk3568_pin_banks[] = {
 	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", IOMUX_SOURCE_PMU | IOMUX_WIDTH_4BIT,
 					     IOMUX_SOURCE_PMU | IOMUX_WIDTH_4BIT,
@@ -4210,6 +4404,8 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 		.data = &rk3368_pin_ctrl },
 	{ .compatible = "rockchip,rk3399-pinctrl",
 		.data = &rk3399_pin_ctrl },
+	{ .compatible = "rockchip,rk3562-pinctrl",
+		.data = &rk3562_pin_ctrl },
 	{ .compatible = "rockchip,rk3568-pinctrl",
 		.data = &rk3568_pin_ctrl },
 	{ .compatible = "rockchip,rk3576-pinctrl",
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index 6ebbb0a88ce7..87a20cec8e21 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2020-2021 Rockchip Electronics Co. Ltd.
+ * Copyright (c) 2020-2024 Rockchip Electronics Co., Ltd.
  *
  * Copyright (c) 2013 MundoReader S.L.
  * Author: Heiko Stuebner <heiko@sntech.de>
@@ -196,6 +196,7 @@ enum rockchip_pinctrl_type {
 	RK3328,
 	RK3368,
 	RK3399,
+	RK3562,
 	RK3568,
 	RK3576,
 	RK3588,
-- 
2.25.1


