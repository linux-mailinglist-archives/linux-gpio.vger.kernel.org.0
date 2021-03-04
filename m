Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A80C732CF11
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 10:00:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237153AbhCDI7J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 03:59:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237044AbhCDI6h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 03:58:37 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C2BC061765;
        Thu,  4 Mar 2021 00:57:22 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id o2so8313766wme.5;
        Thu, 04 Mar 2021 00:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IBobp++zzmXkFlTKyV+xbBFMiHTm9+gplidWmumgZTU=;
        b=p4Jnlj36BLh4YW4420lN2L4SKeIDWzvbo75DvTnUNwFWiehfztrwJu1ceeMti5tiRR
         l/HF7T/d6r99i9hlcyDUtGYNlqqpN2mG69WRnQtPJXqh0tqDYR5rrSOnl+RConNZJqNC
         pcClgx8Ogv9Zf1bptbNzXI1O1EZySaPKH7fJGs1l67VfJmvDRcf1L6/qu5iL2ZlMqOSq
         BoYW9sjFGqWBjl93+MOEOclmS46GXz5qltmomQc65XoYAxZWl1pxQsMxUgW7ksO/aAzH
         crX8wK2C9Q+2qRuDWSQUt4F4UUhcVtI+yoCvrOkE5e7XUXyu9c6ykEmc0bwxzkxhkZNf
         WjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IBobp++zzmXkFlTKyV+xbBFMiHTm9+gplidWmumgZTU=;
        b=msprwby8sVUZEZxgDqa7GPihAB+ybbcdP8NUO9M/VWZeWYUx0IB1rsG7oHXtvC+AKF
         f0hIXm9au3MXFAcX16GTtL1WeXGW8vxX55ow4YCJTaGxgzTKcUHq/j0NPZC/XpzjJPoJ
         a/kkflGiCEGFYy25Q7xbtxFxHfAYWwxmXFBWCQi3pwJloCxUqY/9stEkdVQu++oHFfs/
         sxAJIYcKBQzqGi9Y5k8Mij+zMQJWyMGpOY/axlaueMKehHrWjOHspT+m41HJb5aTrn/3
         aMWVrz9pSfBvO5cznbA0oB/9WfAMdTEtPum/E1LKTwRjvhEGoN65LRrQvFstAYK/wg1s
         wzPQ==
X-Gm-Message-State: AOAM5300Rvs9g23S+vxmNO6CfrwZBN1yP24vVrXUVx4dRmmC4lQscq/T
        paSZ8Kq0vQrOgMXeDeqG1/Q=
X-Google-Smtp-Source: ABdhPJzfXAEyiFeygEb7VPKW/XrEvx80nNQCpObVqJ93U2X06EMcfoID3tV3dyqCGC4gWgq5K+JYbA==
X-Received: by 2002:a1c:2403:: with SMTP id k3mr2868231wmk.130.1614848241223;
        Thu, 04 Mar 2021 00:57:21 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id q15sm2828976wrx.56.2021.03.04.00.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 00:57:20 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 08/15] Documentation: add BCM6362 pincontroller binding documentation
Date:   Thu,  4 Mar 2021 09:57:03 +0100
Message-Id: <20210304085710.7128-9-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210304085710.7128-1-noltari@gmail.com>
References: <20210304085710.7128-1-noltari@gmail.com>
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
 v4: no changes
 v3: add new gpio node
 v2: remove interrupts

 .../pinctrl/brcm,bcm6362-pinctrl.yaml         | 250 ++++++++++++++++++
 1 file changed, 250 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6362-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6362-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6362-pinctrl.yaml
new file mode 100644
index 000000000000..f33b56cd883f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6362-pinctrl.yaml
@@ -0,0 +1,250 @@
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
+  Refer to the the bindings described in
+  Documentation/devicetree/bindings/mfd/syscon.yaml
+
+properties:
+  compatible:
+    const: brcm,bcm6362-pinctrl
+
+patternProperties:
+  '^gpio$':
+    type: object
+    properties:
+      compatible:
+        const: brcm,bcm6362-gpio
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
+        compatible = "brcm,bcm6362-pinctrl";
+
+        gpio {
+          compatible = "brcm,bcm6362-gpio";
+          data = <0xc>;
+          dirout = <0x4>;
+
+          gpio-controller;
+          gpio-ranges = <&pinctrl 0 0 48>;
+          #gpio-cells = <2>;
+        };
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

