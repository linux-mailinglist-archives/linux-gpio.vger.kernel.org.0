Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 357FE38F195
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 18:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233550AbhEXQbw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 12:31:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233401AbhEXQbi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 12:31:38 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3DC0C06138B
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 09:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=FNchyohTk64OPI3ZQ9BXTbaOFALE2D5YS8PQlfIT8Q4=; b=phFSGRWYYk5RAYehzI+oFJ6ACn
        9ORUV2yQivMh+O/un7FjjkkCCnQ0GEyDHEZ77xH/z0NG/4dg+ZFAThJNqcWXGJAC5cHrUvcoI/O7s
        CSjkHpfy6sNcZt0EtTFsr6pYiKXajZjbMmltn5cE6EJp+/sUKSI5d+PmUJfBfZ5v0YavjKmrS/eOD
        lgdgjNz2zvYXkKhMgS2bz3m7DDbN8VxkLMlGzGvm49ltHEcNvIMmwoonh4oadysqt+8KbBuV8T0M1
        c+k844mjQ6sIRWhwmp+a754+L/tXSZuxLBduxqgIwUCLSzPHalGhZ8j1bynRNn/aTbY2q3h2tD1fo
        BF5cchkw==;
Received: from 164-105-191-90.dyn.estpak.ee ([90.191.105.164] helo=ubuntu)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sandberg@mailfence.com>)
        id 1llDSW-0005nU-7z; Mon, 24 May 2021 19:29:41 +0300
Received: by ubuntu (sSMTP sendmail emulation); Mon, 24 May 2021 19:29:36 +0300
From:   Mauri Sandberg <sandberg@mailfence.com>
To:     linux-gpio@vger.kernel.org
Cc:     bgolaszewski@baylibre.com, Mauri Sandberg <sandberg@mailfence.com>
Subject: [PATCH v3 1/2] dt-bindings: gpio-mux-input: add documentation
Date:   Mon, 24 May 2021 19:29:05 +0300
Message-Id: <20210524162906.30784-2-sandberg@mailfence.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524162906.30784-1-sandberg@mailfence.com>
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210524162906.30784-1-sandberg@mailfence.com>
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

