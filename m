Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9D012D51B4
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 04:44:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729808AbgLJDnL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 22:43:11 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:39153 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729414AbgLJDnL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 22:43:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607572544; x=1639108544;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5HeCPpC2eIy6wf3Z5moPS/TBbmANlueIBuGfBKoPqYw=;
  b=S8bkvciAurfTY1M1tdh1eNpKGHNd3jJZ7wVuRHDeHjxsk3iIIGsTCJON
   x9RjyzvYjtZ73MvA2QQ9JVWyt8soRA9t2vd7zdlzYiG1LhYMRIpGcJ3gj
   CWF1KbC5bzE54v7qwaqLheWyADlmoMotbYogHZJAqJmUhd6NqzLPIPlr7
   cD3g795P2tW+4FarosMGBVmeOUCQRkNqjg2DTC3kC+6peRv2cxyq3Tik9
   QpJpZzCBgZtLcYvo7h6JR1MmXMNcqQ5Mvq3NzSrEjkhOBOD1zwz8l66kz
   e1gCTNzb/+cDSOV0tWW6UYyBvBiqbw2D9KYvjPUUDjd5zGJLhgedxuOHh
   g==;
IronPort-SDR: De7SduQ1fCBQWZMhVTrpzxBETvxw+LeEWZBK5fIJOz0cnT5nAbUedrzqyigtTkhvg5/rxy18s3
 UNFHpZyFlzn6w7JzhjwKvwmHly3dCz26VBIz+J4a5bCagjB2CIzZYMQhchdGDvWS5LKOY9Grcj
 6zAWa+zJ2Mb5gxwRzcud1B/iC8C+M3UgwmWQvUUhpKS3leIsNCvHcgZ4G178YjlNNYMlQ8AjJK
 6g5JHqdQLGqVJVw3tx35009b8d9upz+QgYe2K5zxVdTIvzw1/hgagSxZQtDQ2cmVGgCAkOkd6Q
 LbI=
X-IronPort-AV: E=Sophos;i="5.78,407,1599494400"; 
   d="scan'208";a="258551221"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 11:51:43 +0800
IronPort-SDR: 5aHK4bH5D+FgNGYOCh6ZDnGuymqKkd1Lu0lx+wsS9vw/ema4KSlfdiC9kN7kwX9IXHSUdTu8jD
 pQhwPg0zDS84S8rw0pu+TdlDbtXO+9pkM=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2020 19:24:27 -0800
IronPort-SDR: UfuQOQqabfbJQcg/AQGSKLRASp/1S9YpVfxHlcnxada6c0BZ6rwMVueZGIf5G3mcwS3s5Hrcm2
 xjM368f51L2A==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip01.wdc.com with ESMTP; 09 Dec 2020 19:40:29 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v7 09/22] dt-bindings: reset: Document canaan,k210-rst bindings
Date:   Thu, 10 Dec 2020 12:39:50 +0900
Message-Id: <20201210034003.222297-10-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210034003.222297-1-damien.lemoal@wdc.com>
References: <20201210034003.222297-1-damien.lemoal@wdc.com>
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

