Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CC05772999
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Aug 2023 17:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbjHGPot (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Aug 2023 11:44:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231164AbjHGPor (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Aug 2023 11:44:47 -0400
Received: from mx.skole.hr (mx1.hosting.skole.hr [161.53.165.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67BF0C4;
        Mon,  7 Aug 2023 08:44:45 -0700 (PDT)
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
        by mx.skole.hr (mx.skole.hr) with ESMTP id C08FE839F9;
        Mon,  7 Aug 2023 17:44:43 +0200 (CEST)
From:   =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date:   Mon, 07 Aug 2023 17:42:37 +0200
Subject: [PATCH v4 3/8] dt-bindings: clock: Add Marvell PXA1908 clock
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230807-pxa1908-lkml-v4-3-cb387d73b452@skole.hr>
References: <20230807-pxa1908-lkml-v4-0-cb387d73b452@skole.hr>
In-Reply-To: <20230807-pxa1908-lkml-v4-0-cb387d73b452@skole.hr>
To:     Robert Jarzmik <robert.jarzmik@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-hardening@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        afaerber@suse.de
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5011;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=nYxIESbCn6uimi4GgMf98s8y1U+8IT+Y3LfP8p6EBaQ=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBk0REyFdO7vcGF3+YJSXxDt9dyrz/PKe+Zhk14y
 xbY/gmvLoaJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZNERMgAKCRCaEZ6wQi2W
 4cFVEACQrBuJ33X3QbwSqyrHt5PS73bDxLrToGKW6Gs6dVA8WfZjO75JYs6vHY2SlVmS9/NTT6c
 vKdspUwSWcIlde+ZjhW13ONF9laNkUMPGT0R1NF8Pa772zo+zn8IKLJflBv+AbVrwgFfSJyJ/fG
 51ofB2bXfKpkOkP8h3hFo2iGMLu31oOvF4J8CDId8kOiiLx+6Ym29wD46UHqU9nCTgOn0Cq6wvD
 N/TAs9FgoaACVpjiQmWXFMVabPSruEJybVFuqBpYOT4a8OxyyNlFj0Mru1dpe7cYSBZ/h2dcZao
 oSX4ULdDQXLAfFw8hvKjA2xC172WVV479RQt21NH+bNjGDCEDRsXj9LO7Jw6afCcuYqhPFIbOqC
 NqhMSx5pyRj+LuLZCT47RKhNzAEq9qiO1MsMUsOydWABST1eefgpJTx63vJyA/nFEOdErVIBYPC
 vL4ioAuM/atZbrWHTrpL5bG+bg+++AhIWptnAMFXe040TJcV1OsRthAEB3n5jkzatsusGY22vtj
 XyZVIYiUjQ6wcOshfCS5thBHWyuiFbtlxiUqYWr51CBqK0N0grrIrW+2SMuH1758n427NaYB0m6
 2eeyNrQ2+s/cuG6gToDBl5HkFDeg0QREr8KaE/uQZ25EZMy1vItl5WNN5xNBPLxN/yNpvuu+zaE
 PsddfN473nk+WqQ==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add dt bindings and documentation for the Marvell PXA1908 clock
controller.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 .../devicetree/bindings/clock/marvell,pxa1908.yaml | 48 +++++++++++
 include/dt-bindings/clock/marvell,pxa1908.h        | 92 ++++++++++++++++++++++
 2 files changed, 140 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml b/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
new file mode 100644
index 000000000000..4e78933232b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/marvell,pxa1908.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell PXA1908 Clock Controllers
+
+maintainers:
+  - Duje Mihanović <duje.mihanovic@skole.hr>
+
+description: |
+  The PXA1908 clock subsystem generates and supplies clock to various
+  controllers within the PXA1908 SoC. The PXA1908 contains numerous clock
+  controller blocks, with the ones currently supported being APBC, APBCP, MPMU
+  and APMU roughly corresponding to internal buses.
+
+  All these clock identifiers could be found in <include/dt-bindings/marvell,pxa1908.h>.
+
+properties:
+  compatible:
+    enum:
+      - marvell,pxa1908-apbc
+      - marvell,pxa1908-apbcp
+      - marvell,pxa1908-mpmu
+      - marvell,pxa1908-apmu
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  # APMU block:
+  - |
+    clock-controller@d4282800 {
+      compatible = "marvell,pxa1908-apmu";
+      reg = <0xd4282800 0x400>;
+      #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/marvell,pxa1908.h b/include/dt-bindings/clock/marvell,pxa1908.h
new file mode 100644
index 000000000000..0c1f328bf534
--- /dev/null
+++ b/include/dt-bindings/clock/marvell,pxa1908.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+#ifndef __DTS_MARVELL_PXA1908_CLOCK_H
+#define __DTS_MARVELL_PXA1908_CLOCK_H
+
+/* plls */
+#define PXA1908_CLK_CLK32		1
+#define PXA1908_CLK_VCTCXO		2
+#define PXA1908_CLK_PLL1_624		3
+#define PXA1908_CLK_PLL1_416		4
+#define PXA1908_CLK_PLL1_499		5
+#define PXA1908_CLK_PLL1_832		6
+#define PXA1908_CLK_PLL1_1248		7
+#define PXA1908_CLK_PLL1_D2		8
+#define PXA1908_CLK_PLL1_D4		9
+#define PXA1908_CLK_PLL1_D8		10
+#define PXA1908_CLK_PLL1_D16		11
+#define PXA1908_CLK_PLL1_D6		12
+#define PXA1908_CLK_PLL1_D12		13
+#define PXA1908_CLK_PLL1_D24		14
+#define PXA1908_CLK_PLL1_D48		15
+#define PXA1908_CLK_PLL1_D96		16
+#define PXA1908_CLK_PLL1_D13		17
+#define PXA1908_CLK_PLL1_32		18
+#define PXA1908_CLK_PLL1_208		19
+#define PXA1908_CLK_PLL1_117		20
+#define PXA1908_CLK_PLL1_416_GATE	21
+#define PXA1908_CLK_PLL1_624_GATE	22
+#define PXA1908_CLK_PLL1_832_GATE	23
+#define PXA1908_CLK_PLL1_1248_GATE	24
+#define PXA1908_CLK_PLL1_D2_GATE	25
+#define PXA1908_CLK_PLL1_499_EN		26
+#define PXA1908_CLK_PLL2VCO		27
+#define PXA1908_CLK_PLL2		28
+#define PXA1908_CLK_PLL2P		29
+#define PXA1908_CLK_PLL2VCODIV3		30
+#define PXA1908_CLK_PLL3VCO		31
+#define PXA1908_CLK_PLL3		32
+#define PXA1908_CLK_PLL3P		33
+#define PXA1908_CLK_PLL3VCODIV3		34
+#define PXA1908_CLK_PLL4VCO		35
+#define PXA1908_CLK_PLL4		36
+#define PXA1908_CLK_PLL4P		37
+#define PXA1908_CLK_PLL4VCODIV3		38
+#define PXA1908_MPMU_NR_CLKS		38
+
+/* apb (apbc) peripherals */
+#define PXA1908_CLK_UART0		1
+#define PXA1908_CLK_UART1		2
+#define PXA1908_CLK_GPIO		3
+#define PXA1908_CLK_PWM0		4
+#define PXA1908_CLK_PWM1		5
+#define PXA1908_CLK_PWM2		6
+#define PXA1908_CLK_PWM3		7
+#define PXA1908_CLK_SSP0		8
+#define PXA1908_CLK_SSP1		9
+#define PXA1908_CLK_IPC_RST		10
+#define PXA1908_CLK_RTC			11
+#define PXA1908_CLK_TWSI0		12
+#define PXA1908_CLK_KPC			13
+#define PXA1908_CLK_SWJTAG		14
+#define PXA1908_CLK_SSP2		15
+#define PXA1908_CLK_TWSI1		16
+#define PXA1908_CLK_THERMAL		17
+#define PXA1908_CLK_TWSI3		18
+#define PXA1908_APBC_NR_CLKS		50
+
+/* apb (apbcp) peripherals */
+#define PXA1908_CLK_UART2		1
+#define PXA1908_CLK_TWSI2		2
+#define PXA1908_CLK_AICER		3
+#define PXA1908_APBCP_NR_CLKS		50
+
+/* axi (apmu) peripherals */
+#define PXA1908_CLK_CCIC1		1
+#define PXA1908_CLK_ISP			2
+#define PXA1908_CLK_DSI1		3
+#define PXA1908_CLK_DISP1		4
+#define PXA1908_CLK_CCIC0		5
+#define PXA1908_CLK_SDH0		6
+#define PXA1908_CLK_SDH1		7
+#define PXA1908_CLK_USB			8
+#define PXA1908_CLK_NF			9
+#define PXA1908_CLK_CORE_DEBUG		10
+#define PXA1908_CLK_VPU			11
+#define PXA1908_CLK_GC			12
+#define PXA1908_CLK_SDH2		13
+#define PXA1908_CLK_GC2D		14
+#define PXA1908_CLK_TRACE		15
+#define PXA1908_CLK_DVC_DFC_DEBUG	16
+#define PXA1908_APMU_NR_CLKS		50
+
+#endif

-- 
2.41.0


