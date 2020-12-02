Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B83BA2CB360
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Dec 2020 04:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbgLBD2B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 22:28:01 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:25514 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727975AbgLBD2B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 22:28:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606879681; x=1638415681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4U4b/nqfPlar1rNpNlwWEX+TNC6mHk8oUWWOJcFYm1M=;
  b=kGBGVswgh3WWnmIg5LAIi2oMMK7qBZDEneElDsHeEeQ0vVNPISXKmkk7
   YdN0QXTjrcxqls4q4kK2z91QVVs21phU8Qus4DZPC9jp6goSayCl0YAuO
   hABMjwp4fJHAttcrgQ8f9rA9NP4oGR6xc3P4w9rNNEKlh17QnxoPKXbwe
   /24HY4ByJxHusfIv+3+i1B7Uqi7nhV2xKfVLcQxvb3pgo30wVcOjTcM44
   jSnrh6dlvwKdmpJSfzknSqliHytkjTe2q83bYiw31/A7GX5eYJb5/S5Sw
   UqZUQ8ivWKHFn2TDYQrjECXiSaudsPOV8x8iq/QvYqGndk4RC1rkr0EFX
   w==;
IronPort-SDR: 5dEXX5ie5P8KHA93Sq/0A15fFerVUoi4wRXvUNsO+J1o9eBI+3DQ8DDo0fvzXpmbsnsYYtiEwU
 jsWmot3HDDw238OPtoMIunwzfjvFiLl0xEpdd+2WgVbOWPuorxKUIPnzXotRvlFdMv4AvxtZl8
 F5TKKAPVaGemQjVokszqTteKxSiAChsDXj0SCxIcOfxikOsJqEo4e/lXgeGMrd/3LPGaMOpXlu
 xHAwBYslPckQQwX2VQDAdCYKnMIUOQqeRsdF002N0Iu4vlK9k0Lkhg7TmnLOxXIoLxDB3nUrwK
 5KY=
X-IronPort-AV: E=Sophos;i="5.78,385,1599494400"; 
   d="scan'208";a="155183553"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 02 Dec 2020 11:25:26 +0800
IronPort-SDR: ARxNeLS4OxGKALagcR8ccSwEnTxZ9vJUPJtrYlsHhtasuXsJyVxyIInfpDW0hlwnLzQnRzWGod
 R0c/Tj+4txONSHV59DUSiYJqeDm6ovnN0=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 19:11:00 -0800
IronPort-SDR: jClx1gkeTuhWSHnS7qdGvykLA5KUahbqpfNM8S+uVO4FKtlbbwu8SQh+scqHKpInkvIpWgqMuJ
 WS1JYJrbaw4g==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.196])
  by uls-op-cesaip02.wdc.com with ESMTP; 01 Dec 2020 19:25:24 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v4 10/21] dt-binding: mfd: Document canaan,k210-sysctl bindings
Date:   Wed,  2 Dec 2020 12:24:49 +0900
Message-Id: <20201202032500.206346-11-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201202032500.206346-1-damien.lemoal@wdc.com>
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
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

