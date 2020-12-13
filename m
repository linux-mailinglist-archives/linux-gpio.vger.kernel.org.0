Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 336C22D8D7F
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 14:54:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406984AbgLMNx4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 08:53:56 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:35021 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406995AbgLMNx4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 08:53:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607867635; x=1639403635;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O5a5XMfXL/EMdhk8PWFeJMOXMqu3c4qCzL2yRbbsrpo=;
  b=jSp3lHTrhMouuwC0zzebnYL7Pk2f3+qGtZboqaoD4tIMYWXItwua6Hk5
   Jv4/XTqke6EI5mSZCo2lVyA0InBqBZtTMoZYsjLCmBEXbWgr3FW6vrlE1
   tV9yGkBaJdUlBU9gs0WgLuf8hCykr2Poy+IzBPEXm/E1hZzY16QLPjPdA
   u0JhNIj7K8EzAEBavSNX/zXsDEHkcwvdLTPZby9PydsHEkXXtUn3lDs05
   DAQwWLvrEZd2Eld9Ax3ZlHT2JE7u9qdbFalkv9K8u16bSMlcWwiSilZPT
   MK9prYQQIX7eiI675H94EdjeBTpeDjHUFZxSFtMgYKbHixWGBcuiF8wpz
   A==;
IronPort-SDR: YnsdTq5d+kFm7wjKav275qAgo8R4PJ8GqnupHARc2w9x6zViqvb3172lNrDN5ha75tFteioPEO
 pcRCD/RNByXf49ozSigG5mUHI1e3b6K7MPXhCyKvb31IBF1W3i5te0mdzfvQ1Fv02DfBUW74/t
 KedRkbimjtG3AkZjHF13oP0XIILZrFt2DpSlx3/9RuRaUxA7ih9lmKPF5bWCfWAPqTvHcdg9c1
 hCcgBfc7qePfGKSFW8xDL50RZxxFHOlv/DWuq4QVIeBIMbebobUMyi3C0QsrYWZR/tpO/kMsFb
 bTc=
X-IronPort-AV: E=Sophos;i="5.78,416,1599494400"; 
   d="scan'208";a="159494607"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 21:51:20 +0800
IronPort-SDR: KYBo4nXtAEUVDuuzEIplYMWQ2Is+SbsOrt9Cjay5CfmKe1q9g2N2LoIaOaKuLkvuDVoXXiS1eN
 HV1b5lsoYBK/ESMPEVdzjgC0RhSb47uMleeQ4Gy07CtXxR2NF+SVp0S5y8VHn34OR1ovK3Dets
 fsPCfvBypreH1vak+nR1iytjeP7GIUT4XXmS3As+cKhNX2lcAQqPyOX4lDW+I2l8SgJE2fHqzo
 YHfsAX1zwWcUtQBlu21TQwepuRkFz3ecHseTn+duOhMB3jTxNXckaZnBEhwQJ35+DCaBKuPtYu
 p+qxjaXH9eFJu0PlpigjzxjD
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 05:35:06 -0800
IronPort-SDR: owmm+ip6FrVtrDCKHr9XRw5yf+y+HQPxDArbvq4hjcjQgBVNSuWNvOQUoatanC35iLmJlqRIVf
 Z1TYJGQVyoW1UIJYGM1Xlgnw5mCYZMvDsSb7DytrzqHy/xX+wXjP37bKKQwq7Ds5KWBpA+ECRR
 sNGYDDjoemVguEPuWk1lG7aEIkzYQQ8d9HMxq8pfTsvmpXQuEt8Lkokj7Obo+uNEKPKv+wmT/6
 AueR5cJ7/dU+ZPDGT+zCnrZaVJTzn0+alCqSCIVqbt+SltoV6v3EZrb+S/NJoPvWihXGw4Vam3
 h1E=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.197])
  by uls-op-cesaip01.wdc.com with ESMTP; 13 Dec 2020 05:51:18 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v10 10/23] dt-bindings: reset: Document canaan,k210-rst bindings
Date:   Sun, 13 Dec 2020 22:50:43 +0900
Message-Id: <20201213135056.24446-11-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213135056.24446-1-damien.lemoal@wdc.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
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

