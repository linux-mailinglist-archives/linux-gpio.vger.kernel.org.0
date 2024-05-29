Return-Path: <linux-gpio+bounces-6862-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4018D3999
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 16:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4556E1F246E1
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 14:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158B317BB28;
	Wed, 29 May 2024 14:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAZaUg8u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7622169ACE;
	Wed, 29 May 2024 14:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716993885; cv=none; b=rudh84h+RNNeeZDNd07aL4Fysp2/nrMTDH8nQ8Qomt6RsOUEUh9aDO5fNg1Z3aNigN8c+VGUJZB2sViVJnHWe6yGFJay47Y8tU8mGxIMV0Q2ZW+Jpkq20fC2Ue0dL3kMKoxXT9fXbV1eWePuerZaORfxLNg5RDWLj4URmOsPFog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716993885; c=relaxed/simple;
	bh=L1pB5sM833F91QYZtZD5zyIFpixH8efzKyB/vGQgB+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dV7N5KJ7J6wwUv/1QC/36r97pimnBf1TPecHgCce+eF/78TetsaTowbUZb+OmsDuftMN868oqVB83lERnyKT1gWchBQDBapsdULvd6aubeJBcKKsm7REqQx9WpWVAwKv+G3pza4h/2nq3fhfDfwoGfqOcu7W7uSD0iEH2dRtAYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAZaUg8u; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52b78ef397bso52879e87.0;
        Wed, 29 May 2024 07:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716993882; x=1717598682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgB23vKcow7QnQ1mmlyRwIrojERGh2ECUWAs0egDdog=;
        b=EAZaUg8usik5dtGnk8fveOUrrmFg+xUm+N+UaWLg7t/5yrwCVEiHQjwyxqW/INOGag
         apHSb2aHkWayfTGpPdvD9t3cmwMCz4WwPcc0lY/blLb5uBCTvPDGEg3/jl9sjI/VuuAs
         8f0iyzDfT2+qxcyMdSO7/6xZDWHsDOQ98gSLkE2yoFtyLfvfbjz8CSTeJjKs5j5JpS4D
         D0HAGEbFSvZjLMASqxBImpZ7FXjDCh6LlDeAj/RZ06CxLg85yg+zd6V33oKCtIriiZom
         NWuwMFka15g/XfPolXUCFQy6evx4b3jr8prFjoUWRGbwOiBoupAPenoizQk4d8vqVwMJ
         tKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716993882; x=1717598682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgB23vKcow7QnQ1mmlyRwIrojERGh2ECUWAs0egDdog=;
        b=YDcdKi79x7EilEySnX/fA9LC3bdxIkeFhUrjRzqqoxxMh9X9syCuEPR4VFQJ2sMhK+
         bIW6iXS/Dm6ssUgNl5nJHpTLWvGtJoB8/Y/2aLhFjXeGQymkLBoYdBPoy0WYAOEVuHW2
         CSTp92xi7KGg7sH98CLpuNmRAXci5cCsRQJXRyhN/6P3b2vxq+CKcc1lXJbOQhvLysaL
         Iflq+nEo+/xVjif99VJoD0UJuiVyTt4opAT3ipthtLCeNHosCqhx+IAUWp1fjMUy5zbF
         vmtQ2FN0g4XSi3UTevrFjzhB5LJEcMMROSuff1nu7nmaOBLgaTMPjure3reK9rJuzinp
         UidQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx0IpvA6HWrQiMhDa8mkLA2SlwxMgxRVA0T3z/x/nnDRspUjbYG2H3bq//eMlDoj6Y5J56wY1psotzHStnRQW+GzJvFyaVfiuxglqTlQzNFYrb5LnyhKcx5zIwx5fkGBiZCMUtzmKsaUupHR5Bf3Oys0VXb5WnXZLDI8nwd03wmNSUf1M=
X-Gm-Message-State: AOJu0YwjlmzqLIr/iXZPBwpdr47zb36iViApjVKIp6wsWuthk+Ek/Mp8
	fdpEULNkeTsTJe57y3N4n8DXS4Dj6nGrrJKq13rCeU55Fsz+S6cK
X-Google-Smtp-Source: AGHT+IGq0angoA+k/9hNkfevqbRCbrHyt1FB3mZ0p8maQzNbTG1/SbqWABuQ8jwgmDQpwNS5qunqcQ==
X-Received: by 2002:a05:6512:4010:b0:523:88a9:86bf with SMTP id 2adb3069b0e04-52a84127ba6mr876206e87.31.1716993881763;
        Wed, 29 May 2024 07:44:41 -0700 (PDT)
Received: from yoga-710.tas.nnz-ipc.net ([178.218.200.115])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529ac903bd9sm928915e87.236.2024.05.29.07.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:44:41 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jianqun Xu <jay.xu@rock-chips.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dmitry Yashin <dmt.yashin@gmail.com>
Subject: [PATCH v2 2/2] pinctrl: rockchip: add rk3308b SoC support
Date: Wed, 29 May 2024 19:35:34 +0500
Message-ID: <20240529143534.32402-3-dmt.yashin@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240529143534.32402-1-dmt.yashin@gmail.com>
References: <20240529143534.32402-1-dmt.yashin@gmail.com>
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
rk3308b_soc_sel_src_init to use new 3bit iomuxes over some 2bit old
ones and update iomux_recalced and iomux_routes for the new SoC's.

Fixes: 1f3e25a06883 ("pinctrl: rockchip: fix RK3308 pinmux bits")
Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 234 +++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.h |   1 +
 2 files changed, 235 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index c290c755b4fb..e3b6e22c5dce 100644
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
@@ -3348,6 +3489,93 @@ static int __maybe_unused rockchip_pinctrl_resume(struct device *dev)
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
+#define RK3308_GRF_CHIP_ID			0x800
+
+static int rk3308_soc_update_type(struct rockchip_pinctrl *info)
+{
+	struct rockchip_pin_ctrl *ctrl = info->ctrl;
+	unsigned int chip_id;
+	int ret;
+
+	ret = regmap_read(info->regmap_base, RK3308_GRF_CHIP_ID, &chip_id);
+	if (ret)
+		return ret;
+
+	switch (chip_id) {
+	/* From RK3308 TRM: "Errata: The read only chip id value is 32'h0cea(32'd3306)" */
+	case 0xcea:
+		break;
+	case 0x3308:
+	case 0x3308c:
+		ctrl->type = RK3308B;
+		break;
+	default:
+		return dev_err_probe(info->dev, -EINVAL, "Unknown chip_id: 0x%x\n", chip_id);
+	}
+
+	return 0;
+}
+
+static int rk3308_soc_data_update(struct rockchip_pinctrl *info)
+{
+	struct rockchip_pin_ctrl *ctrl = info->ctrl;
+	int ret;
+
+	ret = rk3308_soc_update_type(info);
+	if (ret)
+		return ret;
+
+	if (ctrl->type == RK3308B) {
+		/* Replace iomux data for RK3308B and RK3308BS */
+		ctrl->iomux_recalced	= rk3308b_mux_recalced_data;
+		ctrl->niomux_recalced	= ARRAY_SIZE(rk3308b_mux_recalced_data);
+		ctrl->iomux_routes	= rk3308b_mux_route_data;
+		ctrl->niomux_routes	= ARRAY_SIZE(rk3308b_mux_route_data);
+		
+		ret = rk3308b_soc_sel_src_init(info);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int rockchip_pinctrl_probe(struct platform_device *pdev)
 {
 	struct rockchip_pinctrl *info;
@@ -3413,6 +3641,12 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 			return PTR_ERR(info->regmap_pmu);
 	}
 
+	if (ctrl->type == RK3308) {
+		ret = rk3308_soc_data_update(info);
+		if (ret)
+			return ret;
+	}
+
 	iomux_recalced_routes_init(info);
 
 	ret = rockchip_pinctrl_register(pdev, info);
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


