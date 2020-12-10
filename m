Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF8CA2D51F3
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 04:50:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730066AbgLJDnZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 22:43:25 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:39156 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730729AbgLJDnR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 22:43:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607572552; x=1639108552;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gCHnKYQpL265wuELJDnjUpNViRiOlr0EE7etZSVDZT0=;
  b=DsjivkFSqMmq7ZqQbHU/1elbD83o+UGo0ncJpZU663YKlMAsygzBd1md
   lAuaM/A0GltqdPhpA2kwanjhmF0I+rOAwoVi7GWTUqgqLE06lT36Za6KH
   54vW+BL/YEW4PSdyYT1nFVzfuVtyFjvvmYavzLV6OJOkHApYuwp4vPoYM
   xlEg2A5x7+nba28ZJxVa0XBL4ExHw9nQNYDPrsQ9WL8e5bA2viY98IEgS
   zEIpMyul19we/nHgxlxOI7wbCdZK19J77eUhK4Zr/oZ+O/7P6UghlS/9g
   U88TJjHLDFK6G9bhjIi9svJWmnKGuZvd6ZwEG/CalQr6OotiyBVkzZLFA
   Q==;
IronPort-SDR: 5wk0MPLDZUL40Rj/9rLEOvxUUhFlfGs3fSxSEELMG3fCVVEgjBx5FPEGbbQMYJVgGLumMZp+iw
 s19gSNcAoIvsrHTcRq8liK0tcA825KS7vipnE4tWjLVcNoSZklf6NdlHMkmOQYYdnQG0YZG8Ff
 7rQ/OlTHtT99xBXAzO3g7mpxszBXansrsPYVAmp8f5T2Lf3Kmgj5nRsdQc36ieoemugkytVj76
 CSvwAuIIg6t366MBXKZdyZKiDG4GC55mW9dOYIXMrWHtkOVicFmUV9GvH+4Gzb1USSwv/TuN3z
 Qj0=
X-IronPort-AV: E=Sophos;i="5.78,407,1599494400"; 
   d="scan'208";a="258551224"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 11:51:47 +0800
IronPort-SDR: FVIkMKtNLQ8EOYX+xDxYqqyQBVYH1e64+A/QLjuOseLCjj1o1JoWsrT5LGbLlBhFMu1gjeKyLO
 N5/MIbuz/Z0t8QNURBe+KIKlVHwiM1b44=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2020 19:24:29 -0800
IronPort-SDR: RwmpdkZGVsFt600xgvm0NLYArZ4WFFO8bKELwU9P+SRF+YmPlX0x+ypjxYAChasuBJP2SF4HGM
 ITqVKYWWynkw==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip01.wdc.com with ESMTP; 09 Dec 2020 19:40:31 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v7 10/22] dt-bindings: pinctrl: Document canaan,k210-fpioa bindings
Date:   Thu, 10 Dec 2020 12:39:51 +0900
Message-Id: <20201210034003.222297-11-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210034003.222297-1-damien.lemoal@wdc.com>
References: <20201210034003.222297-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document the device tree bindings for the Canaan Kendryte K210 SoC
Fully Programmable IO Array (FPIOA) pinctrl driver in
Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml. The
new header file include/dt-bindings/pinctrl/k210-fpioa.h is added to
define all 256 possible pin functions of the SoC IO pins, as well as
macros simplifying the definition of pin functions in a device tree.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../bindings/pinctrl/canaan,k210-fpioa.yaml   | 171 +++++++++++
 include/dt-bindings/pinctrl/k210-fpioa.h      | 276 ++++++++++++++++++
 2 files changed, 447 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
 create mode 100644 include/dt-bindings/pinctrl/k210-fpioa.h

diff --git a/Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml b/Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
new file mode 100644
index 000000000000..30b850c3bf2b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
@@ -0,0 +1,171 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/canaan,k210-fpioa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Canaan Kendryte K210 FPIOA Device Tree Bindings
+
+maintainers:
+  - Damien Le Moal <damien.lemoal@wdc.com>
+
+description:
+  The Canaan Kendryte K210 SoC Fully Programmable IO Array (FPIOA)
+  controller allows assiging any of 256 possible functions to any of
+  48 IO pins of the SoC. Pin function configuration is performed on
+  a per-pin basis.
+
+properties:
+  compatible:
+    const: canaan,k210-fpioa
+
+  reg:
+    maxItems: 1
+    description:
+      Address and length of the register set for the FPIOA controller.
+
+  clocks:
+    items:
+      - description: Controller reference clock source
+      - description: APB interface clock source
+
+  clock-names:
+    items:
+      - const: ref
+      - const: pclk
+
+  resets:
+    maxItems: 1
+
+  canaan,k210-sysctl-power:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      phandle of the K210 system controller node and offset of its
+      power domain control register.
+
+patternProperties:
+  '-pinmux$':
+    type: object
+    $ref: /schemas/pinctrl/pinmux-node.yaml
+    description:
+      FPIOA client devices use sub-nodes to define the desired pin
+      configuration. Client device sub-nodes use the pinux property
+      below.
+
+    properties:
+      pinmux:
+        description:
+          List of IO pins alternate functions. The values for each IO
+          pin is a combination of an IO pin number (0 to 47) with the
+          desired function for the IO pin. Functions are defined as
+          macros in include/dt-bindings/pinctrl/k210-fpioa.h.
+          The K210_FPIOA(IO pin, function) macro is provided to
+          facilitate the combination of IO pin numbers and functions.
+
+    required:
+      - pinmux
+
+    additionalProperties: false
+
+  '-pins$':
+    type: object
+    $ref: /schemas/pinctrl/pincfg-node.yaml
+    description:
+      FPIOA client devices use sub-nodes to define the desired
+      configuration of pins. Client device sub-nodes use the
+      properties below.
+
+    properties:
+      pins:
+        description:
+          List of IO pins affected by the properties specified in this
+          subnode. IO pins are identified using the pin names "IO_xx".
+          Pin configuration nodes can also define the power domain to
+          be used for the SoC pin groups A0 (IO pins 0-5),
+          A1 (IO pins 6-11), A2 (IO pins 12-17), B0 (IO pins 18-23),
+          B1 (IO pins 24-29), B2 (IO pins 30-35), B3 (IO pins 30-35),
+          C0 (IO pins 36-41) and C1 (IO pins 42-47) using the
+          power-source property.
+        items:
+          anyOf:
+            - pattern: "^(IO_([0-9]*))|(A[0-2])|(B[3-5])|(C[6-7])$"
+            - enum: [ IO_0, IO_1, IO_2, IO_3, IO_4, IO_5, IO_6, IO_7,
+                      IO_8, IO_9, IO_10, IO_11, IO_12, IO_13, IO_14,
+                      IO_15, IO_16, IO_17, IO_18, IO_19, IO_20, IO_21,
+                      IO_22, IO_23, IO_24, IO_25, IO_26, IO_27, IO_28,
+                      IO_29, IO_30, IO_31, IO_32, IO_33, IO_34, IO_35,
+                      IO_36, IO_37, IO_38, IO_39, IO_40, IO_41, IO_42,
+                      IO_43, IO_44, IO_45, IO_46, IO_47,
+                      A0, A1, A2, B3, B4, B5, C6, C7 ]
+      bias-disable: true
+
+      bias-pull-down: true
+
+      bias-pull-up: true
+
+      drive-strength: true
+
+      drive-strength-microamp: true
+
+      input-enable: true
+
+      input-disable: true
+
+      input-schmitt-enable: true
+
+      input-schmitt-disable: true
+
+      intput-polarity-invert:
+        description:
+          Enable or disable pin input polarity inversion.
+
+      output-enable: true
+
+      output-disable: true
+
+      output-high: true
+
+      output-low: true
+
+      output-polarity-invert:
+        description:
+          Enable or disable pin output polarity inversion.
+
+      slew-rate: true
+
+      power-source: true
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - canaan,k210-sysctl-power
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/k210-fpioa.h>
+    #include <dt-bindings/clock/k210-clk.h>
+    #include <dt-bindings/reset/k210-rst.h>
+
+    fpioa: pinmux@502B0000 {
+      compatible = "canaan,k210-fpioa";
+      reg = <0x502B0000 0x100>;
+      clocks = <&sysclk K210_CLK_FPIOA>,
+               <&sysclk K210_CLK_APB0>;
+      clock-names = "ref", "pclk";
+      resets = <&sysrst K210_RST_FPIOA>;
+      canaan,k210-sysctl-power = <&sysctl 108>;
+      pinctrl-0 = <&jtag_pinctrl>;
+      pinctrl-names = "default";
+
+      jtag_pinctrl: jtag-pinmux {
+        pinmux = <K210_FPIOA(0, K210_PCF_JTAG_TCLK)>,
+                 <K210_FPIOA(1, K210_PCF_JTAG_TDI)>,
+                 <K210_FPIOA(2, K210_PCF_JTAG_TMS)>,
+                 <K210_FPIOA(3, K210_PCF_JTAG_TDO)>;
+      };
+    };
diff --git a/include/dt-bindings/pinctrl/k210-fpioa.h b/include/dt-bindings/pinctrl/k210-fpioa.h
new file mode 100644
index 000000000000..314285eab3a1
--- /dev/null
+++ b/include/dt-bindings/pinctrl/k210-fpioa.h
@@ -0,0 +1,276 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2020 Sean Anderson <seanga2@gmail.com>
+ * Copyright (c) 2020 Western Digital Corporation or its affiliates.
+ */
+#ifndef PINCTRL_K210_FPIOA_H
+#define PINCTRL_K210_FPIOA_H
+
+/*
+ * Full list of FPIOA functions from
+ * kendryte-standalone-sdk/lib/drivers/include/fpioa.h
+ */
+#define K210_PCF_MASK		GENMASK(7, 0)
+#define K210_PCF_JTAG_TCLK	0   /* JTAG Test Clock */
+#define K210_PCF_JTAG_TDI	1   /* JTAG Test Data In */
+#define K210_PCF_JTAG_TMS	2   /* JTAG Test Mode Select */
+#define K210_PCF_JTAG_TDO	3   /* JTAG Test Data Out */
+#define K210_PCF_SPI0_D0	4   /* SPI0 Data 0 */
+#define K210_PCF_SPI0_D1	5   /* SPI0 Data 1 */
+#define K210_PCF_SPI0_D2	6   /* SPI0 Data 2 */
+#define K210_PCF_SPI0_D3	7   /* SPI0 Data 3 */
+#define K210_PCF_SPI0_D4	8   /* SPI0 Data 4 */
+#define K210_PCF_SPI0_D5	9   /* SPI0 Data 5 */
+#define K210_PCF_SPI0_D6	10  /* SPI0 Data 6 */
+#define K210_PCF_SPI0_D7	11  /* SPI0 Data 7 */
+#define K210_PCF_SPI0_SS0	12  /* SPI0 Chip Select 0 */
+#define K210_PCF_SPI0_SS1	13  /* SPI0 Chip Select 1 */
+#define K210_PCF_SPI0_SS2	14  /* SPI0 Chip Select 2 */
+#define K210_PCF_SPI0_SS3	15  /* SPI0 Chip Select 3 */
+#define K210_PCF_SPI0_ARB	16  /* SPI0 Arbitration */
+#define K210_PCF_SPI0_SCLK	17  /* SPI0 Serial Clock */
+#define K210_PCF_UARTHS_RX	18  /* UART High speed Receiver */
+#define K210_PCF_UARTHS_TX	19  /* UART High speed Transmitter */
+#define K210_PCF_RESV6		20  /* Reserved function */
+#define K210_PCF_RESV7		21  /* Reserved function */
+#define K210_PCF_CLK_SPI1	22  /* Clock SPI1 */
+#define K210_PCF_CLK_I2C1	23  /* Clock I2C1 */
+#define K210_PCF_GPIOHS0	24  /* GPIO High speed 0 */
+#define K210_PCF_GPIOHS1	25  /* GPIO High speed 1 */
+#define K210_PCF_GPIOHS2	26  /* GPIO High speed 2 */
+#define K210_PCF_GPIOHS3	27  /* GPIO High speed 3 */
+#define K210_PCF_GPIOHS4	28  /* GPIO High speed 4 */
+#define K210_PCF_GPIOHS5	29  /* GPIO High speed 5 */
+#define K210_PCF_GPIOHS6	30  /* GPIO High speed 6 */
+#define K210_PCF_GPIOHS7	31  /* GPIO High speed 7 */
+#define K210_PCF_GPIOHS8	32  /* GPIO High speed 8 */
+#define K210_PCF_GPIOHS9	33  /* GPIO High speed 9 */
+#define K210_PCF_GPIOHS10	34  /* GPIO High speed 10 */
+#define K210_PCF_GPIOHS11	35  /* GPIO High speed 11 */
+#define K210_PCF_GPIOHS12	36  /* GPIO High speed 12 */
+#define K210_PCF_GPIOHS13	37  /* GPIO High speed 13 */
+#define K210_PCF_GPIOHS14	38  /* GPIO High speed 14 */
+#define K210_PCF_GPIOHS15	39  /* GPIO High speed 15 */
+#define K210_PCF_GPIOHS16	40  /* GPIO High speed 16 */
+#define K210_PCF_GPIOHS17	41  /* GPIO High speed 17 */
+#define K210_PCF_GPIOHS18	42  /* GPIO High speed 18 */
+#define K210_PCF_GPIOHS19	43  /* GPIO High speed 19 */
+#define K210_PCF_GPIOHS20	44  /* GPIO High speed 20 */
+#define K210_PCF_GPIOHS21	45  /* GPIO High speed 21 */
+#define K210_PCF_GPIOHS22	46  /* GPIO High speed 22 */
+#define K210_PCF_GPIOHS23	47  /* GPIO High speed 23 */
+#define K210_PCF_GPIOHS24	48  /* GPIO High speed 24 */
+#define K210_PCF_GPIOHS25	49  /* GPIO High speed 25 */
+#define K210_PCF_GPIOHS26	50  /* GPIO High speed 26 */
+#define K210_PCF_GPIOHS27	51  /* GPIO High speed 27 */
+#define K210_PCF_GPIOHS28	52  /* GPIO High speed 28 */
+#define K210_PCF_GPIOHS29	53  /* GPIO High speed 29 */
+#define K210_PCF_GPIOHS30	54  /* GPIO High speed 30 */
+#define K210_PCF_GPIOHS31	55  /* GPIO High speed 31 */
+#define K210_PCF_GPIO0		56  /* GPIO pin 0 */
+#define K210_PCF_GPIO1		57  /* GPIO pin 1 */
+#define K210_PCF_GPIO2		58  /* GPIO pin 2 */
+#define K210_PCF_GPIO3		59  /* GPIO pin 3 */
+#define K210_PCF_GPIO4		60  /* GPIO pin 4 */
+#define K210_PCF_GPIO5		61  /* GPIO pin 5 */
+#define K210_PCF_GPIO6		62  /* GPIO pin 6 */
+#define K210_PCF_GPIO7		63  /* GPIO pin 7 */
+#define K210_PCF_UART1_RX	64  /* UART1 Receiver */
+#define K210_PCF_UART1_TX	65  /* UART1 Transmitter */
+#define K210_PCF_UART2_RX	66  /* UART2 Receiver */
+#define K210_PCF_UART2_TX	67  /* UART2 Transmitter */
+#define K210_PCF_UART3_RX	68  /* UART3 Receiver */
+#define K210_PCF_UART3_TX	69  /* UART3 Transmitter */
+#define K210_PCF_SPI1_D0	70  /* SPI1 Data 0 */
+#define K210_PCF_SPI1_D1	71  /* SPI1 Data 1 */
+#define K210_PCF_SPI1_D2	72  /* SPI1 Data 2 */
+#define K210_PCF_SPI1_D3	73  /* SPI1 Data 3 */
+#define K210_PCF_SPI1_D4	74  /* SPI1 Data 4 */
+#define K210_PCF_SPI1_D5	75  /* SPI1 Data 5 */
+#define K210_PCF_SPI1_D6	76  /* SPI1 Data 6 */
+#define K210_PCF_SPI1_D7	77  /* SPI1 Data 7 */
+#define K210_PCF_SPI1_SS0	78  /* SPI1 Chip Select 0 */
+#define K210_PCF_SPI1_SS1	79  /* SPI1 Chip Select 1 */
+#define K210_PCF_SPI1_SS2	80  /* SPI1 Chip Select 2 */
+#define K210_PCF_SPI1_SS3	81  /* SPI1 Chip Select 3 */
+#define K210_PCF_SPI1_ARB	82  /* SPI1 Arbitration */
+#define K210_PCF_SPI1_SCLK	83  /* SPI1 Serial Clock */
+#define K210_PCF_SPI2_D0	84  /* SPI2 Data 0 */
+#define K210_PCF_SPI2_SS	85  /* SPI2 Select */
+#define K210_PCF_SPI2_SCLK	86  /* SPI2 Serial Clock */
+#define K210_PCF_I2S0_MCLK	87  /* I2S0 Master Clock */
+#define K210_PCF_I2S0_SCLK	88  /* I2S0 Serial Clock(BCLK) */
+#define K210_PCF_I2S0_WS	89  /* I2S0 Word Select(LRCLK) */
+#define K210_PCF_I2S0_IN_D0	90  /* I2S0 Serial Data Input 0 */
+#define K210_PCF_I2S0_IN_D1	91  /* I2S0 Serial Data Input 1 */
+#define K210_PCF_I2S0_IN_D2	92  /* I2S0 Serial Data Input 2 */
+#define K210_PCF_I2S0_IN_D3	93  /* I2S0 Serial Data Input 3 */
+#define K210_PCF_I2S0_OUT_D0	94  /* I2S0 Serial Data Output 0 */
+#define K210_PCF_I2S0_OUT_D1	95  /* I2S0 Serial Data Output 1 */
+#define K210_PCF_I2S0_OUT_D2	96  /* I2S0 Serial Data Output 2 */
+#define K210_PCF_I2S0_OUT_D3	97  /* I2S0 Serial Data Output 3 */
+#define K210_PCF_I2S1_MCLK	98  /* I2S1 Master Clock */
+#define K210_PCF_I2S1_SCLK	99  /* I2S1 Serial Clock(BCLK) */
+#define K210_PCF_I2S1_WS	100 /* I2S1 Word Select(LRCLK) */
+#define K210_PCF_I2S1_IN_D0	101 /* I2S1 Serial Data Input 0 */
+#define K210_PCF_I2S1_IN_D1	102 /* I2S1 Serial Data Input 1 */
+#define K210_PCF_I2S1_IN_D2	103 /* I2S1 Serial Data Input 2 */
+#define K210_PCF_I2S1_IN_D3	104 /* I2S1 Serial Data Input 3 */
+#define K210_PCF_I2S1_OUT_D0	105 /* I2S1 Serial Data Output 0 */
+#define K210_PCF_I2S1_OUT_D1	106 /* I2S1 Serial Data Output 1 */
+#define K210_PCF_I2S1_OUT_D2	107 /* I2S1 Serial Data Output 2 */
+#define K210_PCF_I2S1_OUT_D3	108 /* I2S1 Serial Data Output 3 */
+#define K210_PCF_I2S2_MCLK	109 /* I2S2 Master Clock */
+#define K210_PCF_I2S2_SCLK	110 /* I2S2 Serial Clock(BCLK) */
+#define K210_PCF_I2S2_WS	111 /* I2S2 Word Select(LRCLK) */
+#define K210_PCF_I2S2_IN_D0	112 /* I2S2 Serial Data Input 0 */
+#define K210_PCF_I2S2_IN_D1	113 /* I2S2 Serial Data Input 1 */
+#define K210_PCF_I2S2_IN_D2	114 /* I2S2 Serial Data Input 2 */
+#define K210_PCF_I2S2_IN_D3	115 /* I2S2 Serial Data Input 3 */
+#define K210_PCF_I2S2_OUT_D0	116 /* I2S2 Serial Data Output 0 */
+#define K210_PCF_I2S2_OUT_D1	117 /* I2S2 Serial Data Output 1 */
+#define K210_PCF_I2S2_OUT_D2	118 /* I2S2 Serial Data Output 2 */
+#define K210_PCF_I2S2_OUT_D3	119 /* I2S2 Serial Data Output 3 */
+#define K210_PCF_RESV0		120 /* Reserved function */
+#define K210_PCF_RESV1		121 /* Reserved function */
+#define K210_PCF_RESV2		122 /* Reserved function */
+#define K210_PCF_RESV3		123 /* Reserved function */
+#define K210_PCF_RESV4		124 /* Reserved function */
+#define K210_PCF_RESV5		125 /* Reserved function */
+#define K210_PCF_I2C0_SCLK	126 /* I2C0 Serial Clock */
+#define K210_PCF_I2C0_SDA	127 /* I2C0 Serial Data */
+#define K210_PCF_I2C1_SCLK	128 /* I2C1 Serial Clock */
+#define K210_PCF_I2C1_SDA	129 /* I2C1 Serial Data */
+#define K210_PCF_I2C2_SCLK	130 /* I2C2 Serial Clock */
+#define K210_PCF_I2C2_SDA	131 /* I2C2 Serial Data */
+#define K210_PCF_DVP_XCLK	132 /* DVP System Clock */
+#define K210_PCF_DVP_RST	133 /* DVP System Reset */
+#define K210_PCF_DVP_PWDN	134 /* DVP Power Down Mode */
+#define K210_PCF_DVP_VSYNC	135 /* DVP Vertical Sync */
+#define K210_PCF_DVP_HSYNC	136 /* DVP Horizontal Sync */
+#define K210_PCF_DVP_PCLK	137 /* Pixel Clock */
+#define K210_PCF_DVP_D0		138 /* Data Bit 0 */
+#define K210_PCF_DVP_D1		139 /* Data Bit 1 */
+#define K210_PCF_DVP_D2		140 /* Data Bit 2 */
+#define K210_PCF_DVP_D3		141 /* Data Bit 3 */
+#define K210_PCF_DVP_D4		142 /* Data Bit 4 */
+#define K210_PCF_DVP_D5		143 /* Data Bit 5 */
+#define K210_PCF_DVP_D6		144 /* Data Bit 6 */
+#define K210_PCF_DVP_D7		145 /* Data Bit 7 */
+#define K210_PCF_SCCB_SCLK	146 /* Serial Camera Control Bus Clock */
+#define K210_PCF_SCCB_SDA	147 /* Serial Camera Control Bus Data */
+#define K210_PCF_UART1_CTS	148 /* UART1 Clear To Send */
+#define K210_PCF_UART1_DSR	149 /* UART1 Data Set Ready */
+#define K210_PCF_UART1_DCD	150 /* UART1 Data Carrier Detect */
+#define K210_PCF_UART1_RI	151 /* UART1 Ring Indicator */
+#define K210_PCF_UART1_SIR_IN	152 /* UART1 Serial Infrared Input */
+#define K210_PCF_UART1_DTR	153 /* UART1 Data Terminal Ready */
+#define K210_PCF_UART1_RTS	154 /* UART1 Request To Send */
+#define K210_PCF_UART1_OUT2	155 /* UART1 User-designated Output 2 */
+#define K210_PCF_UART1_OUT1	156 /* UART1 User-designated Output 1 */
+#define K210_PCF_UART1_SIR_OUT	157 /* UART1 Serial Infrared Output */
+#define K210_PCF_UART1_BAUD	158 /* UART1 Transmit Clock Output */
+#define K210_PCF_UART1_RE	159 /* UART1 Receiver Output Enable */
+#define K210_PCF_UART1_DE	160 /* UART1 Driver Output Enable */
+#define K210_PCF_UART1_RS485_EN	161 /* UART1 RS485 Enable */
+#define K210_PCF_UART2_CTS	162 /* UART2 Clear To Send */
+#define K210_PCF_UART2_DSR	163 /* UART2 Data Set Ready */
+#define K210_PCF_UART2_DCD	164 /* UART2 Data Carrier Detect */
+#define K210_PCF_UART2_RI	165 /* UART2 Ring Indicator */
+#define K210_PCF_UART2_SIR_IN	166 /* UART2 Serial Infrared Input */
+#define K210_PCF_UART2_DTR	167 /* UART2 Data Terminal Ready */
+#define K210_PCF_UART2_RTS	168 /* UART2 Request To Send */
+#define K210_PCF_UART2_OUT2	169 /* UART2 User-designated Output 2 */
+#define K210_PCF_UART2_OUT1	170 /* UART2 User-designated Output 1 */
+#define K210_PCF_UART2_SIR_OUT	171 /* UART2 Serial Infrared Output */
+#define K210_PCF_UART2_BAUD	172 /* UART2 Transmit Clock Output */
+#define K210_PCF_UART2_RE	173 /* UART2 Receiver Output Enable */
+#define K210_PCF_UART2_DE	174 /* UART2 Driver Output Enable */
+#define K210_PCF_UART2_RS485_EN	175 /* UART2 RS485 Enable */
+#define K210_PCF_UART3_CTS	176 /* UART3 Clear To Send */
+#define K210_PCF_UART3_DSR	177 /* UART3 Data Set Ready */
+#define K210_PCF_UART3_DCD	178 /* UART3 Data Carrier Detect */
+#define K210_PCF_UART3_RI	179 /* UART3 Ring Indicator */
+#define K210_PCF_UART3_SIR_IN	180 /* UART3 Serial Infrared Input */
+#define K210_PCF_UART3_DTR	181 /* UART3 Data Terminal Ready */
+#define K210_PCF_UART3_RTS	182 /* UART3 Request To Send */
+#define K210_PCF_UART3_OUT2	183 /* UART3 User-designated Output 2 */
+#define K210_PCF_UART3_OUT1	184 /* UART3 User-designated Output 1 */
+#define K210_PCF_UART3_SIR_OUT	185 /* UART3 Serial Infrared Output */
+#define K210_PCF_UART3_BAUD	186 /* UART3 Transmit Clock Output */
+#define K210_PCF_UART3_RE	187 /* UART3 Receiver Output Enable */
+#define K210_PCF_UART3_DE	188 /* UART3 Driver Output Enable */
+#define K210_PCF_UART3_RS485_EN	189 /* UART3 RS485 Enable */
+#define K210_PCF_TIMER0_TOGGLE1	190 /* TIMER0 Toggle Output 1 */
+#define K210_PCF_TIMER0_TOGGLE2	191 /* TIMER0 Toggle Output 2 */
+#define K210_PCF_TIMER0_TOGGLE3	192 /* TIMER0 Toggle Output 3 */
+#define K210_PCF_TIMER0_TOGGLE4	193 /* TIMER0 Toggle Output 4 */
+#define K210_PCF_TIMER1_TOGGLE1	194 /* TIMER1 Toggle Output 1 */
+#define K210_PCF_TIMER1_TOGGLE2	195 /* TIMER1 Toggle Output 2 */
+#define K210_PCF_TIMER1_TOGGLE3	196 /* TIMER1 Toggle Output 3 */
+#define K210_PCF_TIMER1_TOGGLE4	197 /* TIMER1 Toggle Output 4 */
+#define K210_PCF_TIMER2_TOGGLE1	198 /* TIMER2 Toggle Output 1 */
+#define K210_PCF_TIMER2_TOGGLE2	199 /* TIMER2 Toggle Output 2 */
+#define K210_PCF_TIMER2_TOGGLE3	200 /* TIMER2 Toggle Output 3 */
+#define K210_PCF_TIMER2_TOGGLE4	201 /* TIMER2 Toggle Output 4 */
+#define K210_PCF_CLK_SPI2	202 /* Clock SPI2 */
+#define K210_PCF_CLK_I2C2	203 /* Clock I2C2 */
+#define K210_PCF_INTERNAL0	204 /* Internal function signal 0 */
+#define K210_PCF_INTERNAL1	205 /* Internal function signal 1 */
+#define K210_PCF_INTERNAL2	206 /* Internal function signal 2 */
+#define K210_PCF_INTERNAL3	207 /* Internal function signal 3 */
+#define K210_PCF_INTERNAL4	208 /* Internal function signal 4 */
+#define K210_PCF_INTERNAL5	209 /* Internal function signal 5 */
+#define K210_PCF_INTERNAL6	210 /* Internal function signal 6 */
+#define K210_PCF_INTERNAL7	211 /* Internal function signal 7 */
+#define K210_PCF_INTERNAL8	212 /* Internal function signal 8 */
+#define K210_PCF_INTERNAL9	213 /* Internal function signal 9 */
+#define K210_PCF_INTERNAL10	214 /* Internal function signal 10 */
+#define K210_PCF_INTERNAL11	215 /* Internal function signal 11 */
+#define K210_PCF_INTERNAL12	216 /* Internal function signal 12 */
+#define K210_PCF_INTERNAL13	217 /* Internal function signal 13 */
+#define K210_PCF_INTERNAL14	218 /* Internal function signal 14 */
+#define K210_PCF_INTERNAL15	219 /* Internal function signal 15 */
+#define K210_PCF_INTERNAL16	220 /* Internal function signal 16 */
+#define K210_PCF_INTERNAL17	221 /* Internal function signal 17 */
+#define K210_PCF_CONSTANT	222 /* Constant function */
+#define K210_PCF_INTERNAL18	223 /* Internal function signal 18 */
+#define K210_PCF_DEBUG0		224 /* Debug function 0 */
+#define K210_PCF_DEBUG1		225 /* Debug function 1 */
+#define K210_PCF_DEBUG2		226 /* Debug function 2 */
+#define K210_PCF_DEBUG3		227 /* Debug function 3 */
+#define K210_PCF_DEBUG4		228 /* Debug function 4 */
+#define K210_PCF_DEBUG5		229 /* Debug function 5 */
+#define K210_PCF_DEBUG6		230 /* Debug function 6 */
+#define K210_PCF_DEBUG7		231 /* Debug function 7 */
+#define K210_PCF_DEBUG8		232 /* Debug function 8 */
+#define K210_PCF_DEBUG9		233 /* Debug function 9 */
+#define K210_PCF_DEBUG10	234 /* Debug function 10 */
+#define K210_PCF_DEBUG11	235 /* Debug function 11 */
+#define K210_PCF_DEBUG12	236 /* Debug function 12 */
+#define K210_PCF_DEBUG13	237 /* Debug function 13 */
+#define K210_PCF_DEBUG14	238 /* Debug function 14 */
+#define K210_PCF_DEBUG15	239 /* Debug function 15 */
+#define K210_PCF_DEBUG16	240 /* Debug function 16 */
+#define K210_PCF_DEBUG17	241 /* Debug function 17 */
+#define K210_PCF_DEBUG18	242 /* Debug function 18 */
+#define K210_PCF_DEBUG19	243 /* Debug function 19 */
+#define K210_PCF_DEBUG20	244 /* Debug function 20 */
+#define K210_PCF_DEBUG21	245 /* Debug function 21 */
+#define K210_PCF_DEBUG22	246 /* Debug function 22 */
+#define K210_PCF_DEBUG23	247 /* Debug function 23 */
+#define K210_PCF_DEBUG24	248 /* Debug function 24 */
+#define K210_PCF_DEBUG25	249 /* Debug function 25 */
+#define K210_PCF_DEBUG26	250 /* Debug function 26 */
+#define K210_PCF_DEBUG27	251 /* Debug function 27 */
+#define K210_PCF_DEBUG28	252 /* Debug function 28 */
+#define K210_PCF_DEBUG29	253 /* Debug function 29 */
+#define K210_PCF_DEBUG30	254 /* Debug function 30 */
+#define K210_PCF_DEBUG31	255 /* Debug function 31 */
+
+#define K210_FPIOA(pin, func)		(((pin) << 16) | (func))
+
+#define K210_PC_POWER_3V3	0
+#define K210_PC_POWER_1V8	1
+
+#endif /* PINCTRL_K210_FPIOA_H */
-- 
2.29.2

