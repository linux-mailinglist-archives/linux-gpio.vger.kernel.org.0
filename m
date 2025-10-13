Return-Path: <linux-gpio+bounces-27049-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 942DABD5E47
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 21:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47C00405E9C
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 19:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E344E2D8DC3;
	Mon, 13 Oct 2025 19:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GeAjggwa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980CB2D6407;
	Mon, 13 Oct 2025 19:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760382734; cv=none; b=LQwHbKgk+vxdFNl5FGgrJWHNVyL9E2X37R0ll1M8BcMpakM12x7Tm3ego1LW3RyjQgi7PqHlk0AAAXDvVqDY6eJM5AXSt7ozte+WZg/CYp5NcpbMjoqlI+dbwy3P1U0xDJptx544L3TW7mZVas7SaOLB3N86fGN73H04Mz63wZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760382734; c=relaxed/simple;
	bh=TBuH5vfsNCCAmDPCeWRAxDm4BbVIYflZ5xFMniHdeRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ImPvk0+I8k+SR01FulCE4k4qsKKkrbq5qfUbLMawLtogQ9xFXopKktf0n8BfSaf7+AuWz+h/o21iticxuENEc3cTZghkaj3WgmH6k2OQF9j4K0oCBcIyongqPgbyA9Fe3s8WjTTBOibCYgft5dr5I7d5ONv7MRQreRe8+Lyb5Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GeAjggwa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4ED9C4CEE7;
	Mon, 13 Oct 2025 19:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760382734;
	bh=TBuH5vfsNCCAmDPCeWRAxDm4BbVIYflZ5xFMniHdeRw=;
	h=From:To:Cc:Subject:Date:From;
	b=GeAjggwadD0hUfrz+hVoo9cGVGHlWIjz83HDogezRJxItXPov7MnrywPR7DGjZZ9k
	 40iQ1tnran1H6Q7g4OCxQ1SKDC6xnshSNZ3cxr234Xo9mRFeEBxWdGmBjk0R2vyY+3
	 7UesxTP9MhkOHlv/Euy3LKnp7PfMAYlGGV0ylCvIjOF1+tRoyi0h5tyLiU5or4ubXT
	 fsC+luveEd7EjMx8/KjniMINxJ9764CE8OOg5KVxh+4qCi11iNzX23zyJjXs9Uh6wc
	 yDeLa4FgM4ToyN3hqiFUQinud5bwuTWKesRAkBfKMPZRlaBLMFuCaWXd+QrsiVDLBa
	 +VZl5EX1ihnDw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: Convert actions,s700-pinctrl to DT schema
Date: Mon, 13 Oct 2025 14:12:05 -0500
Message-ID: <20251013191207.4135075-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the actions,s700-pinctrl binding to DT schema format. It's a
straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/pinctrl/actions,s700-pinctrl.txt | 170 ---------------
 .../pinctrl/actions,s700-pinctrl.yaml         | 204 ++++++++++++++++++
 2 files changed, 204 insertions(+), 170 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/actions,s700-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/actions,s700-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/actions,s700-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/actions,s700-pinctrl.txt
deleted file mode 100644
index d13ff82f8518..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/actions,s700-pinctrl.txt
+++ /dev/null
@@ -1,170 +0,0 @@
-Actions Semi S700 Pin Controller
-
-This binding describes the pin controller found in the S700 SoC.
-
-Required Properties:
-
-- compatible:   Should be "actions,s700-pinctrl"
-- reg:          Should contain the register base address and size of
-		the pin controller.
-- clocks:       phandle of the clock feeding the pin controller
-- gpio-controller: Marks the device node as a GPIO controller.
-- gpio-ranges: Specifies the mapping between gpio controller and
-               pin-controller pins.
-- #gpio-cells: Should be two. The first cell is the gpio pin number
-		and the second cell is used for optional parameters.
-- interrupt-controller: Marks the device node as an interrupt controller.
-- #interrupt-cells: Specifies the number of cells needed to encode an
-		interrupt.  Shall be set to 2.  The first cell
-		defines the interrupt number, the second encodes
-		the trigger flags described in
-		bindings/interrupt-controller/interrupts.txt
-- interrupts: The interrupt outputs from the controller. There is one GPIO
-              interrupt per GPIO bank. The number of interrupts listed depends
-              on the number of GPIO banks on the SoC. The interrupts must be
-              ordered by bank, starting with bank 0.
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices, including the meaning of the
-phrase "pin configuration node".
-
-The pin configuration nodes act as a container for an arbitrary number of
-subnodes. Each of these subnodes represents some desired configuration for a
-pin, a group, or a list of pins or groups. This configuration can include the
-mux function to select on those group(s), and various pin configuration
-parameters, such as pull-up, drive strength, etc.
-
-PIN CONFIGURATION NODES:
-
-The name of each subnode is not important; all subnodes should be enumerated
-and processed purely based on their content.
-
-Each subnode only affects those parameters that are explicitly listed. In
-other words, a subnode that lists a mux function but no pin configuration
-parameters implies no information about any pin configuration parameters.
-Similarly, a pin subnode that describes a pullup parameter implies no
-information about e.g. the mux function.
-
-Pinmux functions are available only for the pin groups while pinconf
-parameters are available for both pin groups and individual pins.
-
-The following generic properties as defined in pinctrl-bindings.txt are valid
-to specify in a pin configuration subnode:
-
-Required Properties:
-
-- pins:		An array of strings, each string containing the name of a pin.
-		These pins are used for selecting the pull control and schmitt
-		trigger parameters. The following are the list of pins
-		available:
-
-		eth_txd0, eth_txd1, eth_txd2, eth_txd3, eth_txen, eth_rxer,
-		eth_crs_dv, eth_rxd1, eth_rxd0, eth_rxd2, eth_rxd3, eth_ref_clk,
-		eth_mdc, eth_mdio, sirq0, sirq1, sirq2, i2s_d0, i2s_bclk0,
-		i2s_lrclk0, i2s_mclk0, i2s_d1, i2s_bclk1, i2s_lrclk1, i2s_mclk1,
-		pcm1_in, pcm1_clk, pcm1_sync, pcm1_out, ks_in0, ks_in1, ks_in2,
-		ks_in3, ks_out0, ks_out1, ks_out2, lvds_oep, lvds_oen, lvds_odp,
-		lvds_odn, lvds_ocp, lvds_ocn, lvds_obp, lvds_obn, lvds_oap,
-		lvds_oan, lvds_eep, lvds_een, lvds_edp, lvds_edn, lvds_ecp,
-		lvds_ecn, lvds_ebp, lvds_ebn, lvds_eap, lvds_ean, lcd0_d18,
-		lcd0_d2, dsi_dp3, dsi_dn3, dsi_dp1, dsi_dn1, dsi_cp, dsi_cn,
-		dsi_dp0, dsi_dn0, dsi_dp2, dsi_dn2, sd0_d0, sd0_d1, sd0_d2,
-		sd0_d3, sd1_d0, sd1_d1, sd1_d2, sd1_d3, sd0_cmd, sd0_clk,
-		sd1_cmd, sd1_clk, spi0_ss, spi0_miso, uart0_rx, uart0_tx,
-		uart2_rx, uart2_tx, uart2_rtsb, uart2_ctsb, uart3_rx, uart3_tx,
-		uart3_rtsb, uart3_ctsb, i2c0_sclk, i2c0_sdata, i2c1_sclk,
-		i2c1_sdata, i2c2_sdata, csi_dn0, csi_dp0, csi_dn1, csi_dp1,
-		csi_cn, csi_cp, csi_dn2, csi_dp2, csi_dn3, csi_dp3,
-		sensor0_pclk, sensor0_ckout, dnand_d0, dnand_d1, dnand_d2,
-		dnand_d3, dnand_d4, dnand_d5, dnand_d6, dnand_d7, dnand_wrb,
-		dnand_rdb, dnand_rdbn, dnand_dqs, dnand_dqsn, dnand_rb0,
-		dnand_ale, dnand_cle, dnand_ceb0, dnand_ceb1, dnand_ceb2,
-		dnand_ceb3, porb, clko_25m, bsel, pkg0, pkg1, pkg2, pkg3
-
-- groups:       An array of strings, each string containing the name of a pin
-                group. These pin groups are used for selecting the pinmux
-                functions.
-		rgmii_txd23_mfp, rgmii_rxd2_mfp, rgmii_rxd3_mfp, lcd0_d18_mfp,
-		rgmii_txd01_mfp, rgmii_txd0_mfp, rgmii_txd1_mfp, rgmii_txen_mfp,
-		rgmii_rxen_mfp, rgmii_rxd1_mfp, rgmii_rxd0_mfp, rgmii_ref_clk_mfp,
-		i2s_d0_mfp, i2s_pcm1_mfp, i2s0_pcm0_mfp, i2s1_pcm0_mfp,
-		i2s_d1_mfp, ks_in2_mfp, ks_in1_mfp, ks_in0_mfp, ks_in3_mfp,
-		ks_out0_mfp, ks_out1_mfp, ks_out2_mfp, lvds_o_pn_mfp, dsi_dn0_mfp,
-		dsi_dp2_mfp, lcd0_d2_mfp, dsi_dp3_mfp, dsi_dn3_mfp, dsi_dp0_mfp,
-		lvds_ee_pn_mfp, uart2_rx_tx_mfp, spi0_i2c_pcm_mfp, dsi_dnp1_cp_d2_mfp,
-		dsi_dnp1_cp_d17_mfp, lvds_e_pn_mfp, dsi_dn2_mfp, uart2_rtsb_mfp,
-		uart2_ctsb_mfp, uart3_rtsb_mfp, uart3_ctsb_mfp, sd0_d0_mfp, sd0_d1_mfp,
-		sd0_d2_d3_mfp, sd1_d0_d3_mfp, sd0_cmd_mfp, sd0_clk_mfp, sd1_cmd_mfp,
-		uart0_rx_mfp, clko_25m_mfp, csi_cn_cp_mfp, sens0_ckout_mfp, uart0_tx_mfp,
-		i2c0_mfp, csi_dn_dp_mfp, sen0_pclk_mfp, pcm1_in_mfp, pcm1_clk_mfp,
-		pcm1_sync_mfp, pcm1_out_mfp, dnand_data_wr_mfp, dnand_acle_ce0_mfp,
-		nand_ceb2_mfp, nand_ceb3_mfp
-
-		These pin groups are used for selecting the drive strength
-		parameters.
-
-		sirq_drv, rgmii_txd23_drv, rgmii_rxd23_drv, rgmii_txd01_txen_drv,
-		rgmii_rxer_drv, rgmii_crs_drv, rgmii_rxd10_drv, rgmii_ref_clk_drv,
-		smi_mdc_mdio_drv, i2s_d0_drv, i2s_bclk0_drv, i2s3_drv, i2s13_drv,
-		pcm1_drv, ks_in_drv, ks_out_drv, lvds_all_drv, lcd_d18_d2_drv,
-		dsi_all_drv, sd0_d0_d3_drv, sd0_cmd_drv, sd0_clk_drv, spi0_all_drv,
-		uart0_rx_drv, uart0_tx_drv, uart2_all_drv, i2c0_all_drv, i2c12_all_drv,
-		sens0_pclk_drv, sens0_ckout_drv, uart3_all_drv
-
-- function:	An array of strings, each string containing the name of the
-		pinmux functions. These functions can only be selected by
-		the corresponding pin groups. The following are the list of
-		pinmux functions available:
-
-		nor, eth_rgmii, eth_sgmii, spi0, spi1, spi2, spi3, seNs0, sens1,
-		uart0, uart1, uart2, uart3, uart4, uart5, uart6, i2s0, i2s1,
-		pcm1, pcm0, ks, jtag, pwm0, pwm1, pwm2, pwm3, pwm4, pwm5, p0,
-		sd0, sd1, sd2, i2c0, i2c1, i2c2, i2c3, dsi, lvds, usb30,
-		clko_25m, mipi_csi, nand, spdif, sirq0, sirq1, sirq2, bt, lcd0
-
-Optional Properties:
-
-- bias-pull-down: No arguments. The specified pins should be configured as
-		pull down.
-- bias-pull-up:   No arguments. The specified pins should be configured as
-		pull up.
-- input-schmitt-enable: No arguments: Enable schmitt trigger for the specified
-		pins
-- input-schmitt-disable: No arguments: Disable schmitt trigger for the specified
-		pins
-- drive-strength: Integer. Selects the drive strength for the specified
-		pins in mA.
-		Valid values are:
-		<2>
-		<4>
-		<8>
-		<12>
-
-Example:
-
-	pinctrl: pinctrl@e01b0000 {
-		compatible = "actions,s700-pinctrl";
-		reg = <0x0 0xe01b0000 0x0 0x1000>;
-		clocks = <&cmu CLK_GPIO>;
-		gpio-controller;
-		gpio-ranges = <&pinctrl 0 0 136>;
-		#gpio-cells = <2>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-                interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
-                             <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
-                             <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
-                             <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
-                             <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
-
-		uart3-default: uart3-default {
-			pinmux {
-				groups = "uart3_rtsb_mfp", "uart3_ctsb_mfp";
-				function = "uart3";
-			};
-			pinconf {
-				groups = "uart3_all_drv";
-				drive-strength = <2>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/pinctrl/actions,s700-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/actions,s700-pinctrl.yaml
new file mode 100644
index 000000000000..9597b983c332
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/actions,s700-pinctrl.yaml
@@ -0,0 +1,204 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/actions,s700-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Actions Semi S700 Pin Controller
+
+maintainers:
+  - Manivannan Sadhasivam <mani@kernel.org>
+
+properties:
+  compatible:
+    const: actions,s700-pinctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  gpio-controller: true
+
+  gpio-line-names:
+    maxItems: 136
+
+  gpio-ranges: true
+
+  '#gpio-cells':
+    const: 2
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  interrupts:
+    maxItems: 5
+    description:
+      The interrupt outputs from the controller. There is one GPIO interrupt per
+      GPIO bank. The interrupts must be ordered by bank, starting with
+      bank 0.
+
+additionalProperties:
+  type: object
+  description: Pin configuration subnode
+  additionalProperties: false
+
+  properties:
+    pinmux:
+      description: Configure pin multiplexing.
+      type: object
+      $ref: /schemas/pinctrl/pinmux-node.yaml#
+      additionalProperties: false
+
+      properties:
+        groups:
+          items:
+            enum: [
+              rgmii_txd23_mfp, rgmii_rxd2_mfp, rgmii_rxd3_mfp, lcd0_d18_mfp,
+              rgmii_txd01_mfp, rgmii_txd0_mfp, rgmii_txd1_mfp, rgmii_txen_mfp,
+              rgmii_rxen_mfp, rgmii_rxd1_mfp, rgmii_rxd0_mfp, rgmii_ref_clk_mfp,
+              i2c1_dummy, i2c2_dummy, i2s_d0_mfp, i2s_pcm1_mfp, i2s0_pcm0_mfp, i2s1_pcm0_mfp,
+              i2s_d1_mfp, ks_in2_mfp, ks_in1_mfp, ks_in0_mfp, ks_in3_mfp,
+              ks_out0_mfp, ks_out1_mfp, ks_out2_mfp, lvds_o_pn_mfp, dsi_dn0_mfp,
+              dsi_dp2_mfp, lcd0_d2_mfp, dsi_dp3_mfp, dsi_dn3_mfp, dsi_dp0_mfp,
+              lvds_ee_pn_mfp, uart2_rx_tx_mfp, spi0_i2c_pcm_mfp,
+              dsi_dnp1_cp_d2_mfp, dsi_dnp1_cp_d17_mfp, lvds_e_pn_mfp,
+              dsi_dn2_mfp, uart2_rtsb_mfp, uart2_ctsb_mfp, uart3_rtsb_mfp,
+              uart3_ctsb_mfp, sd0_d0_mfp, sd0_d1_mfp, sd0_d2_d3_mfp,
+              sd1_d0_d3_mfp, sd0_cmd_mfp, sd0_clk_mfp, sd1_cmd_mfp,
+              uart0_rx_mfp, clko_25m_mfp, csi_cn_cp_mfp, sens0_ckout_mfp,
+              uart0_tx_mfp, i2c0_mfp, csi_dn_dp_mfp, sen0_pclk_mfp, pcm1_in_mfp,
+              pcm1_clk_mfp, pcm1_sync_mfp, pcm1_out_mfp, dnand_data_wr_mfp,
+              dnand_acle_ce0_mfp, nand_ceb2_mfp, nand_ceb3_mfp
+            ]
+
+        function:
+          items:
+            enum: [
+              nor, eth_rgmii, eth_sgmii, spi0, spi1, spi2, spi3, seNs0, sens1,
+              uart0, uart1, uart2, uart3, uart4, uart5, uart6, i2s0, i2s1, pcm1,
+              pcm0, ks, jtag, pwm0, pwm1, pwm2, pwm3, pwm4, pwm5, p0, sd0, sd1,
+              sd2, i2c0, i2c1, i2c2, i2c3, dsi, lvds, usb30, clko_25m, mipi_csi,
+              nand, spdif, sirq0, sirq1, sirq2, bt, lcd0
+            ]
+
+      required:
+        - groups
+        - function
+
+    pinconf:
+      description: Configure pin-specific parameters.
+      type: object
+      allOf:
+        - $ref: /schemas/pinctrl/pincfg-node.yaml#
+        - $ref: /schemas/pinctrl/pinmux-node.yaml#
+      additionalProperties: false
+
+      properties:
+        groups:
+          items:
+            enum: [
+              sirq_drv, rgmii_txd23_drv, rgmii_rxd23_drv, rgmii_txd01_txen_drv,
+              rgmii_rxer_drv, rgmii_crs_drv, rgmii_rxd10_drv, rgmii_ref_clk_drv,
+              smi_mdc_mdio_drv, i2s_d0_drv, i2s_bclk0_drv, i2s3_drv, i2s13_drv,
+              pcm1_drv, ks_in_drv, ks_out_drv, lvds_all_drv, lcd_d18_d2_drv,
+              dsi_all_drv, sd0_d0_d3_drv, sd0_cmd_drv, sd0_clk_drv,
+              spi0_all_drv, uart0_rx_drv, uart0_tx_drv, uart2_all_drv,
+              i2c0_all_drv, i2c12_all_drv, sens0_pclk_drv, sens0_ckout_drv,
+              uart3_all_drv
+            ]
+
+        pins:
+          items:
+            enum: [
+              eth_txd0, eth_txd1, eth_txd2, eth_txd3, eth_txen, eth_rxer,
+              eth_crs_dv, eth_rxd1, eth_rxd0, eth_rxd2, eth_rxd3, eth_ref_clk,
+              eth_mdc, eth_mdio, sirq0, sirq1, sirq2, i2s_d0, i2s_bclk0,
+              i2s_lrclk0, i2s_mclk0, i2s_d1, i2s_bclk1, i2s_lrclk1, i2s_mclk1,
+              pcm1_in, pcm1_clk, pcm1_sync, pcm1_out, ks_in0, ks_in1, ks_in2,
+              ks_in3, ks_out0, ks_out1, ks_out2, lvds_oep, lvds_oen, lvds_odp,
+              lvds_odn, lvds_ocp, lvds_ocn, lvds_obp, lvds_obn, lvds_oap,
+              lvds_oan, lvds_eep, lvds_een, lvds_edp, lvds_edn, lvds_ecp,
+              lvds_ecn, lvds_ebp, lvds_ebn, lvds_eap, lvds_ean, lcd0_d18,
+              lcd0_d2, dsi_dp3, dsi_dn3, dsi_dp1, dsi_dn1, dsi_cp, dsi_cn,
+              dsi_dp0, dsi_dn0, dsi_dp2, dsi_dn2, sd0_d0, sd0_d1, sd0_d2,
+              sd0_d3, sd1_d0, sd1_d1, sd1_d2, sd1_d3, sd0_cmd, sd0_clk, sd1_cmd,
+              sd1_clk, spi0_ss, spi0_miso, uart0_rx, uart0_tx, uart2_rx,
+              uart2_tx, uart2_rtsb, uart2_ctsb, uart3_rx, uart3_tx, uart3_rtsb,
+              uart3_ctsb, i2c0_sclk, i2c0_sdata, i2c1_sclk, i2c1_sdata,
+              i2c2_sclk, i2c2_sdata, csi_dn0, csi_dp0, csi_dn1, csi_dp1, csi_cn, csi_cp,
+              csi_dn2, csi_dp2, csi_dn3, csi_dp3, sensor0_pclk, sensor0_ckout,
+              dnand_d0, dnand_d1, dnand_d2, dnand_d3, dnand_d4, dnand_d5,
+              dnand_d6, dnand_d7, dnand_wrb, dnand_rdb, dnand_rdbn, dnand_dqs,
+              dnand_dqsn, dnand_rb0, dnand_ale, dnand_cle, dnand_ceb0,
+              dnand_ceb1, dnand_ceb2, dnand_ceb3, porb, clko_25m, bsel, pkg0,
+              pkg1, pkg2, pkg3
+            ]
+
+        bias-pull-down:
+          type: boolean
+
+        bias-pull-up:
+          type: boolean
+
+        drive-strength:
+          description: Selects the drive strength for the specified pins in mA.
+          enum: [2, 4, 8, 12]
+
+        input-schmitt-enable: true
+        input-schmitt-disable: true
+
+      oneOf:
+        - required:
+            - groups
+        - required:
+            - pins
+
+  anyOf:
+    - required: [ pinmux ]
+    - required: [ pinconf ]
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - gpio-controller
+  - gpio-ranges
+  - '#gpio-cells'
+  - interrupt-controller
+  - '#interrupt-cells'
+  - interrupts
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pinctrl: pinctrl@e01b0000 {
+        compatible = "actions,s700-pinctrl";
+        reg = <0xe01b0000 0x1000>;
+        clocks = <&cmu 1>;
+        gpio-controller;
+        gpio-ranges = <&pinctrl 0 0 136>;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+
+        uart3-default {
+            pinmux {
+                groups = "uart3_rtsb_mfp", "uart3_ctsb_mfp";
+                function = "uart3";
+            };
+            pinconf {
+                groups = "uart3_all_drv";
+                drive-strength = <2>;
+            };
+        };
+    };
-- 
2.51.0


