Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC922D8C3B
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 09:13:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404134AbgLMINb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 03:13:31 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:32105 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404130AbgLMINa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 03:13:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607847209; x=1639383209;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MQK/vb8NBPxRh5mHQhMV5bOBm1Zq0AgJmS+3j2J54wg=;
  b=D+CBUlAlDNGzG3R9fYktpGz8sKrvQY+i3MthxwkXHJHbWXko6XoxDqcV
   z7SDxR4WA7luUt/yqB13Hq942RO8PhS6gD40Ga0J0MKdOBLhALGBXJhtF
   HiK32pn8UZi4V9Ejs+nV3gf/nTYFKg+WyB2KoT9PYzwMWj0G4vHjF7ZDm
   S8OqGvy+u77DbFBTQkcZf3X0d7Hhb6UYYUGR1ByNSThcgfGv6+INg2j4K
   lrGk2qzqPhba7W+DJXp8jCQwKMekmpfbCziwT/GsdKXVjAf2O0l5b1A98
   /o0vxA6oqzuyjvM3N/lsJI0vjv6ukYTVq0hj2j8+HAjwxOsTQKgJ5gQwe
   Q==;
IronPort-SDR: bx69zx7vPKLfv15ofu0SlkL5dzwiD/TH0JhikNPJqF53DNVtM5YtZ2LsQvzSksDjbKzrTaBtOO
 c/a3GmL5fM+JULro0OV1WGuwnFb09I7D9TeR2+z9TdQMowTpoM4O6ndPQ0BTylir7hKpgCgRfF
 Yhkx89rep2GAeXfpAEHhdwf0PfSa1LGFTGrthiEVj7ew9s4KEghX/wIIBmw5exyj38JOrMZYwG
 0zRJBnuhHmzNOU0IzuRbSQCo90n68atlsIhETxkzSman6u/uAc+whW68vPSccSMfmdL1Ejg/ae
 yzc=
X-IronPort-AV: E=Sophos;i="5.78,415,1599494400"; 
   d="scan'208";a="265208194"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 16:10:43 +0800
IronPort-SDR: QX10ksyCmuuHWoQerMfG4y49V9fHNRQL5vd4ukMTCibfnug2ltz083zlpC8LiOeladC6Bekkrk
 kU3rOfiPo4+1oYXkaK2mzaLxFWHdBKOJfW3gTnEX2Hxf1nKybWgUXCrBcP6Q9TdDuZ3NF64i/L
 j8v6OcdRdg7V+cRUvf0h9y+tJOrsxvPzlyS+95YoM7+T381CC3J7064DnVBrB2kJF2GFzKz3yE
 WaYsmTkMaDpZSs72cw1sPRrhTKmG4Xd1WuOHBgSbUnhqdHtcYx7er0er6SXNVPFqIgZt+J2sIV
 sUNLc/FQHWMSWKfHVEESYiO2
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2020 23:56:04 -0800
IronPort-SDR: qEv9igjrrP4z4heeansmisFfCBHHetvIIUm3Lypue2sM68pUKqdyMFfWxXBbhPxoO9WkII4DKu
 mmFFInJovkIJHB6dwDQwLkVrvgTjIY7NI3NQiZ/SMzd7kQ4uIcCqiSg6Tg/+KOCu0tck0Z09mS
 7oSGEUEz8YkoGSgfUrOtj9REWJdHoesvL/602SP2+RX45oL6wa+2Y4ZQaZGkiOHu6jA0To2uF5
 QgkEkZ2Q8q/pGKUq76NudHGjxAs47FhsQG2ws43frCGPp6WNDdICK+WW3yCdf6QYxafKfb5TXx
 ToU=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.197])
  by uls-op-cesaip02.wdc.com with ESMTP; 13 Dec 2020 00:10:42 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v9 11/22] dt-binding: mfd: Document canaan,k210-sysctl bindings
Date:   Sun, 13 Dec 2020 17:10:05 +0900
Message-Id: <20201213081016.179192-12-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213081016.179192-1-damien.lemoal@wdc.com>
References: <20201213081016.179192-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document the device tree bindings of the Canaan Kendryte K210 SoC
system controller driver in
Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../bindings/mfd/canaan,k210-sysctl.yaml      | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml

diff --git a/Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml b/Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
new file mode 100644
index 000000000000..c24ad45cabb5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/canaan,k210-sysctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Canaan Kendryte K210 System Controller Device Tree Bindings
+
+maintainers:
+  - Damien Le Moal <damien.lemoal@wdc.com>
+
+description:
+  Canaan Inc. Kendryte K210 SoC system controller which provides a
+  register map for controlling the clocks, reset signals and pin power
+  domains of the SoC.
+
+properties:
+  compatible:
+    items:
+      - const: canaan,k210-sysctl
+      - const: syscon
+      - const: simple-mfd
+
+  clocks:
+    maxItems: 1
+    description:
+      System controller Advanced Power Bus (APB) interface clock source.
+
+  clock-names:
+    items:
+      - const: pclk
+
+  reg:
+    maxItems: 1
+
+  clock-controller:
+    # Child node
+    type: object
+    $ref: "../clock/canaan,k210-clk.yaml"
+    description:
+      Clock controller for the SoC clocks. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml.
+
+  reset-controller:
+    # Child node
+    type: object
+    $ref: "../reset/canaan,k210-rst.yaml"
+    description:
+      Reset controller for the SoC. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml.
+
+  syscon-reboot:
+    # Child node
+    type: object
+    $ref: "../power/reset/syscon-reboot.yaml"
+    description:
+      Reboot method for the SoC. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml.
+
+required:
+  - compatible
+  - clocks
+  - reg
+  - clock-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/k210-clk.h>
+    #include <dt-bindings/reset/k210-rst.h>
+
+    clocks {
+      in0: oscllator {
+        compatible = "fixed-clock";
+        #clock-cells = <0>;
+        clock-frequency = <26000000>;
+      };
+    };
+
+    sysctl: syscon@50440000 {
+      compatible = "canaan,k210-sysctl",
+                   "syscon", "simple-mfd";
+      reg = <0x50440000 0x100>;
+      clocks = <&sysclk K210_CLK_APB1>;
+      clock-names = "pclk";
+
+      sysclk: clock-controller {
+        #clock-cells = <1>;
+        compatible = "canaan,k210-clk";
+        clocks = <&in0>;
+      };
+
+      sysrst: reset-controller {
+        compatible = "canaan,k210-rst";
+        #reset-cells = <1>;
+      };
+
+      reboot: syscon-reboot {
+        compatible = "syscon-reboot";
+        regmap = <&sysctl>;
+        offset = <48>;
+        mask = <1>;
+        value = <1>;
+      };
+    };
-- 
2.29.2

