Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 227081DDDAB
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2020 05:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728028AbgEVDI0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 May 2020 23:08:26 -0400
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:50923 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727876AbgEVDI0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 May 2020 23:08:26 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2008003|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.101682-0.00181878-0.8965;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03312;MF=frank@allwinnertech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.HbxBGFJ_1590116882;
Received: from allwinnertech.com(mailfrom:frank@allwinnertech.com fp:SMTPD_---.HbxBGFJ_1590116882)
          by smtp.aliyun-inc.com(10.147.41.178);
          Fri, 22 May 2020 11:08:22 +0800
From:   Frank Lee <frank@allwinnertech.com>
To:     mripard@kernel.org, wens@csie.org, robh+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, p.zabel@pengutronix.de,
        frank@allwinnertech.com, huangshuosheng@allwinnertech.com,
        tiny.windzz@gmail.com
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH 4/4] arm64: allwinner: A100: add support for Allwinner Perf1 board
Date:   Fri, 22 May 2020 11:07:43 +0800
Message-Id: <20200522030743.10204-5-frank@allwinnertech.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200522030743.10204-1-frank@allwinnertech.com>
References: <20200522030743.10204-1-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A100 perf1 is an Allwinner A100-based SBC, with the following features:

- 1GiB DDR3 DRAM
- AXP803 PMIC
- 2 USB 2.0 ports
- MicroSD slot and on-board eMMC module
- on-board Nand flash
- ···

Adds initial support for it, including the UART.

Signed-off-by: Frank Lee <frank@allwinnertech.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |  1 +
 .../allwinner/sun50i-a100-allwinner-perf1.dts | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index e4d3cd0ac5bb..ab780dbdd17b 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -14,6 +14,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinephone-1.1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinetab.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-baseboard.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-teres-i.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a100-allwinner-perf1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus-v1.2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-emlid-neutis-n5-devboard.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts b/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
new file mode 100644
index 000000000000..32c9986920ed
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+/*
+ * Copyright (c) 2020 Frank Lee <frank@allwinner.com>
+ */
+
+/dts-v1/;
+
+#include "sun50i-a100.dtsi"
+
+/{
+	model = "A100 perf1";
+	compatible = "allwinner,a100-perf1", "allwinner,sun50i-a100";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
-- 
2.24.0

