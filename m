Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EAE66112D6
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Oct 2022 15:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231202AbiJ1NcZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Oct 2022 09:32:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230478AbiJ1NcI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Oct 2022 09:32:08 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78D6D1D4635;
        Fri, 28 Oct 2022 06:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=miJXfwb6SpLnRG/te/kh+sEEvhMBX9xEEL1aGW0nD/o=; b=AR00mbH2kldZHLQqUYrm1ZqnaO
        w+OvEHP7sab9GhsSa0xko+bMQieSLDBjOYnwJ95br6mrrE8p9tLYEYpfF4dP995S35T5Wy3MvemLx
        vlTkAVgYCJYv64iqVECnFC4+34snVooz8DYPm/HjwZZc7NB5jvQbcK7q9rqXcEkiua3MzzJ2uiPOr
        2jGWi/KNS+fn8vxNlG+5UFp8BKJunHYDiapNjxv+85QWzSskbtdWdRJSGChFK8G3Tru3WiKXuwxQ0
        HT2b8VD3bfB4o+4d4eTqbhfwexSHm/Xgoz2m9IqqF+dRJavAF85u1ds8a4NdvOW8z01oCY1f7uYCo
        /F/qzUZw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60582 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1ooPSt-0008HG-CA; Fri, 28 Oct 2022 14:32:03 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1ooPSs-00Hb5D-PE; Fri, 28 Oct 2022 14:32:02 +0100
In-Reply-To: <Y1vZprz7t1WRW3bz@shell.armlinux.org.uk>
References: <Y1vZprz7t1WRW3bz@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: gpio: add binding for the GPIO block for
 Apple Mac SMC
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1ooPSs-00Hb5D-PE@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Fri, 28 Oct 2022 14:32:02 +0100
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the DT binding for the Apple Mac System Management Controller GPIOs.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../devicetree/bindings/gpio/gpio-macsmc.yaml | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
new file mode 100644
index 000000000000..2bb8faa2c08c
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-macsmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple Mac System Management Controller GPIO
+
+maintainers:
+  - Hector Martin <marcan@marcan.st>
+
+description:
+  This describes the binding for the Apple Mac System Management Controller
+  GPIO block.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,t8103-smc-gpio
+      - const: apple,smc-gpio
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+required:
+  - compatible
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio {
+        compatible = "apple,t8103-smc-gpio", "apple,smc-gpio";
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
-- 
2.30.2

