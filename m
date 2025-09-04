Return-Path: <linux-gpio+bounces-25577-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38934B438FF
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 12:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDE227A9392
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 10:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C4782FB983;
	Thu,  4 Sep 2025 10:39:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA5E2FAC05;
	Thu,  4 Sep 2025 10:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756982357; cv=none; b=St/+gDy8J9lUMmHHv00uRr6XmeAY+CQBznC8Hr9gNzB8rRlS1QWvFMH30616eKk0vl9QtXM4D46AsIMuwDOfnA/AxneZKewsOgcxsNxPgsiqu2JXElw2Ajn76MsYxyKt66z/C9ozRYYco8K4Nxm1UaE121Ld8WQb+4GweVWnlVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756982357; c=relaxed/simple;
	bh=2I0kKlTWAzyjkON4QRNlE8eyz/3A5R8qNN1NPPSEwY8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CbzUuKra0o4YHDHs3zHxEZNQH/IOU+Pw5B+6x5qaFhkdQFcA7aEW4tVkJVwAq2yMKhHeYBJlXNRXdLXDDXzp2XpX2jiE9cqI+4eq6Xzhb3SWzVxJsJCI2G/zSzgJNI9wqiTbVysuDUvAmXoL4vGnxmo4ydkadMZhdBn1qF5Z97U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 4 Sep
 2025 18:34:02 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 4 Sep 2025 18:34:02 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linus.walleij@linaro.org>, <brgl@bgdev.pl>, <billy_tsai@aspeedtech.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <linux-gpio@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
Subject: [PATCH v2 2/4] dt-bindings: pinctrl: aspeed: Add support for AST27xx
Date: Thu, 4 Sep 2025 18:33:59 +0800
Message-ID: <20250904103401.88287-3-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904103401.88287-1-billy_tsai@aspeedtech.com>
References: <20250904103401.88287-1-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add bindings for the pin controller found in the ASPEED AST27xx SoC.
The ASPEED AST2700 SoC contains two separate pin controllers, each
managed by a distinct System Control Unit (SCU).
Because these two controllers have different register maps, control
different sets of pins, support different pin configuration options, and
implement different multi-function switch logic, they are not compatible.
Therefore, two separate device tree bindings,'aspeed,ast2700-soc0-pinctrl'
and 'aspeed,ast2700-soc1-pinctrl', are introduced.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml  | 115 +++++
 .../pinctrl/aspeed,ast2700-soc1-pinctrl.yaml  | 435 ++++++++++++++++++
 2 files changed, 550 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
new file mode 100644
index 000000000000..0fee62259250
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2700 SoC0 Pin Controller
+
+maintainers:
+  - Billy Tsai <billy_tsai@aspeedtech.com>
+
+description: |
+  Bindings for the ASPEED AST2700 SoC0 Pin Controller.
+
+properties:
+  compatible:
+    const: aspeed,ast2700-soc0-pinctrl
+
+additionalProperties:
+  $ref: pinmux-node.yaml#
+  additionalProperties: false
+
+  properties:
+    function:
+      enum:
+        - EMMC
+        - VGADDC
+        - USB3A
+        - USB2A
+        - USB3B
+        - USB2B
+        - JTAG0
+        - PCIERC
+
+    groups:
+      enum:
+        - EMMCG1
+        - EMMCG4
+        - EMMCG8
+        - EMMCWPN
+        - EMMCCDN
+        - VGADDC
+        - USB3AXHD
+        - USB3AXHPD
+        - USB3AXH
+        - USB3AXHP
+        - USB3AXH2B
+        - USB3AXHP2B
+        - USB2AXHD1
+        - USB2AXHPD1
+        - USB2AD1
+        - USB2AXH
+        - USB2AXHP
+        - USB2AXH2B
+        - USB2AXHP2B
+        - USB2AHPD0
+        - USB2AD0
+        - USB2AH
+        - USB2AHP
+        - USB3BXHD
+        - USB3BXHPD
+        - USB3BXH
+        - USB3BXHP
+        - USB3BXH2A
+        - USB3BXHP2A
+        - USB2BXHD1
+        - USB2BXHPD1
+        - USB2BD1
+        - USB2BXH
+        - USB2BXHP
+        - USB2BXH2A
+        - USB2BXHP2A
+        - USB2BHPD0
+        - USB2BD0
+        - USB2BH
+        - USB2BHP
+        - JTAGM0
+        - PSP
+        - SSP
+        - TSP
+        - DDR
+        - USB3A
+        - USB3B
+        - PCIEA
+        - PCIEB
+        - PCIERC0PERST
+        - PCIERC1PERST
+
+    pins:
+      $ref: /schemas/types.yaml#/definitions/string-array
+    drive-strength:
+      minimum: 0
+      maximum: 15
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+
+examples:
+  - |
+    pinctrl0: pinctrl{
+        compatible = "aspeed,ast2700-soc0-pinctrl";
+
+        pinctrl_emmc_default: emmc-default {
+            function = "EMMC";
+            groups = "EMMCG1";
+        };
+
+        pinctrl_emmcclk_driving: emmcclk-driving {
+            pins = "AC14";
+            drive-strength = <2>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
new file mode 100644
index 000000000000..1c0121aa26cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
@@ -0,0 +1,435 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2700 SoC1 Pin Controller
+
+maintainers:
+  - Billy Tsai <billy_tsai@aspeedtech.com>
+
+description: |
+  Bindings for the ASPEED AST2700 SoC1 Pin Controller.
+
+properties:
+  compatible:
+    const: aspeed,ast2700-soc1-pinctrl
+
+additionalProperties:
+  $ref: pinmux-node.yaml#
+  additionalProperties: false
+
+  properties:
+    function:
+      enum:
+        - ADC0
+        - ADC1
+        - ADC2
+        - ADC3
+        - ADC4
+        - ADC5
+        - ADC6
+        - ADC7
+        - ADC8
+        - ADC9
+        - ADC10
+        - ADC11
+        - ADC12
+        - ADC13
+        - ADC14
+        - ADC15
+        - CANBUS
+        - DDR
+        - ESPI0
+        - ESPI1
+        - FSI0
+        - FSI1
+        - FSI2
+        - FSI3
+        - FWQSPI
+        - I2C0
+        - I2C1
+        - I2C2
+        - I2C3
+        - I2C4
+        - I2C5
+        - I2C6
+        - I2C7
+        - I2C8
+        - I2C9
+        - I2C10
+        - I2C11
+        - I2C12
+        - I2C13
+        - I2C14
+        - I2C15
+        - I3C0
+        - I3C1
+        - I3C2
+        - I3C3
+        - I3C4
+        - I3C5
+        - I3C6
+        - I3C7
+        - I3C8
+        - I3C9
+        - I3C10
+        - I3C11
+        - I3C12
+        - I3C13
+        - I3C14
+        - I3C15
+        - JTAGM0
+        - JTAGM1
+        - LPC0
+        - LPC1
+        - LTPI_PS_I2C0
+        - LTPI_PS_I2C1
+        - LTPI_PS_I2C2
+        - LTPI_PS_I2C3
+        - MDIO0
+        - MDIO1
+        - MDIO2
+        - NCTS5
+        - NDCD5
+        - NDSR5
+        - NRI5
+        - PCIERC
+        - PWM0
+        - PWM1
+        - PWM2
+        - PWM3
+        - PWM4
+        - PWM5
+        - PWM6
+        - PWM7
+        - PWM8
+        - PWM9
+        - PWM10
+        - PWM11
+        - PWM12
+        - PWM13
+        - PWM14
+        - PWM15
+        - QSPI0
+        - QSPI1
+        - QSPI2
+        - RGMII0
+        - RGMII1
+        - RMII0
+        - RMII0RCLKO
+        - RMII1
+        - RMII1RCLKO
+        - SALT0
+        - SALT1
+        - SALT2
+        - SALT3
+        - SALT4
+        - SALT5
+        - SALT6
+        - SALT7
+        - SALT8
+        - SALT9
+        - SALT10
+        - SALT11
+        - SALT12
+        - SALT13
+        - SALT14
+        - SALT15
+        - SD
+        - SGMII
+        - SGPM0
+        - SGPM1
+        - SGPS
+        - SPI0
+        - SPI0CS1
+        - SPI1
+        - SPI1CS1
+        - SPI2
+        - SPI2CS1
+        - SSP
+        - TACH0
+        - TACH1
+        - TACH2
+        - TACH3
+        - TACH4
+        - TACH5
+        - TACH6
+        - TACH7
+        - TACH8
+        - TACH9
+        - TACH10
+        - TACH11
+        - TACH12
+        - TACH13
+        - TACH14
+        - TACH15
+        - THRU0
+        - THRU1
+        - THRU2
+        - THRU3
+        - TSP
+        - UART0
+        - UART1
+        - UART2
+        - UART3
+        - UART5
+        - UART6
+        - UART7
+        - UART8
+        - UART9
+        - UART10
+        - UART11
+        - USB2C
+        - USB2D
+        - VPI
+
+    groups:
+      enum:
+        - ADC0
+        - ADC1
+        - ADC2
+        - ADC3
+        - ADC4
+        - ADC5
+        - ADC6
+        - ADC7
+        - ADC8
+        - ADC9
+        - ADC10
+        - ADC11
+        - ADC12
+        - ADC13
+        - ADC14
+        - ADC15
+        - CANBUS
+        - DI2C0
+        - DI2C1
+        - DI2C2
+        - DI2C3
+        - DI2C8
+        - DI2C9
+        - DI2C10
+        - DI2C11
+        - DI2C12
+        - DI2C13
+        - DI2C14
+        - DI2C15
+        - DSGPM0
+        - ESPI0
+        - ESPI1
+        - FSI0
+        - FSI1
+        - FSI2
+        - FSI3
+        - FWQSPI
+        - HVI3C0
+        - HVI3C1
+        - HVI3C2
+        - HVI3C3
+        - HVI3C12
+        - HVI3C13
+        - HVI3C14
+        - HVI3C15
+        - I2C0
+        - I2C1
+        - I2C2
+        - I2C3
+        - I2C4
+        - I2C5
+        - I2C6
+        - I2C7
+        - I2C8
+        - I2C9
+        - I2C10
+        - I2C11
+        - I2C12
+        - I2C13
+        - I2C14
+        - I2C15
+        - I3C4
+        - I3C5
+        - I3C6
+        - I3C7
+        - I3C8
+        - I3C9
+        - I3C10
+        - I3C11
+        - JTAGM1
+        - LPC0
+        - LPC1
+        - LTPI_PS_I2C0
+        - LTPI_PS_I2C1
+        - LTPI_PS_I2C2
+        - LTPI_PS_I2C3
+        - MDIO0
+        - MDIO1
+        - MDIO2
+        - NCTS0
+        - NCTS1
+        - NCTS5
+        - NCTS6
+        - NDCD0
+        - NDCD1
+        - NDCD5
+        - NDCD6
+        - NDSR0
+        - NDSR1
+        - NDSR5
+        - NDSR6
+        - NDTR0
+        - NDTR1
+        - NDTR5
+        - NDTR6
+        - NRI0
+        - NRI1
+        - NRI5
+        - NRI6
+        - NRTS0
+        - NRTS1
+        - NRTS5
+        - NRTS6
+        - PE2SGRSTN
+        - PWM0
+        - PWM1
+        - PWM2
+        - PWM3
+        - PWM4
+        - PWM5
+        - PWM6
+        - PWM7
+        - PWM8
+        - PWM9
+        - PWM10
+        - PWM11
+        - PWM12
+        - PWM13
+        - PWM14
+        - PWM15
+        - QSPI0
+        - QSPI1
+        - QSPI2
+        - RGMII0
+        - RGMII1
+        - RMII0
+        - RMII0RCLKO
+        - RMII1
+        - RMII1RCLKO
+        - RXD0
+        - RXD1
+        - RXD2
+        - RXD3
+        - RXD5
+        - RXD6
+        - RXD7
+        - RXD8
+        - RXD9
+        - RXD10
+        - RXD11
+        - SALT0
+        - SALT1
+        - SALT2
+        - SALT3
+        - SALT4
+        - SALT5
+        - SALT6
+        - SALT7
+        - SALT8
+        - SALT9
+        - SALT10
+        - SALT11
+        - SALT12
+        - SALT13
+        - SALT14
+        - SALT15
+        - SD
+        - SGMII
+        - SGPM0
+        - SGPM1
+        - SGPS
+        - SPI0
+        - SPI0CS1
+        - SPI1
+        - SPI1CS1
+        - SPI2
+        - SPI2CS1
+        - TACH0
+        - TACH1
+        - TACH2
+        - TACH3
+        - TACH4
+        - TACH5
+        - TACH6
+        - TACH7
+        - TACH8
+        - TACH9
+        - TACH10
+        - TACH11
+        - TACH12
+        - TACH13
+        - TACH14
+        - TACH15
+        - THRU0
+        - THRU1
+        - THRU2
+        - THRU3
+        - TXD0
+        - TXD1
+        - TXD2
+        - TXD3
+        - TXD5
+        - TXD6
+        - TXD7
+        - TXD8
+        - TXD9
+        - TXD10
+        - TXD11
+        - USB2CD
+        - USB2CH
+        - USB2CU
+        - USB2CUD
+        - USB2DD
+        - USB2DH
+        - VPI
+
+    pins:
+      $ref: /schemas/types.yaml#/definitions/string-array
+    bias-disable:
+      type: boolean
+    bias-pull-down:
+      type: boolean
+    bias-pull-up:
+      type: boolean
+    drive-strength:
+      minimum: 0
+      maximum: 3
+    power-source:
+      enum: [1800, 3300]
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+
+examples:
+  - |
+    pinctrl1: pinctrl {
+        compatible = "aspeed,ast2700-soc1-pinctrl";
+
+        pinctrl_hvi3c0_default: hvi3c0-default {
+            function = "I3C0";
+            groups = "HVI3C0";
+        };
+
+        pinctrl_i3c0_3_hv_voltage: i3chv-voltage {
+            pins = "U25";
+            power-source = <1800>;
+        };
+
+        pinctrl_i3c0_driving: i3c0-driving {
+            pins = "U25", "U26";
+            drive-strength = <2>;
+        };
+    };
-- 
2.25.1


