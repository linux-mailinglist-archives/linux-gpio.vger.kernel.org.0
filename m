Return-Path: <linux-gpio+bounces-27051-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 676D1BD5E5D
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 21:12:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF6B518A78BE
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 19:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5835C2D9EEC;
	Mon, 13 Oct 2025 19:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tQxeIkPH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF952D9792;
	Mon, 13 Oct 2025 19:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760382751; cv=none; b=rUNsA+mtGmDAjPZD3GJ8tpahIINpvWO0d1OZb6UDgkasoLzEEfIDz6KUpFSQ9NFZoBS2w0PzKmbcQCsemxT1qHmV1AMr4WqQ/AmvGFFV4TVI0SZ+9ibFcpiDo6wBOdyzm7Qr4pas9FFYNyWXAXPIsuLa3zWrmDeuljQ6bPSSKF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760382751; c=relaxed/simple;
	bh=/EYExUXDtVFgP52wPhqUrGddLcwzoWlva+3f/b9NpCo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bw117FsbrKBW2a4dsH8F0nb6rHZ5B5ctP8A67mcl5W6R6x1pa2WAiduPQ2Zd/zA1dkzDHCBdp5VXpazqPtB8G2222var6E9ZzZKoV/t+XSANkVQWBkSP9Il95lZkwsEgh/rmfCokdSYU5LHN/1JD+8dQ/KbcpYXxDPp9xjvSgbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tQxeIkPH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BAEBC4CEF8;
	Mon, 13 Oct 2025 19:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760382750;
	bh=/EYExUXDtVFgP52wPhqUrGddLcwzoWlva+3f/b9NpCo=;
	h=From:To:Cc:Subject:Date:From;
	b=tQxeIkPHMH2FiuRniUFXF2xGtphIvEcflYe6VgFT/6xWMHU2IpWmHQ8QmiXatAQxQ
	 0PMrejXowPwXljQUq3P/5SmaJfors2hntkt3nciStgBEQQQBdwX66hP5BFVnSSZla/
	 Kd6Ur0otl+FnNrsYgZuhv8BBhuJjcjL4axJNmnNhHM7Ec2cfdqGTdHyzM4tPNJPMgm
	 UdofJOGj2+36YTfsJ8rrqgdGLdPjwonSc6sgKCfghRAHiZPqB/nlCGE9On/RZMNt2m
	 bgtzOE9pnPWLoVyhs4gmFZCSaQ/607g2Ozvota0S2SWPZcOKeueWSGsn4zMrCopAf9
	 C+oiw7c8ZkxSA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: Convert brcm,ns2-pinmux to DT schema
Date: Mon, 13 Oct 2025 14:12:25 -0500
Message-ID: <20251013191226.4137995-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the brcm,ns2-pinmux binding to DT schema format. It's a
straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/pinctrl/brcm,ns2-pinmux.txt      | 102 ----------------
 .../bindings/pinctrl/brcm,ns2-pinmux.yaml     | 111 ++++++++++++++++++
 2 files changed, 111 insertions(+), 102 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,ns2-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,ns2-pinmux.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,ns2-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/brcm,ns2-pinmux.txt
deleted file mode 100644
index 40e0a9a19525..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/brcm,ns2-pinmux.txt
+++ /dev/null
@@ -1,102 +0,0 @@
-Broadcom Northstar2 IOMUX Controller
-
-The Northstar2 IOMUX controller supports group based mux configuration. There
-are some individual pins that support modifying the pinconf parameters.
-
-Required properties:
-
-- compatible:
-    Must be "brcm,ns2-pinmux"
-
-- reg:
-    Define the base and range of the I/O address space that contains the
-    Northstar2 IOMUX and pin configuration registers.
-
-Properties in sub nodes:
-
-- function:
-    The mux function to select
-
-- groups:
-    The list of groups to select with a given function
-
-- pins:
-    List of pin names to change configuration
-
-The generic properties bias-disable, bias-pull-down, bias-pull-up,
-drive-strength, slew-rate, input-enable, input-disable are supported
-for some individual pins listed at the end.
-
-For more details, refer to
-Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
-
-For example:
-
-	pinctrl: pinctrl@6501d130 {
-		compatible = "brcm,ns2-pinmux";
-		reg = <0x6501d130 0x08>,
-		      <0x660a0028 0x04>,
-		      <0x660009b0 0x40>;
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&nand_sel>, <&uart3_rx>, <&sdio0_d4>;
-
-		/* Select nand function */
-		nand_sel: nand_sel {
-			function = "nand";
-			groups = "nand_grp";
-		};
-
-		/* Pull up the uart3 rx pin */
-		uart3_rx: uart3_rx {
-			pins = "uart3_sin";
-			bias-pull-up;
-		};
-
-		/* Set the drive strength of sdio d4 pin */
-		sdio0_d4: sdio0_d4 {
-			pins = "sdio0_data4";
-			drive-strength = <8>;
-		};
-	};
-
-List of supported functions and groups in Northstar2:
-
-"nand": "nand_grp"
-
-"nor": "nor_data_grp", "nor_adv_grp", "nor_addr_0_3_grp", "nor_addr_4_5_grp",
-	"nor_addr_6_7_grp", "nor_addr_8_9_grp", "nor_addr_10_11_grp",
-	"nor_addr_12_15_grp"
-
-"gpio": "gpio_0_1_grp", "gpio_2_5_grp", "gpio_6_7_grp", "gpio_8_9_grp",
-	"gpio_10_11_grp", "gpio_12_13_grp", "gpio_14_17_grp", "gpio_18_19_grp",
-	"gpio_20_21_grp", "gpio_22_23_grp", "gpio_24_25_grp", "gpio_26_27_grp",
-	"gpio_28_29_grp", "gpio_30_31_grp"
-
-"pcie": "pcie_ab1_clk_wak_grp", "pcie_a3_clk_wak_grp", "pcie_b3_clk_wak_grp",
-	"pcie_b2_clk_wak_grp", "pcie_a2_clk_wak_grp"
-
-"uart0": "uart0_modem_grp", "uart0_rts_cts_grp", "uart0_in_out_grp"
-
-"uart1": "uart1_ext_clk_grp", "uart1_dcd_dsr_grp", "uart1_ri_dtr_grp",
-	"uart1_rts_cts_grp", "uart1_in_out_grp"
-
-"uart2": "uart2_rts_cts_grp"
-
-"pwm": "pwm_0_grp", "pwm_1_grp", "pwm_2_grp", "pwm_3_grp"
-
-
-List of pins that support pinconf parameters:
-
-"qspi_wp", "qspi_hold", "qspi_cs", "qspi_sck", "uart3_sin", "uart3_sout",
-"qspi_mosi", "qspi_miso", "spi0_fss", "spi0_rxd", "spi0_txd", "spi0_sck",
-"spi1_fss", "spi1_rxd", "spi1_txd", "spi1_sck", "sdio0_data7",
-"sdio0_emmc_rst", "sdio0_led_on", "sdio0_wp", "sdio0_data3", "sdio0_data4",
-"sdio0_data5", "sdio0_data6", "sdio0_cmd", "sdio0_data0", "sdio0_data1",
-"sdio0_data2", "sdio1_led_on", "sdio1_wp", "sdio0_cd_l", "sdio0_clk",
-"sdio1_data5", "sdio1_data6", "sdio1_data7", "sdio1_emmc_rst", "sdio1_data1",
-"sdio1_data2", "sdio1_data3", "sdio1_data4", "sdio1_cd_l", "sdio1_clk",
-"sdio1_cmd", "sdio1_data0", "ext_mdio_0", "ext_mdc_0", "usb3_p1_vbus_ppc",
-"usb3_p1_overcurrent", "usb3_p0_vbus_ppc", "usb3_p0_overcurrent",
-"usb2_presence_indication", "usb2_vbus_present", "usb2_vbus_ppc",
-"usb2_overcurrent", "sata_led1", "sata_led0"
diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,ns2-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,ns2-pinmux.yaml
new file mode 100644
index 000000000000..1de23c06fa49
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,ns2-pinmux.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/brcm,ns2-pinmux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom Northstar2 IOMUX Controller
+
+maintainers:
+  - Ray Jui <rjui@broadcom.com>
+  - Scott Branden <sbranden@broadcom.com>
+
+properties:
+  compatible:
+    const: brcm,ns2-pinmux
+
+  reg:
+    maxItems: 3
+
+additionalProperties:
+  description: Pin group node properties
+  type: object
+  allOf:
+    - $ref: /schemas/pinctrl/pincfg-node.yaml#
+    - $ref: /schemas/pinctrl/pinmux-node.yaml#
+  additionalProperties: false
+
+  properties:
+    function:
+      description: The mux function to select
+      $ref: /schemas/types.yaml#/definitions/string
+
+    groups:
+      items:
+        enum: [
+          nand_grp, nor_data_grp, nor_adv_grp, nor_addr_0_3_grp,
+          nor_addr_4_5_grp, nor_addr_6_7_grp, nor_addr_8_9_grp,
+          nor_addr_10_11_grp, nor_addr_12_15_grp, gpio_0_1_grp, gpio_2_5_grp,
+          gpio_6_7_grp, gpio_8_9_grp, gpio_10_11_grp, gpio_12_13_grp,
+          gpio_14_17_grp, gpio_18_19_grp, gpio_20_21_grp, gpio_22_23_grp,
+          gpio_24_25_grp, gpio_26_27_grp, gpio_28_29_grp, gpio_30_31_grp,
+          pcie_ab1_clk_wak_grp, pcie_a3_clk_wak_grp, pcie_b3_clk_wak_grp,
+          pcie_b2_clk_wak_grp, pcie_a2_clk_wak_grp, uart0_modem_grp,
+          uart0_rts_cts_grp, uart0_in_out_grp, uart1_ext_clk_grp,
+          uart1_dcd_dsr_grp, uart1_ri_dtr_grp, uart1_rts_cts_grp,
+          uart1_in_out_grp, uart2_rts_cts_grp, pwm_0_grp, pwm_1_grp, pwm_2_grp,
+          pwm_3_grp
+        ]
+
+    pins:
+      items:
+        enum: [
+          qspi_wp, qspi_hold, qspi_cs, qspi_sck, uart3_sin, uart3_sout,
+          qspi_mosi, qspi_miso, spi0_fss, spi0_rxd, spi0_txd, spi0_sck,
+          spi1_fss, spi1_rxd, spi1_txd, spi1_sck, sdio0_data7, sdio0_emmc_rst,
+          sdio0_led_on, sdio0_wp, sdio0_data3, sdio0_data4, sdio0_data5,
+          sdio0_data6, sdio0_cmd, sdio0_data0, sdio0_data1, sdio0_data2,
+          sdio1_led_on, sdio1_wp, sdio0_cd_l, sdio0_clk, sdio1_data5,
+          sdio1_data6, sdio1_data7, sdio1_emmc_rst, sdio1_data1, sdio1_data2,
+          sdio1_data3, sdio1_data4, sdio1_cd_l, sdio1_clk, sdio1_cmd,
+          sdio1_data0, ext_mdio_0, ext_mdc_0, usb3_p1_vbus_ppc,
+          usb3_p1_overcurrent, usb3_p0_vbus_ppc, usb3_p0_overcurrent,
+          usb2_presence_indication, usb2_vbus_present, usb2_vbus_ppc,
+          usb2_overcurrent, sata_led1, sata_led0
+        ]
+
+    bias-disable: true
+    bias-pull-down: true
+    bias-pull-up: true
+    drive-strength: true
+    slew-rate: true
+    input-enable: true
+    input-disable: true
+
+  oneOf:
+    - required:
+        - groups
+        - function
+    - required:
+        - pins
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    pinctrl@6501d130 {
+        compatible = "brcm,ns2-pinmux";
+        reg = <0x6501d130 0x08>,
+              <0x660a0028 0x04>,
+              <0x660009b0 0x40>;
+
+        /* Select nand function */
+        nand-sel {
+            function = "nand";
+            groups = "nand_grp";
+        };
+
+        /* Pull up the uart3 rx pin */
+        uart3-rx {
+            pins = "uart3_sin";
+            bias-pull-up;
+        };
+
+        /* Set the drive strength of sdio d4 pin */
+        sdio0-d4 {
+            pins = "sdio0_data4";
+            drive-strength = <8>;
+        };
+    };
-- 
2.51.0


