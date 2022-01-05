Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB80F4852ED
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jan 2022 13:41:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233431AbiAEMkM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jan 2022 07:40:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232884AbiAEMkL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jan 2022 07:40:11 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8022C061761;
        Wed,  5 Jan 2022 04:40:10 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id k21so88868928lfu.0;
        Wed, 05 Jan 2022 04:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Xn70qN5iMWwiX4RVZL4Nzfe/4PAigFYZ9/3ibWiajA=;
        b=jV+//Djxo1q3wYBIGq/OcwWrpks0VMYzNDLcbbawxN67eXeYoa2Ka01uRGil3vuivY
         vFntj9nwCkcNRgKRNBh98JBFCromco8cShAA6xYq/yfEbjZSim4fjuPclGjVGpYkw/A/
         tsxRo93saUjqnOuhZQeuInRBAmoQHNu4qEjpWq4f+iKMBYTBb9drPAWjhtiZZAaSOSRb
         +k6WA5jxwu/yR6Mpc/1bST+GE7aUogPda8XvCmlybK5taKE+V6ipcwxClk0hHyJqaDtD
         +lqImO5sUP+2tDUJMEDqeBSWdHfcQMCEEd6KjvrgkrK5jByyhdk38+o6/uXT+O1yVPtU
         NDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Xn70qN5iMWwiX4RVZL4Nzfe/4PAigFYZ9/3ibWiajA=;
        b=0xqKVkgscDJAXqWVnrOSIOchaJfIBUQenBpCU56D4YVM+JwZgKx0iU9gBVebuCQ+x2
         5pMarQUCvA3a0HeLbJCFZvcESgrotltYV+jwaED/uC+oE/aTiG9SVF+OOPBHbqV1HMPh
         J7uZgD9ryj+rLiCHyLD9vqLcg+q3xSqKGOTu/Ut9OEVyy4ja4EV1araCIYtFrwQBavDc
         ql47Gdl1pPEBChMMPr1LNTYJzkdOwoGPKzvAk9p87W7vDXnP/cyzJOlOUGHkbW6brodo
         ojIjNTx52b4V0Kt81RK9+dIiyFNj6AqC0sr38flCnLYCTG6Q9chmGh2p+5JVngMTPDT8
         PpRg==
X-Gm-Message-State: AOAM53085cm4e3mMbMwoVLuhdwXGymeSEJoxd2VDyb6ihEJ9mZhJ+eDQ
        aELdPwWwWeld+63VF7EvznjNNTcGj8E=
X-Google-Smtp-Source: ABdhPJxqzB2UPPCwy2thCPFfbHYUP0nkuFub7Ufq2iIMisu3amvdJPV6MhupopJLkWj3177lp9Wm7Q==
X-Received: by 2002:a05:6512:3b24:: with SMTP id f36mr48294745lfv.545.1641386409142;
        Wed, 05 Jan 2022 04:40:09 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id k10sm1834781ljg.48.2022.01.05.04.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 04:40:08 -0800 (PST)
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
Subject: [PATCH V3 1/2] dt-bindings: pinctrl: Add binding for BCM4908 pinctrl
Date:   Wed,  5 Jan 2022 13:40:02 +0100
Message-Id: <20220105124003.11319-1-zajec5@gmail.com>
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
index 9c8129679c4f..579fa0f0a785 100644
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

