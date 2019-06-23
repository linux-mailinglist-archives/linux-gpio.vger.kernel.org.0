Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB524F9F5
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Jun 2019 06:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbfFWEjp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 Jun 2019 00:39:45 -0400
Received: from hermes.aosc.io ([199.195.250.187]:52197 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726050AbfFWEjo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 23 Jun 2019 00:39:44 -0400
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender: icenowy@aosc.io)
        by hermes.aosc.io (Postfix) with ESMTPSA id AAF6A6212D;
        Sun, 23 Jun 2019 04:39:39 +0000 (UTC)
From:   Icenowy Zheng <icenowy@aosc.io>
To:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v3 4/9] clk: sunxi-ng: v3s: add Allwinner V3 support
Date:   Sun, 23 Jun 2019 12:37:56 +0800
Message-Id: <20190623043801.14040-5-icenowy@aosc.io>
In-Reply-To: <20190623043801.14040-1-icenowy@aosc.io>
References: <20190623043801.14040-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allwinner V3 has the same main die with V3s, but with more pins wired.
There's a I2S bus on V3 that is not available on V3s.

Add the V3-only peripheral's clocks and reset to the V3s CCU driver,
bound to a new V3 compatible string. The driver name is not changed
because it's part of the device tree binding (the header file name).

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
No changes in v3/v2.

 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c      | 225 +++++++++++++++++++++-
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.h      |   2 +-
 include/dt-bindings/clock/sun8i-v3s-ccu.h |   4 +
 include/dt-bindings/reset/sun8i-v3s-ccu.h |   3 +
 4 files changed, 231 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
index 90a9ca5fac80..fb04e564d55d 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
@@ -235,6 +235,8 @@ static SUNXI_CCU_GATE(bus_codec_clk,	"bus-codec",	"apb1",
 		      0x068, BIT(0), 0);
 static SUNXI_CCU_GATE(bus_pio_clk,	"bus-pio",	"apb1",
 		      0x068, BIT(5), 0);
+static SUNXI_CCU_GATE(bus_i2s0_clk,	"bus-i2s0",	"apb1",
+		      0x068, BIT(12), 0);
 
 static SUNXI_CCU_GATE(bus_i2c0_clk,	"bus-i2c0",	"apb2",
 		      0x06c, BIT(0), 0);
@@ -306,6 +308,11 @@ static SUNXI_CCU_MP_WITH_MUX_GATE(spi0_clk, "spi0", mod0_default_parents, 0x0a0,
 				  BIT(31),	/* gate */
 				  0);
 
+static const char * const i2s_parents[] = { "pll-audio-8x", "pll-audio-4x",
+					    "pll-audio-2x", "pll-audio" };
+static SUNXI_CCU_MUX_WITH_GATE(i2s0_clk, "i2s0", i2s_parents,
+			       0x0b0, 16, 2, BIT(31), CLK_SET_RATE_PARENT);
+
 static SUNXI_CCU_GATE(usb_phy0_clk,	"usb-phy0",	"osc24M",
 		      0x0cc, BIT(8), 0);
 static SUNXI_CCU_GATE(usb_ohci0_clk,	"usb-ohci0",	"osc24M",
@@ -439,6 +446,80 @@ static struct ccu_common *sun8i_v3s_ccu_clks[] = {
 	&mipi_csi_clk.common,
 };
 
+static struct ccu_common *sun8i_v3_ccu_clks[] = {
+	&pll_cpu_clk.common,
+	&pll_audio_base_clk.common,
+	&pll_video_clk.common,
+	&pll_ve_clk.common,
+	&pll_ddr0_clk.common,
+	&pll_periph0_clk.common,
+	&pll_isp_clk.common,
+	&pll_periph1_clk.common,
+	&pll_ddr1_clk.common,
+	&cpu_clk.common,
+	&axi_clk.common,
+	&ahb1_clk.common,
+	&apb1_clk.common,
+	&apb2_clk.common,
+	&ahb2_clk.common,
+	&bus_ce_clk.common,
+	&bus_dma_clk.common,
+	&bus_mmc0_clk.common,
+	&bus_mmc1_clk.common,
+	&bus_mmc2_clk.common,
+	&bus_dram_clk.common,
+	&bus_emac_clk.common,
+	&bus_hstimer_clk.common,
+	&bus_spi0_clk.common,
+	&bus_otg_clk.common,
+	&bus_ehci0_clk.common,
+	&bus_ohci0_clk.common,
+	&bus_ve_clk.common,
+	&bus_tcon0_clk.common,
+	&bus_csi_clk.common,
+	&bus_de_clk.common,
+	&bus_codec_clk.common,
+	&bus_pio_clk.common,
+	&bus_i2s0_clk.common,
+	&bus_i2c0_clk.common,
+	&bus_i2c1_clk.common,
+	&bus_uart0_clk.common,
+	&bus_uart1_clk.common,
+	&bus_uart2_clk.common,
+	&bus_ephy_clk.common,
+	&bus_dbg_clk.common,
+	&mmc0_clk.common,
+	&mmc0_sample_clk.common,
+	&mmc0_output_clk.common,
+	&mmc1_clk.common,
+	&mmc1_sample_clk.common,
+	&mmc1_output_clk.common,
+	&mmc2_clk.common,
+	&mmc2_sample_clk.common,
+	&mmc2_output_clk.common,
+	&ce_clk.common,
+	&spi0_clk.common,
+	&i2s0_clk.common,
+	&usb_phy0_clk.common,
+	&usb_ohci0_clk.common,
+	&dram_clk.common,
+	&dram_ve_clk.common,
+	&dram_csi_clk.common,
+	&dram_ohci_clk.common,
+	&dram_ehci_clk.common,
+	&de_clk.common,
+	&tcon_clk.common,
+	&csi_misc_clk.common,
+	&csi0_mclk_clk.common,
+	&csi1_sclk_clk.common,
+	&csi1_mclk_clk.common,
+	&ve_clk.common,
+	&ac_dig_clk.common,
+	&avs_clk.common,
+	&mbus_clk.common,
+	&mipi_csi_clk.common,
+};
+
 /* We hardcode the divider to 4 for now */
 static CLK_FIXED_FACTOR(pll_audio_clk, "pll-audio",
 			"pll-audio-base", 4, 1, CLK_SET_RATE_PARENT);
@@ -528,6 +609,85 @@ static struct clk_hw_onecell_data sun8i_v3s_hw_clks = {
 	.num	= CLK_NUMBER,
 };
 
+static struct clk_hw_onecell_data sun8i_v3_hw_clks = {
+	.hws	= {
+		[CLK_PLL_CPU]		= &pll_cpu_clk.common.hw,
+		[CLK_PLL_AUDIO_BASE]	= &pll_audio_base_clk.common.hw,
+		[CLK_PLL_AUDIO]		= &pll_audio_clk.hw,
+		[CLK_PLL_AUDIO_2X]	= &pll_audio_2x_clk.hw,
+		[CLK_PLL_AUDIO_4X]	= &pll_audio_4x_clk.hw,
+		[CLK_PLL_AUDIO_8X]	= &pll_audio_8x_clk.hw,
+		[CLK_PLL_VIDEO]		= &pll_video_clk.common.hw,
+		[CLK_PLL_VE]		= &pll_ve_clk.common.hw,
+		[CLK_PLL_DDR0]		= &pll_ddr0_clk.common.hw,
+		[CLK_PLL_PERIPH0]	= &pll_periph0_clk.common.hw,
+		[CLK_PLL_PERIPH0_2X]	= &pll_periph0_2x_clk.hw,
+		[CLK_PLL_ISP]		= &pll_isp_clk.common.hw,
+		[CLK_PLL_PERIPH1]	= &pll_periph1_clk.common.hw,
+		[CLK_PLL_DDR1]		= &pll_ddr1_clk.common.hw,
+		[CLK_CPU]		= &cpu_clk.common.hw,
+		[CLK_AXI]		= &axi_clk.common.hw,
+		[CLK_AHB1]		= &ahb1_clk.common.hw,
+		[CLK_APB1]		= &apb1_clk.common.hw,
+		[CLK_APB2]		= &apb2_clk.common.hw,
+		[CLK_AHB2]		= &ahb2_clk.common.hw,
+		[CLK_BUS_CE]		= &bus_ce_clk.common.hw,
+		[CLK_BUS_DMA]		= &bus_dma_clk.common.hw,
+		[CLK_BUS_MMC0]		= &bus_mmc0_clk.common.hw,
+		[CLK_BUS_MMC1]		= &bus_mmc1_clk.common.hw,
+		[CLK_BUS_MMC2]		= &bus_mmc2_clk.common.hw,
+		[CLK_BUS_DRAM]		= &bus_dram_clk.common.hw,
+		[CLK_BUS_EMAC]		= &bus_emac_clk.common.hw,
+		[CLK_BUS_HSTIMER]	= &bus_hstimer_clk.common.hw,
+		[CLK_BUS_SPI0]		= &bus_spi0_clk.common.hw,
+		[CLK_BUS_OTG]		= &bus_otg_clk.common.hw,
+		[CLK_BUS_EHCI0]		= &bus_ehci0_clk.common.hw,
+		[CLK_BUS_OHCI0]		= &bus_ohci0_clk.common.hw,
+		[CLK_BUS_VE]		= &bus_ve_clk.common.hw,
+		[CLK_BUS_TCON0]		= &bus_tcon0_clk.common.hw,
+		[CLK_BUS_CSI]		= &bus_csi_clk.common.hw,
+		[CLK_BUS_DE]		= &bus_de_clk.common.hw,
+		[CLK_BUS_CODEC]		= &bus_codec_clk.common.hw,
+		[CLK_BUS_PIO]		= &bus_pio_clk.common.hw,
+		[CLK_BUS_I2S0]		= &bus_i2s0_clk.common.hw,
+		[CLK_BUS_I2C0]		= &bus_i2c0_clk.common.hw,
+		[CLK_BUS_I2C1]		= &bus_i2c1_clk.common.hw,
+		[CLK_BUS_UART0]		= &bus_uart0_clk.common.hw,
+		[CLK_BUS_UART1]		= &bus_uart1_clk.common.hw,
+		[CLK_BUS_UART2]		= &bus_uart2_clk.common.hw,
+		[CLK_BUS_EPHY]		= &bus_ephy_clk.common.hw,
+		[CLK_BUS_DBG]		= &bus_dbg_clk.common.hw,
+		[CLK_MMC0]		= &mmc0_clk.common.hw,
+		[CLK_MMC0_SAMPLE]	= &mmc0_sample_clk.common.hw,
+		[CLK_MMC0_OUTPUT]	= &mmc0_output_clk.common.hw,
+		[CLK_MMC1]		= &mmc1_clk.common.hw,
+		[CLK_MMC1_SAMPLE]	= &mmc1_sample_clk.common.hw,
+		[CLK_MMC1_OUTPUT]	= &mmc1_output_clk.common.hw,
+		[CLK_CE]		= &ce_clk.common.hw,
+		[CLK_SPI0]		= &spi0_clk.common.hw,
+		[CLK_I2S0]		= &i2s0_clk.common.hw,
+		[CLK_USB_PHY0]		= &usb_phy0_clk.common.hw,
+		[CLK_USB_OHCI0]		= &usb_ohci0_clk.common.hw,
+		[CLK_DRAM]		= &dram_clk.common.hw,
+		[CLK_DRAM_VE]		= &dram_ve_clk.common.hw,
+		[CLK_DRAM_CSI]		= &dram_csi_clk.common.hw,
+		[CLK_DRAM_EHCI]		= &dram_ehci_clk.common.hw,
+		[CLK_DRAM_OHCI]		= &dram_ohci_clk.common.hw,
+		[CLK_DE]		= &de_clk.common.hw,
+		[CLK_TCON0]		= &tcon_clk.common.hw,
+		[CLK_CSI_MISC]		= &csi_misc_clk.common.hw,
+		[CLK_CSI0_MCLK]		= &csi0_mclk_clk.common.hw,
+		[CLK_CSI1_SCLK]		= &csi1_sclk_clk.common.hw,
+		[CLK_CSI1_MCLK]		= &csi1_mclk_clk.common.hw,
+		[CLK_VE]		= &ve_clk.common.hw,
+		[CLK_AC_DIG]		= &ac_dig_clk.common.hw,
+		[CLK_AVS]		= &avs_clk.common.hw,
+		[CLK_MBUS]		= &mbus_clk.common.hw,
+		[CLK_MIPI_CSI]		= &mipi_csi_clk.common.hw,
+	},
+	.num	= CLK_NUMBER,
+};
+
 static struct ccu_reset_map sun8i_v3s_ccu_resets[] = {
 	[RST_USB_PHY0]		=  { 0x0cc, BIT(0) },
 
@@ -563,6 +723,42 @@ static struct ccu_reset_map sun8i_v3s_ccu_resets[] = {
 	[RST_BUS_UART2]		=  { 0x2d8, BIT(18) },
 };
 
+static struct ccu_reset_map sun8i_v3_ccu_resets[] = {
+	[RST_USB_PHY0]		=  { 0x0cc, BIT(0) },
+
+	[RST_MBUS]		=  { 0x0fc, BIT(31) },
+
+	[RST_BUS_CE]		=  { 0x2c0, BIT(5) },
+	[RST_BUS_DMA]		=  { 0x2c0, BIT(6) },
+	[RST_BUS_MMC0]		=  { 0x2c0, BIT(8) },
+	[RST_BUS_MMC1]		=  { 0x2c0, BIT(9) },
+	[RST_BUS_MMC2]		=  { 0x2c0, BIT(10) },
+	[RST_BUS_DRAM]		=  { 0x2c0, BIT(14) },
+	[RST_BUS_EMAC]		=  { 0x2c0, BIT(17) },
+	[RST_BUS_HSTIMER]	=  { 0x2c0, BIT(19) },
+	[RST_BUS_SPI0]		=  { 0x2c0, BIT(20) },
+	[RST_BUS_OTG]		=  { 0x2c0, BIT(24) },
+	[RST_BUS_EHCI0]		=  { 0x2c0, BIT(26) },
+	[RST_BUS_OHCI0]		=  { 0x2c0, BIT(29) },
+
+	[RST_BUS_VE]		=  { 0x2c4, BIT(0) },
+	[RST_BUS_TCON0]		=  { 0x2c4, BIT(4) },
+	[RST_BUS_CSI]		=  { 0x2c4, BIT(8) },
+	[RST_BUS_DE]		=  { 0x2c4, BIT(12) },
+	[RST_BUS_DBG]		=  { 0x2c4, BIT(31) },
+
+	[RST_BUS_EPHY]		=  { 0x2c8, BIT(2) },
+
+	[RST_BUS_CODEC]		=  { 0x2d0, BIT(0) },
+	[RST_BUS_I2S0]		=  { 0x2d0, BIT(12) },
+
+	[RST_BUS_I2C0]		=  { 0x2d8, BIT(0) },
+	[RST_BUS_I2C1]		=  { 0x2d8, BIT(1) },
+	[RST_BUS_UART0]		=  { 0x2d8, BIT(16) },
+	[RST_BUS_UART1]		=  { 0x2d8, BIT(17) },
+	[RST_BUS_UART2]		=  { 0x2d8, BIT(18) },
+};
+
 static const struct sunxi_ccu_desc sun8i_v3s_ccu_desc = {
 	.ccu_clks	= sun8i_v3s_ccu_clks,
 	.num_ccu_clks	= ARRAY_SIZE(sun8i_v3s_ccu_clks),
@@ -573,7 +769,18 @@ static const struct sunxi_ccu_desc sun8i_v3s_ccu_desc = {
 	.num_resets	= ARRAY_SIZE(sun8i_v3s_ccu_resets),
 };
 
-static void __init sun8i_v3s_ccu_setup(struct device_node *node)
+static const struct sunxi_ccu_desc sun8i_v3_ccu_desc = {
+	.ccu_clks	= sun8i_v3_ccu_clks,
+	.num_ccu_clks	= ARRAY_SIZE(sun8i_v3_ccu_clks),
+
+	.hw_clks	= &sun8i_v3_hw_clks,
+
+	.resets		= sun8i_v3_ccu_resets,
+	.num_resets	= ARRAY_SIZE(sun8i_v3_ccu_resets),
+};
+
+static void __init sun8i_v3_v3s_ccu_init(struct device_node *node,
+					 const struct sunxi_ccu_desc *ccu_desc)
 {
 	void __iomem *reg;
 	u32 val;
@@ -589,7 +796,21 @@ static void __init sun8i_v3s_ccu_setup(struct device_node *node)
 	val &= ~GENMASK(19, 16);
 	writel(val | (3 << 16), reg + SUN8I_V3S_PLL_AUDIO_REG);
 
-	sunxi_ccu_probe(node, reg, &sun8i_v3s_ccu_desc);
+	sunxi_ccu_probe(node, reg, ccu_desc);
+}
+
+static void __init sun8i_v3s_ccu_setup(struct device_node *node)
+{
+	sun8i_v3_v3s_ccu_init(node, &sun8i_v3s_ccu_desc);
+}
+
+static void __init sun8i_v3_ccu_setup(struct device_node *node)
+{
+	sun8i_v3_v3s_ccu_init(node, &sun8i_v3_ccu_desc);
 }
+
 CLK_OF_DECLARE(sun8i_v3s_ccu, "allwinner,sun8i-v3s-ccu",
 	       sun8i_v3s_ccu_setup);
+
+CLK_OF_DECLARE(sun8i_v3_ccu, "allwinner,sun8i-v3-ccu",
+	       sun8i_v3_ccu_setup);
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.h b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.h
index 10af324bd6b1..b0160d305a67 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.h
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.h
@@ -51,6 +51,6 @@
 
 #define CLK_PLL_DDR1		74
 
-#define CLK_NUMBER		(CLK_PLL_DDR1 + 1)
+#define CLK_NUMBER		(CLK_I2S0 + 1)
 
 #endif /* _CCU_SUN8I_H3_H_ */
diff --git a/include/dt-bindings/clock/sun8i-v3s-ccu.h b/include/dt-bindings/clock/sun8i-v3s-ccu.h
index c0d5d5599c87..014ac6123d17 100644
--- a/include/dt-bindings/clock/sun8i-v3s-ccu.h
+++ b/include/dt-bindings/clock/sun8i-v3s-ccu.h
@@ -104,4 +104,8 @@
 
 #define CLK_MIPI_CSI		73
 
+/* Clocks not available on V3s */
+#define CLK_BUS_I2S0		75
+#define CLK_I2S0		76
+
 #endif /* _DT_BINDINGS_CLK_SUN8I_V3S_H_ */
diff --git a/include/dt-bindings/reset/sun8i-v3s-ccu.h b/include/dt-bindings/reset/sun8i-v3s-ccu.h
index b58ef21a2e18..b6790173afd6 100644
--- a/include/dt-bindings/reset/sun8i-v3s-ccu.h
+++ b/include/dt-bindings/reset/sun8i-v3s-ccu.h
@@ -75,4 +75,7 @@
 #define RST_BUS_UART1		50
 #define RST_BUS_UART2		51
 
+/* Reset lines not available on V3s */
+#define RST_BUS_I2S0		52
+
 #endif /* _DT_BINDINGS_RST_SUN8I_H3_H_ */
-- 
2.21.0

