Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1A5D2D8D84
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 14:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407022AbgLMNyL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 08:54:11 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:1980 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406995AbgLMNyK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 08:54:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607867650; x=1639403650;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MQK/vb8NBPxRh5mHQhMV5bOBm1Zq0AgJmS+3j2J54wg=;
  b=g1l6ptiQyOdZc7V0M0VGm0RyzwfBR+G56WFHyxSE4+G7Z/6N1lELg8mv
   zRVQbbPaifusRDdNeHIYYqkYJhkCpV3qrYFmJXIg3PUQohCTmDALoiyew
   MznKaoZAEuC9pQS6sOZxl5+Pna2P+9ZUXz+3Qd8ODAC2Ji6qcJ8Yc0iC4
   uXBxSktifuEyD/z8WcmD8iRw9NH544eQqX0S7IoJmJriVIG8Ck2sfavjH
   PeDbsTEeruxRrFIn85gV1v1cDi6aCTGGGWe0s5fLKKSq6cM6JIKj63Qmr
   LqAPx5fSY5AtWnqqQ9785lo+WWd255Q4G7opm7dzdIbtC1/JtP+3ijACG
   Q==;
IronPort-SDR: /ZBMnvOJR5JlwnWQQ9PL4Gln/6pypMkpQxruMRVRT+W7nAkf3jIDgPgei5RIJQV7WflvzN6O14
 3IQ047wHrfpP2nBDDwE43g0MCbToEp45yJVByJhBH4zAulIhLd1O6SyhFjXC2VwvLj+eo+xKw1
 NbppVuHl/ZHc8SSgPKAha5JSdGHt0O+IjweZciymGGCwFWYxnMAzt/ZCxz1NrswI/X9uWhqUTx
 oJwdjg3JT9yWVeTGrP1YIUn807MJDWcQre1Ik5hRWGnr/R5PkITQMlVxT9xMKDjwiqkzAWVCtb
 kUo=
X-IronPort-AV: E=Sophos;i="5.78,416,1599494400"; 
   d="scan'208";a="159494616"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 21:51:25 +0800
IronPort-SDR: k1h7mi6MDTeKA9HQsg/P0lJau8ueBzOhAX/M+79WDlffG/DCft+R3ip4Hlc/ettxUT02YR2zgp
 0oVUH7QHb13DlLHkL0TTcW97wZmvCHUosRa56CwiBszBkNfnZ8jmoq5IOJFb73h1jNMylRq3II
 9mLsN5/6DCNYoBIUzHW4YfXNUVq2yZn7gkySoFS7e2zmbhJrNUhSgE2GsN4gvN1AYroJ2L1q4g
 ge2VZyjFsuQ5YBdibCWZ0ELB43LIV4Cieco5ohKY6NCRlqi7v6vKRYsQVF3y56h50QvT0v6Q4Q
 eosGuqehiOpHakZAPC5+ZH/d
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 05:35:10 -0800
IronPort-SDR: cnx2i2INf7rCAeZ3gRVqQDnghQDFS5YLOWXS9TOpQcKvylpvV8Xiqo4hG94JjeT96CCviVO6Az
 Mor35TtgLQVDdNj6NyKwNG7gC/4hhadp7ZIgDh4I0b+SHuCPoqxGAYWO0DkWqk9ml8OjxuusYY
 C3ewyCTHhllC/Jx/gZ1qFpNO6pas8xMlig9hJBt8poh891D7T0pcM1pZoqLlvSjrE2oMBsY+Yg
 TsFBCC6OHRHkhqByk1TUamY3ODhumbX1HOrxZxIDDsj48gf0UggTOZK/Zbz8MU96k9ClD+ZhmB
 4uA=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.197])
  by uls-op-cesaip01.wdc.com with ESMTP; 13 Dec 2020 05:51:23 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v10 12/23] dt-binding: mfd: Document canaan,k210-sysctl bindings
Date:   Sun, 13 Dec 2020 22:50:45 +0900
Message-Id: <20201213135056.24446-13-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213135056.24446-1-damien.lemoal@wdc.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
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

