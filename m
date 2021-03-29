Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5740034D204
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 16:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhC2OAb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 10:00:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbhC2OAY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 10:00:24 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 767EAC061574
        for <linux-gpio@vger.kernel.org>; Mon, 29 Mar 2021 07:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=8kvNkwiPmA8kWOXvjn+b+97isguhKxMWOjhz9Bwgp3w=; b=gBc2Y/x4a0ECCXlkQQhuNx7sl5
        m3unZAgamZEBiPOrWzjZBTYl0NYD2+EXIEc24O8nwvlX7VZ14P3/EjyqnPYGYF58+YRW4Q7zqw5Za
        o83NgC+wQnaeTKprVVOsEPjCPMQPiTV+xEYphXsY684+obzJywIinG5a2Yd8UpVA4g9FoDa5h1iL+
        QLpzccKseIG4VDhvn2LqI8ezk1uk0d4xQG7JnWUy/DyfPfDAH0qlicj/k1sCuO87XRco6FWxexznD
        izfE3nBqZVPmv/ZQBuZ3SYygOUejxH2NM8q97VQhvwjW72sCGIE2pS6QxG/kCJkD3q7Q30TFzovvP
        eZPuQeeQ==;
Received: from 97-173-191-90.dyn.estpak.ee ([90.191.173.97] helo=ubuntu)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sandberg@mailfence.com>)
        id 1lQsRI-0006Xt-1T; Mon, 29 Mar 2021 17:00:21 +0300
Received: by ubuntu (sSMTP sendmail emulation); Mon, 29 Mar 2021 17:00:16 +0300
From:   Mauri Sandberg <sandberg@mailfence.com>
To:     sandberg@mailfence.com
Cc:     andy.shevchenko@gmail.com, bgolaszewski@baylibre.com,
        geert+renesas@glider.be, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, drew@beagleboard.org
Subject: [RFC v2 1/2] dt-bindings: gpio-mux-input: add documentation
Date:   Mon, 29 Mar 2021 16:57:28 +0300
Message-Id: <20210329135729.10523-2-sandberg@mailfence.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210329135729.10523-1-sandberg@mailfence.com>
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210329135729.10523-1-sandberg@mailfence.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.191.173.97
X-SA-Exim-Mail-From: sandberg@mailfence.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add documentation for a general GPIO multiplexer.

Signed-off-by: Mauri Sandberg <sandberg@mailfence.com>
---
 .../bindings/gpio/gpio-mux-input.yaml         | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml b/Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml
new file mode 100644
index 000000000000..5cb5d6f9e30a
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml
@@ -0,0 +1,56 @@
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
+    gpio2: key-mux1 {
+        compatible = "gpio-mux-input";
+        mux-controls = <&mux>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        // GPIOs used by this node, mux output pin
+        pin-gpios = <&gpio 12 GPIO_ACTIVE_HIGH>;
+    };
+
+...
-- 
2.25.1

