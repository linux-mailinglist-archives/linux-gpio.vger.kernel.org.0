Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7532D8C35
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 09:13:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404113AbgLMIMv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 03:12:51 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:32155 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404097AbgLMIMv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 03:12:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607847171; x=1639383171;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O5a5XMfXL/EMdhk8PWFeJMOXMqu3c4qCzL2yRbbsrpo=;
  b=W1Dt2aKscKpQDOj1vdiVo2ICGzAkSb92q+NcWMXF3stvwWV+IsWZRVzw
   IudKWjBMt455RwULpBMBgIJG0e1b4nlOqnmlgen2hacGPIy7v5zcNpYYd
   uXC5iDaD7u21Olsp+JyfXgEoHsoUrwjxGt562UYzv8a/UA+gPcEw03EkH
   UOl+rJGp1uMd1wU31oj9CCQRqRBcbHPxd7MGOOn9v/3PaKXPWrhpqLqdQ
   XRuRZmOTCmOiLM7px93md1Not8Wn3r0Mf0NY554uqGvMwfXabRjPCRAck
   wVx3qwPLHhEqqq4CK5NTkKHIwqjfO45A/qgOvBLchCaQEMDMd3zYQJeE/
   Q==;
IronPort-SDR: EBClOjCz5YqSusFYcLuV1mHaaVbiTLslCrVrdlsXTjzCXcF8jJaMnQJUEspk82WvMB+jlMiBPp
 mbXhW36FOYYKXHX+Vq3qb6Kewg/I7Wty4y4B5fs15I7zZkLyShbHS07kWBF6MPkkJ4DfH4zvq9
 pU4Oy8uLFJsUvkwDjGDL93lNJpWKFOZL4S4TnKtvIwNVEap+g9hVZsxyExg1yJiebN0IJF+We9
 VR0sMxkX/ru7Tk35vgASWX+ecD4JJDbCpOOoqyk7TR/BY9RUYl2l5WTAm2zm64dC+laNR18cKX
 MKg=
X-IronPort-AV: E=Sophos;i="5.78,415,1599494400"; 
   d="scan'208";a="265208186"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 16:10:39 +0800
IronPort-SDR: /BJHrX7PNzs0YKBR/iIAIDr0HY+uNpsZ9hVnLcERzDhEMH5iYnjRpUuK/RDOGTkjFONSVLZyUE
 MdtpVUYl2KglINDh/FKBhDod1edCD42QMJ/I2ztm2B0XoEntZcoHxHvJPd77FWhlam/V8Y3I7w
 va0wg5yF957WVS28cCEsSVBlQWKQAqFISJ10Dj2wkpgFQRad50PikTJZbTZ46F8jyqbIueAFd3
 IeuqnM+eb5bAdKnsFCQtmrBubYmDA4GcXysH/imjMtAnX5HW0iUfyRxuJ3bl95aQArXMCO8ywl
 s8Y2HpNnKi0ha+dQ/R3Or+2V
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2020 23:56:00 -0800
IronPort-SDR: B4zbUj/kuk1jdIaiJkdiekyFK+8nmjlLbD1JzV8vaAwrnW4Ab8qVaHXHiAXqUy3wQlqMWq6xqR
 qgr+UtPngoNVA/O0P3bWSwsTXly30LIDe6glP79OoI+SY2E7WOK1QiY1Urq5N8YGbJ/5EtURDr
 iidV6BM1tQ/tpkRsIvt86RFTIugZwu2OzCtuqPGm6YwWkKTOyRLddwihUsbkM3mwaAdnmp443Q
 cr10PMjGNHJLYNMPy/jm6Cb5w3E3LrAH3sEI2NHv6OrV3Dqfrbp9Ds1vZtrnGIEpkmKJt2i/w+
 Hjw=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.197])
  by uls-op-cesaip02.wdc.com with ESMTP; 13 Dec 2020 00:10:38 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v9 09/22] dt-bindings: reset: Document canaan,k210-rst bindings
Date:   Sun, 13 Dec 2020 17:10:03 +0900
Message-Id: <20201213081016.179192-10-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213081016.179192-1-damien.lemoal@wdc.com>
References: <20201213081016.179192-1-damien.lemoal@wdc.com>
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
Reviewed-by: Rob Herring <robh@kernel.org>
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

