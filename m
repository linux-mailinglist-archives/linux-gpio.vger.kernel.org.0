Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B81A2D3AC7
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 06:38:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbgLIFhn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 00:37:43 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:15306 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727276AbgLIFhn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 00:37:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607492262; x=1639028262;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WYEB+xAbAuz8m2e2zCencw/TA9tmQomuLP1slmI1JUQ=;
  b=UB+CbDY4D9QzZ10JvuvEtvV8ceQcZr9ePu3sbox+1hRE+kSle5f27HyS
   2w2HdAk8uIVqIJ2CMsPyB8Tv1ebxwrFyRCTdFAq+ZOyZe37nTMQQnmZ5B
   nLBk869FgA46auKvJ5REhFS/9MfgQbumhiQCoZcCPU56SecKsPl+fMEGF
   XB1VaOjYYw+CELZrcBpZZl1YrUa8m4sUGT7lnrvR8HYul2zUcoWNQ2AQK
   1P2JLbDCg5QYY4vx9QLIQx7+FvGl7w8xJttJT06kYZNC6BEUaBZVsXVP5
   rlGEu3T1E09CXEidCEC7N3e0VqVwSDZapqUKimC6JIFsjc2Qx4umM88js
   Q==;
IronPort-SDR: RJfAHx9b78cEHtuKq2iR2/0UvVlH+OSOQHrNOZ5CpnxrZs7E2kN4XeAMJg3O+cKDZRZW6bjWjB
 bNbzuqlumFG2WUkoxGZphe1rXr12HRt1SF2y+jdInSOvL4NtswRf12HfPYl/sIPnbrprnFUhGe
 mlGVepWkrGEuaCLo2oqYV2aLewEHHYA3xbBmJp9KTC4mCZegg249CpQos8HZou9BnZYy1enG/Z
 zh3e5Mres0kcqDmUh7oKNFcZcTsCdo2Z/sJXrwzWC/5+KGzlqe0F776J0uPoh6cjXbc93aSp6m
 q20=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; 
   d="scan'208";a="154735898"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 13:35:27 +0800
IronPort-SDR: Bec4eiDKqwvp0VMeU+/i9U/TR1Z+cHnFHXR7M4vxjjU8n/FpnXt3bvHSdIj++dFH8YPDLXp7xW
 bEsCnkm3yQEldHV++i6EMxffO417yGw/M=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 21:20:53 -0800
IronPort-SDR: P4uZjs5f+5BxHSGbdwUus2YeR7g2ND0buudUm8S6N8HZY2azHhFWeeF62gZNczoIU7W5mNoCkJ
 IqPb27HDKfGw==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip02.wdc.com with ESMTP; 08 Dec 2020 21:35:25 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v6 08/22] dt-binding: clock: Document canaan,k210-clk bindings
Date:   Wed,  9 Dec 2020 14:34:52 +0900
Message-Id: <20201209053506.122582-9-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201209053506.122582-1-damien.lemoal@wdc.com>
References: <20201209053506.122582-1-damien.lemoal@wdc.com>
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
 .../bindings/clock/canaan,k210-clk.yaml       | 54 ++++++++++++++++++
 include/dt-bindings/clock/k210-clk.h          | 55 +++++++++++++++----
 2 files changed, 98 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml

diff --git a/Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml b/Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
new file mode 100644
index 000000000000..565ca468cb44
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
@@ -0,0 +1,54 @@
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
+    description:
+      Phandle of the SoC 26MHz fixed-rate oscillator clock.
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
index 5a2fd64d1a49..b2de702cbf75 100644
--- a/include/dt-bindings/clock/k210-clk.h
+++ b/include/dt-bindings/clock/k210-clk.h
@@ -3,18 +3,51 @@
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
+#define K210_CLK_CPU	0
+#define K210_CLK_SRAM0	1
+#define K210_CLK_SRAM1	2
+#define K210_CLK_AI	3
+#define K210_CLK_DMA	4
+#define K210_CLK_FFT	5
+#define K210_CLK_ROM	6
+#define K210_CLK_DVP	7
+#define K210_CLK_APB0	8
+#define K210_CLK_APB1	9
+#define K210_CLK_APB2	10
+#define K210_CLK_I2S0	11
+#define K210_CLK_I2S1	12
+#define K210_CLK_I2S2	13
+#define K210_CLK_I2S0_M	14
+#define K210_CLK_I2S1_M	15
+#define K210_CLK_I2S2_M	16
+#define K210_CLK_WDT0	17
+#define K210_CLK_WDT1	18
+#define K210_CLK_SPI0	19
+#define K210_CLK_SPI1	20
+#define K210_CLK_SPI2	21
+#define K210_CLK_I2C0	22
+#define K210_CLK_I2C1	23
+#define K210_CLK_I2C2	24
+#define K210_CLK_SPI3	25
+#define K210_CLK_TIMER0	26
+#define K210_CLK_TIMER1	27
+#define K210_CLK_TIMER2	28
+#define K210_CLK_GPIO	29
+#define K210_CLK_UART1	30
+#define K210_CLK_UART2	31
+#define K210_CLK_UART3	32
+#define K210_CLK_FPIOA	33
+#define K210_CLK_SHA	34
+#define K210_CLK_AES	35
+#define K210_CLK_OTP	36
+#define K210_CLK_RTC	37
 
-#endif /* K210_CLK_H */
+#define K210_NUM_CLKS	38
+
+#endif /* CLOCK_K210_CLK_H */
-- 
2.28.0

