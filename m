Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA937433FA7
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Oct 2021 22:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234089AbhJSUMU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Oct 2021 16:12:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbhJSUMU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Oct 2021 16:12:20 -0400
Received: from mailserv1.kapsi.fi (mailserv1.kapsi.fi [IPv6:2001:67c:1be8::25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25090C06161C;
        Tue, 19 Oct 2021 13:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=y7spF2wtPDMLtULbRbiz9aiJnIDKvevtX6vQLUJscgg=; b=KEbhKbiK9Kfe0tZwqbNPZhXCXY
        9xLS34NzOU0J79t2LpJzdG7GMcppUHXWufW+7FBLiX8vaXPwXzxRu92jNL5ToBiYuqoBHpqNDxZj8
        fuAciDGcGbMvHcuXWrm8mdrnAryGA5gNMMpY4z0eaCQO79hX1swaj+Bs8EJs0qWIcOYUo0nIdbv0a
        Ea46bMtuNr/MpMTuaqmsiZW6qBcsSVgFPwvTMgDchp02Mc+llDTQH9s7GDD9QPEIpphGYOCC0sX0r
        YTV2uYu5IihKgz4piXSi3+zXbZ5xUKdEsbme/A2b9+kAH028T+fQW14456Sxz/5hLTVvzSZpYj66g
        j8e3dcng==;
Received: from 153-106-191-90.dyn.estpak.ee ([90.191.106.153]:63064 helo=localdomain)
        by mailserv1.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <maukka@ext.kapsi.fi>)
        id 1mcvQv-0002y1-7b; Tue, 19 Oct 2021 23:10:02 +0300
Received: by localdomain (sSMTP sendmail emulation); Tue, 19 Oct 2021 23:09:59 +0300
From:   Mauri Sandberg <maukka@ext.kapsi.fi>
To:     sandberg@mailfence.com
Cc:     andy.shevchenko@gmail.com, bgolaszewski@baylibre.com,
        geert+renesas@glider.be, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        drew@beagleboard.org, Mauri Sandberg <maukka@ext.kapsi.fi>,
        Rob Herring <robh@kernel.org>
Date:   Tue, 19 Oct 2021 23:08:30 +0300
Message-Id: <20211019200831.3817-2-maukka@ext.kapsi.fi>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019200831.3817-1-maukka@ext.kapsi.fi>
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20211019200831.3817-1-maukka@ext.kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.191.106.153
X-SA-Exim-Mail-From: maukka@ext.kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mailserv1.kapsi.fi
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        TVD_RCVD_IP autolearn=ham autolearn_force=no version=3.4.2
Subject: [PATCH v7 1/2] dt-bindings: gpio-cascade: add documentation
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add documentation for a general GPIO cascade. It allows building
one-to-many cascades of GPIO lines using multiplexer to choose
the cascaded line.

Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v5 -> v6:
 - added Reviewed-by tag by Rob
v4 -> v5:
 - renamed gpio-mux-input -> gpio-cascade
 - changed vague term 'pin' to 'upstream line'
 - added more verbose description for the module
 - added missing 'mux-controls' entry
 - dropped Tested-by and Reviewed-by due to changes in bindings
v3 -> v4:
 - Changed author email
 - Included Tested-by and Reviewed-by from Drew
v2 -> v3: added a complete example on dual 4-way multiplexer
v1 -> v2: added a little bit more text in the binding documenation
---
 .../bindings/gpio/gpio-cascade.yaml           | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-cascade.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-cascade.yaml b/Documentation/devicetree/bindings/gpio/gpio-cascade.yaml
new file mode 100644
index 000000000000..46248f8e2ba5
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-cascade.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-cascade.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic GPIO cascade
+
+maintainers:
+  - Mauri Sandberg <maukka@ext.kapsi.fi>
+
+description: |
+  A generic GPIO cascade
+
+  This hardware construction cascades (multiplexes) several GPIO lines from
+  one-to-many using a software controlled multiplexer. The most common use
+  case is probably reading several inputs by switching the multiplexer over
+  several input lines, which in practice works well since input lines has
+  high impedance.
+
+  Constructions with multiplexed outputs are also possible using open drain
+  electronics.
+
+  The number of cascaded GPIO lines is limited by the technology used to
+  switch over the cascaded lines. There are readily available dual/triple
+  4-to-1 multiplexers, for example, and others.
+
+  Illustration (pins used to drive the multiplexer are omitted for clarity)
+
+                 /|---- Cascaded GPIO line 0
+  Upstream      | |---- Cascaded GPIO line 1
+  GPIO line ----+ | .
+                | | .
+                 \|---- Cascaded GPIO line n
+
+properties:
+  compatible:
+    enum:
+      - gpio-cascade
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  mux-controls:
+    minItems: 1
+    maxItems: 1
+    description: |
+      The mux controller that will be driving the GPIO cascade.
+
+  upstream-gpios:
+    description: |
+      The GPIO line used as the upstream line will convey the status to/from
+      cascaded GPIO lines. In an input mode, by using this line, it is
+      possible to read the status from selected cascaded GPIO line.
+
+      In an output mode the status of the upstream GPIO will be conveyed to
+      the selected cascaded GPIO line.
+
+required:
+  - compatible
+  - gpio-controller
+  - "#gpio-cells"
+  - mux-controls
+  - upstream-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    mux: mux-controller {
+        compatible = "gpio-mux";
+        #mux-control-cells = <0>;
+
+        mux-gpios = <&gpio 9 GPIO_ACTIVE_HIGH>,
+                    <&gpio 11 GPIO_ACTIVE_HIGH>;
+    };
+
+    gpio2: key-mux1 {
+        compatible = "gpio-cascade";
+        mux-controls = <&mux>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        // GPIOs used by this node, upstream pin
+        upstream-gpios = <&gpio 12 GPIO_ACTIVE_HIGH>;
+    };
+
+    gpio3: key-mux2 {
+        compatible = "gpio-cascade";
+        mux-controls = <&mux>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        // GPIOs used by this node, upstream pin
+        upstream-gpios = <&gpio 14 GPIO_ACTIVE_HIGH>;
+    };
+
+...
-- 
2.25.1

