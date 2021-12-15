Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1D624763B1
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Dec 2021 21:48:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231340AbhLOUsG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Dec 2021 15:48:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbhLOUsF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Dec 2021 15:48:05 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B41DC061574;
        Wed, 15 Dec 2021 12:48:05 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id p8so35215907ljo.5;
        Wed, 15 Dec 2021 12:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Sv2B+5LPVRxFC2WOTdPR91DA2GrMS9+H47ed1svDv0=;
        b=dmxm4xP3qmwHsORfXuABZWftnVGDKLEHjQBd5v0QqGAffsHdrWfBlgA3+W5Nv1tV61
         +Jorv1Xe5GG7tmDoIjGe5tb+ov0bMP0KXbKxX1hWZEBSar5DLmOBAG9aBWCISbZq3Lgg
         vPIAsaRlyntLi1+hSjXEg9Ryk/WCwszwY80IMae+SoPxFXgiPoP2bBsksvD/Y+ThJC8e
         ospjjBmzc2pQHFKN5pHaBua4dQSl8YmfGKa6XXHE5DP4VPMrors9I6aX7LC4Jle6W52O
         /jdQHxTjlWkvOEHHjYEB8GD1PAuXQ3vRCOnviN2ZlhMn5LNx1tne4Bp9RbbGn7Nmli4R
         qNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Sv2B+5LPVRxFC2WOTdPR91DA2GrMS9+H47ed1svDv0=;
        b=Yak8WrxUyVjtCjsi5y0bN+8imvUMEhi4bC0YRsAd0UTCdm2VwEK+ay7saJWfNxvl9j
         udwjFwRQ/t+JIg8G0Of6HgFEOQrs2QcR0YQgonh7g6uCJ96NOAgCb7qC1EHgISvr080w
         Zc2TtI5JtTyuxed4rNgrU2K4tprI9kNrqS0PYFL+vHTvSsviXWDd7TK20+dREGHDWoaq
         SNWtuqoEbp6G8oMir4vqqWih7nVHbLR8WFfT/to4IsDgaXukzi6lx6mopw1l0pQexR8M
         zYkUWZpBZ99JrY+sa0xd1S6wYCWsnYQYZK7flzcQK0hAZO0dfz1w92Zh+7btkS3dOUgv
         iZpQ==
X-Gm-Message-State: AOAM532DGTGoo63Wm0HX5q5A26jW3Nk7/NkmDEGetwuo0cfFAmTynd6A
        xNZVOyBAELS9yFlpVFlXJKye8jlx/Oc=
X-Google-Smtp-Source: ABdhPJxcRrpLNo0b5+ALV62AUSn3RLrGw4/F6vpQ1zAnMALmQaBPr8O9ZiqYvUOWlwHOPE1vfcCUFg==
X-Received: by 2002:a2e:9698:: with SMTP id q24mr12071102lji.246.1639601283391;
        Wed, 15 Dec 2021 12:48:03 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id k11sm488312lfj.100.2021.12.15.12.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 12:48:02 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] dt-bindings: pinctrl: Add binding for BCM4908 pinctrl
Date:   Wed, 15 Dec 2021 21:47:52 +0100
Message-Id: <20211215204753.5956-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

It's hardware block that is part of every SoC from BCM4908 family.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../pinctrl/brcm,bcm4908-pinctrl.yaml         | 72 +++++++++++++++++++
 MAINTAINERS                                   |  7 ++
 2 files changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.yaml
new file mode 100644
index 000000000000..175a992f15e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/brcm,bcm4908-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM4908 pin controller
+
+maintainers:
+  - Rafał Miłecki <rafal@milecki.pl>
+
+description:
+  Binding for pin controller present on BCM4908 family SoCs.
+
+properties:
+  compatible:
+    const: brcm,bcm4908-pinctrl
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '-pins$':
+    type: object
+    $ref: pinmux-node.yaml#
+
+    properties:
+      function:
+        enum: [ led_0, led_1, led_2, led_3, led_4, led_5, led_6, led_7, led_8,
+                led_9, led_10, led_11, led_12, led_13, led_14, led_15, led_16,
+                led_17, led_18, led_19, led_20, led_21, led_22, led_23, led_24,
+                led_25, led_26, led_27, led_28, led_29, led_30, led_31,
+                hs_uart, i2c, i2s, nand_ctrl, nand_data, emmc_ctrl, usb0_pwr,
+                usb1_pwr ]
+
+      groups:
+        minItems: 1
+        maxItems: 2
+        items:
+          enum: [ led_0_grp_a, led_1_grp_a, led_2_grp_a, led_3_grp_a,
+                  led_4_grp_a, led_5_grp_a, led_6_grp_a, led_7_grp_a,
+                  led_8_grp_a, led_9_grp_a, led_10_grp_a, led_10_grp_b,
+                  led_11_grp_a, led_11_grp_b, led_12_grp_a, led_12_grp_b,
+                  led_13_grp_a, led_13_grp_b, led_14_grp_a, led_15_grp_a,
+                  led_16_grp_a, led_17_grp_a, led_18_grp_a, led_19_grp_a,
+                  led_20_grp_a, led_21_grp_a, led_22_grp_a, led_23_grp_a,
+                  led_24_grp_a, led_25_grp_a, led_26_grp_a, led_27_grp_a,
+                  led_28_grp_a, led_29_grp_a, led_30_grp_a, led_31_grp_a,
+                  led_31_grp_b, hs_uart_grp, i2c_grp_a, i2c_grp_b, i2s_grp,
+                  nand_ctrl_grp, nand_data_grp, emmc_ctrl_grp, usb0_pwr_grp,
+                  usb1_pwr_grp ]
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pinctrl@ff800560 {
+        compatible = "brcm,bcm4908-pinctrl";
+        reg = <0xff800560 0x10>;
+
+        led_0-a-pins {
+            function = "led_0";
+            groups = "led_0_grp_a";
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 52653c83de69..949cff4ee1e4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3666,6 +3666,13 @@ F:	Documentation/devicetree/bindings/net/brcm,bcm4908-enet.yaml
 F:	drivers/net/ethernet/broadcom/bcm4908_enet.*
 F:	drivers/net/ethernet/broadcom/unimac.h
 
+BROADCOM BCM4908 PINMUX DRIVER
+M:	Rafał Miłecki <rafal@milecki.pl>
+M:	bcm-kernel-feedback-list@broadcom.com
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.yaml
+
 BROADCOM BCM5301X ARM ARCHITECTURE
 M:	Hauke Mehrtens <hauke@hauke-m.de>
 M:	Rafał Miłecki <zajec5@gmail.com>
-- 
2.31.1

