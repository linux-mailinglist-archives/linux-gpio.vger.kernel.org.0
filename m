Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB3333B162
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 12:43:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbhCOLmu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 07:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbhCOLmX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 07:42:23 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54197C061574;
        Mon, 15 Mar 2021 04:42:23 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id e18so5520696wrt.6;
        Mon, 15 Mar 2021 04:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FrjVIRNvmorTfWmGREyH/5Ppc5xrd48THahdljOpQzU=;
        b=Gg361dwv+chwZLnWCEqLWwzNjueIVobzdVW/tfuemHv2dpVfNCuWLXxOPSoUruxjpF
         mktIUjQu7+Lq5FTYmb+hVt+eJKsGC24JhbBdsI5X4RRbo8KV/dJwfoUVUH9AijCXKZcy
         ZlFdn07vjNV8KJQM0vuOZhIb+pbPki9rKVyeMktURqqRHq/+vHSxQ1hdtoOfz+m8dUeU
         o15DvH/bFYafINvJrl4rc6O/3zhDzwqw4YRy30m/dxv1E8Zt/MG4nGJKJuK11MZcYJez
         6p1P4wAcTZ08gYXnuaHTDXDclmaAZuDPANgvLmeiXH5zB5u++OXsfYUCK1FdYOMJMAbn
         Po/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FrjVIRNvmorTfWmGREyH/5Ppc5xrd48THahdljOpQzU=;
        b=rY8viLyjfe0h73RWoRJaGkjQCU3n0XZA2tLjSf64cw2UXkR6WUaTu8GYdeDc464pYN
         mL34dshBPWcR1xECrOqDte2FabwZ/jXbNh6hzWhWzXmRzhbPaD9u+MbJPPprmPjNmlsA
         vuVBs338zONnzn1D726mXRJO0zoFrSnvk98cVqTip3jIVfCqR9PWaMw+qmQCoeWkOy/G
         0UvzfGGPF3oMLw0fucd++e61jQZD3Suo7frqM2ETPUTWG3Kbq1QlFg96lFUoQvNnzOU1
         EioXmOLLbWugkMebNZrMfew05CTE94NYdYwYyHuwy957vkJxMT49H3EH1dA4hvKmBr16
         fsiA==
X-Gm-Message-State: AOAM533XCZJtWBqMEvIfnANj1RFGgfF3Ocef8kM5PG2nRryBCFMm+q1Q
        tiNpEY0qYT4XzuZFuXYsi0c=
X-Google-Smtp-Source: ABdhPJxgwH3rLLtuT57M1ND1g1GvG52e35cVY+DMfd68tASLQNOerluYOCLc2kO0LsqM9SBt2yMesg==
X-Received: by 2002:adf:e84f:: with SMTP id d15mr26963426wrn.394.1615808541986;
        Mon, 15 Mar 2021 04:42:21 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id v189sm12648187wme.39.2021.03.15.04.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 04:42:21 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 05/22] dt-bindings: add BCM6328 pincontroller binding documentation
Date:   Mon, 15 Mar 2021 12:41:57 +0100
Message-Id: <20210315114214.3096-6-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210315114214.3096-1-noltari@gmail.com>
References: <20210315114214.3096-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the pincontrol core found in BCM6328 SoCs.

Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v7: add changes suggested by Rob Herring
 v6: add changes suggested by Rob Herring
 v5: change Documentation to dt-bindings in commit title
 v4: no changes
 v3: add new gpio node
 v2: remove interrupts

 .../pinctrl/brcm,bcm6328-pinctrl.yaml         | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
new file mode 100644
index 000000000000..e1ecdc578f32
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
@@ -0,0 +1,132 @@
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
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '^.*-pins$':
+    if:
+      type: object
+    then:
+      properties:
+        function:
+          $ref: "pinmux-node.yaml#/properties/function"
+          enum: [ serial_led_data, serial_led_clk, inet_act_led, pcie_clkreq,
+                  led, ephy0_act_led, ephy1_act_led, ephy2_act_led,
+                  ephy3_act_led, hsspi_cs1, usb_device_port, usb_host_port ]
+
+        pins:
+          $ref: "pinmux-node.yaml#/properties/pins"
+          enum: [ gpio6, gpio7, gpio11, gpio16, gpio17, gpio18, gpio19,
+                  gpio20, gpio25, gpio26, gpio27, gpio28, hsspi_cs1,
+                  usb_port1 ]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl@18 {
+      compatible = "brcm,bcm6328-pinctrl";
+      reg = <0x18 0x10>;
+
+      pinctrl_serial_led: serial_led-pins {
+        pinctrl_serial_led_data: serial_led_data-pins {
+          function = "serial_led_data";
+          pins = "gpio6";
+        };
+
+        pinctrl_serial_led_clk: serial_led_clk-pins {
+          function = "serial_led_clk";
+          pins = "gpio7";
+        };
+      };
+
+      pinctrl_inet_act_led: inet_act_led-pins {
+        function = "inet_act_led";
+        pins = "gpio11";
+      };
+
+      pinctrl_pcie_clkreq: pcie_clkreq-pins {
+        function = "pcie_clkreq";
+        pins = "gpio16";
+      };
+
+      pinctrl_ephy0_spd_led: ephy0_spd_led-pins {
+        function = "led";
+        pins = "gpio17";
+      };
+
+      pinctrl_ephy1_spd_led: ephy1_spd_led-pins {
+        function = "led";
+        pins = "gpio18";
+      };
+
+      pinctrl_ephy2_spd_led: ephy2_spd_led-pins {
+        function = "led";
+        pins = "gpio19";
+      };
+
+      pinctrl_ephy3_spd_led: ephy3_spd_led-pins {
+        function = "led";
+        pins = "gpio20";
+      };
+
+      pinctrl_ephy0_act_led: ephy0_act_led-pins {
+        function = "ephy0_act_led";
+        pins = "gpio25";
+      };
+
+      pinctrl_ephy1_act_led: ephy1_act_led-pins {
+        function = "ephy1_act_led";
+        pins = "gpio26";
+      };
+
+      pinctrl_ephy2_act_led: ephy2_act_led-pins {
+        function = "ephy2_act_led";
+        pins = "gpio27";
+      };
+
+      pinctrl_ephy3_act_led: ephy3_act_led-pins {
+        function = "ephy3_act_led";
+        pins = "gpio28";
+      };
+
+      pinctrl_hsspi_cs1: hsspi_cs1-pins {
+        function = "hsspi_cs1";
+        pins = "hsspi_cs1";
+      };
+
+      pinctrl_usb_port1_device: usb_port1_device-pins {
+        function = "usb_device_port";
+        pins = "usb_port1";
+      };
+
+      pinctrl_usb_port1_host: usb_port1_host-pins {
+        function = "usb_host_port";
+        pins = "usb_port1";
+      };
+    };
-- 
2.20.1

