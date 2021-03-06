Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F54832FB97
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Mar 2021 16:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbhCFP5w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 6 Mar 2021 10:57:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbhCFP5X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 6 Mar 2021 10:57:23 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 198F0C06174A;
        Sat,  6 Mar 2021 07:57:23 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id w203-20020a1c49d40000b029010c706d0642so6926356wma.0;
        Sat, 06 Mar 2021 07:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=849Nqu21AvWZcv63jCn9ZUYE/2O8uEVFHTUr/iGwlos=;
        b=pVMRwBf1Q3G6ZwCgNYUquyDJNrjCoK3lYlvvdT1vv91+D8wGgx3CwTQGKUKKYj5gbc
         YWK9cDAen4TybFW77EuLe0p0wEgamC+bxTWIimvjBLT0TxK9mSlvlIj3X2uzEfhy+nvk
         koAoStnjVzoEjgFUE1Sr1bnL/Hm6UNiGAORHVqkBgk7QXGBz/ZQP2i7prUlXABZzof46
         zGwuZ6an+0YsWwUByDLvrkgod+kX6ZiTTHL+tTAZUcwMJo8YKR3NOy/P0q78RPZaS0uR
         GWswTWNvBn04Oxp8rzwzT2s/wAKr53QpUE8NsgfnpDy9iToz9EuFEu2e+d8fj/DWRdaz
         5D6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=849Nqu21AvWZcv63jCn9ZUYE/2O8uEVFHTUr/iGwlos=;
        b=mptXvVXh2CCbl1HaCUMfaIFPx1b79ZyJcMhpos3R0q1tSDbnRg+tgx7Un1YA9DtdC8
         FGHKln0O8V0hM9bPF9o42azc8vRFhVmuVdlx4W5WQxvbqG7rJhEYrAuBoczHSKbU2xRQ
         +VThbVNcoeBP4GlQR2oCJsO0AO2cllbYILZfEh3zq9Ol7VKlmkukayGasQpFFAQegQED
         0OOIcU9DpDB5g7n+4g1nivwD+ZBM4iw9CYWYitVZyU06sFBK4uM99li5sfyTShg2RaxX
         h9e6nhAuGSIFGVc3RZ1KKSMCfAVsYvUnJedmq9me+y7/f2IzAxqy1CiyyaOqfYQOD4vH
         F3Eg==
X-Gm-Message-State: AOAM531BUTGTQPabrAKLeXZcCSVNyOoniBlHqv8rDkMAfFAR5yIzr7OR
        QDCB2EMdWZz4SneP3vz4pyY=
X-Google-Smtp-Source: ABdhPJyycvpVFA+1d5SbYtzN+Jn5sb2qZJizKicCJD6nhbm/nApodZFFwFkQkZo4jqqVIWkUKwmpYA==
X-Received: by 2002:a7b:c10c:: with SMTP id w12mr14570239wmi.112.1615046241847;
        Sat, 06 Mar 2021 07:57:21 -0800 (PST)
Received: from skynet.lan (224.red-2-138-103.dynamicip.rima-tde.net. [2.138.103.224])
        by smtp.gmail.com with ESMTPSA id p6sm9315188wru.2.2021.03.06.07.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 07:57:21 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 10/15] dt-bindings: add BCM6368 pincontroller binding documentation
Date:   Sat,  6 Mar 2021 16:57:07 +0100
Message-Id: <20210306155712.4298-11-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210306155712.4298-1-noltari@gmail.com>
References: <20210306155712.4298-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the pincontrol core found in BCM6368 SoCs.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v5: change Documentation to dt-bindings in commit title
 v4: no changes
 v3: add new gpio node
 v2: remove interrupts

 .../pinctrl/brcm,bcm6368-pinctrl.yaml         | 261 ++++++++++++++++++
 1 file changed, 261 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6368-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6368-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6368-pinctrl.yaml
new file mode 100644
index 000000000000..6a289c93d6b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6368-pinctrl.yaml
@@ -0,0 +1,261 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/brcm,bcm6368-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6368 pin controller
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+  - Jonas Gorski <jonas.gorski@gmail.com>
+
+description: |+
+  The pin controller node should be the child of a syscon node.
+
+  Refer to the the bindings described in
+  Documentation/devicetree/bindings/mfd/syscon.yaml
+
+properties:
+  compatible:
+    const: brcm,bcm6368-pinctrl
+
+patternProperties:
+  '^gpio$':
+    type: object
+    properties:
+      compatible:
+        const: brcm,bcm6368-gpio
+
+      data:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Offset in the register map for the data register (in bytes).
+
+      dirout:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Offset in the register map for the dirout register (in bytes).
+
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
+      gpio-ranges:
+        maxItems: 1
+
+    required:
+      - gpio-controller
+      - gpio-ranges
+      - '#gpio-cells'
+
+  '^.*$':
+    if:
+      type: object
+    then:
+      properties:
+        function:
+          $ref: "/schemas/types.yaml#/definitions/string"
+          enum: [ analog_afe_0, analog_afe_1, sys_irq, serial_led_data,
+                  serial_led_clk, inet_led, ephy0_led, ephy1_led, ephy2_led,
+                  ephy3_led, robosw_led_data, robosw_led_clk, robosw_led0,
+                  robosw_led1, usb_device_led, pci_req1, pci_gnt1, pci_intb,
+                  pci_req0, pci_gnt0, pcmcia_cd1, pcmcia_cd2, pcmcia_vs1,
+                  pcmcia_vs2, ebi_cs2, ebi_cs3, spi_cs2, spi_cs3, spi_cs4,
+                  spi_cs5, uart1 ]
+
+        pins:
+          $ref: "/schemas/types.yaml#/definitions/string"
+          enum: [ gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7,
+                  gpio8, gpio9, gpio10, gpio11, gpio12, gpio13, gpio14,
+                  gpio16, gpio17, gpio18, gpio19, gpio20, gpio22, gpio23,
+                  gpio24, gpio25, gpio26, gpio27, gpio28, gpio29, gpio30,
+                  gpio31, uart1_grp ]
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio_cntl@10000080 {
+      compatible = "syscon", "simple-mfd";
+      reg = <0x10000080 0x80>;
+
+      pinctrl: pinctrl {
+        compatible = "brcm,bcm6368-pinctrl";
+
+        gpio {
+          compatible = "brcm,bcm6368-gpio";
+          data = <0xc>;
+          dirout = <0x4>;
+
+          gpio-controller;
+          gpio-ranges = <&pinctrl 0 0 38>;
+          #gpio-cells = <2>;
+        };
+
+        pinctrl_analog_afe_0: analog_afe_0 {
+          function = "analog_afe_0";
+          pins = "gpio0";
+        };
+
+        pinctrl_analog_afe_1: analog_afe_1 {
+          function = "analog_afe_1";
+          pins = "gpio1";
+        };
+
+        pinctrl_sys_irq: sys_irq {
+          function = "sys_irq";
+          pins = "gpio2";
+        };
+
+        pinctrl_serial_led: serial_led {
+          pinctrl_serial_led_data: serial_led_data {
+            function = "serial_led_data";
+            pins = "gpio3";
+          };
+
+          pinctrl_serial_led_clk: serial_led_clk {
+            function = "serial_led_clk";
+            pins = "gpio4";
+          };
+        };
+
+        pinctrl_inet_led: inet_led {
+          function = "inet_led";
+          pins = "gpio5";
+        };
+
+        pinctrl_ephy0_led: ephy0_led {
+          function = "ephy0_led";
+          pins = "gpio6";
+        };
+
+        pinctrl_ephy1_led: ephy1_led {
+          function = "ephy1_led";
+          pins = "gpio7";
+        };
+
+        pinctrl_ephy2_led: ephy2_led {
+          function = "ephy2_led";
+          pins = "gpio8";
+        };
+
+        pinctrl_ephy3_led: ephy3_led {
+          function = "ephy3_led";
+          pins = "gpio9";
+        };
+
+        pinctrl_robosw_led_data: robosw_led_data {
+          function = "robosw_led_data";
+          pins = "gpio10";
+        };
+
+        pinctrl_robosw_led_clk: robosw_led_clk {
+          function = "robosw_led_clk";
+          pins = "gpio11";
+        };
+
+        pinctrl_robosw_led0: robosw_led0 {
+          function = "robosw_led0";
+          pins = "gpio12";
+        };
+
+        pinctrl_robosw_led1: robosw_led1 {
+          function = "robosw_led1";
+          pins = "gpio13";
+        };
+
+        pinctrl_usb_device_led: usb_device_led {
+          function = "usb_device_led";
+          pins = "gpio14";
+        };
+
+        pinctrl_pci: pci {
+          pinctrl_pci_req1: pci_req1 {
+            function = "pci_req1";
+            pins = "gpio16";
+          };
+
+          pinctrl_pci_gnt1: pci_gnt1 {
+            function = "pci_gnt1";
+            pins = "gpio17";
+          };
+
+          pinctrl_pci_intb: pci_intb {
+            function = "pci_intb";
+            pins = "gpio18";
+          };
+
+          pinctrl_pci_req0: pci_req0 {
+            function = "pci_req0";
+            pins = "gpio19";
+          };
+
+          pinctrl_pci_gnt0: pci_gnt0 {
+            function = "pci_gnt0";
+            pins = "gpio20";
+          };
+        };
+
+        pinctrl_pcmcia: pcmcia {
+          pinctrl_pcmcia_cd1: pcmcia_cd1 {
+            function = "pcmcia_cd1";
+            pins = "gpio22";
+          };
+
+          pinctrl_pcmcia_cd2: pcmcia_cd2 {
+            function = "pcmcia_cd2";
+            pins = "gpio23";
+          };
+
+          pinctrl_pcmcia_vs1: pcmcia_vs1 {
+            function = "pcmcia_vs1";
+            pins = "gpio24";
+          };
+
+          pinctrl_pcmcia_vs2: pcmcia_vs2 {
+            function = "pcmcia_vs2";
+            pins = "gpio25";
+          };
+        };
+
+        pinctrl_ebi_cs2: ebi_cs2 {
+          function = "ebi_cs2";
+          pins = "gpio26";
+        };
+
+        pinctrl_ebi_cs3: ebi_cs3 {
+          function = "ebi_cs3";
+          pins = "gpio27";
+        };
+
+        pinctrl_spi_cs2: spi_cs2 {
+          function = "spi_cs2";
+          pins = "gpio28";
+        };
+
+        pinctrl_spi_cs3: spi_cs3 {
+          function = "spi_cs3";
+          pins = "gpio29";
+        };
+
+        pinctrl_spi_cs4: spi_cs4 {
+          function = "spi_cs4";
+          pins = "gpio30";
+        };
+
+        pinctrl_spi_cs5: spi_cs5 {
+          function = "spi_cs5";
+          pins = "gpio31";
+        };
+
+        pinctrl_uart1: uart1 {
+          function = "uart1";
+          group = "uart1_grp";
+        };
+      };
+    };
-- 
2.20.1

