Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 686393491F6
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 13:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbhCYM3e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 08:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230155AbhCYM3W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Mar 2021 08:29:22 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C3EC06174A
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 05:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=m2kaDDOf+6H3SMKnNi1wsR8XKbDRWWv9yzDVx2W/C6E=; b=CBHUp/OwLeYSBy9XH2moe1tzsW
        hQQqhFTyG/CXO+rUmyemNM+D/AGDDnhewjIBwEBwvBL4aHeTOz7xumQBR6PHuX7qXWBSGAP0Hve1E
        sp4Xj9D9W1H8ARZKMPjkvfX1NoeY9xSY9SafaD5WLBTHVYrPuESuILbvHXgGG0abcWmYTKduowPB7
        PSiUgekq3xSfa2nl+JgTICJQ+JjOypks45SPxFQo+co5CZOubYgSiPfip5BL36iHTXC0B0yqrO8dA
        dHiU99ib0ZoVywvoSqbvP2haIaqkLuaM4aUPCGfrbaK6t4VGCLTGn2l1dcNj87OTQzil2MlY+WAaT
        bfIr686g==;
Received: from 97-173-191-90.dyn.estpak.ee ([90.191.173.97] helo=ubuntu)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sandberg@mailfence.com>)
        id 1lPP71-00035U-Mp; Thu, 25 Mar 2021 14:29:20 +0200
Received: by ubuntu (sSMTP sendmail emulation); Thu, 25 Mar 2021 14:29:17 +0200
From:   Mauri Sandberg <sandberg@mailfence.com>
To:     linux-gpio@vger.kernel.org
Cc:     andy.shevchenko@gmail.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, geert+renesas@glider.be,
        Mauri Sandberg <sandberg@mailfence.com>
Subject: [RFC gpio/for-next 1/2] dt-bindings: gpio-mux-input: add documentation
Date:   Thu, 25 Mar 2021 14:28:31 +0200
Message-Id: <20210325122832.119147-2-sandberg@mailfence.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210325122832.119147-1-sandberg@mailfence.com>
References: <20210325122832.119147-1-sandberg@mailfence.com>
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
 .../bindings/gpio/gpio-mux-input.yaml         | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml b/Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml
new file mode 100644
index 000000000000..f436000fe138
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-mux-input.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO input multiplexer
+
+maintainers:
+  - Mauri Sandberg <sandberg@mailfence.com>
+
+description: |
+  A generic GPIO based input multiplexer
+
+  This driver uses mux-controller to drive the multiplexer.
+
+  For consumer use see gpio.txt.
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
+      The GPIO pin used the output from the multiplexer
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
+        pin-gpios = <&gpio 12 GPIO_ACTIVE_HIGH>;	/* 1y */
+    };
+
+...
-- 
2.25.1

