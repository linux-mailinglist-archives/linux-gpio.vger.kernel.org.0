Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9D132AD32
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:15:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383870AbhCBV2s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:28:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1835592AbhCBTSS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 14:18:18 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 046EAC061797;
        Tue,  2 Mar 2021 11:16:20 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id d11so21069884wrj.7;
        Tue, 02 Mar 2021 11:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=f+1uK/23EaM5hwRL1l81iawD2Ji1JU/s2x3SKaefDYE=;
        b=cmd8gp0wZlVjWMd08wEJ6p9Gi5B2r6jhEAllT3uzEFFRllc+gkY1oBP6yZojhAuIzT
         /N/f/M4eFPorC2fzzJLm6WZN9nN3rIHu9Hjsb0ghXanzBwW6m16NJvYoohdNYPZ8hGGS
         qLqieOuZ0tYkCa7HBpAmumNy9a6sxN/kVsGeGDqAVuFD10QZaIYSjb/0nuxfXUJHv8sP
         K68QAHa75U4CoOAznRkaNvVwjYGLRn/1vkAseRykjL7OcAFjtpqW8Ikt89z9ojf/77yN
         v56OrG3SnIc1KyOpPg29DWiXYdEEBSUa3O7ijumz49+/ncmpaB6Db+vFIHb+UdKXnmyz
         rDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f+1uK/23EaM5hwRL1l81iawD2Ji1JU/s2x3SKaefDYE=;
        b=IGJOynvA1aLSeTWZCaIIrY7DsDhq7p4h2axnXFPnlfX/5/effSs+bNkkxyz9NzJtm5
         9aIYwQ+Bkl1GGHXQ0Lc96e021l64q5fqh7qYi39570V4lVJVcnZuDGLwwSd5ftZGxG6g
         J3nLDkH80IJSYmSzgbm0bD4XUSlVKsl79zG9PwZaAzElaJ0yWlo+rtu3jJ5u2OtvXWPh
         fJLrIh3SKGSv3TgT4ncpewzSal7VLr505AtSLN09LjhjeqVBC7v5Yn7BNcFqwIcXsabO
         J/fYYlWegNtOm8nM5PLzPQ4Nv8oGUegOxwwwIeGC0vha0qgkxXoRNEwLnpNwH8hG1EX5
         kMdg==
X-Gm-Message-State: AOAM531+x6SkxNRjllfmuzVqYp/OI3CxnpNWYAbwZpmhSwTceaNMHqx4
        ijVRBpPKahC1fKSlRllD0sn/IlpCjCvy3A==
X-Google-Smtp-Source: ABdhPJyyFYWa7GtzXRm6ru/kN69NPC7Ida23XN34VctpeggRIEAK4AH2ihjF0GeFHPsflrwoir/rWg==
X-Received: by 2002:adf:b30f:: with SMTP id j15mr23669652wrd.132.1614712578708;
        Tue, 02 Mar 2021 11:16:18 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id l15sm3578862wmh.21.2021.03.02.11.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 11:16:17 -0800 (PST)
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
Subject: [PATCH v2 01/12] Documentation: add BCM6328 pincontroller binding documentation
Date:   Tue,  2 Mar 2021 20:16:02 +0100
Message-Id: <20210302191613.29476-2-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210302191613.29476-1-noltari@gmail.com>
References: <20210302191613.29476-1-noltari@gmail.com>
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
 v2: remove interrupts

 .../pinctrl/brcm,bcm6328-pinctrl.yaml         | 145 ++++++++++++++++++
 1 file changed, 145 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
new file mode 100644
index 000000000000..8b1201a763e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
@@ -0,0 +1,145 @@
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
+        compatible = "brcm,bcm6328-pinctrl";
+
+        gpio-controller;
+        #gpio-cells = <2>;
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

