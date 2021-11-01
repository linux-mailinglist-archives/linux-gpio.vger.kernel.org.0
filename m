Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A33644151A
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Nov 2021 09:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231901AbhKAION (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Nov 2021 04:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbhKAIOG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Nov 2021 04:14:06 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67DEAC061766;
        Mon,  1 Nov 2021 01:11:33 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id k2so1066062pff.11;
        Mon, 01 Nov 2021 01:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=G4lhw8oUgXC3VeB+Y7MyYKlg5u5UVdlnClwj/T16E6Q=;
        b=jS6lrWXoTT5x+qVFdazvpooRmAv8LMivpdmsuuXrGDkRBBs5OimrdBaysQTSwnfQJI
         yxw4DOQZBXuTNUTkntqKv6hRzwNYaBXtYgEykuiRDEu1/ZykM+eWb7EK8p3VKRooHpwM
         rTuPqOhG2OTsOWjrK3pvlgtdwEEkNcek8VO2YGrbBKZzs20sDh8QRbcP9GEGriEiNnTI
         zqsvp3e+rcmFLl/wkL7YrMACe/0sAg24IL5chfou1IacZRdj3M4iI7NKi/tpoX/IW73M
         PbQ0MaciOFnbc2KoJGCttusJiVNC1DyIWc4KRYiF+pujjLHSen9Hi0fYxKBWgdB1w+rE
         b1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=G4lhw8oUgXC3VeB+Y7MyYKlg5u5UVdlnClwj/T16E6Q=;
        b=WxoCBBnefK9HzBiMU/81QlJcCZsFsuHixOo530ssYVBvIHFxHNJfMfaiuj0mjMMakV
         ysZoPK3u4tdwTEn4MQjb0OUvHyUYukoypvvGeaYL+F3HwwdSADiLplJOIXBEn9Tw0o1q
         Anz6MR1mffVyqny77yMyfhFbB2GsdWyR7ZlepmhJAO2VkZUTyDt1J3V9zPZZT+NGscKn
         xInfMbqXrZa8/+PL+cltnYwUHRDkKGQalc4CiP94oAhbuAM93oCyksS2NSz7nGqQ2CLt
         rngcj+ZMbIXV/QGDhmLX3eJ43HRl14hlX2lQwqPy5+on5EFCgTqd8usqknNaHVcKnnNu
         fBDA==
X-Gm-Message-State: AOAM531Vf1PQKhXur4TdLLsNH1nPkXNJDTbvS03I8myCWWnBLtSne+NH
        e5aczyPgEejEcPAH1iirUn0=
X-Google-Smtp-Source: ABdhPJwcaXAeT2W3/vzjpYCswpqhcTvNEijktoqx0oBO+D+WLLA9e281tug4tPHVk75pJ694JnaknQ==
X-Received: by 2002:a63:5664:: with SMTP id g36mr10045822pgm.243.1635754292906;
        Mon, 01 Nov 2021 01:11:32 -0700 (PDT)
Received: from scdiu3.sunplus.com ([113.196.136.192])
        by smtp.googlemail.com with ESMTPSA id d2sm15732606pfj.42.2021.11.01.01.11.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Nov 2021 01:11:32 -0700 (PDT)
From:   Wells Lu <wellslutw@gmail.com>
X-Google-Original-From: Wells Lu <wells.lu@sunplus.com>
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Cc:     qinjian@cqplus1.com, dvorkin@tibbo.com,
        Wells Lu <wells.lu@sunplus.com>
Subject: [PATCH v2 3/3] devicetree: bindings: pinctrl: Add bindings doc for Sunplus SP7021.
Date:   Mon,  1 Nov 2021 16:11:17 +0800
Message-Id: <1635754277-32429-4-git-send-email-wells.lu@sunplus.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635754277-32429-1-git-send-email-wells.lu@sunplus.com>
References: <1635324926-22319-1-git-send-email-wells.lu@sunplus.com>
 <1635754277-32429-1-git-send-email-wells.lu@sunplus.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add bindings documentation for Sunplus SP7021.

Signed-off-by: Wells Lu <wells.lu@sunplus.com>
---
Changes in v2:
 - None

 .../bindings/pinctrl/sunplus,sp7021-pinctrl.yaml   | 277 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 278 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/sunplus,sp7021-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/sunplus,sp7021-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/sunplus,sp7021-pinctrl.yaml
new file mode 100644
index 0000000..7cfa0ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/sunplus,sp7021-pinctrl.yaml
@@ -0,0 +1,277 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) Sunplus Co., Ltd. 2021
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/sunplus,sp7021-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sunplus SP7021 Pin Controller Device Tree Bindings
+
+maintainers:
+  - Dvorkin Dmitry <dvorkin@tibbo.com>
+  - Wells Lu <wells.lu@sunplus.com>
+
+description: |
+  The Sunplus SP7021 pin controller is used to control SoC pins. Please
+  refer to pinctrl-bindings.txt in this directory for details of the common
+  pinctrl bindings used by client devices.
+
+  Refer to https://sunplus-tibbo.atlassian.net/wiki/spaces/doc/pages/
+  1443495991/How+to+setup+pins+of+SP7021+in+device-tree+source
+
+  The device node of pin controller of Sunplus SP7021 has following
+  properties.
+
+properties:
+  compatible:
+    const: sunplus,sp7021-pctl
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  reg:
+    items:
+      - description: Base address and length of the MOON2 registers.
+      - description: Base address and length of the GPIOXT registers.
+      - description: Base address and length of the GPIOXT2 registers.
+      - description: Base address and length of the FIRST registers.
+      - description: Base address and length of the MOON1 registers.
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+patternProperties:
+  '^.*$':
+    if:
+      type: object
+    then:
+      description: |
+        A pinctrl node should contain at least one subnodes representing the
+        pins or function-pins group available on the machine. Each subnode
+        will list the pins it needs, and how they should be configured.
+
+        Pinctrl node's client devices use subnodes for desired pin
+        configuration. Client device subnodes use below standard properties.
+
+      properties:
+        pins:
+          description: |
+            Define pins which are used by pinctrl node's client device.
+
+            It consists of one or more integers which represents the config
+            setting for corresponding pin. Please use macro SPPCTL_IOPAD to
+            define the integers for pins.
+
+            The first argument of the macro is pin number, the second is pin
+            type, the third is type of GPIO, the last is default output state
+            of GPIO.
+          $ref: /schemas/types.yaml#/definitions/uint32-array
+
+        function:
+          description: |
+            Define pin-function which is used by pinctrl node's client device.
+            The name should be one of string in the following enumeration.
+          $ref: "/schemas/types.yaml#/definitions/string"
+          enum: [ SPI_FLASH, SPI_FLASH_4BIT, SPI_NAND, CARD0_EMMC, SD_CARD,
+                  UA0, FPGA_IFX, HDMI_TX, LCDIF, USB0_OTG, USB1_OTG ]
+
+        groups:
+          description: |
+            Define pin-group in a specified pin-function.
+            The name should be one of string in the following enumeration.
+          $ref: "/schemas/types.yaml#/definitions/string"
+          enum: [ SPI_FLASH1, SPI_FLASH2, SPI_FLASH_4BIT1, SPI_FLASH_4BIT2,
+                  SPI_NAND, CARD0_EMMC, SD_CARD, UA0, FPGA_IFX, HDMI_TX1,
+                  HDMI_TX2, HDMI_TX3, LCDIF, USB0_OTG, USB1_OTG ]
+
+        zero_func:
+          description: |
+            Disabled pins which are not used by pinctrl node's client device.
+          $ref: /schemas/types.yaml#/definitions/uint32-array
+
+      additionalProperties: false
+
+      allOf:
+        - if:
+            properties:
+              function:
+                enum:
+                  - SPI_FLASH
+          then:
+            properties:
+              groups:
+                enum:
+                  - SPI_FLASH1
+                  - SPI_FLASH2
+        - if:
+            properties:
+              function:
+                enum:
+                  - SPI_FLASH_4BIT
+          then:
+            properties:
+              groups:
+                enum:
+                  - SPI_FLASH_4BIT1
+                  - SPI_FLASH_4BIT2
+        - if:
+            properties:
+              function:
+                enum:
+                  - SPI_NAND
+          then:
+            properties:
+              groups:
+                enum:
+                  - SPI_NAND
+        - if:
+            properties:
+              function:
+                enum:
+                  - CARD0_EMMC
+          then:
+            properties:
+              groups:
+                enum:
+                  - CARD0_EMMC
+        - if:
+            properties:
+              function:
+                enum:
+                  - SD_CARD
+          then:
+            properties:
+              groups:
+                enum:
+                  - SD_CARD
+        - if:
+            properties:
+              function:
+                enum:
+                  - UA0
+          then:
+            properties:
+              groups:
+                enum:
+                  - UA0
+        - if:
+            properties:
+              function:
+                enum:
+                  - FPGA_IFX
+          then:
+            properties:
+              groups:
+                enum:
+                  - FPGA_IFX
+        - if:
+            properties:
+              function:
+                enum:
+                  - HDMI_TX
+          then:
+            properties:
+              groups:
+                enum:
+                  - HDMI_TX1
+                  - HDMI_TX2
+                  - HDMI_TX3
+        - if:
+            properties:
+              function:
+                enum:
+                  - LCDIF
+          then:
+            properties:
+              groups:
+                enum:
+                  - LCDIF
+        - if:
+            properties:
+              function:
+                enum:
+                  - USB0_OTG
+          then:
+            properties:
+              groups:
+                enum:
+                  - USB0_OTG
+        - if:
+            properties:
+              function:
+                enum:
+                  - USB1_OTG
+          then:
+            properties:
+              groups:
+                enum:
+                  - USB1_OTG
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - gpio-controller
+  - clocks
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sp-sp7021.h>
+    #include <dt-bindings/reset/sp-sp7021.h>
+    #include <dt-bindings/pinctrl/sppctl-sp7021.h>
+
+    pctl: pctl@9C000100 {
+        compatible = "sunplus,sp7021-pctl";
+        reg = <0x9C000100 0x100>, <0x9C000300 0x80>, <0x9C000380 0x80>,
+              <0x9C0032e4 0x1C>, <0x9C000080 0x20>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        clocks = <&clkc GPIO>;
+        resets = <&rstc RST_GPIO>;
+
+        pins_uart0: pins_uart0 {
+            function = "UA0";
+            groups = "UA0";
+        };
+
+        pins_uart1: pins_uart1 {
+            pins = <
+                SPPCTL_IOPAD(11,SPPCTL_PCTL_G_PMUX,MUXF_UA1_TX,0)
+                SPPCTL_IOPAD(10,SPPCTL_PCTL_G_PMUX,MUXF_UA1_RX,0)
+                SPPCTL_IOPAD(7,SPPCTL_PCTL_G_GPIO,0,SPPCTL_PCTL_L_OUT)
+            >;
+        };
+
+        emmc_mux: emmc_mux {
+            function = "CARD0_EMMC";
+            groups = "CARD0_EMMC";
+        };
+
+        mmc1_mux: mmc1_mux {
+            function = "SD_CARD";
+            groups = "SD_CARD";
+            pins = < SPPCTL_IOPAD(91,SPPCTL_PCTL_G_GPIO,0,0) >;
+        };
+
+        hdmi_A_tx1: hdmi_A_tx1_pins {
+            function = "HDMI_TX";
+            groups = "HDMI_TX1";
+        };
+        hdmi_A_tx2: hdmi_A_tx2_pins {
+            function = "HDMI_TX";
+            groups = "HDMI_TX2";
+        };
+        hdmi_A_tx3: hdmi_A_tx3_pins {
+            function = "HDMI_TX";
+            groups = "HDMI_TX3";
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index da6378f..11835e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14872,6 +14872,7 @@ M:	Wells Lu <wells.lu@sunplus.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	https://sunplus-tibbo.atlassian.net/wiki/spaces/doc/overview
+F:	Documentation/devicetree/bindings/pinctrl/sunplus,*
 F:	drivers/pinctrl/sunplus/
 F:	include/dt-bindings/pinctrl/sppctl*
 
-- 
2.7.4

