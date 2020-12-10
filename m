Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA7352D5CF2
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 15:08:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389957AbgLJOGH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 09:06:07 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:5144 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389953AbgLJOFv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 09:05:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607609150; x=1639145150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5HeCPpC2eIy6wf3Z5moPS/TBbmANlueIBuGfBKoPqYw=;
  b=Doz9+WuR2AkuW73QBjl1RL+7qEqLeWC6g1Fu5pqbUeCoj9WKNFTEUMR4
   6Hz38gxsSiX5z15zwDnMbwG/NpayxzsBbrnCJvLJG/dfU5tJKODBkMeCd
   fFOaR4YYwrKWaxmOA0dhlnJKesKOIfXgZA78amyx8FDXmRNSY0MLaYR3H
   0WSgnvxDaXqsuOg5R6UQ2NYljkc/2skOZzWomFinLoN6wm184RkVkE9sB
   dq7MlJBtQ+t8dWKhaq8iCkn2BqAddPl62HIN+bp1N0FYxaa+ZuhWH78J4
   5kmVLb2ZCra7oIBLk8j/QA6PMiYFWIpzl0KVSBn7qRVoKTRBRPWgbhWxg
   Q==;
IronPort-SDR: 8WAVTSDs+1u1YS7CvmcuPQj6TMqFK/6ynAbMVX6cqOmZxTBl0JDVuAo2xFL7JgoRQADKR3iZlk
 h5PrY9hFY9Ucth6dEDy4ntIj2NoATKkTlx1vbOrp/bF5aSZ/UzwLoZsAONABcFvu2+b7BFyqBl
 1Nw2pZekkViTgNXH+C1f5zVwgtnMHfJnd1FEAg8XyB4HUtRF+9zZyPAGIlKD1NdbaXL1PwC83x
 /ecpTlgzjQUGm2UHCZDkRbq9P5YapyRcHwA9w/A0XNXcoqqUeb1updEHegY+dygKxpa4j9+dDR
 OsY=
X-IronPort-AV: E=Sophos;i="5.78,408,1599494400"; 
   d="scan'208";a="159316722"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 22:03:36 +0800
IronPort-SDR: kU30jMR75YcBAz7coyIBnaKFWN2Ejilu9g6DVyjBn4bVxG+E1DKWn31zXoBg28jYtll6dV+czD
 XtHWfYY1YoMyryDDXT9wOoRLD9TvU41Fs=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 05:47:28 -0800
IronPort-SDR: /epogBhLeR3572DbcYQ7HyAhK9OpEtxRa6qMzBBSROf5shuVU7mWQAXgqew+Z5qzgF7tf0755c
 nHJPO+KQchqQ==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip02.wdc.com with ESMTP; 10 Dec 2020 06:03:35 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v8 09/22] dt-bindings: reset: Document canaan,k210-rst bindings
Date:   Thu, 10 Dec 2020 23:03:00 +0900
Message-Id: <20201210140313.258739-10-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210140313.258739-1-damien.lemoal@wdc.com>
References: <20201210140313.258739-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document the device tree bindings for the Canaan Kendryte K210 SoC
reset controller driver in
Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml. The header
file include/dt-bindings/reset/k210-rst.h is added to define all
possible reset lines of the SoC.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../bindings/reset/canaan,k210-rst.yaml       | 40 ++++++++++++++++++
 include/dt-bindings/reset/k210-rst.h          | 42 +++++++++++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml
 create mode 100644 include/dt-bindings/reset/k210-rst.h

diff --git a/Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml b/Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml
new file mode 100644
index 000000000000..53e4ede9c0bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/canaan,k210-rst.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Canaan Kendryte K210 Reset Controller Device Tree Bindings
+
+maintainers:
+  - Damien Le Moal <damien.lemoal@wdc.com>
+
+description: |
+  Canaan Kendryte K210 reset controller driver which supports the SoC
+  system controller supplied reset registers for the various peripherals
+  of the SoC. The K210 reset controller node must be defined as a child
+  node of the K210 system controller node.
+
+  See also:
+  - dt-bindings/reset/k210-rst.h
+
+properties:
+  compatible:
+    const: canaan,k210-rst
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - '#reset-cells'
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/k210-rst.h>
+    sysrst: reset-controller {
+      compatible = "canaan,k210-rst";
+      #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/reset/k210-rst.h b/include/dt-bindings/reset/k210-rst.h
new file mode 100644
index 000000000000..883c1aed50e8
--- /dev/null
+++ b/include/dt-bindings/reset/k210-rst.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2019 Sean Anderson <seanga2@gmail.com>
+ * Copyright (c) 2020 Western Digital Corporation or its affiliates.
+ */
+#ifndef RESET_K210_SYSCTL_H
+#define RESET_K210_SYSCTL_H
+
+/*
+ * Kendryte K210 SoC system controller K210_SYSCTL_SOFT_RESET register bits.
+ * Taken from Kendryte SDK (kendryte-standalone-sdk).
+ */
+#define K210_RST_ROM	0
+#define K210_RST_DMA	1
+#define K210_RST_AI	2
+#define K210_RST_DVP	3
+#define K210_RST_FFT	4
+#define K210_RST_GPIO	5
+#define K210_RST_SPI0	6
+#define K210_RST_SPI1	7
+#define K210_RST_SPI2	8
+#define K210_RST_SPI3	9
+#define K210_RST_I2S0	10
+#define K210_RST_I2S1	11
+#define K210_RST_I2S2	12
+#define K210_RST_I2C0	13
+#define K210_RST_I2C1	14
+#define K210_RST_I2C2	15
+#define K210_RST_UART1	16
+#define K210_RST_UART2	17
+#define K210_RST_UART3	18
+#define K210_RST_AES	19
+#define K210_RST_FPIOA	20
+#define K210_RST_TIMER0	21
+#define K210_RST_TIMER1	22
+#define K210_RST_TIMER2	23
+#define K210_RST_WDT0	24
+#define K210_RST_WDT1	25
+#define K210_RST_SHA	26
+#define K210_RST_RTC	29
+
+#endif /* RESET_K210_SYSCTL_H */
-- 
2.29.2

