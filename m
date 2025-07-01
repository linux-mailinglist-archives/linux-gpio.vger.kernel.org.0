Return-Path: <linux-gpio+bounces-22533-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3509BAF0477
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 22:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DAE44A81A7
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 20:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A10264A61;
	Tue,  1 Jul 2025 20:15:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F401C2441A6;
	Tue,  1 Jul 2025 20:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751400935; cv=none; b=XbV24Ppq+e0y25uZyan35DfMOV6yzBGCbCa5YrzUKP/6FtZt1mhN9WlmhnhDPe8B4E2c9MwBOg08yBSs2H1IrNnEzz0UIEfHiDHY/uD1OA1gnN3G6ggW9ZKpdGtsRry67WKwytdIAKn4CLdQHSjrrhUMd3S8khT1XSvXByB/WdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751400935; c=relaxed/simple;
	bh=UCQ/ORzA7zunGa781r16wUL+6h1iduPb4jRIaZmeYQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Le4g0Z86CytRTh2Z1pWNkTW7ZRrxmav/645Yek7+25GB3vLRZQLUzFkgaQVy1XUR1s0R7PPFspnTTfb6mtiHV6jHTq+h2BF5NJ8xqWHJ3270lod/O38OxnPPBzNElQgBcJ7LcXmBDzonlguLcg5xmelZAJ5oWMhORRmUMySnaQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id A54031F00036;
	Tue,  1 Jul 2025 20:15:30 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 2F874AC9699; Tue,  1 Jul 2025 20:15:30 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 2C8D0AC9682;
	Tue,  1 Jul 2025 20:11:33 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-gpio@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Icenowy Zheng <icenowy@aosc.xyz>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 2/5] clk: sunxi-ng: v3s: Fix CSI SCLK clock name
Date: Tue,  1 Jul 2025 22:11:21 +0200
Message-ID: <20250701201124.812882-3-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701201124.812882-1-paulk@sys-base.io>
References: <20250701201124.812882-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CSI SCLK clock is incorrectly called CSI1 SCLK while it is used for
both the CSI0 and CSI1 interfaces and is called CSI SCLK all around the
documentation.

Fix the name in the driver, header and device-tree.

Fixes: d0f11d14b0bc ("clk: sunxi-ng: add support for V3s CCU")
Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../bindings/media/allwinner,sun6i-a31-csi.yaml        |  2 +-
 .../bindings/media/allwinner,sun6i-a31-isp.yaml        |  2 +-
 .../bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml  |  2 +-
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi             |  2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c                   | 10 +++++-----
 include/dt-bindings/clock/sun8i-v3s-ccu.h              |  2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
index b3d6db922693..1aa5775ba2bc 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
@@ -110,7 +110,7 @@ examples:
         reg = <0x01cb4000 0x1000>;
         interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&ccu CLK_BUS_CSI>,
-                 <&ccu CLK_CSI1_SCLK>,
+                 <&ccu CLK_CSI_SCLK>,
                  <&ccu CLK_DRAM_CSI>;
         clock-names = "bus",
                       "mod",
diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
index a61a76bb611c..3ea4a4290f23 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
@@ -79,7 +79,7 @@ examples:
         reg = <0x01cb8000 0x1000>;
         interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&ccu CLK_BUS_CSI>,
-             <&ccu CLK_CSI1_SCLK>,
+             <&ccu CLK_CSI_SCLK>,
              <&ccu CLK_DRAM_CSI>;
         clock-names = "bus", "mod", "ram";
         resets = <&ccu RST_BUS_CSI>;
diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml
index 54e15ab8a7f5..627b28e94354 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml
@@ -103,7 +103,7 @@ examples:
         reg = <0x01cb1000 0x1000>;
         interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&ccu CLK_BUS_CSI>,
-                 <&ccu CLK_CSI1_SCLK>;
+                 <&ccu CLK_CSI_SCLK>;
         clock-names = "bus", "mod";
         resets = <&ccu RST_BUS_CSI>;
 
diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
index f909b1d4dbca..e82cf312da25 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
@@ -652,7 +652,7 @@ csi1: camera@1cb4000 {
 			reg = <0x01cb4000 0x3000>;
 			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_CSI>,
-				 <&ccu CLK_CSI1_SCLK>,
+				 <&ccu CLK_CSI_SCLK>,
 				 <&ccu CLK_DRAM_CSI>;
 			clock-names = "bus", "mod", "ram";
 			resets = <&ccu RST_BUS_CSI>;
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
index 579a81bb46df..d12791b31a9d 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
@@ -362,8 +362,8 @@ static const char * const csi_mclk_parents[] = { "osc24M", "pll-video",
 static SUNXI_CCU_M_WITH_MUX_GATE(csi0_mclk_clk, "csi0-mclk", csi_mclk_parents,
 				 0x130, 0, 5, 8, 3, BIT(15), 0);
 
-static const char * const csi1_sclk_parents[] = { "pll-video", "pll-isp" };
-static SUNXI_CCU_M_WITH_MUX_GATE(csi1_sclk_clk, "csi-sclk", csi1_sclk_parents,
+static const char * const csi_sclk_parents[] = { "pll-video", "pll-isp" };
+static SUNXI_CCU_M_WITH_MUX_GATE(csi_sclk_clk, "csi-sclk", csi_sclk_parents,
 				 0x134, 16, 4, 24, 3, BIT(31), 0);
 
 static SUNXI_CCU_M_WITH_MUX_GATE(csi1_mclk_clk, "csi-mclk", csi_mclk_parents,
@@ -452,7 +452,7 @@ static struct ccu_common *sun8i_v3s_ccu_clks[] = {
 	&tcon_clk.common,
 	&csi_misc_clk.common,
 	&csi0_mclk_clk.common,
-	&csi1_sclk_clk.common,
+	&csi_sclk_clk.common,
 	&csi1_mclk_clk.common,
 	&ve_clk.common,
 	&ac_dig_clk.common,
@@ -551,7 +551,7 @@ static struct clk_hw_onecell_data sun8i_v3s_hw_clks = {
 		[CLK_TCON0]		= &tcon_clk.common.hw,
 		[CLK_CSI_MISC]		= &csi_misc_clk.common.hw,
 		[CLK_CSI0_MCLK]		= &csi0_mclk_clk.common.hw,
-		[CLK_CSI1_SCLK]		= &csi1_sclk_clk.common.hw,
+		[CLK_CSI_SCLK]		= &csi_sclk_clk.common.hw,
 		[CLK_CSI1_MCLK]		= &csi1_mclk_clk.common.hw,
 		[CLK_VE]		= &ve_clk.common.hw,
 		[CLK_AC_DIG]		= &ac_dig_clk.common.hw,
@@ -633,7 +633,7 @@ static struct clk_hw_onecell_data sun8i_v3_hw_clks = {
 		[CLK_TCON0]		= &tcon_clk.common.hw,
 		[CLK_CSI_MISC]		= &csi_misc_clk.common.hw,
 		[CLK_CSI0_MCLK]		= &csi0_mclk_clk.common.hw,
-		[CLK_CSI1_SCLK]		= &csi1_sclk_clk.common.hw,
+		[CLK_CSI_SCLK]		= &csi_sclk_clk.common.hw,
 		[CLK_CSI1_MCLK]		= &csi1_mclk_clk.common.hw,
 		[CLK_VE]		= &ve_clk.common.hw,
 		[CLK_AC_DIG]		= &ac_dig_clk.common.hw,
diff --git a/include/dt-bindings/clock/sun8i-v3s-ccu.h b/include/dt-bindings/clock/sun8i-v3s-ccu.h
index 014ac6123d17..c4055629c9f9 100644
--- a/include/dt-bindings/clock/sun8i-v3s-ccu.h
+++ b/include/dt-bindings/clock/sun8i-v3s-ccu.h
@@ -96,7 +96,7 @@
 #define CLK_TCON0		64
 #define CLK_CSI_MISC		65
 #define CLK_CSI0_MCLK		66
-#define CLK_CSI1_SCLK		67
+#define CLK_CSI_SCLK		67
 #define CLK_CSI1_MCLK		68
 #define CLK_VE			69
 #define CLK_AC_DIG		70
-- 
2.49.0


