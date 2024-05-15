Return-Path: <linux-gpio+bounces-6399-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3078C6645
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 14:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 192D81C210A9
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 12:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B8A7F48C;
	Wed, 15 May 2024 12:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LymaZ6GT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245C477F12;
	Wed, 15 May 2024 12:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715775474; cv=none; b=TmekGHpcr1wDaplzhUrbTrifYtVjubK7JB2Nr6WAjYQ2wrkkaTCXFbpNfc9CgXiEghrM99y0X/4sVm3yFSqDNxKeiIPcvGVf0PAzxBy/K8V0oV0QY8TqinEvezU8V9HdIzUuoKeBNT3X7wra18jw/T5skvjiyg1PcXUKzfjnAZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715775474; c=relaxed/simple;
	bh=Zo7xb1sJzDhoCt8TTVH1Ff6XUyWXmqiqEO9mwffj5n4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DlCYyzPFInJAwoT1BUkqw22oCtbpl2raqyLhueKKtoNqy373II3Sxst0kgssI4SmggT6vAc5iztCKbEKRI9WBFQL8BGT5FVbH+AN+c2iAqYZhyDDJ+uD8qG/iEAuOmPDzQPe8p2R/FbcVgs8FLUgrI6ZSmG+XGlLMbisfVc7guE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LymaZ6GT; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51f3a49ff7dso8834426e87.2;
        Wed, 15 May 2024 05:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715775470; x=1716380270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FfTd+IhcseVz82kX8cl5ddq+uO0WysRifQ/UtsUnsk=;
        b=LymaZ6GTMkA5CW1QJmmIQ4LSrPt/71+tAKQbk5N3vIvi5scjXAHT6cCLce7XGJZY0U
         H6zPBPcA7pHOWKmhryzXGm7h6bS+xT6Sn9YQwsM19dcmBJOyjQPIEThKX6PczAxAs6Y2
         8xK45cgKDRQSlxsNrlHYUXEl6JkFCU3aCB423MnK+6FCWpGm20WgbZXvCPswlUeCvEZC
         D2be1EqigQITBaGMwUjeNVzOJHHS7G44ov4Z/Cus1LMPjz4y3COKwpruq+GCA4FRr9cF
         2LvSA2zqH8tlnJ3fWPen6sV4it/x67t3Sl7yp3WZoKp84i1yPCwz9DVg1wco4dCPaS1s
         JUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715775470; x=1716380270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FfTd+IhcseVz82kX8cl5ddq+uO0WysRifQ/UtsUnsk=;
        b=d54nl9htLr2AlVn+XTYbjp7tQoDnr3mb/V2NGODDLNPDpQq5Jtj6xuhn7Fo8S/E43h
         DR0T4YY3F+E9g59stQmLse+qcbZ+UP3d/522eToP1ZRAoRLdJIf1pPkSFD6+2F18z0ws
         CfIRDxgS1IKRiTiSrebep+5lecARXd35b8XaEW9fViu+lPR4N3YgA/fgYe4sFjjExaAT
         zg5Q0WF38N1aun/XhaDanloUqmizlms0B59kIpVshOWtUK1oMBiyGk1JW16UhWxPLcYC
         ZUmARvTPKj1kgFTJE97s6FbGTObwQDn7CaxwobK9UPCgWAvO9vRnAnZyxPOAtZpvSH/0
         Mftw==
X-Forwarded-Encrypted: i=1; AJvYcCVO0yiuEkdLtKeihnAx2IDOA68hMTrFUignBHcXLeuOCpVFNddT10l1TxMFjbnqeW+FwxtTc3AMhVQk1KJzvZHhqfebnqwPigI/VSApntg6HqW7bFgzi666dPwz+yfpwSJVDWifLTnzF1JW/Rm9aAxr9SdrsmxJUnGLG5MuVyERwTVa4tc=
X-Gm-Message-State: AOJu0YxEeiBD6mr8Fwj5yEt5BkrsdXpsudp7aKhiI3nXMGBnltm8AWIT
	EYYFwSg12lfEvfrKGWYWyJ3cP9vsSGF8+I5Vsqvf+hgiGjQuIjzk
X-Google-Smtp-Source: AGHT+IH+qSj1I/O3GPU5wteh8h6ytdiJYjGehctJATlTyw6eYCkMHo7xMnVO4bDJk5abmxizMhiDPA==
X-Received: by 2002:a05:6512:3135:b0:51b:e42c:2ec4 with SMTP id 2adb3069b0e04-5220fc7dc49mr9132357e87.24.1715775470277;
        Wed, 15 May 2024 05:17:50 -0700 (PDT)
Received: from yoga-710.tas.nnz-ipc.net ([178.218.200.115])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad684sm2515614e87.3.2024.05.15.05.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 05:17:50 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jianqun Xu <jay.xu@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dmitry Yashin <dmt.yashin@gmail.com>
Subject: [PATCH 3/3] pinctrl: rockchip: add rk3308b SoC support
Date: Wed, 15 May 2024 17:16:34 +0500
Message-ID: <20240515121634.23945-4-dmt.yashin@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240515121634.23945-1-dmt.yashin@gmail.com>
References: <20240515121634.23945-1-dmt.yashin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pinctrl support for rk3308b. This pin controller much the same as
rk3308's, but with additional iomux routes and 3bit iomuxes selected
via gpio##_sel_src_ctrl registers. Set them up in the function
rk3308b_soc_sel_src_init to use new 3bit iomuxes over some 2bit old ones.

Fixes: 1f3e25a06883 ("pinctrl: rockchip: fix RK3308 pinmux bits")
Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 200 +++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.h |   1 +
 2 files changed, 201 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index cc647db76927..15d2045f929e 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -632,6 +632,115 @@ static struct rockchip_mux_recalced_data rk3308_mux_recalced_data[] = {
 	},
 };
 
+static struct rockchip_mux_recalced_data rk3308b_mux_recalced_data[] = {
+	{
+		/* gpio1b6_sel */
+		.num = 1,
+		.pin = 14,
+		.reg = 0x28,
+		.bit = 12,
+		.mask = 0xf
+	}, {
+		/* gpio1b7_sel */
+		.num = 1,
+		.pin = 15,
+		.reg = 0x2c,
+		.bit = 0,
+		.mask = 0x3
+	}, {
+		/* gpio1c2_sel */
+		.num = 1,
+		.pin = 18,
+		.reg = 0x30,
+		.bit = 4,
+		.mask = 0xf
+	}, {
+		/* gpio1c3_sel */
+		.num = 1,
+		.pin = 19,
+		.reg = 0x30,
+		.bit = 8,
+		.mask = 0xf
+	}, {
+		/* gpio1c4_sel */
+		.num = 1,
+		.pin = 20,
+		.reg = 0x30,
+		.bit = 12,
+		.mask = 0xf
+	}, {
+		/* gpio1c5_sel */
+		.num = 1,
+		.pin = 21,
+		.reg = 0x34,
+		.bit = 0,
+		.mask = 0xf
+	}, {
+		/* gpio1c6_sel */
+		.num = 1,
+		.pin = 22,
+		.reg = 0x34,
+		.bit = 4,
+		.mask = 0xf
+	}, {
+		/* gpio1c7_sel */
+		.num = 1,
+		.pin = 23,
+		.reg = 0x34,
+		.bit = 8,
+		.mask = 0xf
+	}, {
+		/* gpio2a2_sel_plus */
+		.num = 2,
+		.pin = 2,
+		.reg = 0x608,
+		.bit = 0,
+		.mask = 0x7
+	}, {
+		/* gpio2a3_sel_plus */
+		.num = 2,
+		.pin = 3,
+		.reg = 0x608,
+		.bit = 4,
+		.mask = 0x7
+	}, {
+		/* gpio2c0_sel_plus */
+		.num = 2,
+		.pin = 16,
+		.reg = 0x610,
+		.bit = 8,
+		.mask = 0x7
+	}, {
+		/* gpio3b2_sel_plus */
+		.num = 3,
+		.pin = 10,
+		.reg = 0x610,
+		.bit = 0,
+		.mask = 0x7
+	}, {
+		/* gpio3b3_sel_plus */
+		.num = 3,
+		.pin = 11,
+		.reg = 0x610,
+		.bit = 4,
+		.mask = 0x7
+	}, {
+		/* gpio3b4_sel */
+		.num = 3,
+		.pin = 12,
+		.reg = 0x68,
+		.bit = 8,
+		.mask = 0xf
+	}, {
+		/* gpio3b5_sel */
+		.num = 3,
+		.pin = 13,
+		.reg = 0x68,
+		.bit = 12,
+		.mask = 0xf
+	},
+};
+
 static struct rockchip_mux_recalced_data rk3328_mux_recalced_data[] = {
 	{
 		.num = 2,
@@ -882,6 +991,35 @@ static struct rockchip_mux_route_data rk3308_mux_route_data[] = {
 	RK_MUXROUTE_SAME(2, RK_PA4, 3, 0x600, BIT(16 + 2) | BIT(2)), /* pdm-clkm-m2 */
 };
 
+static struct rockchip_mux_route_data rk3308b_mux_route_data[] = {
+	RK_MUXROUTE_SAME(0, RK_PC3, 1, 0x314, BIT(16 + 0) | BIT(0)), /* rtc_clk */
+	RK_MUXROUTE_SAME(1, RK_PC6, 2, 0x314, BIT(16 + 2) | BIT(16 + 3)), /* uart2_rxm0 */
+	RK_MUXROUTE_SAME(4, RK_PD2, 2, 0x314, BIT(16 + 2) | BIT(16 + 3) | BIT(2)), /* uart2_rxm1 */
+	RK_MUXROUTE_SAME(0, RK_PB7, 2, 0x608, BIT(16 + 8) | BIT(16 + 9)), /* i2c3_sdam0 */
+	RK_MUXROUTE_SAME(3, RK_PB4, 2, 0x608, BIT(16 + 8) | BIT(16 + 9) | BIT(8)), /* i2c3_sdam1 */
+	RK_MUXROUTE_SAME(2, RK_PA0, 3, 0x608, BIT(16 + 8) | BIT(16 + 9) | BIT(9)), /* i2c3_sdam2 */
+	RK_MUXROUTE_SAME(1, RK_PA3, 2, 0x308, BIT(16 + 3)), /* i2s-8ch-1-sclktxm0 */
+	RK_MUXROUTE_SAME(1, RK_PA4, 2, 0x308, BIT(16 + 3)), /* i2s-8ch-1-sclkrxm0 */
+	RK_MUXROUTE_SAME(1, RK_PB5, 2, 0x308, BIT(16 + 3) | BIT(3)), /* i2s-8ch-1-sclktxm1 */
+	RK_MUXROUTE_SAME(1, RK_PB6, 2, 0x308, BIT(16 + 3) | BIT(3)), /* i2s-8ch-1-sclkrxm1 */
+	RK_MUXROUTE_SAME(1, RK_PA4, 3, 0x308, BIT(16 + 12) | BIT(16 + 13)), /* pdm-clkm0 */
+	RK_MUXROUTE_SAME(1, RK_PB6, 4, 0x308, BIT(16 + 12) | BIT(16 + 13) | BIT(12)), /* pdm-clkm1 */
+	RK_MUXROUTE_SAME(2, RK_PA6, 2, 0x308, BIT(16 + 12) | BIT(16 + 13) | BIT(13)), /* pdm-clkm2 */
+	RK_MUXROUTE_SAME(2, RK_PA4, 3, 0x600, BIT(16 + 2) | BIT(2)), /* pdm-clkm-m2 */
+	RK_MUXROUTE_SAME(3, RK_PB2, 3, 0x314, BIT(16 + 9)), /* spi1_miso */
+	RK_MUXROUTE_SAME(2, RK_PA4, 2, 0x314, BIT(16 + 9) | BIT(9)), /* spi1_miso_m1 */
+	RK_MUXROUTE_SAME(0, RK_PB3, 3, 0x314, BIT(16 + 10) | BIT(16 + 11)), /* owire_m0 */
+	RK_MUXROUTE_SAME(1, RK_PC6, 7, 0x314, BIT(16 + 10) | BIT(16 + 11) | BIT(10)), /* owire_m1 */
+	RK_MUXROUTE_SAME(2, RK_PA2, 5, 0x314, BIT(16 + 10) | BIT(16 + 11) | BIT(11)), /* owire_m2 */
+	RK_MUXROUTE_SAME(0, RK_PB3, 2, 0x314, BIT(16 + 12) | BIT(16 + 13)), /* can_rxd_m0 */
+	RK_MUXROUTE_SAME(1, RK_PC6, 5, 0x314, BIT(16 + 12) | BIT(16 + 13) | BIT(12)), /* can_rxd_m1 */
+	RK_MUXROUTE_SAME(2, RK_PA2, 4, 0x314, BIT(16 + 12) | BIT(16 + 13) | BIT(13)), /* can_rxd_m2 */
+	RK_MUXROUTE_SAME(1, RK_PC4, 3, 0x314, BIT(16 + 14)), /* mac_rxd0_m0 */
+	RK_MUXROUTE_SAME(4, RK_PA2, 2, 0x314, BIT(16 + 14) | BIT(14)), /* mac_rxd0_m1 */
+	RK_MUXROUTE_SAME(3, RK_PB4, 4, 0x314, BIT(16 + 15)), /* uart3_rx */
+	RK_MUXROUTE_SAME(0, RK_PC1, 3, 0x314, BIT(16 + 15) | BIT(15)), /* uart3_rx_m1 */
+};
+
 static struct rockchip_mux_route_data rk3328_mux_route_data[] = {
 	RK_MUXROUTE_SAME(1, RK_PA1, 2, 0x50, BIT(16) | BIT(16 + 1)), /* uart2dbg_rxm0 */
 	RK_MUXROUTE_SAME(2, RK_PA1, 1, 0x50, BIT(16) | BIT(16 + 1) | BIT(0)), /* uart2dbg_rxm1 */
@@ -2420,6 +2558,7 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
 	case RK3188:
 	case RK3288:
 	case RK3308:
+	case RK3308B:
 	case RK3368:
 	case RK3399:
 	case RK3568:
@@ -2478,6 +2617,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 	case RK3188:
 	case RK3288:
 	case RK3308:
+	case RK3308B:
 	case RK3368:
 	case RK3399:
 	case RK3568:
@@ -2740,6 +2880,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 	case RK3188:
 	case RK3288:
 	case RK3308:
+	case RK3308B:
 	case RK3368:
 	case RK3399:
 	case RK3568:
@@ -3338,6 +3479,42 @@ static int __maybe_unused rockchip_pinctrl_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(rockchip_pinctrl_dev_pm_ops, rockchip_pinctrl_suspend,
 			 rockchip_pinctrl_resume);
 
+#define RK3308B_GRF_SOC_CON13			0x608
+#define RK3308B_GRF_SOC_CON15			0x610
+
+/* RK3308B_GRF_SOC_CON13 */
+#define RK3308B_GRF_I2C3_IOFUNC_SRC_CTRL	(BIT(16 + 10) | BIT(10))
+#define RK3308B_GRF_GPIO2A3_SEL_SRC_CTRL	(BIT(16 + 7)  | BIT(7))
+#define RK3308B_GRF_GPIO2A2_SEL_SRC_CTRL	(BIT(16 + 3)  | BIT(3))
+
+/* RK3308B_GRF_SOC_CON15 */
+#define RK3308B_GRF_GPIO2C0_SEL_SRC_CTRL	(BIT(16 + 11) | BIT(11))
+#define RK3308B_GRF_GPIO3B3_SEL_SRC_CTRL	(BIT(16 + 7)  | BIT(7))
+#define RK3308B_GRF_GPIO3B2_SEL_SRC_CTRL	(BIT(16 + 3)  | BIT(3))
+
+/*
+ * RK3308B has 3bit gpio##_sel_plus iomuxes over some 2bit old ones.
+ * Put them in use by initializing gpio##_sel_src_ctrl registers.
+ */
+static int rk3308b_soc_sel_src_init(struct rockchip_pinctrl *info)
+{
+	int ret;
+
+	ret = regmap_write(info->regmap_base, RK3308B_GRF_SOC_CON13,
+			   RK3308B_GRF_I2C3_IOFUNC_SRC_CTRL |
+			   RK3308B_GRF_GPIO2A3_SEL_SRC_CTRL |
+			   RK3308B_GRF_GPIO2A2_SEL_SRC_CTRL);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(info->regmap_base, RK3308B_GRF_SOC_CON15,
+			   RK3308B_GRF_GPIO2C0_SEL_SRC_CTRL |
+			   RK3308B_GRF_GPIO3B3_SEL_SRC_CTRL |
+			   RK3308B_GRF_GPIO3B2_SEL_SRC_CTRL);
+
+	return ret;
+};
+
 static int rockchip_pinctrl_probe(struct platform_device *pdev)
 {
 	struct rockchip_pinctrl *info;
@@ -3403,6 +3580,12 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 			return PTR_ERR(info->regmap_pmu);
 	}
 
+	if (ctrl->type == RK3308B) {
+		ret = rk3308b_soc_sel_src_init(info);
+		if (ret)
+			return ret;
+	}
+
 	ret = rockchip_pinctrl_register(pdev, info);
 	if (ret)
 		return ret;
@@ -3746,6 +3929,21 @@ static struct rockchip_pin_ctrl rk3308_pin_ctrl = {
 		.schmitt_calc_reg	= rk3308_calc_schmitt_reg_and_bit,
 };
 
+static struct rockchip_pin_ctrl rk3308b_pin_ctrl = {
+		.pin_banks		= rk3308_pin_banks,
+		.nr_banks		= ARRAY_SIZE(rk3308_pin_banks),
+		.label			= "RK3308b-GPIO",
+		.type			= RK3308B,
+		.grf_mux_offset		= 0x0,
+		.iomux_recalced		= rk3308b_mux_recalced_data,
+		.niomux_recalced	= ARRAY_SIZE(rk3308b_mux_recalced_data),
+		.iomux_routes		= rk3308b_mux_route_data,
+		.niomux_routes		= ARRAY_SIZE(rk3308b_mux_route_data),
+		.pull_calc_reg		= rk3308_calc_pull_reg_and_bit,
+		.drv_calc_reg		= rk3308_calc_drv_reg_and_bit,
+		.schmitt_calc_reg	= rk3308_calc_schmitt_reg_and_bit,
+};
+
 static struct rockchip_pin_bank rk3328_pin_banks[] = {
 	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", 0, 0, 0, 0),
 	PIN_BANK_IOMUX_FLAGS(1, 32, "gpio1", 0, 0, 0, 0),
@@ -3952,6 +4150,8 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 		.data = &rk3288_pin_ctrl },
 	{ .compatible = "rockchip,rk3308-pinctrl",
 		.data = &rk3308_pin_ctrl },
+	{ .compatible = "rockchip,rk3308b-pinctrl",
+		.data = &rk3308b_pin_ctrl },
 	{ .compatible = "rockchip,rk3328-pinctrl",
 		.data = &rk3328_pin_ctrl },
 	{ .compatible = "rockchip,rk3368-pinctrl",
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index 4759f336941e..3af5b1bd626b 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -193,6 +193,7 @@ enum rockchip_pinctrl_type {
 	RK3188,
 	RK3288,
 	RK3308,
+	RK3308B,
 	RK3368,
 	RK3399,
 	RK3568,
-- 
2.39.2


