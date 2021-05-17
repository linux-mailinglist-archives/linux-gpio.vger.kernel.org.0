Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C38383AA2
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 18:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236000AbhEQRAj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 13:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236776AbhEQRAi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 13:00:38 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 224C0C061756
        for <linux-gpio@vger.kernel.org>; Mon, 17 May 2021 09:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=FNchyohTk64OPI3ZQ9BXTbaOFALE2D5YS8PQlfIT8Q4=; b=X4U46V3SddCapP1G/LJEqHZPcf
        oHPzbd+BJWrmyu2bsUcRYa/9tk5iBIEzkBDOAVkeUNRXvbK2uFmUK+PDClGDCM7Ofpdk4EaPRlYSq
        OOYVKwYFMFAjpL64tMQo1m6olEGNYOOCoPASAMPPfdmaCVFapTfXKgaJRgGCQ/QJdYONh/aG10c7C
        bkj7gGMvgQNjXsO1d1lTkYvQXz194uKhVekru6ZzEbTeVwf+0bwELBzp4r+5csfiHb/SyUldrxphI
        X9ULL6dk2zB+L+xtpaS9qO6LlzN/yBbLivu2I9Ox0S3E+1QxVbfZOWXLXvCHvl/ThGCJTwY0ts7Ed
        7udJAE6A==;
Received: from 164-105-191-90.dyn.estpak.ee ([90.191.105.164] helo=ubuntu)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sandberg@mailfence.com>)
        id 1ligaL-0003AM-4G; Mon, 17 May 2021 19:59:18 +0300
Received: by ubuntu (sSMTP sendmail emulation); Mon, 17 May 2021 19:59:16 +0300
From:   Mauri Sandberg <sandberg@mailfence.com>
To:     sandberg@mailfence.com
Cc:     andy.shevchenko@gmail.com, bgolaszewski@baylibre.com,
        geert+renesas@glider.be, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, drew@beagleboard.org
Subject: [PATCH v3 1/2] dt-bindings: gpio-mux-input: add documentation
Date:   Mon, 17 May 2021 19:58:46 +0300
Message-Id: <20210517165847.206316-2-sandberg@mailfence.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517165847.206316-1-sandberg@mailfence.com>
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210517165847.206316-1-sandberg@mailfence.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.191.105.164
X-SA-Exim-Mail-From: sandberg@mailfence.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add documentation for a general GPIO multiplexer.

Signed-off-by: Mauri Sandberg <sandberg@mailfence.com>
---
v2 -> v3: added a complete example on dual 4-way multiplexer
v1 -> v2: added a little bit more text in the binding documenation
---
 .../bindings/gpio/gpio-mux-input.yaml         | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml b/Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml
new file mode 100644
index 000000000000..a7ff5d1fd6f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-mux-input.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic GPIO input multiplexer
+
+maintainers:
+  - Mauri Sandberg <sandberg@mailfence.com>
+
+description: |
+  A generic GPIO based input multiplexer
+
+  This driver uses a mux-controller to drive the multiplexer and has a single
+  output pin for reading the inputs to the mux.
+
+  For GPIO consumer documentation see gpio.txt.
+
+properties:
+  compatible:
+    enum:
+      - gpio-mux-input
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  pin-gpios:
+    description: |
+      The GPIO pin used as the output from the multiplexer
+
+required:
+  - compatible
+  - gpio-controller
+  - "#gpio-cells"
+  - pin-gpios
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
+        compatible = "gpio-mux-input";
+        mux-controls = <&mux>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        // GPIOs used by this node, mux pin
+        pin-gpios = <&gpio 12 GPIO_ACTIVE_HIGH>;
+    };
+
+    gpio3: key-mux2 {
+        compatible = "gpio-mux-input";
+        mux-controls = <&mux>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        // GPIOs used by this node, mux pin
+        pin-gpios = <&gpio 14 GPIO_ACTIVE_HIGH>;
+    };
+
+...
-- 
2.25.1

