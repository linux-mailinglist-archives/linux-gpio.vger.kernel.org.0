Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55EFA497CE2
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jan 2022 11:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237029AbiAXKWz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jan 2022 05:22:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237025AbiAXKWz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jan 2022 05:22:55 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E350C06173B;
        Mon, 24 Jan 2022 02:22:54 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id x23so1189995lfc.0;
        Mon, 24 Jan 2022 02:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pk5UhSCbnfg+dd1wmtJPMmw4AI+umsSJYTznPvyX78o=;
        b=FHhtjZI+ufGk6VV+ki8kE87jFMObm7lB8hWTHbOEx8jlbtLPQleqJq/Hrg2dDt0QvJ
         6ZxDixK5svUPN7CsyMcAEZ/41TP6BAUysR6wT3857FKIBQ1HkOK75z0cyDOAFST4muqn
         bv6IBgw2wHklf56VpWyXp/sigJm32ugqRMW8j8nh7HAJ+m2j0GDRFvQRejnY57fIbdvI
         xA3GCky2on6YgUU5+vJ86MZNGQ9uGnFbrMmfatnbhrxx5QujmLJ3cQjB+D9ecb3nrZqq
         3GZVB9gQQ+Db+mVwZEfC9/U5hrhfvvRNaAGXDXh5JNddTA8BtDw1dy5/07aRpAwdfcl/
         lCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pk5UhSCbnfg+dd1wmtJPMmw4AI+umsSJYTznPvyX78o=;
        b=046l9qdLhGGLdM6gMxWztZEYPA7smSFUlHwA4mL51iarMckODFW6lG2T1ft6cNVOkz
         LtJOX7UtDcoU44AaLLd15SpgkapdrNrelWo3FT34Sim3n6OGNBp9qqotBl1lgDSQNDgI
         2hnAGjL+BW86yk8PE7e3KWOTb414pnodM513emY7zeXarL3T4qksiLaLcq97na7+FX8Q
         LSgr51xk3NZ/Pr2sdi/k5X2Qb1uwi93A/gqyvm1mvkaM+Cyo1vNSaEPStmja1ks2XT/2
         h8wXErtWeOllVloL7AyVG1A/A3wIpJ+0CQvzYU555I9Jc2xXBY2NV0IBcczaS9dEgl26
         hzIw==
X-Gm-Message-State: AOAM533ikKmvnOWRpClx1Gxm3hi+WCrYGebrrYflsdX4QXyxO2ywHA0N
        xFDdcSr9XMOjuzn2ytjrpG4=
X-Google-Smtp-Source: ABdhPJxW7P2X99LWexzm/F+HtB1LCWxYd2DWFsRysHMl6VXbYEf4B8bWu3aa/cxwlwE7kOmmiQdQbw==
X-Received: by 2002:a05:6512:3ca6:: with SMTP id h38mr389922lfv.19.1643019772629;
        Mon, 24 Jan 2022 02:22:52 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id h19sm1125173lfu.198.2022.01.24.02.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 02:22:52 -0800 (PST)
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
Subject: [PATCH V4 1/2] dt-bindings: pinctrl: Add binding for BCM4908 pinctrl
Date:   Mon, 24 Jan 2022 11:22:42 +0100
Message-Id: <20220124102243.14912-1-zajec5@gmail.com>
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
V4: Rebased on top of the latest for-next which includes 5.17-rc1 now
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
index ea3e6c914384..dc12f93a5df4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3688,6 +3688,13 @@ F:	Documentation/devicetree/bindings/net/brcm,bcm4908-enet.yaml
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
 M:	Florian Fainelli <f.fainelli@gmail.com>
 M:	Hauke Mehrtens <hauke@hauke-m.de>
-- 
2.31.1

