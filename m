Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D46221F98BF
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 15:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730499AbgFONdZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 09:33:25 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:62212 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729875AbgFONdV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jun 2020 09:33:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1592228000; x=1623764000;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7jqIHOYBzLEkUI/gyT4h0PiTuHWl6t5kNRx1viuzrLA=;
  b=Xb2ZZwxutWukTSCiZMm/cNt1Z+Uu2SBTEmnF2cLBIne1n6Z8+8OcwNhH
   XCAuATsa+zJiplBQarzthRP52whoms4c7esHi1hUXf3YsvTWDIhtPCUp9
   ksXolR/xbM5PgvpS7Gcvr/jpkgCNGD9JEqC2WicgQRrREy3lfoVeDWeaG
   i8YNmjeCC5vg/VtI4+nMXI1cD4Cx6KNWItoK9mGcA5K1h6PrgRu9tHjnm
   DXybMr4K4vPefNGpVKem8RqcP93ApF4csK1F8s8GnqVr3brWlJ55Lp1MV
   f9AH5vciT+17O0bb85PJ/QlI/zq91OzIODbX6YI3eBAmWCTWiq36zBjUF
   A==;
IronPort-SDR: yufsqD9qyb+fw5WP3N9pN5zY94Wts0Vf92UN8PXQBlFAJ5pUF29Ahbk/9mOXbS2CbufLnxFLJW
 B0nP7oZq/76MrosCTpxIjPuqz6geBPFI6cEVBfngF18LXYbRCTotbghYIJMkGhfpVD+f6jnGaq
 ZSfWe8WpZ6IyWWNoBcfnGsSx+oHrmlm4NVWm5ydtXfbRYF+t8FfTAKud1ojy4ftaH6c2eF7cAG
 gu006u/YpmaJ/b24TZM3riO3WoYsFjLAH4SMsq5WfSU2PyneR8zglAuWlNWh0xwwEfRwQE4BWz
 +NY=
X-IronPort-AV: E=Sophos;i="5.73,514,1583218800"; 
   d="scan'208";a="83619496"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jun 2020 06:33:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 15 Jun 2020 06:33:18 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 15 Jun 2020 06:33:15 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
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
Subject: [PATCH v3 06/10] dt-bindings: clock: sparx5: Add Sparx5 SoC DPLL clock
Date:   Mon, 15 Jun 2020 15:32:38 +0200
Message-ID: <20200615133242.24911-7-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200615133242.24911-1-lars.povlsen@microchip.com>
References: <20200615133242.24911-1-lars.povlsen@microchip.com>
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

