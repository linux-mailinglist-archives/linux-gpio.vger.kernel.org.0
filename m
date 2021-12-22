Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C62BE47D087
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Dec 2021 12:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236602AbhLVLLS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Dec 2021 06:11:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244410AbhLVLLS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Dec 2021 06:11:18 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98466C061574;
        Wed, 22 Dec 2021 03:11:17 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id bt1so4521033lfb.13;
        Wed, 22 Dec 2021 03:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZH3DJ4O6RX9KRTBXPgYvqJ8q3R6fJTAgZ/pUJfzbC3U=;
        b=eK1MicFLVDuoJKdGFVyBF/FHBK8kh9neCky0dOv1W+Gsu1ag/lDNWNrfGPNU8/AOIb
         CRF+5U8TjgwQuyek64dhOIqv42GhhqxHO4wKp6AXkbGajZoWj+NhDr68MTMuKB/kZ/9+
         TXMXEmnSCRpigo4klH0xbnoVpmrtLVQrGqvC9mvPEKM+OSHb46mVUGnkJbCnfHf8MU2w
         vChq8nqDy6h3a8KJPBWAKAoEzYFOAK+I2HrwCB58M6Nc0OEMvMZoJUXPyFb7j53BND6r
         bWVWyOdD8E5vnuYOhMNJcNeji4tzS89L5wAlBFtEOVLu2jYlIk2Mgo+V+p9HQRiWS+dO
         fduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZH3DJ4O6RX9KRTBXPgYvqJ8q3R6fJTAgZ/pUJfzbC3U=;
        b=DBd/O1pLky5WNftokVLSRTUsyhEB7Ju1/bDzFlHby+1JQEbZ8b8XNKnWfSV2F4jhIf
         pjDkwCG7e/m16XrHGdUmN/p+Po85IpLuvLqBjNTv+Y0LopjF4wkBLKLmzS8XU9MuwF7L
         eVstbvwqITAD5o6yR0YP5Xpfo5lRcZE+iblDXn2CzSQH5luuLpAsHvVoB/0VOUFTcv0Z
         rGXDnaAY+lJCwXaDA0a9o8PFmSAmEoyM1TxWe+muNh0qniNxvTvyizOMoUiTwLkBO7YI
         SPFURVLMWYRgrQsvM7oPxaChGY35/vJ0XnN8g+W/yV7Spws8w42xUfZgVc6P9QIlkRVv
         T0iQ==
X-Gm-Message-State: AOAM531jhqvWzv8pci0lKYeSxgcm6tX41z733AKi4YNRwyCkG5JuzsSq
        nG9/9GNa8WdhGZw9ITTbHzI=
X-Google-Smtp-Source: ABdhPJwfLTkDO/MVkiRUFEHCkCwnCOaKAoPrEb1ZSjUvbaFePBWi9rlIeSjhLVnKknvA+6nfLLdlzQ==
X-Received: by 2002:a19:a402:: with SMTP id q2mr2139115lfc.125.1640171475882;
        Wed, 22 Dec 2021 03:11:15 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id m3sm150935lji.112.2021.12.22.03.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 03:11:15 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH V2 1/2] dt-bindings: pinctrl: Add binding for BCM4908 pinctrl
Date:   Wed, 22 Dec 2021 12:11:07 +0100
Message-Id: <20211222111108.13260-1-zajec5@gmail.com>
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
This patch targets linux-pinctrl.git for-next. It requires commit
896568e5b9c8 ("dt-bindings: pinctrl: convert controller description to the json-schema")
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
index 16bc8cdc1492..e352991484e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3668,6 +3668,13 @@ F:	Documentation/devicetree/bindings/net/brcm,bcm4908-enet.yaml
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

