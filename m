Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D91237A687
	for <lists+linux-gpio@lfdr.de>; Tue, 11 May 2021 14:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231538AbhEKM0j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 May 2021 08:26:39 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:35904 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231424AbhEKM0i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 May 2021 08:26:38 -0400
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafb:ee01:a5bf:613f:4f5:f348])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id A074E1FCC1F;
        Tue, 11 May 2021 14:25:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1620735930;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RRj/oagag/Ud36oeIh4KW8xT2ij8dPUR8hrHV5ciy/k=;
        b=Zf7Vr0U7KpD304y3aHhgeheQPVMAS0XPiJXrqnj3mQ4yRc5VwzHkVotducAr5dRucYH5nz
        sXudpB03MfifYdvwYCF591CemxB/VOUf9ENds3tE3aemSk9MK0iSjo30xNOuuv0N9PfmBl
        Stg4IEIxcB+PVVC00WOdwuavW58fKkcG7AeAU3TXUN9khVHm8f+jRcnxsViF3DkjY/4Qca
        +ZTqaLyjIeLUo0xWknMJRTRERV73sFVei7/if/VDu5n45W+ny3yexiMNPzhSYAdcv204pX
        WP5f+TD/xuIytxL1QuFQOPjueA4DdEGuOXZjgqCDo05WqtxEUnkYLAa5i22wqA==
From:   Sander Vanheule <sander@svanheule.net>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>
Subject: [PATCH 1/5] dt-bindings: leds: Binding for RTL8231 scan matrix
Date:   Tue, 11 May 2021 14:25:19 +0200
Message-Id: <cb1910ab6ba0795666df1034b47221f8bac160f9.1620735871.git.sander@svanheule.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620735871.git.sander@svanheule.net>
References: <cover.1620735871.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a binding description for the Realtek RTL8231's LED support, which
consists of up to 88 LEDs arranged in a number of scanning matrices.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 .../bindings/leds/realtek,rtl8231-leds.yaml   | 159 ++++++++++++++++++
 1 file changed, 159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml

diff --git a/Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml b/Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
new file mode 100644
index 000000000000..aba2b55fb9c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
@@ -0,0 +1,159 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/realtek,rtl8231-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RTL8231 LED scan matrix.
+
+maintainers:
+  - Sander Vanheule <sander@svanheule.net>
+
+description: |
+  The RTL8231 has support for driving a number of LED matrices, by scanning
+  over the LEDs pins, alternatingly lighting different columns and/or rows.
+
+  In single color scan mode, 88 LEDs are supported. These are grouped into
+  three output matrices:
+    - Group A of 6×6 single color LEDs. Rows and columns are driven by GPIO
+      pins 0-11.
+               L0[n]    L1[n]    L2[n]    L0[n+6]  L1[n+6]  L2[n+6]
+                |        |        |        |        |        |
+       P0/P6  --<--------<--------<--------<--------<--------< (3)
+                |        |        |        |        |        |
+       P1/P7  --<--------<--------<--------<--------<--------< (4)
+                |        |        |        |        |        |
+       P2/P8  --<--------<--------<--------<--------<--------< (5)
+                |        |        |        |        |        |
+       P3/P9  --<--------<--------<--------<--------<--------< (6)
+                |        |        |        |        |        |
+       P4/P10 --<--------<--------<--------<--------<--------< (7)
+                |        |        |        |        |        |
+       P5/P11 --<--------<--------<--------<--------<--------< (8)
+               (0)      (1)      (2)      (9)     (10)     (11)
+    - Group B of 6×6 single color LEDs. Rows and columns are driven by GPIO
+      pins 12-23.
+               L0[n]    L1[n]    L2[n]    L0[n+6]  L1[n+6]  L2[n+6]
+                |        |        |        |        |        |
+      P12/P18 --<--------<--------<--------<--------<--------< (15)
+                |        |        |        |        |        |
+      P13/P19 --<--------<--------<--------<--------<--------< (16)
+                |        |        |        |        |        |
+      P14/P20 --<--------<--------<--------<--------<--------< (17)
+                |        |        |        |        |        |
+      P15/P21 --<--------<--------<--------<--------<--------< (18)
+                |        |        |        |        |        |
+      P16/P22 --<--------<--------<--------<--------<--------< (19)
+                |        |        |        |        |        |
+      P17/P23 --<--------<--------<--------<--------<--------< (20)
+              (12)     (13)     (14)    (21)      (22)     (23)
+    - Group C of 8 pairs of anti-parallel (or bi-color) LEDs. LED selection is
+      provided by GPIO pins 24-27 and 29-32, polarity selection by GPIO 28.
+               P24     P25  ...  P30     P31
+                |       |         |       |
+      LED POL --X-------X---/\/---X-------X (28)
+              (24)    (25)  ... (31)    (32)
+
+  In bi-color scan mode, 72 LEDs are supported. These are grouped into four
+  output matrices:
+    - Group A of 12 pairs of anti-parallel LEDs. LED selection is provided
+      by GPIO pins 0-11, polarity selection by GPIO 12.
+    - Group B of 6 pairs of anti-parallel LEDs. LED selection is provided
+      by GPIO pins 23-28, polarity selection by GPIO 21.
+    - Group C of 6 pairs of anti-parallel LEDs. LED selection is provided
+      by GPIO pins 29-34, polarity selection by GPIO 22.
+    - Group of 4×6 single color LEDs. Rows are driven by GPIO pins 15-20,
+      columns by GPIO pins 13-14 and 21-22 (shared with groups B and C).
+          P[n]     P[n+6]   P[n+12]  P[n+18]
+            |        |        |        |
+       +0 --<--------<--------<--------< (15)
+            |        |        |        |
+       +1 --<--------<--------<--------< (16)
+            |        |        |        |
+       +2 --<--------<--------<--------< (17)
+            |        |        |        |
+       +3 --<--------<--------<--------< (18)
+            |        |        |        |
+       +4 --<--------<--------<--------< (19)
+            |        |        |        |
+       +6 --<--------<--------<--------< (20)
+          (13)     (14)     (21)     (22)
+
+  This node must always be a child of a 'realtek,rtl8231' node.
+
+properties:
+  $nodename:
+    const: leds
+
+  compatible:
+    const: realtek,rtl8231-leds
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 0
+
+  realtek,led-scan-mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      Specify the scanning mode the chip should run in. See general description
+      for how the scanning matrices are wired up.
+    enum: ["single-color", "bi-color"]
+
+patternProperties:
+  "^led@[0-9]+,[0-2]$":
+    description: |
+      LEDs are addressed by their port index and led index. Ports 0-23 always
+      support three LEDs. Additionally, but only when used in single color scan
+      mode, ports 24-31 support two LEDs.
+    type: object
+
+    properties:
+      reg:
+        maxItems: 1
+
+    allOf:
+      - $ref: ../leds/common.yaml#
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+  - realtek,led-scan-mode
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+    leds {
+        compatible = "realtek,rtl8231-leds";
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        realtek,led-scan-mode = "single-color";
+
+        led@0,0 {
+            reg = <0 0>;
+            color = <LED_COLOR_ID_GREEN>;
+            function = LED_FUNCTION_LAN;
+            function-enumerator = <0>;
+        };
+
+        led@0,1 {
+            reg = <0 1>;
+            color = <LED_COLOR_ID_AMBER>;
+            function = LED_FUNCTION_LAN;
+            function-enumerator = <0>;
+        };
+
+        led@0,2 {
+            reg = <0 2>;
+            color = <LED_COLOR_ID_GREEN>;
+            function = LED_FUNCTION_STATUS;
+        };
+    };
-- 
2.31.1

