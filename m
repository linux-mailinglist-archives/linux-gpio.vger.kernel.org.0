Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B94832AD33
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:15:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383926AbhCBV2w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:28:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1835599AbhCBTSU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 14:18:20 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE448C0617AB;
        Tue,  2 Mar 2021 11:16:33 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id e23so3159487wmh.3;
        Tue, 02 Mar 2021 11:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ktuNjr485xu4lLYE4jWHl+PbsvTt27mHmB+S+D/0vr0=;
        b=T7C3IcAeL0a08J315X2ccT1fATAkuuWhQ2dctWtSLw5NjgQavWhA1yrJMmp4TicKh0
         0P/zWXAjkPPnEHOXbKUI1mbtCkeOIrT4WW7VivegPL8Kbti3t9T5FsMG1aSZ4Kxvx6+K
         rg7qqCjLlXz5xsvRryKySeKgCZOzGVT8JkCJktI+n4FcUGkjF3p5/ApvhQM6O3NGa9D2
         kbTbDSH29rEnfGQHi5O/OWvgPnpr4M7Gb7HAez5x/UP6hv7MtAoVCGj3jfAF4uoeV/lW
         XdVo1YHI9jKQvx/pPNoca76lzgZro9BCx2owYn1Vf/xGNj7VBwftjU0+CBNMD9fDxo0t
         egNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ktuNjr485xu4lLYE4jWHl+PbsvTt27mHmB+S+D/0vr0=;
        b=Q2tLgVkHm81kdyqAqOY1StKOx27XvmTF85gBQ3IKPLgtB/E/GpV3zCHsF+C7jmbb73
         UsEOVAgNz+TCj4QqiqkBsIlDmiYt/8s7MVof6i6D4/dMHUYl7q7u3L7g9VCYaftYMFYi
         dyc2+gnic7Jx6wsMTCXsftyfMq7B6sBmwZ1gZQQPH5m001+lzEceaJlyjPWY2sTdtwOd
         2cRz7xGflecZVStvLE/f5BK6STxFcOsrVPheGBgj6HfkX4Re2cEcw9IeoJVF1YsqL+ik
         s0WAaKPMHleCgSElkkXYo84IqGxfjqfqdnpTQ+NiDzG/rmkBVG4XQ4xmq4gxNMvNMyUI
         DQhA==
X-Gm-Message-State: AOAM5322WgjUreYeOMgRxy1Y8kwpztMZzmF7OSgGblJFEZA73UWye42r
        FbWiMGmL+kh5Fc5ldv2Npj8=
X-Google-Smtp-Source: ABdhPJwkpeX9i2MOMosmc9jjUASFvPXiqT5LIqZAT30HGy1hx8LvJE16Apliyfs6OPraAq42BVAckA==
X-Received: by 2002:a05:600c:19cf:: with SMTP id u15mr5437445wmq.139.1614712592422;
        Tue, 02 Mar 2021 11:16:32 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id l15sm3578862wmh.21.2021.03.02.11.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 11:16:30 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Michael Walle <michael@walle.cc>, f.fainelli@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/12] Documentation: add BCM6362 pincontroller binding documentation
Date:   Tue,  2 Mar 2021 20:16:06 +0100
Message-Id: <20210302191613.29476-6-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210302191613.29476-1-noltari@gmail.com>
References: <20210302191613.29476-1-noltari@gmail.com>
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
 v2: remove interrupts

 .../pinctrl/brcm,bcm6362-pinctrl.yaml         | 224 ++++++++++++++++++
 1 file changed, 224 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6362-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6362-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6362-pinctrl.yaml
new file mode 100644
index 000000000000..82e72778eb66
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6362-pinctrl.yaml
@@ -0,0 +1,224 @@
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
+  gpio-controller: true
+
+  '#gpio-cells':
+    description:
+      Specifies the pin number and flags, as defined in
+      include/dt-bindings/gpio/gpio.h
+    const: 2
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

