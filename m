Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFEBB2C932E
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 00:51:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388966AbgK3Xvb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 18:51:31 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:7901 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388889AbgK3Xva (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 18:51:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606780739; x=1638316739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4U4b/nqfPlar1rNpNlwWEX+TNC6mHk8oUWWOJcFYm1M=;
  b=Pfnbv/GgSP2xYLnhZWHzkTf0RlAmV/3BjTKCm/Cl2lTzqfxPmPl+AihI
   +5ArE4CeNsgxY6/ovIW0nKQn7yAipI07Xg4DL3f+77F74LIiRCZvexkh+
   WImBODyQWSfrsWUHy1UpFhZpcGibyr01tRRkfRBFyoSL52hNnH9ARIUg4
   /t7kP2hH86Vu585HKD2/b4hNzHSoaHRNIZN2onFRl5jJjknkhYSQhT2PA
   9oGLCJIostmKEFa93DI1/TTzVL8D9y/aBqlxzrmr8sdli6LVzF8luqTw4
   p+AGt4dng5o+xx9rMN5PtDU9zOlVg4dg8t9XC+i83/s55k9rOEC/jk/Mf
   g==;
IronPort-SDR: tkQnHNuL6LcTGdn5k5K5TwHvpOvnGta9HyYPwSm2rqTv8Vkt9pWJOSTDwbczx3FzyFeX2fuI3o
 uDL0lXV2genYs/FFo2TcLOn1of+drqAFJb6H4v7yB+AHD/BW/JpdaCWGU/6o9m+rOWVqLTl5Wc
 LCFhty3vCLQzLnObQ7N55nKBOY2ENxS2J3hum52lfxRXwmQDb35J7y9850xnbmfDNWAqu0OGWV
 UbBjjw2Rprd0meYw2a+mBYxzjAuP24Es4vE1gWdRLlnQMDUaAnuOOff4CBsS6JuLjybsdZ1VjY
 25U=
X-IronPort-AV: E=Sophos;i="5.78,382,1599494400"; 
   d="scan'208";a="257538314"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 01 Dec 2020 07:55:04 +0800
IronPort-SDR: tPo767bZFPP5QIjecsR7H+DQBLOiHgulQO9708zoEZmqa6K+SYMwR8KuktNXoftr3cxiEr3i+i
 c7n+vZlcyYCn0BlRPeWIZ10k3Ig3OoVGw=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 15:33:08 -0800
IronPort-SDR: S/DWNCkJAmsWP9HMjt6zhWWymEswQpgz3PQxEQMotFSQ9CslH/gYRmF8befQNQyrgoACequL86
 cQKaxQA6u/JQ==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.196])
  by uls-op-cesaip01.wdc.com with ESMTP; 30 Nov 2020 15:48:53 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v3 10/21] dt-binding: mfd: Document canaan,k210-sysctl bindings
Date:   Tue,  1 Dec 2020 08:48:18 +0900
Message-Id: <20201130234829.118298-11-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201130234829.118298-1-damien.lemoal@wdc.com>
References: <20201130234829.118298-1-damien.lemoal@wdc.com>
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
 .../bindings/mfd/canaan,k210-sysctl.yaml      | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml

diff --git a/Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml b/Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
new file mode 100644
index 000000000000..1847def8e8f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
@@ -0,0 +1,116 @@
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
+    allOf:
+      - items:
+          - const: canaan,k210-sysctl
+          - const: syscon
+          - const: simple-mfd
+
+  clocks:
+    description:
+      System controller Advanced Power Bus (APB) interface clock source.
+
+  clock-names:
+    maxItems: 1
+    items:
+      - const: pclk
+
+  reg:
+    maxItems: 1
+    description:
+      Offset and length of the system controller register space.
+
+  reg-io-width:
+    const: 4
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
+      in0: osc {
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
+      reg-io-width = <4>;
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
2.28.0

