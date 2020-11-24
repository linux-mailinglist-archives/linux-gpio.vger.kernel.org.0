Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A63762C1CE4
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 05:38:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729199AbgKXEhr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 23:37:47 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:49765 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727238AbgKXEhq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 23:37:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606192666; x=1637728666;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iKyL7SSy4thzSVtbyyQfrf5obwUGB0rjdjJLiK0lOWg=;
  b=R2JdDAW8XNOSjwnx6mmYhVlb6Qv88yztpx1HePygkx6c1V82u/giq1kh
   dUUHunGfUdQkZkXY0oMREPp+Fl3VfqoP95fEDS9gepKZfPBu6cB4LYvoS
   JvMdcq8ax5EYJkECDtKQ5yjTKnosTSv99k6oV1FV+2VYJGwunIZ4bfCtR
   tWhwlvC89q2IniUJo0OTYHrVPD6cHrj1kJa/JW4OfAbNihvIVlDFI5xs5
   urDgoaH/03s1uh7afj+S7T6im182T0ykC1qjwX7mD0bdaDF81pFDwghkp
   2D6MQ8ZIeGPE/jmX1oeJUYzogw0hu27nqD6xyWYEuS+4ngBFSaDKacRnp
   w==;
IronPort-SDR: 7SOAhflvV8g31bRuWNMFZ5ZbYjJOFrM05RhTgt63cIdubaXAP1XCbttMQFdXB1voRxWIvlLz+2
 mtT/l0KW/h7uP0mYONN29gh3zji4fBdSmNlzeEIcZmPWnO3VkmiQ6iO1bu3EP7WMdTQRHe6GqU
 TRAPV4idOMCXa8AqeL9MQiRIiittyTkEYEXsaSrfsDNW6uCWGiQgKrE0yeeBeaFSWgtJyQldgS
 GLQAbzJZVMSRq7FfWdRWDRsCAchkfhYQj3MVcFupMWEsfh9tQDINUTghk+vkL2J6OdgvdPjmZ4
 b6s=
X-IronPort-AV: E=Sophos;i="5.78,365,1599494400"; 
   d="scan'208";a="154498169"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 24 Nov 2020 12:37:46 +0800
IronPort-SDR: rmE1m09r3251pxw/cn2tUMeb6M+ZZ4BNtI5z89EOVcbIPM5vuJB6s8uSDmvdXTnTRuaOn6trSZ
 TG3tIh+R/mWYQAA/c6e1dXtLLgRqjj1GI=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 20:23:30 -0800
IronPort-SDR: L5rvPNu5856xVEYaKuvp+Hj77yHH8Vqk3bSOasYSJ9IlYqAI2E3zA+0N7vZNUo8SFS1nkkUUjm
 BN099W/BJV6A==
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.163])
  by uls-op-cesaip01.wdc.com with ESMTP; 23 Nov 2020 20:37:44 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v2 07/21] dt-binding: Document canaan,k210-clk bindings
Date:   Tue, 24 Nov 2020 13:37:14 +0900
Message-Id: <20201124043728.199852-8-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201124043728.199852-1-damien.lemoal@wdc.com>
References: <20201124043728.199852-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document the device tree bindings of the Canaan Kendryte K210 SoC clock
driver in Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml.
The header file include/dt-bindings/clock/k210-clk.h is modified to
include the complete list of IDs for all clocks of the SoC.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../bindings/clock/canaan,k210-clk.yaml       | 55 +++++++++++++++++
 include/dt-bindings/clock/k210-clk.h          | 61 +++++++++++++++----
 2 files changed, 105 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml

diff --git a/Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml b/Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
new file mode 100644
index 000000000000..3547916a2421
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/canaan,k210-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Canaan Kendryte K210 Clock Device Tree Bindings
+
+maintainers:
+  - Damien Le Moal <damien.lemoal@wdc.com>
+
+description: |
+  Canaan Kendryte K210 SoC clocks driver bindings. The clock
+  controller node must be defined as a child node of the K210
+  system controller node.
+
+  See also:
+  - dt-bindings/clock/k210-clk.h
+
+properties:
+  compatible:
+    const: canaan,k210-clk
+
+  clocks:
+    maxItems: 1
+    description:
+      System fixed rate oscillator clock.
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - '#clock-cells'
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/k210-clk.h>
+    clocks {
+      in0: oscillator {
+        compatible = "fixed-clock";
+        #clock-cells = <0>;
+        clock-frequency = <26000000>;
+      };
+    };
+
+    /* ... */
+    sysclk: clock-controller {
+      #clock-cells = <1>;
+      compatible = "canaan,k210-clk";
+      clocks = <&in0>;
+    };
diff --git a/include/dt-bindings/clock/k210-clk.h b/include/dt-bindings/clock/k210-clk.h
index 5a2fd64d1a49..8d7ab2f0737c 100644
--- a/include/dt-bindings/clock/k210-clk.h
+++ b/include/dt-bindings/clock/k210-clk.h
@@ -3,18 +3,57 @@
  * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
  * Copyright (c) 2020 Western Digital Corporation or its affiliates.
  */
-#ifndef K210_CLK_H
-#define K210_CLK_H
+#ifndef CLOCK_K210_CLK_H
+#define CLOCK_K210_CLK_H
 
 /*
- * Arbitrary identifiers for clocks.
- * The structure is: in0 -> pll0 -> aclk -> cpu
- *
- * Since we use the hardware defaults for now, set all these to the same clock.
+ * Kendryte K210 SoC clock identifiers (arbitrary values).
  */
-#define K210_CLK_PLL0   0
-#define K210_CLK_PLL1   0
-#define K210_CLK_ACLK   0
-#define K210_CLK_CPU    0
+#define K210_CLK_IN0	0
+#define K210_CLK_PLL0	1
+#define K210_CLK_PLL1	2
+#define K210_CLK_PLL2	3
+#define K210_CLK_ACLK	4
+#define K210_CLK_CPU	5
+#define K210_CLK_CLINT	6
+#define K210_CLK_DMA	7
+#define K210_CLK_FFT	8
+#define K210_CLK_SRAM0	9
+#define K210_CLK_SRAM1	10
+#define K210_CLK_ROM	11
+#define K210_CLK_DVP	12
+#define K210_CLK_APB0	13
+#define K210_CLK_APB1	14
+#define K210_CLK_APB2	15
+#define K210_CLK_AI	16
+#define K210_CLK_I2S0	17
+#define K210_CLK_I2S1	18
+#define K210_CLK_I2S2	19
+#define K210_CLK_I2S0_M	20
+#define K210_CLK_I2S1_M	21
+#define K210_CLK_I2S2_M	22
+#define K210_CLK_WDT0	23
+#define K210_CLK_WDT1	24
+#define K210_CLK_SPI0	25
+#define K210_CLK_SPI1	26
+#define K210_CLK_SPI2	27
+#define K210_CLK_I2C0	28
+#define K210_CLK_I2C1	29
+#define K210_CLK_I2C2	30
+#define K210_CLK_SPI3	31
+#define K210_CLK_TIMER0	32
+#define K210_CLK_TIMER1	33
+#define K210_CLK_TIMER2	34
+#define K210_CLK_GPIO	35
+#define K210_CLK_UART1	36
+#define K210_CLK_UART2	37
+#define K210_CLK_UART3	38
+#define K210_CLK_FPIOA	39
+#define K210_CLK_SHA	40
+#define K210_CLK_AES	41
+#define K210_CLK_OTP	42
+#define K210_CLK_RTC	43
 
-#endif /* K210_CLK_H */
+#define K210_NUM_CLKS	44
+
+#endif /* CLOCK_K210_CLK_H */
-- 
2.28.0

