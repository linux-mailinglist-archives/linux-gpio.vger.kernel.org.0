Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D52D3AF1D9
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jun 2021 19:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbhFUR1p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Jun 2021 13:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231182AbhFUR1p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Jun 2021 13:27:45 -0400
Received: from mailserv1.kapsi.fi (mailserv1.kapsi.fi [IPv6:2001:67c:1be8::25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 413FBC061756;
        Mon, 21 Jun 2021 10:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Mz2pgiZJH7zbjl6pJ6I5G0OAz5+wZWZ9hjog7cvDxdA=; b=f16uX+og9qgthRVOzye9ZpeKoy
        rgsUsg2LjkwL8tzoIGOLfFe6vT4+EZREMA7cERDpGTrY4CT91ZOVoinGh7/8Xw7CpZDPwPXjNG1L2
        ySupAgOVF4mAWm4uUs8Jm/LPbLDrJ/bzAPt9xcU4WcGWDF8/tqsEP65Mv798Ijuouq6eS6TssRaaA
        jHALCTLD26dlFeyPhbeZsagg3DEaizTI3l9/f27fKjHJU9d9NlbPxUNl6BE/Mvvf+W6vEQ1MzXvrN
        H+RJLLNLxwIIY9FdDow4UEo5ObfQfpmkrjHbzLUWT0BFNVp1GrKI3gxh9p1NFX9sFEEHIHW4QaE/y
        YwRvPe6g==;
Received: from 164-105-191-90.dyn.estpak.ee ([90.191.105.164]:49246 helo=localdomain)
        by mailserv1.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <maukka@ext.kapsi.fi>)
        id 1lvNfn-0002Co-DC; Mon, 21 Jun 2021 20:25:24 +0300
Received: by localdomain (sSMTP sendmail emulation); Mon, 21 Jun 2021 20:25:23 +0300
From:   Mauri Sandberg <maukka@ext.kapsi.fi>
To:     sandberg@mailfence.com
Cc:     andy.shevchenko@gmail.com, bgolaszewski@baylibre.com,
        geert+renesas@glider.be, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        drew@beagleboard.org, Mauri Sandberg <maukka@ext.kapsi.fi>
Date:   Mon, 21 Jun 2021 20:20:52 +0300
Message-Id: <20210621172053.107045-2-maukka@ext.kapsi.fi>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621172053.107045-1-maukka@ext.kapsi.fi>
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210621172053.107045-1-maukka@ext.kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.191.105.164
X-SA-Exim-Mail-From: maukka@ext.kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mailserv1.kapsi.fi
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        TVD_RCVD_IP,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.2
Subject: [PATCH v5 1/2] dt-bindings: gpio-cascade: add documentation
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add documentation for a general GPIO cascade. It allows building
one-to-many cascades of GPIO lines using multiplexer to choose
the cascaded line.

Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
---
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

