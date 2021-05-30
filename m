Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 410E239521C
	for <lists+linux-gpio@lfdr.de>; Sun, 30 May 2021 18:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbhE3Qv4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 May 2021 12:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbhE3Qvx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 May 2021 12:51:53 -0400
Received: from mailserv1.kapsi.fi (mailserv1.kapsi.fi [IPv6:2001:67c:1be8::25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63563C061761;
        Sun, 30 May 2021 09:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=sqayVbWJxMwOJbb2ISlKd5CFS46e4OV067XCFUWNdfs=; b=xCgjQ9j1j6Ds+n9uOzWGSaW1cj
        F4yXNfwBo04FGlpPMTLggyiy7GzHpWmLnlM7vhRf/v2PSBP9QmZMxF15SRkGY4CwInqftogSIH1Mf
        Xf6OaR2GNImzW7lSVjfmqTGdm+4rvWhnj6jqjlSlq11W/NfWP4nJZOG19+tbCPYp2o+vYXCb3ZRuZ
        hT+fsB65yBMQMXBYr59wy3lD34R/Z9Stg3NNEku7fEJ+2BdmObDgFiRbFDX3wZ49w5EPpzRBpGtg9
        HjHbe+EU/WgHuiqqf3IqJpJv2jU5UAZOYgM34ObKkX++sprB5V0TiCO7h9yDkSl9c5ZyNEHVm9IlX
        iiEuG9ig==;
Received: from 164-105-191-90.dyn.estpak.ee ([90.191.105.164]:50316 helo=localdomain)
        by mailserv1.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <maukka@ext.kapsi.fi>)
        id 1lnO6X-0001fO-6h; Sun, 30 May 2021 19:15:58 +0300
Received: by localdomain (sSMTP sendmail emulation); Sun, 30 May 2021 19:15:53 +0300
From:   Mauri Sandberg <maukka@ext.kapsi.fi>
To:     sandberg@mailfence.com
Cc:     andy.shevchenko@gmail.com, bgolaszewski@baylibre.com,
        geert+renesas@glider.be, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        drew@beagleboard.org, Mauri Sandberg <maukka@ext.kapsi.fi>
Date:   Sun, 30 May 2021 19:13:32 +0300
Message-Id: <20210530161333.3996-2-maukka@ext.kapsi.fi>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210530161333.3996-1-maukka@ext.kapsi.fi>
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210530161333.3996-1-maukka@ext.kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.191.105.164
X-SA-Exim-Mail-From: maukka@ext.kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mailserv1.kapsi.fi
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        TVD_RCVD_IP,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.2
Subject: [PATCH v4 1/2] dt-bindings: gpio-mux-input: add documentation
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add documentation for a general GPIO multiplexer.

Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
Tested-by: Drew Fustini <drew@beagleboard.org>
Reviewed-by: Drew Fustini <drew@beagleboard.org>
---
v3 -> v4:
 - Changed author email
 - Included Tested-by and Reviewed-by from Drew
v2 -> v3: added a complete example on dual 4-way multiplexer
v1 -> v2: added a little bit more text in the binding documenation
---
 .../bindings/gpio/gpio-mux-input.yaml         | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml b/Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml
new file mode 100644
index 000000000000..1ca4c3c8d64b
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
+  - Mauri Sandberg <maukka@ext.kapsi.fi>
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

