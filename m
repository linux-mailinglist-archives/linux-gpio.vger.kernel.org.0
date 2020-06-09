Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 976C91F35D0
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 10:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728039AbgFIIId (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jun 2020 04:08:33 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:35539 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbgFIIIa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jun 2020 04:08:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1591690109; x=1623226109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EXViZJNoUAiedo3upJN/pWpw3+V8c4VqVgPBgGd+VnY=;
  b=Z26m9ZOT/j6PyPubsuQxYBIWSNrWK5Q0Oj1Id4ZLjUF/ohtrw84I0XL+
   2gVJ1b5wEpuKroIg+kjUGi91rRc7aCWVukRwB+JTAq8EOjrdP6GnLDXo4
   IerXyGR7OD4NOvXAVObZ8/h3ySOv9tZ221Dvv0RAyzRh/KxjQgcErDJEw
   XRHUj1YLQgNSvJ94SdD0ipglLYk57wZuFwOxgJSOVu3H6EDo+pEW9dV1N
   e7IOuChPHLB0drUPjGeNiw4PcnFxTQGSiPXVTPZW5nlYi+N7JBG8ssQwS
   p7bxfWXJz6fh3JPnKDe5BAj95gpZSeHkP9AgXdGiDIDKJ9ov98x9abmLS
   w==;
IronPort-SDR: FLOeC5uNuX7vgoZEChRdO9fNed5hRF+qIDQ4ty7HM7RTm9TOpUIcfqEPmqjBJjRJibmmjawtUl
 Aanm9Il+p8QTRBNNifO3W/wSFrzf4uVHb/VxX9axuz6vH77JwFZPVx8ZP5ZtLeENHE2H+mOXLE
 e1MYSBBXbDf8OK+yw6J8/NrS1VFwjZf7CfPcXZlvc4qJRNRLvd7HiJpMXQ77vqTmFF0vXXKd5t
 /CsOJZ2pxXHJ5t/jdddtGSvoLFmByXXJZGdsOBymnfh6rB0T8gwwvWOHGYb6NxPaIvfrw3109L
 Whs=
X-IronPort-AV: E=Sophos;i="5.73,491,1583218800"; 
   d="scan'208";a="79412819"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jun 2020 01:08:29 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Tue, 9 Jun 2020 01:08:28 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1847.3 via Frontend Transport; Tue, 9 Jun 2020 01:08:25 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>,
        "Linus Walleij" <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        "Michael Turquette" <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 06/10] dt-bindings: clock: sparx5: Add Sparx5 SoC DPLL clock
Date:   Tue, 9 Jun 2020 10:07:05 +0200
Message-ID: <20200609080709.9654-6-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200609080709.9654-1-lars.povlsen@microchip.com>
References: <20200608123024.5330-1-lars.povlsen@microchip.com>
 <20200609080709.9654-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This add the DT bindings documentation for the Sparx5 SoC DPLL clock

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
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
