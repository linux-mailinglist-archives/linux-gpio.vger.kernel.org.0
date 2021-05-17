Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8BB383D57
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 21:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233581AbhEQTaC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 15:30:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233719AbhEQT36 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 15:29:58 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92F32C061756
        for <linux-gpio@vger.kernel.org>; Mon, 17 May 2021 12:28:41 -0700 (PDT)
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafb:ee01:404a:340a:91cb:c07b])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id EE6041FFBF9;
        Mon, 17 May 2021 21:28:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621279720;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RRj/oagag/Ud36oeIh4KW8xT2ij8dPUR8hrHV5ciy/k=;
        b=3e8ROXZ582pG+TgEcypvruYZAfA162ZpuzGb3+eL9eJZcFQAYd4//5+Weo5hRtWygjUZ1r
        E1vwXuuHDisK60Jmt3onkYkPvUEoMBRoRNwMIzIcmFptM2tkg2GxsW8yTPjaIDt9ziO19u
        zF4SJdI8NFirTbgM4JfEHiHdB3hA/+9F/YYi4+4Upx+THQoTn7m7AWuZ9pbse84bRKpDtG
        kt08298//QthKXRHfTrTRyNMA5WNjMe9mfoz7LkJNjXkpIYyHPj4lcbLgmRKUoX7g9bJjD
        rM1AZPShgnn46kQ2+D0aSWVuKCXLJiHZ8HR5kfDidQF0QtLIYIvoaHvbTGCXkQ==
From:   Sander Vanheule <sander@svanheule.net>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v2 3/7] dt-bindings: leds: Binding for RTL8231 scan matrix
Date:   Mon, 17 May 2021 21:28:05 +0200
Message-Id: <8bf1840e98d34884c266c121cd8736e11f953885.1621279162.git.sander@svanheule.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621279162.git.sander@svanheule.net>
References: <cover.1621279162.git.sander@svanheule.net>
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

