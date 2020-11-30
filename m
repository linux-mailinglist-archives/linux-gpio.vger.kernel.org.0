Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C65822C9322
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 00:51:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388873AbgK3XvC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 18:51:02 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:7930 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388786AbgK3XvC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 18:51:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606780696; x=1638316696;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iKyL7SSy4thzSVtbyyQfrf5obwUGB0rjdjJLiK0lOWg=;
  b=CaXjW2OPiie+Cb1zzcSeM28SZFsCWd7KFOE69Sa9LAslxLcKTW8cUiTE
   tUTbAX/B0kYjaVxCXwd4NJ071/LUYU6DXW9gYcMixJM6dLqigLoBtB6yk
   HSh+XCBWbbW4vJAlh/U7xkQkByw7wGrlaW+kbCR+W12CewQa2XL9K7zD9
   M9aNZVpdD608bqJxpyuoaIj4I/IjKQA3bsH6FHYsVIhpoH93MNfWpW0me
   udr29uxEgOR0cK90WoGbOO2SSWQTAlfurJX00Da9jVyKjYgHn9IyZHzs5
   2EEYDdtSWVOjcOesS+ymjCwnELMQkfYg8bgIk4OklcirDnRT9ZC/K+OM2
   A==;
IronPort-SDR: WDhvJBGPWdemfu6VUlMleBiIwiIg42xK3STjBWgX5Y+/vMM6HrVMlOoLJ/JyxV4eez+4JO7NAk
 4DkEvaInJdjaLArGLsxu7BJYYHwofSNZdXAmWupxoXofPCaQeYyRq5HKEhJuJRj2deee4ITYBV
 AnX+j/yGlNbLmtKfZEHsMNjLuxyIbG6aJcpaIeAeaASWXjsrYgxkUEzOQXbf+6UyrYYG3OaZ/I
 RHBbxxInBfibxnK711Z4mcVXh07uOIs2PlRs+PPiwu9FbenPUnRQP2Dskbrs7sXEQ5jlTvBM04
 JQs=
X-IronPort-AV: E=Sophos;i="5.78,382,1599494400"; 
   d="scan'208";a="257538302"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 01 Dec 2020 07:54:54 +0800
IronPort-SDR: 6iibTx0+J9sxGEJf0o8uF7ZIaNkWPAc5aRIq9Xg/EOHh52iAJK8uPTKyaK3N9x8rEjr/LyFh6J
 9wMWXjHtuwVDqO21QUimW5SVEYN7v2odI=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 15:33:02 -0800
IronPort-SDR: l/m/I6k0kRWWS4V885i1nT4Sg5TwhvURLyU8EayZoOHPdB+69jYTwWQR2m36nb+27dviJaUL5g
 Rk7EMf0ISDCg==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.196])
  by uls-op-cesaip01.wdc.com with ESMTP; 30 Nov 2020 15:48:47 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v3 07/21] dt-binding: clock: Document canaan,k210-clk bindings
Date:   Tue,  1 Dec 2020 08:48:15 +0900
Message-Id: <20201130234829.118298-8-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201130234829.118298-1-damien.lemoal@wdc.com>
References: <20201130234829.118298-1-damien.lemoal@wdc.com>
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

