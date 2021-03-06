Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B487932FBA1
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Mar 2021 16:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbhCFP5y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 6 Mar 2021 10:57:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231139AbhCFP51 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 6 Mar 2021 10:57:27 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 334FEC06175F;
        Sat,  6 Mar 2021 07:57:26 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id 7so5976745wrz.0;
        Sat, 06 Mar 2021 07:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hv9X2XR12q7hw1LPWVxEBEaArtBJIu7+CWBRNZ4nqfo=;
        b=TDvVd7e9xHVeGoUUk4eumU+ILmGOEME6LQBIwoVVYMPPtrlEVvHWKj9p2eeaZQO6Pu
         1XGPpFKs1VvBxXGhVpZMUR3Km35ATH7lykSp7ShelrRR1EPJHY/i+e71Hlut82FnJQxw
         1QGIObDht1kFKw7BjC4y/G1t5qvtj80J6ACayr72vc5WpSsD6v+F8S2Hd81aItfw9m6H
         lQvDCNNFUE3s7mOUGpX7RzKZwAbuwCbmI13uHhJN5+/RbvQ0KEtx1Alke2E9bs8NvwKB
         vHICsP4jYj/yidiAuMa3HnPHSoK4OdVehFhpipN+S5iGD6wUllEmgu/19WigymV08Rt0
         KcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hv9X2XR12q7hw1LPWVxEBEaArtBJIu7+CWBRNZ4nqfo=;
        b=ivNHJnr9vfmhcjtfu7tkQXH/iSLgp/OZnka309pHLwmXJd8BTHlhaQ9L+tPIMzrNbY
         XodhJY90+5byxUgWFOgkc+6kPR3twgM6g+sIXNEJG0MJ5EdKYsHf0l50mmvwRJdQbxuf
         exUeyHRPnLaIkkLD5Ari0TU8RLmftZ0/s28K8/M9abOv7LPKiNn5e1qgKbOw/CYij4D6
         fEXYoY4D8FR6vLtVOH6ExXRfZ4uuY7YwgVwRhtPNOQMWJQ2ElOhHGlGav2UtPx/INfQi
         LGZRV3JzwSnNuE/eL0IFxDGzQedimNAqj9gVKHlX2mWroz8K2vhOWk28SMr2mseZtByO
         10nQ==
X-Gm-Message-State: AOAM53214RlfjmuDGgkDZBibZ5tqjOCRp6IKYCc+sUwf39/4WYPpCwER
        UkTrEy1J2LnGQXbcpzOSgWsKcJmSiGQjhQ==
X-Google-Smtp-Source: ABdhPJyREW9pZD75rkk1/Oye+wKN64U8PWcjXsR1UvtPjuvF3Ba8ghF62dxzbTtSLBtB5othy8LL5A==
X-Received: by 2002:adf:f3c2:: with SMTP id g2mr14914649wrp.300.1615046244931;
        Sat, 06 Mar 2021 07:57:24 -0800 (PST)
Received: from skynet.lan (224.red-2-138-103.dynamicip.rima-tde.net. [2.138.103.224])
        by smtp.gmail.com with ESMTPSA id p6sm9315188wru.2.2021.03.06.07.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 07:57:24 -0800 (PST)
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
Subject: [PATCH v5 14/15] dt-bindings: add BCM6318 pincontroller binding documentation
Date:   Sat,  6 Mar 2021 16:57:11 +0100
Message-Id: <20210306155712.4298-15-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210306155712.4298-1-noltari@gmail.com>
References: <20210306155712.4298-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the pincontrol core found in BCM6318 SoCs.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v5: change Documentation to dt-bindings in commit title
 v4: no changes
 v3: add new gpio node
 v2: remove interrupts

 .../pinctrl/brcm,bcm6318-pinctrl.yaml         | 187 ++++++++++++++++++
 1 file changed, 187 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yaml
new file mode 100644
index 000000000000..979b9d06de15
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yaml
@@ -0,0 +1,187 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/brcm,bcm6318-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6318 pin controller
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
+    const: brcm,bcm6318-pinctrl
+
+patternProperties:
+  '^gpio$':
+    type: object
+    properties:
+      compatible:
+        const: brcm,bcm6318-gpio
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
+          enum: [ ephy0_spd_led, ephy1_spd_led, ephy2_spd_led, ephy3_spd_led,
+                  ephy0_act_led, ephy1_act_led, ephy2_act_led, ephy3_act_led,
+                  serial_led_data, serial_led_clk, inet_act_led, inet_fail_led,
+                  dsl_led, post_fail_led, wlan_wps_led, usb_pwron,
+                  usb_device_led, usb_active ]
+
+        pins:
+          $ref: "/schemas/types.yaml#/definitions/string"
+          enum: [ gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7,
+                  gpio8, gpio9, gpio10, gpio11, gpio12, gpio13, gpio40 ]
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
+        compatible = "brcm,bcm6318-pinctrl";
+
+        gpio {
+          compatible = "brcm,bcm6318-gpio";
+          data = <0xc>;
+          dirout = <0x4>;
+
+          gpio-controller;
+          gpio-ranges = <&pinctrl 0 0 50>;
+          #gpio-cells = <2>;
+        };
+
+        pinctrl_ephy0_spd_led: ephy0_spd_led {
+          function = "ephy0_spd_led";
+          pins = "gpio0";
+        };
+
+        pinctrl_ephy1_spd_led: ephy1_spd_led {
+          function = "ephy1_spd_led";
+          pins = "gpio1";
+        };
+
+        pinctrl_ephy2_spd_led: ephy2_spd_led {
+          function = "ephy2_spd_led";
+          pins = "gpio2";
+        };
+
+        pinctrl_ephy3_spd_led: ephy3_spd_led {
+          function = "ephy3_spd_led";
+          pins = "gpio3";
+        };
+
+        pinctrl_ephy0_act_led: ephy0_act_led {
+          function = "ephy0_act_led";
+          pins = "gpio4";
+        };
+
+        pinctrl_ephy1_act_led: ephy1_act_led {
+          function = "ephy1_act_led";
+          pins = "gpio5";
+        };
+
+        pinctrl_ephy2_act_led: ephy2_act_led {
+          function = "ephy2_act_led";
+          pins = "gpio6";
+        };
+
+        pinctrl_ephy3_act_led: ephy3_act_led {
+          function = "ephy3_act_led";
+          pins = "gpio7";
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
+          pins = "gpio8";
+        };
+
+        pinctrl_inet_fail_led: inet_fail_led {
+          function = "inet_fail_led";
+          pins = "gpio9";
+        };
+
+        pinctrl_dsl_led: dsl_led {
+          function = "dsl_led";
+          pins = "gpio10";
+        };
+
+        pinctrl_post_fail_led: post_fail_led {
+          function = "post_fail_led";
+          pins = "gpio11";
+        };
+
+        pinctrl_wlan_wps_led: wlan_wps_led {
+          function = "wlan_wps_led";
+          pins = "gpio12";
+        };
+
+        pinctrl_usb_pwron: usb_pwron {
+          function = "usb_pwron";
+          pins = "gpio13";
+        };
+
+        pinctrl_usb_device_led: usb_device_led {
+          function = "usb_device_led";
+          pins = "gpio13";
+        };
+
+        pinctrl_usb_active: usb_active {
+          function = "usb_active";
+          pins = "gpio40";
+        };
+      };
+    };
-- 
2.20.1

