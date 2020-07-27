Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79C0322E80C
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 10:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbgG0Imp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 04:42:45 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:48576 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbgG0Imo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2020 04:42:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1595839363; x=1627375363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G2axFXT/31oM3Rm6zrPTCnWCP9KeungmOjSMXgMerY8=;
  b=S/Dl6cHVpuzrDWyG0uk47GkJXvtG6E6oZSMB3I2znXdsVPELUZLa0t7d
   CF/gTHtS2KuPHzyPHzDolOJU+D8Kd0oezteGPx/ceEhDVBAUIF5e8WO+l
   mj2m0KqmTUt1FvAtq6SchitySpmUsIGDY3LQf3knPYo9g1V5JWbBne++A
   vbwfJlB9nj8awCwfdoJIHx3ADzfrBcwR+TwTjHWmB7kaAyDn9+acil7eq
   gGWR86symUbJeoYXSZ1xvZuSK4v6Y0vqm86OWDJ8B+DKlklTYw/03xQqQ
   D0szR4kiff7pH6IMJHZT/tXqEkzlpGF4u4VJxPFfQdy4t7KyU5D7Mlnsf
   A==;
IronPort-SDR: 3foxZozAnfEGasHFCIaHf5sDzu4Ny1EfMeQ/2ef09yfPBB6WGj7fcUEoZY2H6xtzM69M0p/Xw2
 6ghFrhJ6MuKVXxJELq9UUpd6Fx1IYrjnLSdYOiBVG68vwUBbVh5myNgXtYeo5Kk1bj3RqicL0c
 mnXXmM4Ai0rDZLmR39tDUI4fM0znxDHshQqbWrFwB5R94ZX/u/EDDYsBlDlzoiTXAYbocOczhd
 lP0MMFPjmQOKWo+I/o+3zZ7vVMr1xJb02y5Sb4auNRwytePiUuBIsXSoCykT2ePJe4T1PsAWed
 hLw=
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; 
   d="scan'208";a="85470429"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jul 2020 01:42:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 27 Jul 2020 01:41:57 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 27 Jul 2020 01:42:39 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        "Michael Turquette" <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 06/10] dt-bindings: clock: sparx5: Add Sparx5 SoC DPLL clock
Date:   Mon, 27 Jul 2020 10:42:07 +0200
Message-ID: <20200727084211.6632-7-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727084211.6632-1-lars.povlsen@microchip.com>
References: <20200727084211.6632-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This add the DT bindings documentation for the Sparx5 SoC DPLL clock

Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/clock/microchip,sparx5-dpll.yaml | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/microchip,sparx5-dpll.yaml

diff --git a/Documentation/devicetree/bindings/clock/microchip,sparx5-dpll.yaml b/Documentation/devicetree/bindings/clock/microchip,sparx5-dpll.yaml
new file mode 100644
index 0000000000000..39559a0a598ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/microchip,sparx5-dpll.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/microchip,sparx5-dpll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip Sparx5 DPLL Clock
+
+maintainers:
+  - Lars Povlsen <lars.povlsen@microchip.com>
+
+description: |
+  The Sparx5 DPLL clock controller generates and supplies clock to
+  various peripherals within the SoC.
+
+properties:
+  compatible:
+    const: microchip,sparx5-dpll
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  # Clock provider for eMMC:
+  - |
+    lcpll_clk: lcpll-clk {
+        compatible = "fixed-clock";
+        #clock-cells = <0>;
+        clock-frequency = <2500000000>;
+    };
+    clks: clock-controller@61110000c {
+        compatible = "microchip,sparx5-dpll";
+        #clock-cells = <1>;
+        clocks = <&lcpll_clk>;
+        reg = <0x1110000c 0x24>;
+    };
+
+...
-- 
2.27.0

