Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17E8B51B0EC
	for <lists+linux-gpio@lfdr.de>; Wed,  4 May 2022 23:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378715AbiEDVhB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 May 2022 17:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378724AbiEDVgv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 May 2022 17:36:51 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24CE951E7F;
        Wed,  4 May 2022 14:33:04 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 874391F44C7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1651699980;
        bh=QlU4T6vy2JVMguglPjkNApy4f/nAKxVa9z3x8f0X1Yc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aaMZkO7Z6RQDZ01LZfmAxOut57WzTtjdJnUiFKNgxsNxZbGM0zQyNHL+vwBVtrqt3
         sNNMzAzA40/kpoTiqPiuogBn4wR/kSIdmS0XEqjshgfaunnyDuK5dYf0ggYiwBWC26
         BC6HDYUDRzw3M13mSwJC+fQMS6lSHVF2eN919PhTawyehGcTlAVzy5wW9mIbNMy1ZD
         i1MBYEgiiFlm1djFhdutMsjbzVhnyLMEt1ie+Ly3RfoAQ3gFlcIixXp7L9EAmTcShm
         6gatldEh1ERKURNB2z7h9Zlbz9LTVl8L8lNO+y13+ZX92+Ycxoz+50EGVLgLMjuLvN
         0msnC1u0E58vQ==
Received: by jupiter.universe (Postfix, from userid 1000)
        id 5D9254819D8; Wed,  4 May 2022 23:32:53 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@lists.collabora.co.uk,
        Jianqun Xu <jay.xu@rock-chips.com>, kernel@collabora.com,
        Shengfei Xu <xsf@rock-chips.com>,
        Damon Ding <damon.ding@rock-chips.com>,
        Steven Liu <steven.liu@rock-chips.com>,
        Jon Lin <jon.lin@rock-chips.com>,
        Finley Xiao <finley.xiao@rock-chips.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv2 19/21] arm64: dts: rockchip: Add rk3588s pinctrl data
Date:   Wed,  4 May 2022 23:32:49 +0200
Message-Id: <20220504213251.264819-20-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220504213251.264819-1-sebastian.reichel@collabora.com>
References: <20220504213251.264819-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Jianqun Xu <jay.xu@rock-chips.com>

This adds the pin controller data for rk3588.

Signed-off-by: Shengfei Xu <xsf@rock-chips.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Signed-off-by: Steven Liu <steven.liu@rock-chips.com>
Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
[port from vendor tree merging all fixes]
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../boot/dts/rockchip/rk3588s-pinctrl.dtsi    | 3403 +++++++++++++++++
 1 file changed, 3403 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-pinctrl.dtsi

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-pinctrl.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-pinctrl.dtsi
new file mode 100644
index 000000000000..48181671eacb
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-pinctrl.dtsi
@@ -0,0 +1,3403 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2021 Rockchip Electronics Co., Ltd.
+ */
+
+#include <dt-bindings/pinctrl/rockchip.h>
+#include "rockchip-pinconf.dtsi"
+
+/*
+ * This file is auto generated by pin2dts tool, please keep these code
+ * by adding changes at end of this file.
+ */
+&pinctrl {
+	auddsm {
+		/omit-if-no-ref/
+		auddsm_pins: auddsm-pins {
+			rockchip,pins =
+				/* auddsm_ln */
+				<3 RK_PA1 4 &pcfg_pull_none>,
+				/* auddsm_lp */
+				<3 RK_PA2 4 &pcfg_pull_none>,
+				/* auddsm_rn */
+				<3 RK_PA3 4 &pcfg_pull_none>,
+				/* auddsm_rp */
+				<3 RK_PA4 4 &pcfg_pull_none>;
+		};
+	};
+
+	bt1120 {
+		/omit-if-no-ref/
+		bt1120_pins: bt1120-pins {
+			rockchip,pins =
+				/* bt1120_clkout */
+				<4 RK_PB0 2 &pcfg_pull_none>,
+				/* bt1120_d0 */
+				<4 RK_PA0 2 &pcfg_pull_none>,
+				/* bt1120_d1 */
+				<4 RK_PA1 2 &pcfg_pull_none>,
+				/* bt1120_d2 */
+				<4 RK_PA2 2 &pcfg_pull_none>,
+				/* bt1120_d3 */
+				<4 RK_PA3 2 &pcfg_pull_none>,
+				/* bt1120_d4 */
+				<4 RK_PA4 2 &pcfg_pull_none>,
+				/* bt1120_d5 */
+				<4 RK_PA5 2 &pcfg_pull_none>,
+				/* bt1120_d6 */
+				<4 RK_PA6 2 &pcfg_pull_none>,
+				/* bt1120_d7 */
+				<4 RK_PA7 2 &pcfg_pull_none>,
+				/* bt1120_d8 */
+				<4 RK_PB2 2 &pcfg_pull_none>,
+				/* bt1120_d9 */
+				<4 RK_PB3 2 &pcfg_pull_none>,
+				/* bt1120_d10 */
+				<4 RK_PB4 2 &pcfg_pull_none>,
+				/* bt1120_d11 */
+				<4 RK_PB5 2 &pcfg_pull_none>,
+				/* bt1120_d12 */
+				<4 RK_PB6 2 &pcfg_pull_none>,
+				/* bt1120_d13 */
+				<4 RK_PB7 2 &pcfg_pull_none>,
+				/* bt1120_d14 */
+				<4 RK_PC0 2 &pcfg_pull_none>,
+				/* bt1120_d15 */
+				<4 RK_PC1 2 &pcfg_pull_none>;
+		};
+	};
+
+	can0 {
+		/omit-if-no-ref/
+		can0m0_pins: can0m0-pins {
+			rockchip,pins =
+				/* can0_rx_m0 */
+				<0 RK_PC0 11 &pcfg_pull_none>,
+				/* can0_tx_m0 */
+				<0 RK_PB7 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		can0m1_pins: can0m1-pins {
+			rockchip,pins =
+				/* can0_rx_m1 */
+				<4 RK_PD5 9 &pcfg_pull_none>,
+				/* can0_tx_m1 */
+				<4 RK_PD4 9 &pcfg_pull_none>;
+		};
+	};
+
+	can1 {
+		/omit-if-no-ref/
+		can1m0_pins: can1m0-pins {
+			rockchip,pins =
+				/* can1_rx_m0 */
+				<3 RK_PB5 9 &pcfg_pull_none>,
+				/* can1_tx_m0 */
+				<3 RK_PB6 9 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		can1m1_pins: can1m1-pins {
+			rockchip,pins =
+				/* can1_rx_m1 */
+				<4 RK_PB2 12 &pcfg_pull_none>,
+				/* can1_tx_m1 */
+				<4 RK_PB3 12 &pcfg_pull_none>;
+		};
+	};
+
+	can2 {
+		/omit-if-no-ref/
+		can2m0_pins: can2m0-pins {
+			rockchip,pins =
+				/* can2_rx_m0 */
+				<3 RK_PC4 9 &pcfg_pull_none>,
+				/* can2_tx_m0 */
+				<3 RK_PC5 9 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		can2m1_pins: can2m1-pins {
+			rockchip,pins =
+				/* can2_rx_m1 */
+				<0 RK_PD4 10 &pcfg_pull_none>,
+				/* can2_tx_m1 */
+				<0 RK_PD5 10 &pcfg_pull_none>;
+		};
+	};
+
+	cif {
+		/omit-if-no-ref/
+		cif_clk: cif-clk {
+			rockchip,pins =
+				/* cif_clkout */
+				<4 RK_PB4 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		cif_dvp_clk: cif-dvp-clk {
+			rockchip,pins =
+				/* cif_clkin */
+				<4 RK_PB0 1 &pcfg_pull_none>,
+				/* cif_href */
+				<4 RK_PB2 1 &pcfg_pull_none>,
+				/* cif_vsync */
+				<4 RK_PB3 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		cif_dvp_bus16: cif-dvp-bus16 {
+			rockchip,pins =
+				/* cif_d8 */
+				<3 RK_PC4 1 &pcfg_pull_none>,
+				/* cif_d9 */
+				<3 RK_PC5 1 &pcfg_pull_none>,
+				/* cif_d10 */
+				<3 RK_PC6 1 &pcfg_pull_none>,
+				/* cif_d11 */
+				<3 RK_PC7 1 &pcfg_pull_none>,
+				/* cif_d12 */
+				<3 RK_PD0 1 &pcfg_pull_none>,
+				/* cif_d13 */
+				<3 RK_PD1 1 &pcfg_pull_none>,
+				/* cif_d14 */
+				<3 RK_PD2 1 &pcfg_pull_none>,
+				/* cif_d15 */
+				<3 RK_PD3 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		cif_dvp_bus8: cif-dvp-bus8 {
+			rockchip,pins =
+				/* cif_d0 */
+				<4 RK_PA0 1 &pcfg_pull_none>,
+				/* cif_d1 */
+				<4 RK_PA1 1 &pcfg_pull_none>,
+				/* cif_d2 */
+				<4 RK_PA2 1 &pcfg_pull_none>,
+				/* cif_d3 */
+				<4 RK_PA3 1 &pcfg_pull_none>,
+				/* cif_d4 */
+				<4 RK_PA4 1 &pcfg_pull_none>,
+				/* cif_d5 */
+				<4 RK_PA5 1 &pcfg_pull_none>,
+				/* cif_d6 */
+				<4 RK_PA6 1 &pcfg_pull_none>,
+				/* cif_d7 */
+				<4 RK_PA7 1 &pcfg_pull_none>;
+		};
+	};
+
+	clk32k {
+		/omit-if-no-ref/
+		clk32k_in: clk32k-in {
+			rockchip,pins =
+				/* clk32k_in */
+				<0 RK_PB2 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		clk32k_out0: clk32k-out0 {
+			rockchip,pins =
+				/* clk32k_out0 */
+				<0 RK_PB2 2 &pcfg_pull_none>;
+		};
+	};
+
+	cpu {
+		/omit-if-no-ref/
+		cpu_pins: cpu-pins {
+			rockchip,pins =
+				/* cpu_big0_avs */
+				<0 RK_PD1 2 &pcfg_pull_none>,
+				/* cpu_big1_avs */
+				<0 RK_PD5 2 &pcfg_pull_none>;
+		};
+	};
+
+	ddrphych0 {
+		/omit-if-no-ref/
+		ddrphych0_pins: ddrphych0-pins {
+			rockchip,pins =
+				/* ddrphych0_dtb0 */
+				<4 RK_PA0 7 &pcfg_pull_none>,
+				/* ddrphych0_dtb1 */
+				<4 RK_PA1 7 &pcfg_pull_none>,
+				/* ddrphych0_dtb2 */
+				<4 RK_PA2 7 &pcfg_pull_none>,
+				/* ddrphych0_dtb3 */
+				<4 RK_PA3 7 &pcfg_pull_none>;
+		};
+	};
+
+	ddrphych1 {
+		/omit-if-no-ref/
+		ddrphych1_pins: ddrphych1-pins {
+			rockchip,pins =
+				/* ddrphych1_dtb0 */
+				<4 RK_PA4 7 &pcfg_pull_none>,
+				/* ddrphych1_dtb1 */
+				<4 RK_PA5 7 &pcfg_pull_none>,
+				/* ddrphych1_dtb2 */
+				<4 RK_PA6 7 &pcfg_pull_none>,
+				/* ddrphych1_dtb3 */
+				<4 RK_PA7 7 &pcfg_pull_none>;
+		};
+	};
+
+	ddrphych2 {
+		/omit-if-no-ref/
+		ddrphych2_pins: ddrphych2-pins {
+			rockchip,pins =
+				/* ddrphych2_dtb0 */
+				<4 RK_PB0 7 &pcfg_pull_none>,
+				/* ddrphych2_dtb1 */
+				<4 RK_PB1 7 &pcfg_pull_none>,
+				/* ddrphych2_dtb2 */
+				<4 RK_PB2 7 &pcfg_pull_none>,
+				/* ddrphych2_dtb3 */
+				<4 RK_PB3 7 &pcfg_pull_none>;
+		};
+	};
+
+	ddrphych3 {
+		/omit-if-no-ref/
+		ddrphych3_pins: ddrphych3-pins {
+			rockchip,pins =
+				/* ddrphych3_dtb0 */
+				<4 RK_PB4 7 &pcfg_pull_none>,
+				/* ddrphych3_dtb1 */
+				<4 RK_PB5 7 &pcfg_pull_none>,
+				/* ddrphych3_dtb2 */
+				<4 RK_PB6 7 &pcfg_pull_none>,
+				/* ddrphych3_dtb3 */
+				<4 RK_PB7 7 &pcfg_pull_none>;
+		};
+	};
+
+	dp0 {
+		/omit-if-no-ref/
+		dp0m0_pins: dp0m0-pins {
+			rockchip,pins =
+				/* dp0_hpdin_m0 */
+				<4 RK_PB4 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		dp0m1_pins: dp0m1-pins {
+			rockchip,pins =
+				/* dp0_hpdin_m1 */
+				<0 RK_PC4 10 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		dp0m2_pins: dp0m2-pins {
+			rockchip,pins =
+				/* dp0_hpdin_m2 */
+				<1 RK_PA0 5 &pcfg_pull_none>;
+		};
+	};
+
+	dp1 {
+		/omit-if-no-ref/
+		dp1m0_pins: dp1m0-pins {
+			rockchip,pins =
+				/* dp1_hpdin_m0 */
+				<3 RK_PD5 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		dp1m1_pins: dp1m1-pins {
+			rockchip,pins =
+				/* dp1_hpdin_m1 */
+				<0 RK_PC5 10 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		dp1m2_pins: dp1m2-pins {
+			rockchip,pins =
+				/* dp1_hpdin_m2 */
+				<1 RK_PA1 5 &pcfg_pull_none>;
+		};
+	};
+
+	emmc {
+		/omit-if-no-ref/
+		emmc_rstnout: emmc-rstnout {
+			rockchip,pins =
+				/* emmc_rstn */
+				<2 RK_PA3 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		emmc_bus8: emmc-bus8 {
+			rockchip,pins =
+				/* emmc_d0 */
+				<2 RK_PD0 1 &pcfg_pull_up_drv_level_2>,
+				/* emmc_d1 */
+				<2 RK_PD1 1 &pcfg_pull_up_drv_level_2>,
+				/* emmc_d2 */
+				<2 RK_PD2 1 &pcfg_pull_up_drv_level_2>,
+				/* emmc_d3 */
+				<2 RK_PD3 1 &pcfg_pull_up_drv_level_2>,
+				/* emmc_d4 */
+				<2 RK_PD4 1 &pcfg_pull_up_drv_level_2>,
+				/* emmc_d5 */
+				<2 RK_PD5 1 &pcfg_pull_up_drv_level_2>,
+				/* emmc_d6 */
+				<2 RK_PD6 1 &pcfg_pull_up_drv_level_2>,
+				/* emmc_d7 */
+				<2 RK_PD7 1 &pcfg_pull_up_drv_level_2>;
+		};
+
+		/omit-if-no-ref/
+		emmc_clk: emmc-clk {
+			rockchip,pins =
+				/* emmc_clkout */
+				<2 RK_PA1 1 &pcfg_pull_up_drv_level_2>;
+		};
+
+		/omit-if-no-ref/
+		emmc_cmd: emmc-cmd {
+			rockchip,pins =
+				/* emmc_cmd */
+				<2 RK_PA0 1 &pcfg_pull_up_drv_level_2>;
+		};
+
+		/omit-if-no-ref/
+		emmc_data_strobe: emmc-data-strobe {
+			rockchip,pins =
+				/* emmc_data_strobe */
+				<2 RK_PA2 1 &pcfg_pull_none>;
+		};
+	};
+
+	eth1 {
+		/omit-if-no-ref/
+		eth1_pins: eth1-pins {
+			rockchip,pins =
+				/* eth1_refclko_25m */
+				<3 RK_PA6 1 &pcfg_pull_none>;
+		};
+	};
+
+	fspi {
+		/omit-if-no-ref/
+		fspim0_pins: fspim0-pins {
+			rockchip,pins =
+				/* fspi_clk_m0 */
+				<2 RK_PA0 2 &pcfg_pull_up_drv_level_2>,
+				/* fspi_cs0n_m0 */
+				<2 RK_PD6 2 &pcfg_pull_up_drv_level_2>,
+				/* fspi_d0_m0 */
+				<2 RK_PD0 2 &pcfg_pull_up_drv_level_2>,
+				/* fspi_d1_m0 */
+				<2 RK_PD1 2 &pcfg_pull_up_drv_level_2>,
+				/* fspi_d2_m0 */
+				<2 RK_PD2 2 &pcfg_pull_up_drv_level_2>,
+				/* fspi_d3_m0 */
+				<2 RK_PD3 2 &pcfg_pull_up_drv_level_2>;
+		};
+
+		/omit-if-no-ref/
+		fspim0_cs1: fspim0-cs1 {
+			rockchip,pins =
+				/* fspi_cs1n_m0 */
+				<2 RK_PD7 2 &pcfg_pull_up_drv_level_2>;
+		};
+
+		/omit-if-no-ref/
+		fspim2_pins: fspim2-pins {
+			rockchip,pins =
+				/* fspi_clk_m2 */
+				<3 RK_PA5 5 &pcfg_pull_up_drv_level_2>,
+				/* fspi_cs0n_m2 */
+				<3 RK_PC4 2 &pcfg_pull_up_drv_level_2>,
+				/* fspi_d0_m2 */
+				<3 RK_PA0 5 &pcfg_pull_up_drv_level_2>,
+				/* fspi_d1_m2 */
+				<3 RK_PA1 5 &pcfg_pull_up_drv_level_2>,
+				/* fspi_d2_m2 */
+				<3 RK_PA2 5 &pcfg_pull_up_drv_level_2>,
+				/* fspi_d3_m2 */
+				<3 RK_PA3 5 &pcfg_pull_up_drv_level_2>;
+		};
+
+		/omit-if-no-ref/
+		fspim2_cs1: fspim2-cs1 {
+			rockchip,pins =
+				/* fspi_cs1n_m2 */
+				<3 RK_PC5 2 &pcfg_pull_up_drv_level_2>;
+		};
+	};
+
+	gmac1 {
+		/omit-if-no-ref/
+		gmac1_miim: gmac1-miim {
+			rockchip,pins =
+				/* gmac1_mdc */
+				<3 RK_PC2 1 &pcfg_pull_none>,
+				/* gmac1_mdio */
+				<3 RK_PC3 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		gmac1_clkinout: gmac1-clkinout {
+			rockchip,pins =
+				/* gmac1_mclkinout */
+				<3 RK_PB6 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		gmac1_rx_bus2: gmac1-rx-bus2 {
+			rockchip,pins =
+				/* gmac1_rxd0 */
+				<3 RK_PA7 1 &pcfg_pull_none>,
+				/* gmac1_rxd1 */
+				<3 RK_PB0 1 &pcfg_pull_none>,
+				/* gmac1_rxdv_crs */
+				<3 RK_PB1 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		gmac1_tx_bus2: gmac1-tx-bus2 {
+			rockchip,pins =
+				/* gmac1_txd0 */
+				<3 RK_PB3 1 &pcfg_pull_none>,
+				/* gmac1_txd1 */
+				<3 RK_PB4 1 &pcfg_pull_none>,
+				/* gmac1_txen */
+				<3 RK_PB5 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		gmac1_rgmii_clk: gmac1-rgmii-clk {
+			rockchip,pins =
+				/* gmac1_rxclk */
+				<3 RK_PA5 1 &pcfg_pull_none>,
+				/* gmac1_txclk */
+				<3 RK_PA4 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		gmac1_rgmii_bus: gmac1-rgmii-bus {
+			rockchip,pins =
+				/* gmac1_rxd2 */
+				<3 RK_PA2 1 &pcfg_pull_none>,
+				/* gmac1_rxd3 */
+				<3 RK_PA3 1 &pcfg_pull_none>,
+				/* gmac1_txd2 */
+				<3 RK_PA0 1 &pcfg_pull_none>,
+				/* gmac1_txd3 */
+				<3 RK_PA1 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		gmac1_ppsclk: gmac1-ppsclk {
+			rockchip,pins =
+				/* gmac1_ppsclk */
+				<3 RK_PC1 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		gmac1_ppstrig: gmac1-ppstrig {
+			rockchip,pins =
+				/* gmac1_ppstrig */
+				<3 RK_PC0 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		gmac1_ptp_ref_clk: gmac1-ptp-ref-clk {
+			rockchip,pins =
+				/* gmac1_ptp_ref_clk */
+				<3 RK_PB7 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		gmac1_txer: gmac1-txer {
+			rockchip,pins =
+				/* gmac1_txer */
+				<3 RK_PB2 1 &pcfg_pull_none>;
+		};
+	};
+
+	gpu {
+		/omit-if-no-ref/
+		gpu_pins: gpu-pins {
+			rockchip,pins =
+				/* gpu_avs */
+				<0 RK_PC5 2 &pcfg_pull_none>;
+		};
+	};
+
+	hdmi {
+		/omit-if-no-ref/
+		hdmim0_rx_cec: hdmim0-rx-cec {
+			rockchip,pins =
+				/* hdmim0_rx_cec */
+				<4 RK_PB5 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim0_rx_hpdin: hdmim0-rx-hpdin {
+			rockchip,pins =
+				/* hdmim0_rx_hpdin */
+				<4 RK_PB6 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim0_rx_scl: hdmim0-rx-scl {
+			rockchip,pins =
+				/* hdmim0_rx_scl */
+				<0 RK_PD2 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim0_rx_sda: hdmim0-rx-sda {
+			rockchip,pins =
+				/* hdmim0_rx_sda */
+				<0 RK_PD1 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim0_tx0_cec: hdmim0-tx0-cec {
+			rockchip,pins =
+				/* hdmim0_tx0_cec */
+				<4 RK_PC1 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim0_tx0_hpd: hdmim0-tx0-hpd {
+			rockchip,pins =
+				/* hdmim0_tx0_hpd */
+				<1 RK_PA5 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim0_tx0_scl: hdmim0-tx0-scl {
+			rockchip,pins =
+				/* hdmim0_tx0_scl */
+				<4 RK_PB7 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim0_tx0_sda: hdmim0-tx0-sda {
+			rockchip,pins =
+				/* hdmim0_tx0_sda */
+				<4 RK_PC0 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim0_tx1_hpd: hdmim0-tx1-hpd {
+			rockchip,pins =
+				/* hdmim0_tx1_hpd */
+				<1 RK_PA6 5 &pcfg_pull_none>;
+		};
+		/omit-if-no-ref/
+		hdmim1_rx_cec: hdmim1-rx-cec {
+			rockchip,pins =
+				/* hdmim1_rx_cec */
+				<3 RK_PD1 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim1_rx_hpdin: hdmim1-rx-hpdin {
+			rockchip,pins =
+				/* hdmim1_rx_hpdin */
+				<3 RK_PD4 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim1_rx_scl: hdmim1-rx-scl {
+			rockchip,pins =
+				/* hdmim1_rx_scl */
+				<3 RK_PD2 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim1_rx_sda: hdmim1-rx-sda {
+			rockchip,pins =
+				/* hdmim1_rx_sda */
+				<3 RK_PD3 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim1_tx0_cec: hdmim1-tx0-cec {
+			rockchip,pins =
+				/* hdmim1_tx0_cec */
+				<0 RK_PD1 13 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim1_tx0_hpd: hdmim1-tx0-hpd {
+			rockchip,pins =
+				/* hdmim1_tx0_hpd */
+				<3 RK_PD4 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim1_tx0_scl: hdmim1-tx0-scl {
+			rockchip,pins =
+				/* hdmim1_tx0_scl */
+				<0 RK_PD5 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim1_tx0_sda: hdmim1-tx0-sda {
+			rockchip,pins =
+				/* hdmim1_tx0_sda */
+				<0 RK_PD4 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim1_tx1_cec: hdmim1-tx1-cec {
+			rockchip,pins =
+				/* hdmim1_tx1_cec */
+				<0 RK_PD2 13 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim1_tx1_hpd: hdmim1-tx1-hpd {
+			rockchip,pins =
+				/* hdmim1_tx1_hpd */
+				<3 RK_PB7 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim1_tx1_scl: hdmim1-tx1-scl {
+			rockchip,pins =
+				/* hdmim1_tx1_scl */
+				<3 RK_PC6 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim1_tx1_sda: hdmim1-tx1-sda {
+			rockchip,pins =
+				/* hdmim1_tx1_sda */
+				<3 RK_PC5 5 &pcfg_pull_none>;
+		};
+		/omit-if-no-ref/
+		hdmim2_rx_cec: hdmim2-rx-cec {
+			rockchip,pins =
+				/* hdmim2_rx_cec */
+				<1 RK_PB7 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim2_rx_hpdin: hdmim2-rx-hpdin {
+			rockchip,pins =
+				/* hdmim2_rx_hpdin */
+				<1 RK_PB6 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim2_rx_scl: hdmim2-rx-scl {
+			rockchip,pins =
+				/* hdmim2_rx_scl */
+				<1 RK_PD6 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim2_rx_sda: hdmim2-rx-sda {
+			rockchip,pins =
+				/* hdmim2_rx_sda */
+				<1 RK_PD7 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim2_tx0_scl: hdmim2-tx0-scl {
+			rockchip,pins =
+				/* hdmim2_tx0_scl */
+				<3 RK_PC7 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim2_tx0_sda: hdmim2-tx0-sda {
+			rockchip,pins =
+				/* hdmim2_tx0_sda */
+				<3 RK_PD0 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim2_tx1_cec: hdmim2-tx1-cec {
+			rockchip,pins =
+				/* hdmim2_tx1_cec */
+				<3 RK_PC4 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim2_tx1_scl: hdmim2-tx1-scl {
+			rockchip,pins =
+				/* hdmim2_tx1_scl */
+				<1 RK_PA4 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmim2_tx1_sda: hdmim2-tx1-sda {
+			rockchip,pins =
+				/* hdmim2_tx1_sda */
+				<1 RK_PA3 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmi_debug0: hdmi-debug0 {
+			rockchip,pins =
+				/* hdmi_debug0 */
+				<1 RK_PA7 7 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmi_debug1: hdmi-debug1 {
+			rockchip,pins =
+				/* hdmi_debug1 */
+				<1 RK_PB0 7 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmi_debug2: hdmi-debug2 {
+			rockchip,pins =
+				/* hdmi_debug2 */
+				<1 RK_PB1 7 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmi_debug3: hdmi-debug3 {
+			rockchip,pins =
+				/* hdmi_debug3 */
+				<1 RK_PB2 7 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmi_debug4: hdmi-debug4 {
+			rockchip,pins =
+				/* hdmi_debug4 */
+				<1 RK_PB3 7 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmi_debug5: hdmi-debug5 {
+			rockchip,pins =
+				/* hdmi_debug5 */
+				<1 RK_PB4 7 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		hdmi_debug6: hdmi-debug6 {
+			rockchip,pins =
+				/* hdmi_debug6 */
+				<1 RK_PA0 7 &pcfg_pull_none>;
+		};
+	};
+
+	i2c0 {
+		/omit-if-no-ref/
+		i2c0m0_xfer: i2c0m0-xfer {
+			rockchip,pins =
+				/* i2c0_scl_m0 */
+				<0 RK_PB3 2 &pcfg_pull_none_smt>,
+				/* i2c0_sda_m0 */
+				<0 RK_PA6 2 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c0m2_xfer: i2c0m2-xfer {
+			rockchip,pins =
+				/* i2c0_scl_m2 */
+				<0 RK_PD1 3 &pcfg_pull_none_smt>,
+				/* i2c0_sda_m2 */
+				<0 RK_PD2 3 &pcfg_pull_none_smt>;
+		};
+	};
+
+	i2c1 {
+		/omit-if-no-ref/
+		i2c1m0_xfer: i2c1m0-xfer {
+			rockchip,pins =
+				/* i2c1_scl_m0 */
+				<0 RK_PB5 9 &pcfg_pull_none_smt>,
+				/* i2c1_sda_m0 */
+				<0 RK_PB6 9 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c1m1_xfer: i2c1m1-xfer {
+			rockchip,pins =
+				/* i2c1_scl_m1 */
+				<0 RK_PB0 2 &pcfg_pull_none_smt>,
+				/* i2c1_sda_m1 */
+				<0 RK_PB1 2 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c1m2_xfer: i2c1m2-xfer {
+			rockchip,pins =
+				/* i2c1_scl_m2 */
+				<0 RK_PD4 9 &pcfg_pull_none_smt>,
+				/* i2c1_sda_m2 */
+				<0 RK_PD5 9 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c1m3_xfer: i2c1m3-xfer {
+			rockchip,pins =
+				/* i2c1_scl_m3 */
+				<2 RK_PD4 9 &pcfg_pull_none_smt>,
+				/* i2c1_sda_m3 */
+				<2 RK_PD5 9 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c1m4_xfer: i2c1m4-xfer {
+			rockchip,pins =
+				/* i2c1_scl_m4 */
+				<1 RK_PD2 9 &pcfg_pull_none_smt>,
+				/* i2c1_sda_m4 */
+				<1 RK_PD3 9 &pcfg_pull_none_smt>;
+		};
+	};
+
+	i2c2 {
+		/omit-if-no-ref/
+		i2c2m0_xfer: i2c2m0-xfer {
+			rockchip,pins =
+				/* i2c2_scl_m0 */
+				<0 RK_PB7 9 &pcfg_pull_none_smt>,
+				/* i2c2_sda_m0 */
+				<0 RK_PC0 9 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c2m2_xfer: i2c2m2-xfer {
+			rockchip,pins =
+				/* i2c2_scl_m2 */
+				<2 RK_PA3 9 &pcfg_pull_none_smt>,
+				/* i2c2_sda_m2 */
+				<2 RK_PA2 9 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c2m3_xfer: i2c2m3-xfer {
+			rockchip,pins =
+				/* i2c2_scl_m3 */
+				<1 RK_PC5 9 &pcfg_pull_none_smt>,
+				/* i2c2_sda_m3 */
+				<1 RK_PC4 9 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c2m4_xfer: i2c2m4-xfer {
+			rockchip,pins =
+				/* i2c2_scl_m4 */
+				<1 RK_PA1 9 &pcfg_pull_none_smt>,
+				/* i2c2_sda_m4 */
+				<1 RK_PA0 9 &pcfg_pull_none_smt>;
+		};
+	};
+
+	i2c3 {
+		/omit-if-no-ref/
+		i2c3m0_xfer: i2c3m0-xfer {
+			rockchip,pins =
+				/* i2c3_scl_m0 */
+				<1 RK_PC1 9 &pcfg_pull_none_smt>,
+				/* i2c3_sda_m0 */
+				<1 RK_PC0 9 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c3m1_xfer: i2c3m1-xfer {
+			rockchip,pins =
+				/* i2c3_scl_m1 */
+				<3 RK_PB7 9 &pcfg_pull_none_smt>,
+				/* i2c3_sda_m1 */
+				<3 RK_PC0 9 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c3m2_xfer: i2c3m2-xfer {
+			rockchip,pins =
+				/* i2c3_scl_m2 */
+				<4 RK_PA4 9 &pcfg_pull_none_smt>,
+				/* i2c3_sda_m2 */
+				<4 RK_PA5 9 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c3m4_xfer: i2c3m4-xfer {
+			rockchip,pins =
+				/* i2c3_scl_m4 */
+				<4 RK_PD0 9 &pcfg_pull_none_smt>,
+				/* i2c3_sda_m4 */
+				<4 RK_PD1 9 &pcfg_pull_none_smt>;
+		};
+	};
+
+	i2c4 {
+		/omit-if-no-ref/
+		i2c4m0_xfer: i2c4m0-xfer {
+			rockchip,pins =
+				/* i2c4_scl_m0 */
+				<3 RK_PA6 9 &pcfg_pull_none_smt>,
+				/* i2c4_sda_m0 */
+				<3 RK_PA5 9 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c4m2_xfer: i2c4m2-xfer {
+			rockchip,pins =
+				/* i2c4_scl_m2 */
+				<0 RK_PC5 9 &pcfg_pull_none_smt>,
+				/* i2c4_sda_m2 */
+				<0 RK_PC4 9 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c4m3_xfer: i2c4m3-xfer {
+			rockchip,pins =
+				/* i2c4_scl_m3 */
+				<1 RK_PA3 9 &pcfg_pull_none_smt>,
+				/* i2c4_sda_m3 */
+				<1 RK_PA2 9 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c4m4_xfer: i2c4m4-xfer {
+			rockchip,pins =
+				/* i2c4_scl_m4 */
+				<1 RK_PC7 9 &pcfg_pull_none_smt>,
+				/* i2c4_sda_m4 */
+				<1 RK_PC6 9 &pcfg_pull_none_smt>;
+		};
+	};
+
+	i2c5 {
+		/omit-if-no-ref/
+		i2c5m0_xfer: i2c5m0-xfer {
+			rockchip,pins =
+				/* i2c5_scl_m0 */
+				<3 RK_PC7 9 &pcfg_pull_none_smt>,
+				/* i2c5_sda_m0 */
+				<3 RK_PD0 9 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c5m1_xfer: i2c5m1-xfer {
+			rockchip,pins =
+				/* i2c5_scl_m1 */
+				<4 RK_PB6 9 &pcfg_pull_none_smt>,
+				/* i2c5_sda_m1 */
+				<4 RK_PB7 9 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c5m2_xfer: i2c5m2-xfer {
+			rockchip,pins =
+				/* i2c5_scl_m2 */
+				<4 RK_PA6 9 &pcfg_pull_none_smt>,
+				/* i2c5_sda_m2 */
+				<4 RK_PA7 9 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c5m3_xfer: i2c5m3-xfer {
+			rockchip,pins =
+				/* i2c5_scl_m3 */
+				<1 RK_PB6 9 &pcfg_pull_none_smt>,
+				/* i2c5_sda_m3 */
+				<1 RK_PB7 9 &pcfg_pull_none_smt>;
+		};
+	};
+
+	i2c6 {
+		/omit-if-no-ref/
+		i2c6m0_xfer: i2c6m0-xfer {
+			rockchip,pins =
+				/* i2c6_scl_m0 */
+				<0 RK_PD0 9 &pcfg_pull_none_smt>,
+				/* i2c6_sda_m0 */
+				<0 RK_PC7 9 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c6m1_xfer: i2c6m1-xfer {
+			rockchip,pins =
+				/* i2c6_scl_m1 */
+				<1 RK_PC3 9 &pcfg_pull_none_smt>,
+				/* i2c6_sda_m1 */
+				<1 RK_PC2 9 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c6m3_xfer: i2c6m3-xfer {
+			rockchip,pins =
+				/* i2c6_scl_m3 */
+				<4 RK_PB1 9 &pcfg_pull_none_smt>,
+				/* i2c6_sda_m3 */
+				<4 RK_PB0 9 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c6m4_xfer: i2c6m4-xfer {
+			rockchip,pins =
+				/* i2c6_scl_m4 */
+				<3 RK_PA1 9 &pcfg_pull_none_smt>,
+				/* i2c6_sda_m4 */
+				<3 RK_PA0 9 &pcfg_pull_none_smt>;
+		};
+	};
+
+	i2c7 {
+		/omit-if-no-ref/
+		i2c7m0_xfer: i2c7m0-xfer {
+			rockchip,pins =
+				/* i2c7_scl_m0 */
+				<1 RK_PD0 9 &pcfg_pull_none_smt>,
+				/* i2c7_sda_m0 */
+				<1 RK_PD1 9 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c7m2_xfer: i2c7m2-xfer {
+			rockchip,pins =
+				/* i2c7_scl_m2 */
+				<3 RK_PD2 9 &pcfg_pull_none_smt>,
+				/* i2c7_sda_m2 */
+				<3 RK_PD3 9 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c7m3_xfer: i2c7m3-xfer {
+			rockchip,pins =
+				/* i2c7_scl_m3 */
+				<4 RK_PB2 9 &pcfg_pull_none_smt>,
+				/* i2c7_sda_m3 */
+				<4 RK_PB3 9 &pcfg_pull_none_smt>;
+		};
+	};
+
+	i2c8 {
+		/omit-if-no-ref/
+		i2c8m0_xfer: i2c8m0-xfer {
+			rockchip,pins =
+				/* i2c8_scl_m0 */
+				<4 RK_PD2 9 &pcfg_pull_none_smt>,
+				/* i2c8_sda_m0 */
+				<4 RK_PD3 9 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c8m2_xfer: i2c8m2-xfer {
+			rockchip,pins =
+				/* i2c8_scl_m2 */
+				<1 RK_PD6 9 &pcfg_pull_none_smt>,
+				/* i2c8_sda_m2 */
+				<1 RK_PD7 9 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c8m3_xfer: i2c8m3-xfer {
+			rockchip,pins =
+				/* i2c8_scl_m3 */
+				<4 RK_PC0 9 &pcfg_pull_none_smt>,
+				/* i2c8_sda_m3 */
+				<4 RK_PC1 9 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c8m4_xfer: i2c8m4-xfer {
+			rockchip,pins =
+				/* i2c8_scl_m4 */
+				<3 RK_PC2 9 &pcfg_pull_none_smt>,
+				/* i2c8_sda_m4 */
+				<3 RK_PC3 9 &pcfg_pull_none_smt>;
+		};
+	};
+
+	i2s0 {
+		/omit-if-no-ref/
+		i2s0_lrck: i2s0-lrck {
+			rockchip,pins =
+				/* i2s0_lrck */
+				<1 RK_PC5 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s0_mclk: i2s0-mclk {
+			rockchip,pins =
+				/* i2s0_mclk */
+				<1 RK_PC2 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s0_sclk: i2s0-sclk {
+			rockchip,pins =
+				/* i2s0_sclk */
+				<1 RK_PC3 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s0_sdi0: i2s0-sdi0 {
+			rockchip,pins =
+				/* i2s0_sdi0 */
+				<1 RK_PD4 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s0_sdi1: i2s0-sdi1 {
+			rockchip,pins =
+				/* i2s0_sdi1 */
+				<1 RK_PD3 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s0_sdi2: i2s0-sdi2 {
+			rockchip,pins =
+				/* i2s0_sdi2 */
+				<1 RK_PD2 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s0_sdi3: i2s0-sdi3 {
+			rockchip,pins =
+				/* i2s0_sdi3 */
+				<1 RK_PD1 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s0_sdo0: i2s0-sdo0 {
+			rockchip,pins =
+				/* i2s0_sdo0 */
+				<1 RK_PC7 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s0_sdo1: i2s0-sdo1 {
+			rockchip,pins =
+				/* i2s0_sdo1 */
+				<1 RK_PD0 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s0_sdo2: i2s0-sdo2 {
+			rockchip,pins =
+				/* i2s0_sdo2 */
+				<1 RK_PD1 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s0_sdo3: i2s0-sdo3 {
+			rockchip,pins =
+				/* i2s0_sdo3 */
+				<1 RK_PD2 1 &pcfg_pull_none>;
+		};
+	};
+
+	i2s1 {
+		/omit-if-no-ref/
+		i2s1m0_lrck: i2s1m0-lrck {
+			rockchip,pins =
+				/* i2s1m0_lrck */
+				<4 RK_PA2 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s1m0_mclk: i2s1m0-mclk {
+			rockchip,pins =
+				/* i2s1m0_mclk */
+				<4 RK_PA0 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s1m0_sclk: i2s1m0-sclk {
+			rockchip,pins =
+				/* i2s1m0_sclk */
+				<4 RK_PA1 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s1m0_sdi0: i2s1m0-sdi0 {
+			rockchip,pins =
+				/* i2s1m0_sdi0 */
+				<4 RK_PA5 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s1m0_sdi1: i2s1m0-sdi1 {
+			rockchip,pins =
+				/* i2s1m0_sdi1 */
+				<4 RK_PA6 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s1m0_sdi2: i2s1m0-sdi2 {
+			rockchip,pins =
+				/* i2s1m0_sdi2 */
+				<4 RK_PA7 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s1m0_sdi3: i2s1m0-sdi3 {
+			rockchip,pins =
+				/* i2s1m0_sdi3 */
+				<4 RK_PB0 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s1m0_sdo0: i2s1m0-sdo0 {
+			rockchip,pins =
+				/* i2s1m0_sdo0 */
+				<4 RK_PB1 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s1m0_sdo1: i2s1m0-sdo1 {
+			rockchip,pins =
+				/* i2s1m0_sdo1 */
+				<4 RK_PB2 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s1m0_sdo2: i2s1m0-sdo2 {
+			rockchip,pins =
+				/* i2s1m0_sdo2 */
+				<4 RK_PB3 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s1m0_sdo3: i2s1m0-sdo3 {
+			rockchip,pins =
+				/* i2s1m0_sdo3 */
+				<4 RK_PB4 3 &pcfg_pull_none>;
+		};
+		/omit-if-no-ref/
+		i2s1m1_lrck: i2s1m1-lrck {
+			rockchip,pins =
+				/* i2s1m1_lrck */
+				<0 RK_PB7 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s1m1_mclk: i2s1m1-mclk {
+			rockchip,pins =
+				/* i2s1m1_mclk */
+				<0 RK_PB5 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s1m1_sclk: i2s1m1-sclk {
+			rockchip,pins =
+				/* i2s1m1_sclk */
+				<0 RK_PB6 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s1m1_sdi0: i2s1m1-sdi0 {
+			rockchip,pins =
+				/* i2s1m1_sdi0 */
+				<0 RK_PC5 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s1m1_sdi1: i2s1m1-sdi1 {
+			rockchip,pins =
+				/* i2s1m1_sdi1 */
+				<0 RK_PC6 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s1m1_sdi2: i2s1m1-sdi2 {
+			rockchip,pins =
+				/* i2s1m1_sdi2 */
+				<0 RK_PC7 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s1m1_sdi3: i2s1m1-sdi3 {
+			rockchip,pins =
+				/* i2s1m1_sdi3 */
+				<0 RK_PD0 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s1m1_sdo0: i2s1m1-sdo0 {
+			rockchip,pins =
+				/* i2s1m1_sdo0 */
+				<0 RK_PD1 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s1m1_sdo1: i2s1m1-sdo1 {
+			rockchip,pins =
+				/* i2s1m1_sdo1 */
+				<0 RK_PD2 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s1m1_sdo2: i2s1m1-sdo2 {
+			rockchip,pins =
+				/* i2s1m1_sdo2 */
+				<0 RK_PD4 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s1m1_sdo3: i2s1m1-sdo3 {
+			rockchip,pins =
+				/* i2s1m1_sdo3 */
+				<0 RK_PD5 1 &pcfg_pull_none>;
+		};
+	};
+
+	i2s2 {
+		/omit-if-no-ref/
+		i2s2m1_lrck: i2s2m1-lrck {
+			rockchip,pins =
+				/* i2s2m1_lrck */
+				<3 RK_PB6 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s2m1_mclk: i2s2m1-mclk {
+			rockchip,pins =
+				/* i2s2m1_mclk */
+				<3 RK_PB4 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s2m1_sclk: i2s2m1-sclk {
+			rockchip,pins =
+				/* i2s2m1_sclk */
+				<3 RK_PB5 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s2m1_sdi: i2s2m1-sdi {
+			rockchip,pins =
+				/* i2s2m1_sdi */
+				<3 RK_PB2 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s2m1_sdo: i2s2m1-sdo {
+			rockchip,pins =
+				/* i2s2m1_sdo */
+				<3 RK_PB3 3 &pcfg_pull_none>;
+		};
+	};
+
+	i2s3 {
+		/omit-if-no-ref/
+		i2s3_lrck: i2s3-lrck {
+			rockchip,pins =
+				/* i2s3_lrck */
+				<3 RK_PA2 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s3_mclk: i2s3-mclk {
+			rockchip,pins =
+				/* i2s3_mclk */
+				<3 RK_PA0 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s3_sclk: i2s3-sclk {
+			rockchip,pins =
+				/* i2s3_sclk */
+				<3 RK_PA1 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s3_sdi: i2s3-sdi {
+			rockchip,pins =
+				/* i2s3_sdi */
+				<3 RK_PA4 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		i2s3_sdo: i2s3-sdo {
+			rockchip,pins =
+				/* i2s3_sdo */
+				<3 RK_PA3 3 &pcfg_pull_none>;
+		};
+	};
+
+	jtag {
+		/omit-if-no-ref/
+		jtagm0_pins: jtagm0-pins {
+			rockchip,pins =
+				/* jtag_tck_m0 */
+				<4 RK_PD2 5 &pcfg_pull_none>,
+				/* jtag_tms_m0 */
+				<4 RK_PD3 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		jtagm1_pins: jtagm1-pins {
+			rockchip,pins =
+				/* jtag_tck_m1 */
+				<4 RK_PD0 5 &pcfg_pull_none>,
+				/* jtag_tms_m1 */
+				<4 RK_PD1 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		jtagm2_pins: jtagm2-pins {
+			rockchip,pins =
+				/* jtag_tck_m2 */
+				<0 RK_PB5 2 &pcfg_pull_none>,
+				/* jtag_tms_m2 */
+				<0 RK_PB6 2 &pcfg_pull_none>;
+		};
+	};
+
+	litcpu {
+		/omit-if-no-ref/
+		litcpu_pins: litcpu-pins {
+			rockchip,pins =
+				/* litcpu_avs */
+				<0 RK_PD3 1 &pcfg_pull_none>;
+		};
+	};
+
+	mcu {
+		/omit-if-no-ref/
+		mcum0_pins: mcum0-pins {
+			rockchip,pins =
+				/* mcu_jtag_tck_m0 */
+				<4 RK_PD4 5 &pcfg_pull_none>,
+				/* mcu_jtag_tms_m0 */
+				<4 RK_PD5 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		mcum1_pins: mcum1-pins {
+			rockchip,pins =
+				/* mcu_jtag_tck_m1 */
+				<3 RK_PD4 6 &pcfg_pull_none>,
+				/* mcu_jtag_tms_m1 */
+				<3 RK_PD5 6 &pcfg_pull_none>;
+		};
+	};
+
+	mipi {
+		/omit-if-no-ref/
+		mipim0_camera0_clk: mipim0-camera0-clk {
+			rockchip,pins =
+				/* mipim0_camera0_clk */
+				<4 RK_PB1 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		mipim0_camera1_clk: mipim0-camera1-clk {
+			rockchip,pins =
+				/* mipim0_camera1_clk */
+				<1 RK_PB6 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		mipim0_camera2_clk: mipim0-camera2-clk {
+			rockchip,pins =
+				/* mipim0_camera2_clk */
+				<1 RK_PB7 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		mipim0_camera3_clk: mipim0-camera3-clk {
+			rockchip,pins =
+				/* mipim0_camera3_clk */
+				<1 RK_PD6 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		mipim0_camera4_clk: mipim0-camera4-clk {
+			rockchip,pins =
+				/* mipim0_camera4_clk */
+				<1 RK_PD7 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		mipim1_camera0_clk: mipim1-camera0-clk {
+			rockchip,pins =
+				/* mipim1_camera0_clk */
+				<3 RK_PA5 4 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		mipim1_camera1_clk: mipim1-camera1-clk {
+			rockchip,pins =
+				/* mipim1_camera1_clk */
+				<3 RK_PA6 4 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		mipim1_camera2_clk: mipim1-camera2-clk {
+			rockchip,pins =
+				/* mipim1_camera2_clk */
+				<3 RK_PA7 4 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		mipim1_camera3_clk: mipim1-camera3-clk {
+			rockchip,pins =
+				/* mipim1_camera3_clk */
+				<3 RK_PB0 4 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		mipim1_camera4_clk: mipim1-camera4-clk {
+			rockchip,pins =
+				/* mipim1_camera4_clk */
+				<3 RK_PB1 4 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		mipi_te0: mipi-te0 {
+			rockchip,pins =
+				/* mipi_te0 */
+				<3 RK_PC2 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		mipi_te1: mipi-te1 {
+			rockchip,pins =
+				/* mipi_te1 */
+				<3 RK_PC3 2 &pcfg_pull_none>;
+		};
+	};
+
+	npu {
+		/omit-if-no-ref/
+		npu_pins: npu-pins {
+			rockchip,pins =
+				/* npu_avs */
+				<0 RK_PC6 2 &pcfg_pull_none>;
+		};
+	};
+
+	pcie20x1 {
+		/omit-if-no-ref/
+		pcie20x1m0_pins: pcie20x1m0-pins {
+			rockchip,pins =
+				/* pcie20x1_2_clkreqn_m0 */
+				<3 RK_PC7 4 &pcfg_pull_none>,
+				/* pcie20x1_2_perstn_m0 */
+				<3 RK_PD1 4 &pcfg_pull_none>,
+				/* pcie20x1_2_waken_m0 */
+				<3 RK_PD0 4 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pcie20x1m1_pins: pcie20x1m1-pins {
+			rockchip,pins =
+				/* pcie20x1_2_clkreqn_m1 */
+				<4 RK_PB7 4 &pcfg_pull_none>,
+				/* pcie20x1_2_perstn_m1 */
+				<4 RK_PC1 4 &pcfg_pull_none>,
+				/* pcie20x1_2_waken_m1 */
+				<4 RK_PC0 4 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pcie20x1_2_button_rstn: pcie20x1-2-button-rstn {
+			rockchip,pins =
+				/* pcie20x1_2_button_rstn */
+				<4 RK_PB3 4 &pcfg_pull_none>;
+		};
+	};
+
+	pcie30phy {
+		/omit-if-no-ref/
+		pcie30phy_pins: pcie30phy-pins {
+			rockchip,pins =
+				/* pcie30phy_dtb0 */
+				<1 RK_PC4 4 &pcfg_pull_none>,
+				/* pcie30phy_dtb1 */
+				<1 RK_PD1 4 &pcfg_pull_none>;
+		};
+	};
+
+	pcie30x1 {
+		/omit-if-no-ref/
+		pcie30x1m0_pins: pcie30x1m0-pins {
+			rockchip,pins =
+				/* pcie30x1_0_clkreqn_m0 */
+				<0 RK_PC0 12 &pcfg_pull_none>,
+				/* pcie30x1_0_perstn_m0 */
+				<0 RK_PC5 12 &pcfg_pull_none>,
+				/* pcie30x1_0_waken_m0 */
+				<0 RK_PC4 12 &pcfg_pull_none>,
+				/* pcie30x1_1_clkreqn_m0 */
+				<0 RK_PB5 12 &pcfg_pull_none>,
+				/* pcie30x1_1_perstn_m0 */
+				<0 RK_PB7 12 &pcfg_pull_none>,
+				/* pcie30x1_1_waken_m0 */
+				<0 RK_PB6 12 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pcie30x1m1_pins: pcie30x1m1-pins {
+			rockchip,pins =
+				/* pcie30x1_0_clkreqn_m1 */
+				<4 RK_PA3 4 &pcfg_pull_none>,
+				/* pcie30x1_0_perstn_m1 */
+				<4 RK_PA5 4 &pcfg_pull_none>,
+				/* pcie30x1_0_waken_m1 */
+				<4 RK_PA4 4 &pcfg_pull_none>,
+				/* pcie30x1_1_clkreqn_m1 */
+				<4 RK_PA0 4 &pcfg_pull_none>,
+				/* pcie30x1_1_perstn_m1 */
+				<4 RK_PA2 4 &pcfg_pull_none>,
+				/* pcie30x1_1_waken_m1 */
+				<4 RK_PA1 4 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pcie30x1m2_pins: pcie30x1m2-pins {
+			rockchip,pins =
+				/* pcie30x1_0_clkreqn_m2 */
+				<1 RK_PB5 4 &pcfg_pull_none>,
+				/* pcie30x1_0_perstn_m2 */
+				<1 RK_PB4 4 &pcfg_pull_none>,
+				/* pcie30x1_0_waken_m2 */
+				<1 RK_PB3 4 &pcfg_pull_none>,
+				/* pcie30x1_1_clkreqn_m2 */
+				<1 RK_PA0 4 &pcfg_pull_none>,
+				/* pcie30x1_1_perstn_m2 */
+				<1 RK_PA7 4 &pcfg_pull_none>,
+				/* pcie30x1_1_waken_m2 */
+				<1 RK_PA1 4 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pcie30x1_0_button_rstn: pcie30x1-0-button-rstn {
+			rockchip,pins =
+				/* pcie30x1_0_button_rstn */
+				<4 RK_PB1 4 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pcie30x1_1_button_rstn: pcie30x1-1-button-rstn {
+			rockchip,pins =
+				/* pcie30x1_1_button_rstn */
+				<4 RK_PB2 4 &pcfg_pull_none>;
+		};
+	};
+
+	pcie30x2 {
+		/omit-if-no-ref/
+		pcie30x2m0_pins: pcie30x2m0-pins {
+			rockchip,pins =
+				/* pcie30x2_clkreqn_m0 */
+				<0 RK_PD1 12 &pcfg_pull_none>,
+				/* pcie30x2_perstn_m0 */
+				<0 RK_PD4 12 &pcfg_pull_none>,
+				/* pcie30x2_waken_m0 */
+				<0 RK_PD2 12 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pcie30x2m1_pins: pcie30x2m1-pins {
+			rockchip,pins =
+				/* pcie30x2_clkreqn_m1 */
+				<4 RK_PA6 4 &pcfg_pull_none>,
+				/* pcie30x2_perstn_m1 */
+				<4 RK_PB0 4 &pcfg_pull_none>,
+				/* pcie30x2_waken_m1 */
+				<4 RK_PA7 4 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pcie30x2m2_pins: pcie30x2m2-pins {
+			rockchip,pins =
+				/* pcie30x2_clkreqn_m2 */
+				<3 RK_PD2 4 &pcfg_pull_none>,
+				/* pcie30x2_perstn_m2 */
+				<3 RK_PD4 4 &pcfg_pull_none>,
+				/* pcie30x2_waken_m2 */
+				<3 RK_PD3 4 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pcie30x2m3_pins: pcie30x2m3-pins {
+			rockchip,pins =
+				/* pcie30x2_clkreqn_m3 */
+				<1 RK_PD7 4 &pcfg_pull_none>,
+				/* pcie30x2_perstn_m3 */
+				<1 RK_PB7 4 &pcfg_pull_none>,
+				/* pcie30x2_waken_m3 */
+				<1 RK_PB6 4 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pcie30x2_button_rstn: pcie30x2-button-rstn {
+			rockchip,pins =
+				/* pcie30x2_button_rstn */
+				<3 RK_PC1 4 &pcfg_pull_none>;
+		};
+	};
+
+	pcie30x4 {
+		/omit-if-no-ref/
+		pcie30x4m0_pins: pcie30x4m0-pins {
+			rockchip,pins =
+				/* pcie30x4_clkreqn_m0 */
+				<0 RK_PC6 12 &pcfg_pull_none>,
+				/* pcie30x4_perstn_m0 */
+				<0 RK_PD0 12 &pcfg_pull_none>,
+				/* pcie30x4_waken_m0 */
+				<0 RK_PC7 12 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pcie30x4m1_pins: pcie30x4m1-pins {
+			rockchip,pins =
+				/* pcie30x4_clkreqn_m1 */
+				<4 RK_PB4 4 &pcfg_pull_none>,
+				/* pcie30x4_perstn_m1 */
+				<4 RK_PB6 4 &pcfg_pull_none>,
+				/* pcie30x4_waken_m1 */
+				<4 RK_PB5 4 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pcie30x4m2_pins: pcie30x4m2-pins {
+			rockchip,pins =
+				/* pcie30x4_clkreqn_m2 */
+				<3 RK_PC4 4 &pcfg_pull_none>,
+				/* pcie30x4_perstn_m2 */
+				<3 RK_PC6 4 &pcfg_pull_none>,
+				/* pcie30x4_waken_m2 */
+				<3 RK_PC5 4 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pcie30x4m3_pins: pcie30x4m3-pins {
+			rockchip,pins =
+				/* pcie30x4_clkreqn_m3 */
+				<1 RK_PB0 4 &pcfg_pull_none>,
+				/* pcie30x4_perstn_m3 */
+				<1 RK_PB2 4 &pcfg_pull_none>,
+				/* pcie30x4_waken_m3 */
+				<1 RK_PB1 4 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pcie30x4_button_rstn: pcie30x4-button-rstn {
+			rockchip,pins =
+				/* pcie30x4_button_rstn */
+				<3 RK_PD5 4 &pcfg_pull_none>;
+		};
+	};
+
+	pdm0 {
+		/omit-if-no-ref/
+		pdm0m0_clk: pdm0m0-clk {
+			rockchip,pins =
+				/* pdm0_clk0_m0 */
+				<1 RK_PC6 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pdm0m0_clk1: pdm0m0-clk1 {
+			rockchip,pins =
+				/* pdm0m0_clk1 */
+				<1 RK_PC4 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pdm0m0_sdi0: pdm0m0-sdi0 {
+			rockchip,pins =
+				/* pdm0m0_sdi0 */
+				<1 RK_PD5 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pdm0m0_sdi1: pdm0m0-sdi1 {
+			rockchip,pins =
+				/* pdm0m0_sdi1 */
+				<1 RK_PD1 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pdm0m0_sdi2: pdm0m0-sdi2 {
+			rockchip,pins =
+				/* pdm0m0_sdi2 */
+				<1 RK_PD2 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pdm0m0_sdi3: pdm0m0-sdi3 {
+			rockchip,pins =
+				/* pdm0m0_sdi3 */
+				<1 RK_PD3 3 &pcfg_pull_none>;
+		};
+		/omit-if-no-ref/
+		pdm0m1_clk: pdm0m1-clk {
+			rockchip,pins =
+				/* pdm0_clk0_m1 */
+				<0 RK_PC0 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pdm0m1_clk1: pdm0m1-clk1 {
+			rockchip,pins =
+				/* pdm0m1_clk1 */
+				<0 RK_PC4 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pdm0m1_sdi0: pdm0m1-sdi0 {
+			rockchip,pins =
+				/* pdm0m1_sdi0 */
+				<0 RK_PC7 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pdm0m1_sdi1: pdm0m1-sdi1 {
+			rockchip,pins =
+				/* pdm0m1_sdi1 */
+				<0 RK_PD0 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pdm0m1_sdi2: pdm0m1-sdi2 {
+			rockchip,pins =
+				/* pdm0m1_sdi2 */
+				<0 RK_PD4 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pdm0m1_sdi3: pdm0m1-sdi3 {
+			rockchip,pins =
+				/* pdm0m1_sdi3 */
+				<0 RK_PD6 2 &pcfg_pull_none>;
+		};
+	};
+
+	pdm1 {
+		/omit-if-no-ref/
+		pdm1m0_clk: pdm1m0-clk {
+			rockchip,pins =
+				/* pdm1_clk0_m0 */
+				<4 RK_PD5 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pdm1m0_clk1: pdm1m0-clk1 {
+			rockchip,pins =
+				/* pdm1m0_clk1 */
+				<4 RK_PD4 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pdm1m0_sdi0: pdm1m0-sdi0 {
+			rockchip,pins =
+				/* pdm1m0_sdi0 */
+				<4 RK_PD3 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pdm1m0_sdi1: pdm1m0-sdi1 {
+			rockchip,pins =
+				/* pdm1m0_sdi1 */
+				<4 RK_PD2 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pdm1m0_sdi2: pdm1m0-sdi2 {
+			rockchip,pins =
+				/* pdm1m0_sdi2 */
+				<4 RK_PD1 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pdm1m0_sdi3: pdm1m0-sdi3 {
+			rockchip,pins =
+				/* pdm1m0_sdi3 */
+				<4 RK_PD0 2 &pcfg_pull_none>;
+		};
+		/omit-if-no-ref/
+		pdm1m1_clk: pdm1m1-clk {
+			rockchip,pins =
+				/* pdm1_clk0_m1 */
+				<1 RK_PB4 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pdm1m1_clk1: pdm1m1-clk1 {
+			rockchip,pins =
+				/* pdm1m1_clk1 */
+				<1 RK_PB3 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pdm1m1_sdi0: pdm1m1-sdi0 {
+			rockchip,pins =
+				/* pdm1m1_sdi0 */
+				<1 RK_PA7 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pdm1m1_sdi1: pdm1m1-sdi1 {
+			rockchip,pins =
+				/* pdm1m1_sdi1 */
+				<1 RK_PB0 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pdm1m1_sdi2: pdm1m1-sdi2 {
+			rockchip,pins =
+				/* pdm1m1_sdi2 */
+				<1 RK_PB1 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pdm1m1_sdi3: pdm1m1-sdi3 {
+			rockchip,pins =
+				/* pdm1m1_sdi3 */
+				<1 RK_PB2 2 &pcfg_pull_none>;
+		};
+	};
+
+	pmic {
+		/omit-if-no-ref/
+		pmic_pins: pmic-pins {
+			rockchip,pins =
+				/* pmic_int_l */
+				<0 RK_PA7 0 &pcfg_pull_up>,
+				/* pmic_sleep1 */
+				<0 RK_PA2 1 &pcfg_pull_none>,
+				/* pmic_sleep2 */
+				<0 RK_PA3 1 &pcfg_pull_none>,
+				/* pmic_sleep3 */
+				<0 RK_PC1 1 &pcfg_pull_none>,
+				/* pmic_sleep4 */
+				<0 RK_PC2 1 &pcfg_pull_none>,
+				/* pmic_sleep5 */
+				<0 RK_PC3 1 &pcfg_pull_none>,
+				/* pmic_sleep6 */
+				<0 RK_PD6 1 &pcfg_pull_none>;
+		};
+	};
+
+	pmu {
+		/omit-if-no-ref/
+		pmu_pins: pmu-pins {
+			rockchip,pins =
+				/* pmu_debug */
+				<0 RK_PA5 3 &pcfg_pull_none>;
+		};
+	};
+
+	pwm0 {
+		/omit-if-no-ref/
+		pwm0m0_pins: pwm0m0-pins {
+			rockchip,pins =
+				/* pwm0_m0 */
+				<0 RK_PB7 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm0m1_pins: pwm0m1-pins {
+			rockchip,pins =
+				/* pwm0_m1 */
+				<1 RK_PD2 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm0m2_pins: pwm0m2-pins {
+			rockchip,pins =
+				/* pwm0_m2 */
+				<1 RK_PA2 11 &pcfg_pull_none>;
+		};
+	};
+
+	pwm1 {
+		/omit-if-no-ref/
+		pwm1m0_pins: pwm1m0-pins {
+			rockchip,pins =
+				/* pwm1_m0 */
+				<0 RK_PC0 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm1m1_pins: pwm1m1-pins {
+			rockchip,pins =
+				/* pwm1_m1 */
+				<1 RK_PD3 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm1m2_pins: pwm1m2-pins {
+			rockchip,pins =
+				/* pwm1_m2 */
+				<1 RK_PA3 11 &pcfg_pull_none>;
+		};
+	};
+
+	pwm2 {
+		/omit-if-no-ref/
+		pwm2m0_pins: pwm2m0-pins {
+			rockchip,pins =
+				/* pwm2_m0 */
+				<0 RK_PC4 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm2m1_pins: pwm2m1-pins {
+			rockchip,pins =
+				/* pwm2_m1 */
+				<3 RK_PB1 11 &pcfg_pull_none>;
+		};
+	};
+
+	pwm3 {
+		/omit-if-no-ref/
+		pwm3m0_pins: pwm3m0-pins {
+			rockchip,pins =
+				/* pwm3_ir_m0 */
+				<0 RK_PD4 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm3m1_pins: pwm3m1-pins {
+			rockchip,pins =
+				/* pwm3_ir_m1 */
+				<3 RK_PB2 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm3m2_pins: pwm3m2-pins {
+			rockchip,pins =
+				/* pwm3_ir_m2 */
+				<1 RK_PC2 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm3m3_pins: pwm3m3-pins {
+			rockchip,pins =
+				/* pwm3_ir_m3 */
+				<1 RK_PA7 11 &pcfg_pull_none>;
+		};
+	};
+
+	pwm4 {
+		/omit-if-no-ref/
+		pwm4m0_pins: pwm4m0-pins {
+			rockchip,pins =
+				/* pwm4_m0 */
+				<0 RK_PC5 11 &pcfg_pull_none>;
+		};
+	};
+
+	pwm5 {
+		/omit-if-no-ref/
+		pwm5m0_pins: pwm5m0-pins {
+			rockchip,pins =
+				/* pwm5_m0 */
+				<0 RK_PB1 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm5m1_pins: pwm5m1-pins {
+			rockchip,pins =
+				/* pwm5_m1 */
+				<0 RK_PC6 11 &pcfg_pull_none>;
+		};
+	};
+
+	pwm6 {
+		/omit-if-no-ref/
+		pwm6m0_pins: pwm6m0-pins {
+			rockchip,pins =
+				/* pwm6_m0 */
+				<0 RK_PC7 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm6m1_pins: pwm6m1-pins {
+			rockchip,pins =
+				/* pwm6_m1 */
+				<4 RK_PC1 11 &pcfg_pull_none>;
+		};
+	};
+
+	pwm7 {
+		/omit-if-no-ref/
+		pwm7m0_pins: pwm7m0-pins {
+			rockchip,pins =
+				/* pwm7_ir_m0 */
+				<0 RK_PD0 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm7m1_pins: pwm7m1-pins {
+			rockchip,pins =
+				/* pwm7_ir_m1 */
+				<4 RK_PD4 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm7m2_pins: pwm7m2-pins {
+			rockchip,pins =
+				/* pwm7_ir_m2 */
+				<1 RK_PC3 11 &pcfg_pull_none>;
+		};
+	};
+
+	pwm8 {
+		/omit-if-no-ref/
+		pwm8m0_pins: pwm8m0-pins {
+			rockchip,pins =
+				/* pwm8_m0 */
+				<3 RK_PA7 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm8m1_pins: pwm8m1-pins {
+			rockchip,pins =
+				/* pwm8_m1 */
+				<4 RK_PD0 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm8m2_pins: pwm8m2-pins {
+			rockchip,pins =
+				/* pwm8_m2 */
+				<3 RK_PD0 11 &pcfg_pull_none>;
+		};
+	};
+
+	pwm9 {
+		/omit-if-no-ref/
+		pwm9m0_pins: pwm9m0-pins {
+			rockchip,pins =
+				/* pwm9_m0 */
+				<3 RK_PB0 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm9m1_pins: pwm9m1-pins {
+			rockchip,pins =
+				/* pwm9_m1 */
+				<4 RK_PD1 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm9m2_pins: pwm9m2-pins {
+			rockchip,pins =
+				/* pwm9_m2 */
+				<3 RK_PD1 11 &pcfg_pull_none>;
+		};
+	};
+
+	pwm10 {
+		/omit-if-no-ref/
+		pwm10m0_pins: pwm10m0-pins {
+			rockchip,pins =
+				/* pwm10_m0 */
+				<3 RK_PA0 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm10m1_pins: pwm10m1-pins {
+			rockchip,pins =
+				/* pwm10_m1 */
+				<4 RK_PD3 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm10m2_pins: pwm10m2-pins {
+			rockchip,pins =
+				/* pwm10_m2 */
+				<3 RK_PD3 11 &pcfg_pull_none>;
+		};
+	};
+
+	pwm11 {
+		/omit-if-no-ref/
+		pwm11m0_pins: pwm11m0-pins {
+			rockchip,pins =
+				/* pwm11_ir_m0 */
+				<3 RK_PA1 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm11m1_pins: pwm11m1-pins {
+			rockchip,pins =
+				/* pwm11_ir_m1 */
+				<4 RK_PB4 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm11m2_pins: pwm11m2-pins {
+			rockchip,pins =
+				/* pwm11_ir_m2 */
+				<1 RK_PC4 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm11m3_pins: pwm11m3-pins {
+			rockchip,pins =
+				/* pwm11_ir_m3 */
+				<3 RK_PD5 11 &pcfg_pull_none>;
+		};
+	};
+
+	pwm12 {
+		/omit-if-no-ref/
+		pwm12m0_pins: pwm12m0-pins {
+			rockchip,pins =
+				/* pwm12_m0 */
+				<3 RK_PB5 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm12m1_pins: pwm12m1-pins {
+			rockchip,pins =
+				/* pwm12_m1 */
+				<4 RK_PB5 11 &pcfg_pull_none>;
+		};
+	};
+
+	pwm13 {
+		/omit-if-no-ref/
+		pwm13m0_pins: pwm13m0-pins {
+			rockchip,pins =
+				/* pwm13_m0 */
+				<3 RK_PB6 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm13m1_pins: pwm13m1-pins {
+			rockchip,pins =
+				/* pwm13_m1 */
+				<4 RK_PB6 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm13m2_pins: pwm13m2-pins {
+			rockchip,pins =
+				/* pwm13_m2 */
+				<1 RK_PB7 11 &pcfg_pull_none>;
+		};
+	};
+
+	pwm14 {
+		/omit-if-no-ref/
+		pwm14m0_pins: pwm14m0-pins {
+			rockchip,pins =
+				/* pwm14_m0 */
+				<3 RK_PC2 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm14m1_pins: pwm14m1-pins {
+			rockchip,pins =
+				/* pwm14_m1 */
+				<4 RK_PB2 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm14m2_pins: pwm14m2-pins {
+			rockchip,pins =
+				/* pwm14_m2 */
+				<1 RK_PD6 11 &pcfg_pull_none>;
+		};
+	};
+
+	pwm15 {
+		/omit-if-no-ref/
+		pwm15m0_pins: pwm15m0-pins {
+			rockchip,pins =
+				/* pwm15_ir_m0 */
+				<3 RK_PC3 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm15m1_pins: pwm15m1-pins {
+			rockchip,pins =
+				/* pwm15_ir_m1 */
+				<4 RK_PB3 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm15m2_pins: pwm15m2-pins {
+			rockchip,pins =
+				/* pwm15_ir_m2 */
+				<1 RK_PC6 11 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		pwm15m3_pins: pwm15m3-pins {
+			rockchip,pins =
+				/* pwm15_ir_m3 */
+				<1 RK_PD7 11 &pcfg_pull_none>;
+		};
+	};
+
+	refclk {
+		/omit-if-no-ref/
+		refclk_pins: refclk-pins {
+			rockchip,pins =
+				/* refclk_out */
+				<0 RK_PA0 1 &pcfg_pull_none>;
+		};
+	};
+
+	sata {
+		/omit-if-no-ref/
+		sata_pins: sata-pins {
+			rockchip,pins =
+				/* sata_cp_pod */
+				<0 RK_PC6 13 &pcfg_pull_none>,
+				/* sata_cpdet */
+				<0 RK_PD4 13 &pcfg_pull_none>,
+				/* sata_mp_switch */
+				<0 RK_PD5 13 &pcfg_pull_none>;
+		};
+	};
+
+	sata0 {
+		/omit-if-no-ref/
+		sata0m0_pins: sata0m0-pins {
+			rockchip,pins =
+				/* sata0_act_led_m0 */
+				<4 RK_PB6 6 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sata0m1_pins: sata0m1-pins {
+			rockchip,pins =
+				/* sata0_act_led_m1 */
+				<1 RK_PB3 6 &pcfg_pull_none>;
+		};
+	};
+
+	sata1 {
+		/omit-if-no-ref/
+		sata1m0_pins: sata1m0-pins {
+			rockchip,pins =
+				/* sata1_act_led_m0 */
+				<4 RK_PB5 6 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sata1m1_pins: sata1m1-pins {
+			rockchip,pins =
+				/* sata1_act_led_m1 */
+				<1 RK_PA1 6 &pcfg_pull_none>;
+		};
+	};
+
+	sata2 {
+		/omit-if-no-ref/
+		sata2m0_pins: sata2m0-pins {
+			rockchip,pins =
+				/* sata2_act_led_m0 */
+				<4 RK_PB1 6 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sata2m1_pins: sata2m1-pins {
+			rockchip,pins =
+				/* sata2_act_led_m1 */
+				<1 RK_PB7 6 &pcfg_pull_none>;
+		};
+	};
+
+	sdio {
+		/omit-if-no-ref/
+		sdiom1_pins: sdiom1-pins {
+			rockchip,pins =
+				/* sdio_clk_m1 */
+				<3 RK_PA5 2 &pcfg_pull_none>,
+				/* sdio_cmd_m1 */
+				<3 RK_PA4 2 &pcfg_pull_none>,
+				/* sdio_d0_m1 */
+				<3 RK_PA0 2 &pcfg_pull_none>,
+				/* sdio_d1_m1 */
+				<3 RK_PA1 2 &pcfg_pull_none>,
+				/* sdio_d2_m1 */
+				<3 RK_PA2 2 &pcfg_pull_none>,
+				/* sdio_d3_m1 */
+				<3 RK_PA3 2 &pcfg_pull_none>;
+		};
+	};
+
+	sdmmc {
+		/omit-if-no-ref/
+		sdmmc_bus4: sdmmc-bus4 {
+			rockchip,pins =
+				/* sdmmc_d0 */
+				<4 RK_PD0 1 &pcfg_pull_up_drv_level_2>,
+				/* sdmmc_d1 */
+				<4 RK_PD1 1 &pcfg_pull_up_drv_level_2>,
+				/* sdmmc_d2 */
+				<4 RK_PD2 1 &pcfg_pull_up_drv_level_2>,
+				/* sdmmc_d3 */
+				<4 RK_PD3 1 &pcfg_pull_up_drv_level_2>;
+		};
+
+		/omit-if-no-ref/
+		sdmmc_clk: sdmmc-clk {
+			rockchip,pins =
+				/* sdmmc_clk */
+				<4 RK_PD5 1 &pcfg_pull_up_drv_level_2>;
+		};
+
+		/omit-if-no-ref/
+		sdmmc_cmd: sdmmc-cmd {
+			rockchip,pins =
+				/* sdmmc_cmd */
+				<4 RK_PD4 1 &pcfg_pull_up_drv_level_2>;
+		};
+
+		/omit-if-no-ref/
+		sdmmc_det: sdmmc-det {
+			rockchip,pins =
+				/* sdmmc_det */
+				<0 RK_PA4 1 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		sdmmc_pwren: sdmmc-pwren {
+			rockchip,pins =
+				/* sdmmc_pwren */
+				<0 RK_PA5 2 &pcfg_pull_none>;
+		};
+	};
+
+	spdif0 {
+		/omit-if-no-ref/
+		spdif0m0_tx: spdif0m0-tx {
+			rockchip,pins =
+				/* spdif0m0_tx */
+				<1 RK_PB6 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		spdif0m1_tx: spdif0m1-tx {
+			rockchip,pins =
+				/* spdif0m1_tx */
+				<4 RK_PB4 6 &pcfg_pull_none>;
+		};
+	};
+
+	spdif1 {
+		/omit-if-no-ref/
+		spdif1m0_tx: spdif1m0-tx {
+			rockchip,pins =
+				/* spdif1m0_tx */
+				<1 RK_PB7 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		spdif1m1_tx: spdif1m1-tx {
+			rockchip,pins =
+				/* spdif1m1_tx */
+				<4 RK_PB1 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		spdif1m2_tx: spdif1m2-tx {
+			rockchip,pins =
+				/* spdif1m2_tx */
+				<4 RK_PC1 3 &pcfg_pull_none>;
+		};
+	};
+
+	spi0 {
+		/omit-if-no-ref/
+		spi0m0_pins: spi0m0-pins {
+			rockchip,pins =
+				/* spi0_clk_m0 */
+				<0 RK_PC6 8 &pcfg_pull_up_drv_level_1>,
+				/* spi0_miso_m0 */
+				<0 RK_PC7 8 &pcfg_pull_up_drv_level_1>,
+				/* spi0_mosi_m0 */
+				<0 RK_PC0 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi0m0_cs0: spi0m0-cs0 {
+			rockchip,pins =
+				/* spi0_cs0_m0 */
+				<0 RK_PD1 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi0m0_cs1: spi0m0-cs1 {
+			rockchip,pins =
+				/* spi0_cs1_m0 */
+				<0 RK_PB7 8 &pcfg_pull_up_drv_level_1>;
+		};
+		/omit-if-no-ref/
+		spi0m1_pins: spi0m1-pins {
+			rockchip,pins =
+				/* spi0_clk_m1 */
+				<4 RK_PA2 8 &pcfg_pull_up_drv_level_1>,
+				/* spi0_miso_m1 */
+				<4 RK_PA0 8 &pcfg_pull_up_drv_level_1>,
+				/* spi0_mosi_m1 */
+				<4 RK_PA1 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi0m1_cs0: spi0m1-cs0 {
+			rockchip,pins =
+				/* spi0_cs0_m1 */
+				<4 RK_PB2 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi0m1_cs1: spi0m1-cs1 {
+			rockchip,pins =
+				/* spi0_cs1_m1 */
+				<4 RK_PB1 8 &pcfg_pull_up_drv_level_1>;
+		};
+		/omit-if-no-ref/
+		spi0m2_pins: spi0m2-pins {
+			rockchip,pins =
+				/* spi0_clk_m2 */
+				<1 RK_PB3 8 &pcfg_pull_up_drv_level_1>,
+				/* spi0_miso_m2 */
+				<1 RK_PB1 8 &pcfg_pull_up_drv_level_1>,
+				/* spi0_mosi_m2 */
+				<1 RK_PB2 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi0m2_cs0: spi0m2-cs0 {
+			rockchip,pins =
+				/* spi0_cs0_m2 */
+				<1 RK_PB4 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi0m2_cs1: spi0m2-cs1 {
+			rockchip,pins =
+				/* spi0_cs1_m2 */
+				<1 RK_PB5 8 &pcfg_pull_up_drv_level_1>;
+		};
+		/omit-if-no-ref/
+		spi0m3_pins: spi0m3-pins {
+			rockchip,pins =
+				/* spi0_clk_m3 */
+				<3 RK_PD3 8 &pcfg_pull_up_drv_level_1>,
+				/* spi0_miso_m3 */
+				<3 RK_PD1 8 &pcfg_pull_up_drv_level_1>,
+				/* spi0_mosi_m3 */
+				<3 RK_PD2 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi0m3_cs0: spi0m3-cs0 {
+			rockchip,pins =
+				/* spi0_cs0_m3 */
+				<3 RK_PD4 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi0m3_cs1: spi0m3-cs1 {
+			rockchip,pins =
+				/* spi0_cs1_m3 */
+				<3 RK_PD5 8 &pcfg_pull_up_drv_level_1>;
+		};
+	};
+
+	spi1 {
+		/omit-if-no-ref/
+		spi1m1_pins: spi1m1-pins {
+			rockchip,pins =
+				/* spi1_clk_m1 */
+				<3 RK_PC1 8 &pcfg_pull_up_drv_level_1>,
+				/* spi1_miso_m1 */
+				<3 RK_PC0 8 &pcfg_pull_up_drv_level_1>,
+				/* spi1_mosi_m1 */
+				<3 RK_PB7 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi1m1_cs0: spi1m1-cs0 {
+			rockchip,pins =
+				/* spi1_cs0_m1 */
+				<3 RK_PC2 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi1m1_cs1: spi1m1-cs1 {
+			rockchip,pins =
+				/* spi1_cs1_m1 */
+				<3 RK_PC3 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi1m2_pins: spi1m2-pins {
+			rockchip,pins =
+				/* spi1_clk_m2 */
+				<1 RK_PD2 8 &pcfg_pull_up_drv_level_1>,
+				/* spi1_miso_m2 */
+				<1 RK_PD0 8 &pcfg_pull_up_drv_level_1>,
+				/* spi1_mosi_m2 */
+				<1 RK_PD1 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi1m2_cs0: spi1m2-cs0 {
+			rockchip,pins =
+				/* spi1_cs0_m2 */
+				<1 RK_PD3 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi1m2_cs1: spi1m2-cs1 {
+			rockchip,pins =
+				/* spi1_cs1_m2 */
+				<1 RK_PD5 8 &pcfg_pull_up_drv_level_1>;
+		};
+	};
+
+	spi2 {
+		/omit-if-no-ref/
+		spi2m0_pins: spi2m0-pins {
+			rockchip,pins =
+				/* spi2_clk_m0 */
+				<1 RK_PA6 8 &pcfg_pull_up_drv_level_1>,
+				/* spi2_miso_m0 */
+				<1 RK_PA4 8 &pcfg_pull_up_drv_level_1>,
+				/* spi2_mosi_m0 */
+				<1 RK_PA5 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi2m0_cs0: spi2m0-cs0 {
+			rockchip,pins =
+				/* spi2_cs0_m0 */
+				<1 RK_PA7 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi2m0_cs1: spi2m0-cs1 {
+			rockchip,pins =
+				/* spi2_cs1_m0 */
+				<1 RK_PB0 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi2m1_pins: spi2m1-pins {
+			rockchip,pins =
+				/* spi2_clk_m1 */
+				<4 RK_PA6 8 &pcfg_pull_up_drv_level_1>,
+				/* spi2_miso_m1 */
+				<4 RK_PA4 8 &pcfg_pull_up_drv_level_1>,
+				/* spi2_mosi_m1 */
+				<4 RK_PA5 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi2m1_cs0: spi2m1-cs0 {
+			rockchip,pins =
+				/* spi2_cs0_m1 */
+				<4 RK_PA7 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi2m1_cs1: spi2m1-cs1 {
+			rockchip,pins =
+				/* spi2_cs1_m1 */
+				<4 RK_PB0 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi2m2_pins: spi2m2-pins {
+			rockchip,pins =
+				/* spi2_clk_m2 */
+				<0 RK_PA5 1 &pcfg_pull_up_drv_level_1>,
+				/* spi2_miso_m2 */
+				<0 RK_PB3 1 &pcfg_pull_up_drv_level_1>,
+				/* spi2_mosi_m2 */
+				<0 RK_PA6 1 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi2m2_cs0: spi2m2-cs0 {
+			rockchip,pins =
+				/* spi2_cs0_m2 */
+				<0 RK_PB1 1 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi2m2_cs1: spi2m2-cs1 {
+			rockchip,pins =
+				/* spi2_cs1_m2 */
+				<0 RK_PB0 1 &pcfg_pull_up_drv_level_1>;
+		};
+	};
+
+	spi3 {
+		/omit-if-no-ref/
+		spi3m1_pins: spi3m1-pins {
+			rockchip,pins =
+				/* spi3_clk_m1 */
+				<4 RK_PB7 8 &pcfg_pull_up_drv_level_1>,
+				/* spi3_miso_m1 */
+				<4 RK_PB5 8 &pcfg_pull_up_drv_level_1>,
+				/* spi3_mosi_m1 */
+				<4 RK_PB6 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi3m1_cs0: spi3m1-cs0 {
+			rockchip,pins =
+				/* spi3_cs0_m1 */
+				<4 RK_PC0 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi3m1_cs1: spi3m1-cs1 {
+			rockchip,pins =
+				/* spi3_cs1_m1 */
+				<4 RK_PC1 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi3m2_pins: spi3m2-pins {
+			rockchip,pins =
+				/* spi3_clk_m2 */
+				<0 RK_PD3 8 &pcfg_pull_up_drv_level_1>,
+				/* spi3_miso_m2 */
+				<0 RK_PD0 8 &pcfg_pull_up_drv_level_1>,
+				/* spi3_mosi_m2 */
+				<0 RK_PD2 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi3m2_cs0: spi3m2-cs0 {
+			rockchip,pins =
+				/* spi3_cs0_m2 */
+				<0 RK_PD4 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi3m2_cs1: spi3m2-cs1 {
+			rockchip,pins =
+				/* spi3_cs1_m2 */
+				<0 RK_PD5 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi3m3_pins: spi3m3-pins {
+			rockchip,pins =
+				/* spi3_clk_m3 */
+				<3 RK_PD0 8 &pcfg_pull_up_drv_level_1>,
+				/* spi3_miso_m3 */
+				<3 RK_PC6 8 &pcfg_pull_up_drv_level_1>,
+				/* spi3_mosi_m3 */
+				<3 RK_PC7 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi3m3_cs0: spi3m3-cs0 {
+			rockchip,pins =
+				/* spi3_cs0_m3 */
+				<3 RK_PC4 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi3m3_cs1: spi3m3-cs1 {
+			rockchip,pins =
+				/* spi3_cs1_m3 */
+				<3 RK_PC5 8 &pcfg_pull_up_drv_level_1>;
+		};
+	};
+
+	spi4 {
+		/omit-if-no-ref/
+		spi4m0_pins: spi4m0-pins {
+			rockchip,pins =
+				/* spi4_clk_m0 */
+				<1 RK_PC2 8 &pcfg_pull_up_drv_level_1>,
+				/* spi4_miso_m0 */
+				<1 RK_PC0 8 &pcfg_pull_up_drv_level_1>,
+				/* spi4_mosi_m0 */
+				<1 RK_PC1 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi4m0_cs0: spi4m0-cs0 {
+			rockchip,pins =
+				/* spi4_cs0_m0 */
+				<1 RK_PC3 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi4m0_cs1: spi4m0-cs1 {
+			rockchip,pins =
+				/* spi4_cs1_m0 */
+				<1 RK_PC4 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi4m1_pins: spi4m1-pins {
+			rockchip,pins =
+				/* spi4_clk_m1 */
+				<3 RK_PA2 8 &pcfg_pull_up_drv_level_1>,
+				/* spi4_miso_m1 */
+				<3 RK_PA0 8 &pcfg_pull_up_drv_level_1>,
+				/* spi4_mosi_m1 */
+				<3 RK_PA1 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi4m1_cs0: spi4m1-cs0 {
+			rockchip,pins =
+				/* spi4_cs0_m1 */
+				<3 RK_PA3 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi4m1_cs1: spi4m1-cs1 {
+			rockchip,pins =
+				/* spi4_cs1_m1 */
+				<3 RK_PA4 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi4m2_pins: spi4m2-pins {
+			rockchip,pins =
+				/* spi4_clk_m2 */
+				<1 RK_PA2 8 &pcfg_pull_up_drv_level_1>,
+				/* spi4_miso_m2 */
+				<1 RK_PA0 8 &pcfg_pull_up_drv_level_1>,
+				/* spi4_mosi_m2 */
+				<1 RK_PA1 8 &pcfg_pull_up_drv_level_1>;
+		};
+
+		/omit-if-no-ref/
+		spi4m2_cs0: spi4m2-cs0 {
+			rockchip,pins =
+				/* spi4_cs0_m2 */
+				<1 RK_PA3 8 &pcfg_pull_up_drv_level_1>;
+		};
+	};
+
+	tsadc {
+		/omit-if-no-ref/
+		tsadcm1_shut: tsadcm1-shut {
+			rockchip,pins =
+				/* tsadcm1_shut */
+				<0 RK_PA2 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		tsadc_shut: tsadc-shut {
+			rockchip,pins =
+				/* tsadc_shut */
+				<0 RK_PA1 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		tsadc_shut_org: tsadc-shut-org {
+			rockchip,pins =
+				/* tsadc_shut_org */
+				<0 RK_PA1 1 &pcfg_pull_none>;
+		};
+	};
+
+	uart0 {
+		/omit-if-no-ref/
+		uart0m0_xfer: uart0m0-xfer {
+			rockchip,pins =
+				/* uart0_rx_m0 */
+				<0 RK_PC4 4 &pcfg_pull_up>,
+				/* uart0_tx_m0 */
+				<0 RK_PC5 4 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart0m1_xfer: uart0m1-xfer {
+			rockchip,pins =
+				/* uart0_rx_m1 */
+				<0 RK_PB0 4 &pcfg_pull_up>,
+				/* uart0_tx_m1 */
+				<0 RK_PB1 4 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart0m2_xfer: uart0m2-xfer {
+			rockchip,pins =
+				/* uart0_rx_m2 */
+				<4 RK_PA4 10 &pcfg_pull_up>,
+				/* uart0_tx_m2 */
+				<4 RK_PA3 10 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart0_ctsn: uart0-ctsn {
+			rockchip,pins =
+				/* uart0_ctsn */
+				<0 RK_PD1 4 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart0_rtsn: uart0-rtsn {
+			rockchip,pins =
+				/* uart0_rtsn */
+				<0 RK_PC6 4 &pcfg_pull_none>;
+		};
+	};
+
+	uart1 {
+		/omit-if-no-ref/
+		uart1m1_xfer: uart1m1-xfer {
+			rockchip,pins =
+				/* uart1_rx_m1 */
+				<1 RK_PB7 10 &pcfg_pull_up>,
+				/* uart1_tx_m1 */
+				<1 RK_PB6 10 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart1m1_ctsn: uart1m1-ctsn {
+			rockchip,pins =
+				/* uart1m1_ctsn */
+				<1 RK_PD7 10 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart1m1_rtsn: uart1m1-rtsn {
+			rockchip,pins =
+				/* uart1m1_rtsn */
+				<1 RK_PD6 10 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart1m2_xfer: uart1m2-xfer {
+			rockchip,pins =
+				/* uart1_rx_m2 */
+				<0 RK_PD2 10 &pcfg_pull_up>,
+				/* uart1_tx_m2 */
+				<0 RK_PD1 10 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart1m2_ctsn: uart1m2-ctsn {
+			rockchip,pins =
+				/* uart1m2_ctsn */
+				<0 RK_PD0 10 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart1m2_rtsn: uart1m2-rtsn {
+			rockchip,pins =
+				/* uart1m2_rtsn */
+				<0 RK_PC7 10 &pcfg_pull_none>;
+		};
+	};
+
+	uart2 {
+		/omit-if-no-ref/
+		uart2m0_xfer: uart2m0-xfer {
+			rockchip,pins =
+				/* uart2_rx_m0 */
+				<0 RK_PB6 10 &pcfg_pull_up>,
+				/* uart2_tx_m0 */
+				<0 RK_PB5 10 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart2m1_xfer: uart2m1-xfer {
+			rockchip,pins =
+				/* uart2_rx_m1 */
+				<4 RK_PD1 10 &pcfg_pull_up>,
+				/* uart2_tx_m1 */
+				<4 RK_PD0 10 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart2m2_xfer: uart2m2-xfer {
+			rockchip,pins =
+				/* uart2_rx_m2 */
+				<3 RK_PB2 10 &pcfg_pull_up>,
+				/* uart2_tx_m2 */
+				<3 RK_PB1 10 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart2_ctsn: uart2-ctsn {
+			rockchip,pins =
+				/* uart2_ctsn */
+				<3 RK_PB4 10 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart2_rtsn: uart2-rtsn {
+			rockchip,pins =
+				/* uart2_rtsn */
+				<3 RK_PB3 10 &pcfg_pull_none>;
+		};
+	};
+
+	uart3 {
+		/omit-if-no-ref/
+		uart3m0_xfer: uart3m0-xfer {
+			rockchip,pins =
+				/* uart3_rx_m0 */
+				<1 RK_PC0 10 &pcfg_pull_up>,
+				/* uart3_tx_m0 */
+				<1 RK_PC1 10 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart3m1_xfer: uart3m1-xfer {
+			rockchip,pins =
+				/* uart3_rx_m1 */
+				<3 RK_PB6 10 &pcfg_pull_up>,
+				/* uart3_tx_m1 */
+				<3 RK_PB5 10 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart3m2_xfer: uart3m2-xfer {
+			rockchip,pins =
+				/* uart3_rx_m2 */
+				<4 RK_PA6 10 &pcfg_pull_up>,
+				/* uart3_tx_m2 */
+				<4 RK_PA5 10 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart3_ctsn: uart3-ctsn {
+			rockchip,pins =
+				/* uart3_ctsn */
+				<1 RK_PC3 10 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart3_rtsn: uart3-rtsn {
+			rockchip,pins =
+				/* uart3_rtsn */
+				<1 RK_PC2 10 &pcfg_pull_none>;
+		};
+	};
+
+	uart4 {
+		/omit-if-no-ref/
+		uart4m0_xfer: uart4m0-xfer {
+			rockchip,pins =
+				/* uart4_rx_m0 */
+				<1 RK_PD3 10 &pcfg_pull_up>,
+				/* uart4_tx_m0 */
+				<1 RK_PD2 10 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart4m1_xfer: uart4m1-xfer {
+			rockchip,pins =
+				/* uart4_rx_m1 */
+				<3 RK_PD0 10 &pcfg_pull_up>,
+				/* uart4_tx_m1 */
+				<3 RK_PD1 10 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart4m2_xfer: uart4m2-xfer {
+			rockchip,pins =
+				/* uart4_rx_m2 */
+				<1 RK_PB2 10 &pcfg_pull_up>,
+				/* uart4_tx_m2 */
+				<1 RK_PB3 10 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart4_ctsn: uart4-ctsn {
+			rockchip,pins =
+				/* uart4_ctsn */
+				<1 RK_PC7 10 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart4_rtsn: uart4-rtsn {
+			rockchip,pins =
+				/* uart4_rtsn */
+				<1 RK_PC5 10 &pcfg_pull_none>;
+		};
+	};
+
+	uart5 {
+		/omit-if-no-ref/
+		uart5m0_xfer: uart5m0-xfer {
+			rockchip,pins =
+				/* uart5_rx_m0 */
+				<4 RK_PD4 10 &pcfg_pull_up>,
+				/* uart5_tx_m0 */
+				<4 RK_PD5 10 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart5m0_ctsn: uart5m0-ctsn {
+			rockchip,pins =
+				/* uart5m0_ctsn */
+				<4 RK_PD2 10 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart5m0_rtsn: uart5m0-rtsn {
+			rockchip,pins =
+				/* uart5m0_rtsn */
+				<4 RK_PD3 10 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart5m1_xfer: uart5m1-xfer {
+			rockchip,pins =
+				/* uart5_rx_m1 */
+				<3 RK_PC5 10 &pcfg_pull_up>,
+				/* uart5_tx_m1 */
+				<3 RK_PC4 10 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart5m1_ctsn: uart5m1-ctsn {
+			rockchip,pins =
+				/* uart5m1_ctsn */
+				<2 RK_PA2 10 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart5m1_rtsn: uart5m1-rtsn {
+			rockchip,pins =
+				/* uart5m1_rtsn */
+				<2 RK_PA3 10 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart5m2_xfer: uart5m2-xfer {
+			rockchip,pins =
+				/* uart5_rx_m2 */
+				<2 RK_PD4 10 &pcfg_pull_up>,
+				/* uart5_tx_m2 */
+				<2 RK_PD5 10 &pcfg_pull_up>;
+		};
+	};
+
+	uart6 {
+		/omit-if-no-ref/
+		uart6m1_xfer: uart6m1-xfer {
+			rockchip,pins =
+				/* uart6_rx_m1 */
+				<1 RK_PA0 10 &pcfg_pull_up>,
+				/* uart6_tx_m1 */
+				<1 RK_PA1 10 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart6m1_ctsn: uart6m1-ctsn {
+			rockchip,pins =
+				/* uart6m1_ctsn */
+				<1 RK_PA3 10 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart6m1_rtsn: uart6m1-rtsn {
+			rockchip,pins =
+				/* uart6m1_rtsn */
+				<1 RK_PA2 10 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart6m2_xfer: uart6m2-xfer {
+			rockchip,pins =
+				/* uart6_rx_m2 */
+				<1 RK_PD1 10 &pcfg_pull_up>,
+				/* uart6_tx_m2 */
+				<1 RK_PD0 10 &pcfg_pull_up>;
+		};
+	};
+
+	uart7 {
+		/omit-if-no-ref/
+		uart7m1_xfer: uart7m1-xfer {
+			rockchip,pins =
+				/* uart7_rx_m1 */
+				<3 RK_PC1 10 &pcfg_pull_up>,
+				/* uart7_tx_m1 */
+				<3 RK_PC0 10 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart7m1_ctsn: uart7m1-ctsn {
+			rockchip,pins =
+				/* uart7m1_ctsn */
+				<3 RK_PC3 10 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart7m1_rtsn: uart7m1-rtsn {
+			rockchip,pins =
+				/* uart7m1_rtsn */
+				<3 RK_PC2 10 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart7m2_xfer: uart7m2-xfer {
+			rockchip,pins =
+				/* uart7_rx_m2 */
+				<1 RK_PB4 10 &pcfg_pull_up>,
+				/* uart7_tx_m2 */
+				<1 RK_PB5 10 &pcfg_pull_up>;
+		};
+	};
+
+	uart8 {
+		/omit-if-no-ref/
+		uart8m0_xfer: uart8m0-xfer {
+			rockchip,pins =
+				/* uart8_rx_m0 */
+				<4 RK_PB1 10 &pcfg_pull_up>,
+				/* uart8_tx_m0 */
+				<4 RK_PB0 10 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart8m0_ctsn: uart8m0-ctsn {
+			rockchip,pins =
+				/* uart8m0_ctsn */
+				<4 RK_PB3 10 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart8m0_rtsn: uart8m0-rtsn {
+			rockchip,pins =
+				/* uart8m0_rtsn */
+				<4 RK_PB2 10 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart8m1_xfer: uart8m1-xfer {
+			rockchip,pins =
+				/* uart8_rx_m1 */
+				<3 RK_PA3 10 &pcfg_pull_up>,
+				/* uart8_tx_m1 */
+				<3 RK_PA2 10 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart8m1_ctsn: uart8m1-ctsn {
+			rockchip,pins =
+				/* uart8m1_ctsn */
+				<3 RK_PA5 10 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart8m1_rtsn: uart8m1-rtsn {
+			rockchip,pins =
+				/* uart8m1_rtsn */
+				<3 RK_PA4 10 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart8_xfer: uart8-xfer {
+			rockchip,pins =
+				/* uart8_rx_ */
+				<4 RK_PB1 10 &pcfg_pull_up>;
+		};
+	};
+
+	uart9 {
+		/omit-if-no-ref/
+		uart9m1_xfer: uart9m1-xfer {
+			rockchip,pins =
+				/* uart9_rx_m1 */
+				<4 RK_PB5 10 &pcfg_pull_up>,
+				/* uart9_tx_m1 */
+				<4 RK_PB4 10 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart9m1_ctsn: uart9m1-ctsn {
+			rockchip,pins =
+				/* uart9m1_ctsn */
+				<4 RK_PA1 10 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart9m1_rtsn: uart9m1-rtsn {
+			rockchip,pins =
+				/* uart9m1_rtsn */
+				<4 RK_PA0 10 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart9m2_xfer: uart9m2-xfer {
+			rockchip,pins =
+				/* uart9_rx_m2 */
+				<3 RK_PD4 10 &pcfg_pull_up>,
+				/* uart9_tx_m2 */
+				<3 RK_PD5 10 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart9m2_ctsn: uart9m2-ctsn {
+			rockchip,pins =
+				/* uart9m2_ctsn */
+				<3 RK_PD3 10 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart9m2_rtsn: uart9m2-rtsn {
+			rockchip,pins =
+				/* uart9m2_rtsn */
+				<3 RK_PD2 10 &pcfg_pull_none>;
+		};
+	};
+
+	vop {
+		/omit-if-no-ref/
+		vop_pins: vop-pins {
+			rockchip,pins =
+				/* vop_post_empty */
+				<1 RK_PA2 1 &pcfg_pull_none>;
+		};
+	};
+};
+
+/*
+ * This part is edited handly.
+ */
+&pinctrl {
+	bt656 {
+		/omit-if-no-ref/
+		bt656_pins: bt656-pins {
+			rockchip,pins =
+				/* bt1120_clkout */
+				<4 RK_PB0 2 &pcfg_pull_none_drv_level_2>,
+				/* bt1120_d0 */
+				<4 RK_PA0 2 &pcfg_pull_none_drv_level_2>,
+				/* bt1120_d1 */
+				<4 RK_PA1 2 &pcfg_pull_none_drv_level_2>,
+				/* bt1120_d2 */
+				<4 RK_PA2 2 &pcfg_pull_none_drv_level_2>,
+				/* bt1120_d3 */
+				<4 RK_PA3 2 &pcfg_pull_none_drv_level_2>,
+				/* bt1120_d4 */
+				<4 RK_PA4 2 &pcfg_pull_none_drv_level_2>,
+				/* bt1120_d5 */
+				<4 RK_PA5 2 &pcfg_pull_none_drv_level_2>,
+				/* bt1120_d6 */
+				<4 RK_PA6 2 &pcfg_pull_none_drv_level_2>,
+				/* bt1120_d7 */
+				<4 RK_PA7 2 &pcfg_pull_none_drv_level_2>;
+		};
+	};
+
+	gpio-func {
+		/omit-if-no-ref/
+		tsadc_gpio_func: tsadc-gpio-func {
+			rockchip,pins =
+				<0 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
-- 
2.35.1

