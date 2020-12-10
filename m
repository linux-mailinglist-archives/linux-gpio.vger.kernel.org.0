Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7056B2D51AF
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 04:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730650AbgLJDms (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 22:42:48 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:39110 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730104AbgLJDmr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 22:42:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607572509; x=1639108509;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AeiEHbIkWwtw1R4io5A6L+qNVMQkbPlxqlTU/ANGemA=;
  b=aowdSRjjymv3yuVUq3IUUUQA0bMPFamptAPC/34M2ouAxSsZOVuK9Z0r
   O3VXBfMrYcwk6RblGpIKyMAJJvv5/uVy+THU5doGnQujXsZz5rFfq5GrZ
   /kfSsHEVr24Fd3iFRzCst7vLgjZ/U2U+LzjU3dtdBPlL8bRTxL8TqS7GY
   BqfL0MLHYTry2BrfzAb47kpPSxA1UEcQFhkBkBARM9AVvfdL3iGNR/ob9
   3xYj7nstAbnewQ5Wv80h+ZTpyY0eQzWkVf6IsHQ06x2B56YiRFra76He/
   EQ2z0HpJRU4A0PnixKyxR/r0FHhkjeAK00n113Y+8S0RjuMZZNpyWclYN
   A==;
IronPort-SDR: 3gOBLCnLP1w2TjEgX2Fl9NwFLOO+kR4G9vHLqjoFn2iCrCBlYxy4TEYOi7Tnsmu3hIp/rsuxic
 aU+vEbrXdpj1KQoTWbZaAgL518T/+YDBvdcHAhBEcwf+v0CuFuKuCjL4pvpaQvrkf0CWt25vDH
 Aou0EJGrTRw6xxQ582kGVSNGLMvtCcWm3Y0yIrbAukkESIFOBQXau1mWurwg9fqPPab1dGosWj
 yxLRxOBnTPQnEhscYZuYzCG2h7kEduRsB+alHVH2r8ics3CMjxZ8n3qPmm3gKBLBPr/o3NSn43
 JZk=
X-IronPort-AV: E=Sophos;i="5.78,407,1599494400"; 
   d="scan'208";a="258551218"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 11:51:40 +0800
IronPort-SDR: sHlIGSQNZEqVKdojNejYpkRVN0EIiOSNQDmaPk7gbDzqM+1b/ZhXGnWSxonEE72VnRZPj/6VZx
 Wk3dFKpkFLjzXDjEMJaKitIC81bKrqxlE=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2020 19:24:25 -0800
IronPort-SDR: pDyNbCO/fdoBaj3AA4cEC62ohDz9atroDHRBrP+JhINPVJr5p92Q0ebq3dDbpw4uB2cazGKS65
 BGkHQe8lA47w==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip01.wdc.com with ESMTP; 09 Dec 2020 19:40:27 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v7 08/22] dt-binding: clock: Document canaan,k210-clk bindings
Date:   Thu, 10 Dec 2020 12:39:49 +0900
Message-Id: <20201210034003.222297-9-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210034003.222297-1-damien.lemoal@wdc.com>
References: <20201210034003.222297-1-damien.lemoal@wdc.com>
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
2.29.2

