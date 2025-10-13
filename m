Return-Path: <linux-gpio+bounces-27050-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEBCBD5E56
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 21:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 270ED18A788A
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 19:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C5A2D97A0;
	Mon, 13 Oct 2025 19:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LINwk7qk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7512D8767;
	Mon, 13 Oct 2025 19:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760382743; cv=none; b=S9XsLaRuQJQ2RA/gXAFf+1f6lY+IQKGCN1V+8/c4dUAN6aPh9URkdHpLDMG8KfHugt6dZD3g24ztLJrWti84LeBGQ21FmjZG6kPN6MrYw1YBGyRRjrT6L1ok4PIp0B6nrE3ssUvGA086fSJlmJb3RLeiVrRbDyIq0urSs+PAt4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760382743; c=relaxed/simple;
	bh=2M4CuLMTEcUM2eeETAWneoK1kT0IzbWvcH+Ur98DQzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y6VR8oUZfVzvnQIz2xPPdsATf6nisoYJuIvuS/H9CrdKwqysIeoezJlN0gPZjp1NLoZtU2rinv6TZi3m7vI+EKey8J4iPMZW/kOeoBhFNDGyUdygvBTs9im8S1xK31AQqElsNg2QJ1Pf0e+lMNRhymVvZgEkoWflo5xlsx852pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LINwk7qk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0EC4C4CEE7;
	Mon, 13 Oct 2025 19:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760382743;
	bh=2M4CuLMTEcUM2eeETAWneoK1kT0IzbWvcH+Ur98DQzQ=;
	h=From:To:Cc:Subject:Date:From;
	b=LINwk7qkK6YTnF460rlVosebFJdv97mAUncbOhGNXybgJCvoCDO0K58RTw0ZI+9Q9
	 owqwKQqSPRAJVMB0SRUXEO54IU76fv27fJ0HXxe3BWh2ZJayi0TppDArGet5HahTS2
	 jhMaUO7cMTvDeoTYImCCvJ7fACk/sF875AJNjOxYcCrlc/KJYYesS33ubRhWzIzsLI
	 pkIye/8KHETv1XeqvPf3+fUtV64lfdHUu2lCgtZvAj28OSaW1LTJfBCzTm95+63uDz
	 6IO2dpKbkhCAkhbunQKoeg172D49JaTucaT98DBJePB7BKBk33vj8IfOw4K4oxkhuV
	 WNCmPUq4AwBsg==
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
Subject: [PATCH] dt-bindings: pinctrl: Convert actions,s900-pinctrl to DT schema
Date: Mon, 13 Oct 2025 14:12:16 -0500
Message-ID: <20251013191218.4136673-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the actions,s900-pinctrl binding to DT schema format. It's a
straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/pinctrl/actions,s900-pinctrl.txt | 204 ----------------
 .../pinctrl/actions,s900-pinctrl.yaml         | 219 ++++++++++++++++++
 2 files changed, 219 insertions(+), 204 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/actions,s900-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/actions,s900-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/actions,s900-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/actions,s900-pinctrl.txt
deleted file mode 100644
index 81b58dddd3ed..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/actions,s900-pinctrl.txt
+++ /dev/null
@@ -1,204 +0,0 @@
-Actions Semi S900 Pin Controller
-
-This binding describes the pin controller found in the S900 SoC.
-
-Required Properties:
-
-- compatible:   Should be "actions,s900-pinctrl"
-- reg:          Should contain the register base address and size of
-                the pin controller.
-- clocks:       phandle of the clock feeding the pin controller
-- gpio-controller: Marks the device node as a GPIO controller.
-- gpio-ranges: Specifies the mapping between gpio controller and
-               pin-controller pins.
-- #gpio-cells: Should be two. The first cell is the gpio pin number
-               and the second cell is used for optional parameters.
-- interrupt-controller: Marks the device node as an interrupt controller.
-- #interrupt-cells: Specifies the number of cells needed to encode an
-                    interrupt.  Shall be set to 2.  The first cell
-                    defines the interrupt number, the second encodes
-                    the trigger flags described in
-                    bindings/interrupt-controller/interrupts.txt
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
-- pins:           An array of strings, each string containing the name of a pin.
-                  These pins are used for selecting the pull control and schmitt
-                  trigger parameters. The following are the list of pins
-                  available:
-
-                  eth_txd0, eth_txd1, eth_txen, eth_rxer, eth_crs_dv,
-                  eth_rxd1, eth_rxd0, eth_ref_clk, eth_mdc, eth_mdio,
-                  sirq0, sirq1, sirq2, i2s_d0, i2s_bclk0, i2s_lrclk0,
-                  i2s_mclk0, i2s_d1, i2s_bclk1, i2s_lrclk1, i2s_mclk1,
-                  pcm1_in, pcm1_clk, pcm1_sync, pcm1_out, eram_a5,
-                  eram_a6, eram_a7, eram_a8, eram_a9, eram_a10, eram_a11,
-                  lvds_oep, lvds_oen, lvds_odp, lvds_odn, lvds_ocp,
-                  lvds_ocn, lvds_obp, lvds_obn, lvds_oap, lvds_oan,
-                  lvds_eep, lvds_een, lvds_edp, lvds_edn, lvds_ecp,
-                  lvds_ecn, lvds_ebp, lvds_ebn, lvds_eap, lvds_ean,
-                  sd0_d0, sd0_d1, sd0_d2, sd0_d3, sd1_d0, sd1_d1,
-                  sd1_d2, sd1_d3, sd0_cmd, sd0_clk, sd1_cmd, sd1_clk,
-                  spi0_sclk, spi0_ss, spi0_miso, spi0_mosi, uart0_rx,
-                  uart0_tx, uart2_rx, uart2_tx, uart2_rtsb, uart2_ctsb,
-                  uart3_rx, uart3_tx, uart3_rtsb, uart3_ctsb, uart4_rx,
-                  uart4_tx, i2c0_sclk, i2c0_sdata, i2c1_sclk, i2c1_sdata,
-                  i2c2_sclk, i2c2_sdata, csi0_dn0, csi0_dp0, csi0_dn1,
-                  csi0_dp1, csi0_cn, csi0_cp, csi0_dn2, csi0_dp2, csi0_dn3,
-                  csi0_dp3, dsi_dp3, dsi_dn3, dsi_dp1, dsi_dn1, dsi_cp,
-                  dsi_cn, dsi_dp0, dsi_dn0, dsi_dp2, dsi_dn2, sensor0_pclk,
-                  csi1_dn0,csi1_dp0,csi1_dn1, csi1_dp1, csi1_cn, csi1_cp,
-                  sensor0_ckout, nand0_d0, nand0_d1, nand0_d2, nand0_d3,
-                  nand0_d4, nand0_d5, nand0_d6, nand0_d7, nand0_dqs,
-                  nand0_dqsn, nand0_ale, nand0_cle, nand0_ceb0, nand0_ceb1,
-                  nand0_ceb2, nand0_ceb3, nand1_d0, nand1_d1, nand1_d2,
-                  nand1_d3, nand1_d4, nand1_d5, nand1_d6, nand1_d7, nand1_dqs,
-                  nand1_dqsn, nand1_ale, nand1_cle, nand1_ceb0, nand1_ceb1,
-                  nand1_ceb2, nand1_ceb3, sgpio0, sgpio1, sgpio2, sgpio3
-
-- groups:         An array of strings, each string containing the name of a pin
-                  group. These pin groups are used for selecting the pinmux
-                  functions.
-
-                  lvds_oxx_uart4_mfp, rmii_mdc_mfp, rmii_mdio_mfp, sirq0_mfp,
-                  sirq1_mfp, rmii_txd0_mfp, rmii_txd1_mfp, rmii_txen_mfp,
-                  rmii_rxer_mfp, rmii_crs_dv_mfp, rmii_rxd1_mfp, rmii_rxd0_mfp,
-                  rmii_ref_clk_mfp, i2s_d0_mfp, i2s_d1_mfp, i2s_lr_m_clk0_mfp,
-                  i2s_bclk0_mfp, i2s_bclk1_mclk1_mfp, pcm1_in_out_mfp,
-                  pcm1_clk_mfp, pcm1_sync_mfp, eram_a5_mfp, eram_a6_mfp,
-                  eram_a7_mfp, eram_a8_mfp, eram_a9_mfp, eram_a10_mfp,
-                  eram_a11_mfp, lvds_oep_odn_mfp, lvds_ocp_obn_mfp,
-                  lvds_oap_oan_mfp, lvds_e_mfp, spi0_sclk_mosi_mfp, spi0_ss_mfp,
-                  spi0_miso_mfp, uart2_rtsb_mfp, uart2_ctsb_mfp, uart3_rtsb_mfp,
-                  uart3_ctsb_mfp, sd0_d0_mfp, sd0_d1_mfp, sd0_d2_d3_mfp,
-                  sd1_d0_d3_mfp, sd0_cmd_mfp, sd0_clk_mfp, sd1_cmd_clk_mfp,
-                  uart0_rx_mfp, nand0_d0_ceb3_mfp, uart0_tx_mfp, i2c0_mfp,
-                  csi0_cn_cp_mfp, csi0_dn0_dp3_mfp, csi1_dn0_cp_mfp,
-                  dsi_dp3_dn1_mfp, dsi_cp_dn0_mfp, dsi_dp2_dn2_mfp,
-                  nand1_d0_ceb1_mfp, nand1_ceb3_mfp, nand1_ceb0_mfp,
-                  csi1_dn0_dp0_mfp, uart4_rx_tx_mfp
-
-
-                  These pin groups are used for selecting the drive strength
-                  parameters.
-
-                  sgpio3_drv, sgpio2_drv, sgpio1_drv, sgpio0_drv,
-                  rmii_tx_d0_d1_drv, rmii_txen_rxer_drv, rmii_crs_dv_drv,
-                  rmii_rx_d1_d0_drv, rmii_ref_clk_drv, rmii_mdc_mdio_drv,
-                  sirq_0_1_drv, sirq2_drv, i2s_d0_d1_drv, i2s_lr_m_clk0_drv,
-                  i2s_blk1_mclk1_drv, pcm1_in_out_drv, lvds_oap_oan_drv,
-                  lvds_oep_odn_drv, lvds_ocp_obn_drv, lvds_e_drv, sd0_d3_d0_drv,
-                  sd1_d3_d0_drv, sd0_sd1_cmd_clk_drv, spi0_sclk_mosi_drv,
-                  spi0_ss_miso_drv, uart0_rx_tx_drv, uart4_rx_tx_drv, uart2_drv,
-                  uart3_drv, i2c0_drv, i2c1_drv, i2c2_drv, sensor0_drv
-
-                  These pin groups are used for selecting the slew rate
-                  parameters.
-
-                  sgpio3_sr, sgpio2_sr, sgpio1_sr, sgpio0_sr, rmii_tx_d0_d1_sr,
-                  rmii_txen_rxer_sr, rmii_crs_dv_sr, rmii_rx_d1_d0_sr,
-                  rmii_ref_clk_sr, rmii_mdc_mdio_sr, sirq_0_1_sr, sirq2_sr,
-                  i2s_do_d1_sr, i2s_lr_m_clk0_sr, i2s_bclk0_mclk1_sr,
-                  pcm1_in_out_sr, sd1_d3_d0_sr, sd0_sd1_clk_cmd_sr,
-                  spi0_sclk_mosi_sr, spi0_ss_miso_sr, uart0_rx_tx_sr,
-                  uart4_rx_tx_sr, uart2_sr, uart3_sr, i2c0_sr, i2c1_sr, i2c2_sr,
-                  sensor0_sr
-
-- function:       An array of strings, each string containing the name of the
-                  pinmux functions. These functions can only be selected by
-                  the corresponding pin groups. The following are the list of
-                  pinmux functions available:
-
-                  eram, eth_rmii, eth_smii, spi0, spi1, spi2, spi3, sens0,
-                  uart0, uart1, uart2, uart3, uart4, uart5, uart6, i2s0, i2s1,
-                  pcm0, pcm1, jtag, pwm0, pwm1, pwm2, pwm3, pwm4, pwm5, sd0,
-                  sd1, sd2, sd3, i2c0, i2c1, i2c2, i2c3, i2c4, i2c5, lvds,
-                  usb30, usb20, gpu, mipi_csi0, mipi_csi1, mipi_dsi, nand0,
-                  nand1, spdif, sirq0, sirq1, sirq2
-
-Optional Properties:
-
-- bias-bus-hold:  No arguments. The specified pins should retain the previous
-                  state value.
-- bias-high-impedance: No arguments. The specified pins should be configured
-                  as high impedance.
-- bias-pull-down: No arguments. The specified pins should be configured as
-                  pull down.
-- bias-pull-up:   No arguments. The specified pins should be configured as
-                  pull up.
-- input-schmitt-enable: No arguments: Enable schmitt trigger for the specified
-                  pins
-- input-schmitt-disable: No arguments: Disable schmitt trigger for the specified
-                  pins
-- slew-rate:      Integer. Sets slew rate for the specified pins.
-                  Valid values are:
-                  <0>  - Slow
-                  <1>  - Fast
-- drive-strength: Integer. Selects the drive strength for the specified
-                  pins in mA.
-                  Valid values are:
-                  <2>
-                  <4>
-                  <8>
-                  <12>
-
-Example:
-
-          pinctrl: pinctrl@e01b0000 {
-                  compatible = "actions,s900-pinctrl";
-                  reg = <0x0 0xe01b0000 0x0 0x1000>;
-                  clocks = <&cmu CLK_GPIO>;
-                  gpio-controller;
-                  gpio-ranges = <&pinctrl 0 0 146>;
-                  #gpio-cells = <2>;
-                  interrupt-controller;
-                  #interrupt-cells = <2>;
-                  interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
-                               <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
-                               <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
-                               <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
-                               <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
-                               <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
-
-                  uart2-default: uart2-default {
-                          pinmux {
-                                  groups = "lvds_oep_odn_mfp";
-                                  function = "uart2";
-                          };
-                          pinconf {
-                                  groups = "lvds_oep_odn_drv";
-                                  drive-strength = <12>;
-                          };
-                  };
-          };
diff --git a/Documentation/devicetree/bindings/pinctrl/actions,s900-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/actions,s900-pinctrl.yaml
new file mode 100644
index 000000000000..5c7b9f13226d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/actions,s900-pinctrl.yaml
@@ -0,0 +1,219 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/actions,s900-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Actions Semi S900 Pin Controller
+
+maintainers:
+  - Manivannan Sadhasivam <mani@kernel.org>
+
+properties:
+  compatible:
+    const: actions,s900-pinctrl
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 6
+    description: The interrupt outputs from the controller. There is one GPIO
+      interrupt per GPIO bank. The number of interrupts listed depends on the
+      number of GPIO banks on the SoC. The interrupts must be ordered by bank,
+      starting with bank 0.
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  clocks:
+    maxItems: 1
+
+  gpio-controller: true
+
+  gpio-line-names:
+    maxItems: 146
+
+  gpio-ranges: true
+
+  "#gpio-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+  - clocks
+  - gpio-controller
+  - gpio-ranges
+  - "#gpio-cells"
+
+additionalProperties:
+  type: object
+  description: Pin configuration subnode
+  additionalProperties: false
+
+  properties:
+    pinmux:
+      type: object
+      description: Pin mux configuration
+      $ref: /schemas/pinctrl/pinmux-node.yaml#
+      additionalProperties: false
+
+      properties:
+        groups:
+          items:
+            enum: [
+              lvds_oxx_uart4_mfp, rmii_mdc_mfp, rmii_mdio_mfp, sirq0_mfp,
+              sirq1_mfp, rmii_txd0_mfp, rmii_txd1_mfp, rmii_txen_mfp,
+              rmii_rxer_mfp, rmii_crs_dv_mfp, rmii_rxd1_mfp, rmii_rxd0_mfp,
+              rmii_ref_clk_mfp, i2s_d0_mfp, i2s_d1_mfp, i2s_lr_m_clk0_mfp,
+              i2s_bclk0_mfp, i2s_bclk1_mclk1_mfp, pcm1_in_out_mfp, pcm1_clk_mfp,
+              pcm1_sync_mfp, eram_a5_mfp, eram_a6_mfp, eram_a7_mfp, eram_a8_mfp,
+              eram_a9_mfp, eram_a10_mfp, eram_a11_mfp, lvds_oep_odn_mfp,
+              lvds_ocp_obn_mfp, lvds_oap_oan_mfp, lvds_e_mfp,
+              spi0_sclk_mosi_mfp, spi0_ss_mfp, spi0_miso_mfp, uart2_rtsb_mfp,
+              uart2_ctsb_mfp, uart3_rtsb_mfp, uart3_ctsb_mfp, sd0_d0_mfp,
+              sd0_d1_mfp, sd0_d2_d3_mfp, sd1_d0_d3_mfp, sd0_cmd_mfp,
+              sd0_clk_mfp, sd1_cmd_clk_mfp, uart0_rx_mfp, nand0_d0_ceb3_mfp,
+              uart0_tx_mfp, i2c0_mfp, csi0_cn_cp_mfp, csi0_dn0_dp3_mfp,
+              csi1_dn0_cp_mfp, dsi_dp3_dn1_mfp, dsi_cp_dn0_mfp, dsi_dp2_dn2_mfp,
+              nand1_d0_ceb1_mfp, nand1_ceb3_mfp, nand1_ceb0_mfp,
+              csi1_dn0_dp0_mfp, uart4_rx_tx_mfp
+            ]
+
+        function:
+          items:
+            enum: [
+              eram, eth_rmii, eth_smii, spi0, spi1, spi2, spi3, sens0,
+              uart0, uart1, uart2, uart3, uart4, uart5, uart6, i2s0, i2s1,
+              pcm0, pcm1, jtag, pwm0, pwm1, pwm2, pwm3, pwm4, pwm5, sd0,
+              sd1, sd2, sd3, i2c0, i2c1, i2c2, i2c3, i2c4, i2c5, lvds,
+              usb30, usb20, gpu, mipi_csi0, mipi_csi1, mipi_dsi, nand0,
+              nand1, spdif, sirq0, sirq1, sirq2
+            ]
+
+      required:
+        - groups
+        - function
+
+    pinconf:
+      type: object
+      description: Pin configuration parameters
+      allOf:
+        - $ref: /schemas/pinctrl/pincfg-node.yaml#
+        - $ref: /schemas/pinctrl/pinmux-node.yaml#
+
+      additionalProperties: false
+
+      properties:
+        groups:
+          items:
+            enum: [
+              # pin groups for drive strength
+              sgpio3_drv, sgpio2_drv, sgpio1_drv, sgpio0_drv, rmii_tx_d0_d1_drv,
+              rmii_txen_rxer_drv, rmii_crs_dv_drv, rmii_rx_d1_d0_drv,
+              rmii_ref_clk_drv, rmii_mdc_mdio_drv, sirq_0_1_drv, sirq2_drv,
+              i2s_d0_d1_drv, i2s_lr_m_clk0_drv, i2s_blk1_mclk1_drv,
+              pcm1_in_out_drv, lvds_oap_oan_drv, lvds_oep_odn_drv,
+              lvds_ocp_obn_drv, lvds_e_drv, sd0_d3_d0_drv, sd1_d3_d0_drv,
+              sd0_sd1_cmd_clk_drv, spi0_sclk_mosi_drv, spi0_ss_miso_drv,
+              uart0_rx_tx_drv, uart4_rx_tx_drv, uart2_drv, uart3_drv, i2c0_drv,
+              i2c1_drv, i2c2_drv, sensor0_drv,
+              # pin groups for slew rate
+              sgpio3_sr, sgpio2_sr, sgpio1_sr, sgpio0_sr, rmii_tx_d0_d1_sr,
+              rmii_txen_rxer_sr, rmii_crs_dv_sr, rmii_rx_d1_d0_sr,
+              rmii_ref_clk_sr, rmii_mdc_mdio_sr, sirq_0_1_sr, sirq2_sr,
+              i2s_do_d1_sr, i2s_lr_m_clk0_sr, i2s_bclk0_mclk1_sr,
+              pcm1_in_out_sr, sd1_d3_d0_sr, sd0_sd1_clk_cmd_sr,
+              spi0_sclk_mosi_sr, spi0_ss_miso_sr, uart0_rx_tx_sr,
+              uart4_rx_tx_sr, uart2_sr, uart3_sr, i2c0_sr, i2c1_sr, i2c2_sr,
+              sensor0_sr
+            ]
+
+        pins:
+          items:
+            enum: [
+              eth_txd0, eth_txd1, eth_txen, eth_rxer, eth_crs_dv, eth_rxd1,
+              eth_rxd0, eth_ref_clk, eth_mdc, eth_mdio, sirq0, sirq1, sirq2,
+              i2s_d0, i2s_bclk0, i2s_lrclk0, i2s_mclk0, i2s_d1, i2s_bclk1,
+              i2s_lrclk1, i2s_mclk1, pcm1_in, pcm1_clk, pcm1_sync, pcm1_out,
+              eram_a5, eram_a6, eram_a7, eram_a8, eram_a9, eram_a10, eram_a11,
+              lvds_oep, lvds_oen, lvds_odp, lvds_odn, lvds_ocp, lvds_ocn,
+              lvds_obp, lvds_obn, lvds_oap, lvds_oan, lvds_eep, lvds_een,
+              lvds_edp, lvds_edn, lvds_ecp, lvds_ecn, lvds_ebp, lvds_ebn,
+              lvds_eap, lvds_ean, sd0_d0, sd0_d1, sd0_d2, sd0_d3, sd1_d0,
+              sd1_d1, sd1_d2, sd1_d3, sd0_cmd, sd0_clk, sd1_cmd, sd1_clk,
+              spi0_sclk, spi0_ss, spi0_miso, spi0_mosi, uart0_rx, uart0_tx,
+              uart2_rx, uart2_tx, uart2_rtsb, uart2_ctsb, uart3_rx, uart3_tx,
+              uart3_rtsb, uart3_ctsb, uart4_rx, uart4_tx, i2c0_sclk, i2c0_sdata,
+              i2c1_sclk, i2c1_sdata, i2c2_sclk, i2c2_sdata, csi0_dn0, csi0_dp0,
+              csi0_dn1, csi0_dp1, csi0_cn, csi0_cp, csi0_dn2, csi0_dp2,
+              csi0_dn3, csi0_dp3, dsi_dp3, dsi_dn3, dsi_dp1, dsi_dn1, dsi_cp,
+              dsi_cn, dsi_dp0, dsi_dn0, dsi_dp2, dsi_dn2, sensor0_pclk,
+              csi1_dn0, csi1_dp0, csi1_dn1, csi1_dp1, csi1_cn, csi1_cp,
+              sensor0_ckout, nand0_d0, nand0_d1, nand0_d2, nand0_d3, nand0_d4,
+              nand0_d5, nand0_d6, nand0_d7, nand0_dqs, nand0_dqsn, nand0_ale,
+              nand0_cle, nand0_ceb0, nand0_ceb1, nand0_ceb2, nand0_ceb3,
+              nand1_d0, nand1_d1, nand1_d2, nand1_d3, nand1_d4, nand1_d5,
+              nand1_d6, nand1_d7, nand1_dqs, nand1_dqsn, nand1_ale, nand1_cle,
+              nand1_ceb0, nand1_ceb1, nand1_ceb2, nand1_ceb3, sgpio0, sgpio1,
+              sgpio2, sgpio3
+            ]
+
+        bias-bus-hold: true
+        bias-high-impedance: true
+
+        bias-pull-down:
+          type: boolean
+
+        bias-pull-up:
+          type: boolean
+
+        input-schmitt-enable: true
+        input-schmitt-disable: true
+        slew-rate: true
+        drive-strength: true
+
+      oneOf:
+        - required:
+            - groups
+        - required:
+            - pins
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pinctrl: pinctrl@e01b0000 {
+        compatible = "actions,s900-pinctrl";
+        reg = <0xe01b0000 0x1000>;
+        clocks = <&cmu 1>;
+        gpio-controller;
+        gpio-ranges = <&pinctrl 0 0 146>;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+
+        uart2-default {
+            pinmux {
+                groups = "lvds_oep_odn_mfp";
+                function = "uart2";
+            };
+
+            pinconf {
+                groups = "lvds_oep_odn_drv";
+                drive-strength = <12>;
+            };
+        };
+    };
-- 
2.51.0


