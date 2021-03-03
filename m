Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 243D732C7E0
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:12:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242006AbhCDAdE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:33:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239899AbhCCPLo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 10:11:44 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E88DDC061793;
        Wed,  3 Mar 2021 06:23:15 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id k66so6520889wmf.1;
        Wed, 03 Mar 2021 06:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mrF7YuY2e0TOKUItC+mcZ8du9RTkpgqp0UmvueCRZj0=;
        b=c9OPNFW96sC3Ljr5VRohzpthUKhLoBQNV0Ud1izbaXIO/VmkZpy1N7RAtuFHwABPOZ
         COuCbXxZc2qudAgWJuSUfcUVhYklOROor+ltSoD9i4GR6BuM8ttFIqID4PbEgbgXJxuc
         gpf0T/v6k4Z9AtCwK6ch3m1CB8nTqySbEV6JeMTYSD2RWHF8d5Oi4h2gmBoi2xVMPZ5f
         Jd23Zb1PRfvRvWozUHUrFf0UQ0LybaaU8H0TUdJShyMZKK4GTDMt+UVKH+FkE8lRhlda
         4WRZvhS0dYsxPFPit0yV4JZ0ry35hvXJghurdycS/sCxXcHPltbo3VtcEhsqF9kGwQoy
         Shkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mrF7YuY2e0TOKUItC+mcZ8du9RTkpgqp0UmvueCRZj0=;
        b=gUvIhbFmboO3Ps9gopf1uStbzfL/+Vrv73aw3cfjiysdXfcGXhQeSI3dTEPSIQK3g8
         2YikntIdKsw8zeSpNj1mCCPl2s0Bi50JaXMLkkPFrL5y12xJbxP9pjBQ4zd8ki+oIl9O
         TTqM/taKfMHaT4Iy4vdeY0oFOFucZCBMkRouw1UJkXprpoFXCrH1QrL5PdWw8yRcO04c
         e7p5HRAm/LviEBnhOlDIJgfEHkTAuazIAozUr06fmzbbniVTfC+pjy1GvPV61nxWK1d9
         NshJ8/Mdov+EerDjiRHwrxWyGkjoFOBI0uMOE+4QRFI1xkRe+UydhDMqt5RXRz16yONY
         fxFw==
X-Gm-Message-State: AOAM531IK8r1Bbe60qBjiclYAq4sJWo1Kv2hh9AJhW5qim1kelukZ+NR
        9WxNPj8sLXSDxTZW9bHbKqQ=
X-Google-Smtp-Source: ABdhPJzM8bUQnu5SaPHBoXZ2vOcLrH/dugJWK4316stWD4ZpOUprodKY+9/dW9idagvynra9nZZLWA==
X-Received: by 2002:a1c:4b15:: with SMTP id y21mr9577314wma.94.1614781394628;
        Wed, 03 Mar 2021 06:23:14 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id b15sm7876219wmd.41.2021.03.03.06.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 06:23:14 -0800 (PST)
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
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 03/14] Documentation: add BCM6328 pincontroller binding documentation
Date:   Wed,  3 Mar 2021 15:22:59 +0100
Message-Id: <20210303142310.6371-4-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210303142310.6371-1-noltari@gmail.com>
References: <20210303142310.6371-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the pincontrol core found in BCM6328 SoCs.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 v3: add new gpio node
 v2: remove interrupts

 .../pinctrl/brcm,bcm6328-pinctrl.yaml         | 171 ++++++++++++++++++
 1 file changed, 171 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
new file mode 100644
index 000000000000..d4e3c7897f19
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
@@ -0,0 +1,171 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/brcm,bcm6328-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6328 pin controller
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
+    const: brcm,bcm6328-pinctrl
+
+patternProperties:
+  '^gpio$':
+    type: object
+    properties:
+      compatible:
+        const: brcm,bcm6328-gpio
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
+          enum: [ serial_led_data, serial_led_clk, inet_act_led, pcie_clkreq,
+                  led, ephy0_act_led, ephy1_act_led, ephy2_act_led,
+                  ephy3_act_led, hsspi_cs1, usb_device_port, usb_host_port ]
+
+        pins:
+          $ref: "/schemas/types.yaml#/definitions/string"
+          enum: [ gpio6, gpio7, gpio11, gpio16, gpio17, gpio18, gpio19,
+                  gpio20, gpio25, gpio26, gpio27, gpio28, hsspi_cs1,
+                  usb_port1 ]
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
+        compatible = "brcm,bcm6328-pinctrl";
+
+        gpio {
+          compatible = "brcm,bcm6328-gpio";
+          data = <0xc>;
+          dirout = <0x4>;
+
+          gpio-controller;
+          gpio-ranges = <&pinctrl 0 0 32>;
+          #gpio-cells = <2>;
+        };
+
+        pinctrl_serial_led: serial_led {
+          pinctrl_serial_led_data: serial_led_data {
+            function = "serial_led_data";
+            pins = "gpio6";
+          };
+
+          pinctrl_serial_led_clk: serial_led_clk {
+            function = "serial_led_clk";
+            pins = "gpio7";
+          };
+        };
+
+        pinctrl_inet_act_led: inet_act_led {
+          function = "inet_act_led";
+          pins = "gpio11";
+        };
+
+        pinctrl_pcie_clkreq: pcie_clkreq {
+          function = "pcie_clkreq";
+          pins = "gpio16";
+        };
+
+        pinctrl_ephy0_spd_led: ephy0_spd_led {
+          function = "led";
+          pins = "gpio17";
+        };
+
+        pinctrl_ephy1_spd_led: ephy1_spd_led {
+          function = "led";
+          pins = "gpio18";
+        };
+
+        pinctrl_ephy2_spd_led: ephy2_spd_led {
+          function = "led";
+          pins = "gpio19";
+        };
+
+        pinctrl_ephy3_spd_led: ephy3_spd_led {
+          function = "led";
+          pins = "gpio20";
+        };
+
+        pinctrl_ephy0_act_led: ephy0_act_led {
+          function = "ephy0_act_led";
+          pins = "gpio25";
+        };
+
+        pinctrl_ephy1_act_led: ephy1_act_led {
+          function = "ephy1_act_led";
+          pins = "gpio26";
+        };
+
+        pinctrl_ephy2_act_led: ephy2_act_led {
+          function = "ephy2_act_led";
+          pins = "gpio27";
+        };
+
+        pinctrl_ephy3_act_led: ephy3_act_led {
+          function = "ephy3_act_led";
+          pins = "gpio28";
+        };
+
+        pinctrl_hsspi_cs1: hsspi_cs1 {
+          function = "hsspi_cs1";
+          pins = "hsspi_cs1";
+        };
+
+        pinctrl_usb_port1_device: usb_port1_device {
+          function = "usb_device_port";
+          pins = "usb_port1";
+        };
+
+        pinctrl_usb_port1_host: usb_port1_host {
+          function = "usb_host_port";
+          pins = "usb_port1";
+        };
+      };
+    };
-- 
2.20.1

