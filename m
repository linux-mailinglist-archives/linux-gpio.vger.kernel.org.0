Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A70B832CF02
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 09:59:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236995AbhCDI6H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 03:58:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236978AbhCDI57 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 03:57:59 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA55C061761;
        Thu,  4 Mar 2021 00:57:19 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id w7so7284977wmb.5;
        Thu, 04 Mar 2021 00:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yQ6gpjABo8+ZcOfCkcbWgRpU81gfkOshjEp0QdpaCrw=;
        b=rOdXh4sWwu1uxY/8s9SeS8i0r4u7lrMUFdJi7vJ3JtQoIMHC9Dk/VvSZZ7f4Ud2bop
         ux13bFpV9hZUY4pUAxKM4Xc3c5VQZUN3pe92xbB/Zz1npEWT36hCqZYs8LCGqwsZkjbU
         sNx0wuixjfZWUVELIdeOVrTFvBlB+S+sf5/VtF6vqKi81QLNzNu/mnhQq4LrzdtdYvd7
         7FxLqO01Sup9aNIKinnY7v8DFVrxrGNzZU8RgH/OEAHsQ1TPUDWyrsHZRZQpMFzN88ZN
         uM0ER5OhVP/ql4dAA/g+Y0wLbKV6n2vkF9xXmiVPRKdpe4ta7kzg7/vFRpubYmPl4z4W
         5ozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yQ6gpjABo8+ZcOfCkcbWgRpU81gfkOshjEp0QdpaCrw=;
        b=CmV4Sg6J1+GVt/JR/UBWFV0qh7oklr6+zOVSXes+kOmriqb4KqUuZkGx4/4QYFYfEk
         Q7g/ugD/ZYrvSHBmKYuxofQOXGhNDRmlmwZUaahfDQvqIIWSgDa72+BicNEk+Dge1COl
         AUBVtVNXwuiYN5dvUa6x5lD0D/YoKVjosnDyrP0PFcYacqGwnhvusyw9O/1VFLwPJa9H
         k09JNF6j6qJqR15AYdkj3UolN26B7Qx/zK/U7ASq8D5HEmRPW70D6FTZj7fwrmRa+mf+
         9bpZ3w0QpXT7BeXE5CWkZ1ud/BnU22Fre5XBTW18SOfMCP2+p0L1S7qsyEHlFIY+TzXn
         p9qQ==
X-Gm-Message-State: AOAM530fmj8ihhYfvdCzhUbMjKRIcETo2pzK0IOICGdXJ4Pf11wmzm1z
        FP4uw8aP7Juh9i0Oexq1UZM=
X-Google-Smtp-Source: ABdhPJwTIn+Zlb1Kqloce2TlRPCkx4+Co1ANWnnxufvqYpaM1W9Lzv+Ya+GACU5LYSwib1Le8IVO6g==
X-Received: by 2002:a05:600c:2053:: with SMTP id p19mr2762091wmg.87.1614848237933;
        Thu, 04 Mar 2021 00:57:17 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id q15sm2828976wrx.56.2021.03.04.00.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 00:57:17 -0800 (PST)
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
Subject: [PATCH v4 04/15] Documentation: add BCM6328 pincontroller binding documentation
Date:   Thu,  4 Mar 2021 09:56:59 +0100
Message-Id: <20210304085710.7128-5-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210304085710.7128-1-noltari@gmail.com>
References: <20210304085710.7128-1-noltari@gmail.com>
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
 v4: no changes
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

