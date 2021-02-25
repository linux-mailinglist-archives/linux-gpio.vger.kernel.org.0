Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7B2A3253C6
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Feb 2021 17:45:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231160AbhBYQoT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Feb 2021 11:44:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233383AbhBYQnn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2021 11:43:43 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 042ABC06178A;
        Thu, 25 Feb 2021 08:42:25 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id w7so5170387wmb.5;
        Thu, 25 Feb 2021 08:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ALvGgK20hY4hg2uRVpw0C+Cu820uWjonTHwM40KRiOM=;
        b=CUdJHyWP8T32dkSPb0BTFKoJn/Al59JEl/gxv76QZfINclI5E+M2snFOJ3zbuLm0gJ
         y6nlt7VSLY7Yo/I+BW9VIB47JNPjp2jU6sk7r5+M2RH1FkT6HV9wa6Vrc1D9ELiZ1rbm
         +OTrZ+fqnm/+5Gv3BPCfE2l1wu4psrYnBIRKmrRkY8d2J+8FxenPOHDF4zlYjX4mKm0x
         /bex0zYY4uecNU+5kkBhFhNUd6x4Xdt1YOwVPbF4bSLOx5S1wUmHly1z5jLNd7UDgPXJ
         4vNynHSgC8jI4QLZSGzYgwgFEFUvHtPOVVnFcZkMrsWkDI64XiGerQaVkHQiGgaW2vKJ
         h5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ALvGgK20hY4hg2uRVpw0C+Cu820uWjonTHwM40KRiOM=;
        b=U32jJKlEGyaIPJF9HpSS3Y/s/e+nlvv7qk7dphpIelHMvp5EEWnesjseJyxUsRBoB2
         tWmKuIjBby6II5O+/U9dwYf6v7QeO8wC0IXi4uC5JHdio8P5gb2zzf/YMuxHD7YX+GZv
         jqnxzsZZTbcwjAkXn8YZtz4379o9ANDjBgfCmwY1nJmp8OpZinMVIxO40JZ1q1YFYBU8
         rPclKoesZL6rK4yHDDvueNj5iCdvsyDGjhoquHlnRrhqC6d1EXxKPArvf96x8AEunCNJ
         CES3joxuTsQsoVxr5BEIKoRMbDSW6o1CKzECR0IXP/pe/P2sFOA/xlnjyi8V6sxvw4nL
         WIbQ==
X-Gm-Message-State: AOAM533yU6E8PaeTRjEiI8Z/Z/rgqyDJeT8DnXYxoJHZfd901dKcLi8F
        pM64EwygabstICKvblrdBsg=
X-Google-Smtp-Source: ABdhPJxr9n+ZM55pRwe4mlRQ+uYcdggF3q3DMUkBFcm3zQW5Lo6Cn5Wm0BooGi6Jo1YMDuVp81bNeA==
X-Received: by 2002:a1c:f603:: with SMTP id w3mr4026320wmc.122.1614271343731;
        Thu, 25 Feb 2021 08:42:23 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id u4sm372779wrm.24.2021.02.25.08.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 08:42:23 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 05/12] Documentation: add BCM6362 pincontroller binding documentation
Date:   Thu, 25 Feb 2021 17:42:09 +0100
Message-Id: <20210225164216.21124-6-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210225164216.21124-1-noltari@gmail.com>
References: <20210225164216.21124-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the pincontrol core found in BCM6362 SoCs.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 .../pinctrl/brcm,bcm6362-pinctrl.yaml         | 240 ++++++++++++++++++
 1 file changed, 240 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6362-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6362-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6362-pinctrl.yaml
new file mode 100644
index 000000000000..57a1718b179a
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6362-pinctrl.yaml
@@ -0,0 +1,240 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/brcm,bcm6362-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6362 pin controller
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+  - Jonas Gorski <jonas.gorski@gmail.com>
+
+description: |+
+  The pin controller node should be the child of a syscon node.
+
+  Refer to the bindings described in
+  Documentation/devicetree/bindings/mfd/syscon.yaml
+
+properties:
+  compatible:
+    const: brcm,bcm6362-pinctrl
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    description:
+      Specifies the pin number and flags, as defined in
+      include/dt-bindings/gpio/gpio.h
+    const: 2
+
+  interrupts-extended:
+    description:
+      One interrupt per each of the 4 GPIO ports supported by the controller,
+      sorted by port number ascending order.
+    minItems: 4
+    maxItems: 4
+
+patternProperties:
+  '^.*$':
+    if:
+      type: object
+    then:
+      properties:
+        function:
+          $ref: "/schemas/types.yaml#/definitions/string"
+          enum: [ usb_device_led, sys_irq, serial_led_clk, serial_led_data,
+                  robosw_led_data, robosw_led_clk, robosw_led0, robosw_led1,
+                  inet_led, spi_cs2, spi_cs3, ntr_pulse, uart1_scts,
+                  uart1_srts, uart1_sdin, uart1_sdout, adsl_spi_miso,
+                  adsl_spi_mosi, adsl_spi_clk, adsl_spi_cs, ephy0_led,
+                  ephy1_led, ephy2_led, ephy3_led, ext_irq0, ext_irq1,
+                  ext_irq2, ext_irq3, nand ]
+
+        pins:
+          $ref: "/schemas/types.yaml#/definitions/string"
+          enum: [ gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7,
+                  gpio8, gpio9, gpio10, gpio11, gpio12, gpio13, gpio14,
+                  gpio15, gpio16, gpio17, gpio18, gpio19, gpio20, gpio21,
+                  gpio22, gpio23, gpio24, gpio25, gpio26, gpio27, nand_grp ]
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
+    gpio@10000080 {
+      compatible = "syscon", "simple-mfd";
+      reg = <0x10000080 0x80>;
+
+      pinctrl: pinctrl {
+        compatible = "brcm,bcm6362-pinctrl";
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        interrupts-extended = <&ext_intc 0 0>,
+                              <&ext_intc 1 0>,
+                              <&ext_intc 2 0>,
+                              <&ext_intc 3 0>;
+        interrupt-names = "gpio24",
+                          "gpio25",
+                          "gpio26",
+                          "gpio27";
+
+        pinctrl_usb_device_led: usb_device_led {
+          function = "usb_device_led";
+          pins = "gpio0";
+        };
+
+        pinctrl_sys_irq: sys_irq {
+          function = "sys_irq";
+          pins = "gpio1";
+        };
+
+        pinctrl_serial_led: serial_led {
+          pinctrl_serial_led_clk: serial_led_clk {
+            function = "serial_led_clk";
+            pins = "gpio2";
+          };
+
+          pinctrl_serial_led_data: serial_led_data {
+            function = "serial_led_data";
+            pins = "gpio3";
+          };
+        };
+
+        pinctrl_robosw_led_data: robosw_led_data {
+          function = "robosw_led_data";
+          pins = "gpio4";
+        };
+
+        pinctrl_robosw_led_clk: robosw_led_clk {
+          function = "robosw_led_clk";
+          pins = "gpio5";
+        };
+
+        pinctrl_robosw_led0: robosw_led0 {
+          function = "robosw_led0";
+          pins = "gpio6";
+        };
+
+        pinctrl_robosw_led1: robosw_led1 {
+          function = "robosw_led1";
+          pins = "gpio7";
+        };
+
+        pinctrl_inet_led: inet_led {
+          function = "inet_led";
+          pins = "gpio8";
+        };
+
+        pinctrl_spi_cs2: spi_cs2 {
+          function = "spi_cs2";
+          pins = "gpio9";
+        };
+
+        pinctrl_spi_cs3: spi_cs3 {
+          function = "spi_cs3";
+          pins = "gpio10";
+        };
+
+        pinctrl_ntr_pulse: ntr_pulse {
+          function = "ntr_pulse";
+          pins = "gpio11";
+        };
+
+        pinctrl_uart1_scts: uart1_scts {
+          function = "uart1_scts";
+          pins = "gpio12";
+        };
+
+        pinctrl_uart1_srts: uart1_srts {
+          function = "uart1_srts";
+          pins = "gpio13";
+        };
+
+        pinctrl_uart1: uart1 {
+          pinctrl_uart1_sdin: uart1_sdin {
+            function = "uart1_sdin";
+            pins = "gpio14";
+          };
+
+          pinctrl_uart1_sdout: uart1_sdout {
+            function = "uart1_sdout";
+            pins = "gpio15";
+          };
+        };
+
+        pinctrl_adsl_spi: adsl_spi {
+          pinctrl_adsl_spi_miso: adsl_spi_miso {
+            function = "adsl_spi_miso";
+            pins = "gpio16";
+          };
+
+          pinctrl_adsl_spi_mosi: adsl_spi_mosi {
+            function = "adsl_spi_mosi";
+            pins = "gpio17";
+          };
+
+          pinctrl_adsl_spi_clk: adsl_spi_clk {
+            function = "adsl_spi_clk";
+            pins = "gpio18";
+          };
+
+          pinctrl_adsl_spi_cs: adsl_spi_cs {
+            function = "adsl_spi_cs";
+            pins = "gpio19";
+          };
+        };
+
+        pinctrl_ephy0_led: ephy0_led {
+          function = "ephy0_led";
+          pins = "gpio20";
+        };
+
+        pinctrl_ephy1_led: ephy1_led {
+          function = "ephy1_led";
+          pins = "gpio21";
+        };
+
+        pinctrl_ephy2_led: ephy2_led {
+          function = "ephy2_led";
+          pins = "gpio22";
+        };
+
+        pinctrl_ephy3_led: ephy3_led {
+          function = "ephy3_led";
+          pins = "gpio23";
+        };
+
+        pinctrl_ext_irq0: ext_irq0 {
+          function = "ext_irq0";
+          pins = "gpio24";
+        };
+
+        pinctrl_ext_irq1: ext_irq1 {
+          function = "ext_irq1";
+          pins = "gpio25";
+        };
+
+        pinctrl_ext_irq2: ext_irq2 {
+          function = "ext_irq2";
+          pins = "gpio26";
+        };
+
+        pinctrl_ext_irq3: ext_irq3 {
+          function = "ext_irq3";
+          pins = "gpio27";
+        };
+
+        pinctrl_nand: nand {
+          function = "nand";
+          group = "nand_grp";
+        };
+      };
+    };
-- 
2.20.1

