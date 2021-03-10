Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50683333CF8
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 13:56:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232745AbhCJMzf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 07:55:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232627AbhCJMzL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 07:55:11 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8244AC061760;
        Wed, 10 Mar 2021 04:55:11 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id h98so23158731wrh.11;
        Wed, 10 Mar 2021 04:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3elpHbMsS1WBfSFAydPMxxw74aIS3Ok7dVe56YT36mI=;
        b=i4HEVfF/gGkHy67uyxLs8k+X16jEW6NY4+GhzvHfSsbQDakE6iIX/17OcxA4JhCChx
         e10mNazqfbj8wETpblue4bMhvNqIxkdi5WlC3RRSgiCUa80METX60S8I3/q/rpKoVSsI
         MZfEnqTAJHHEqCqTzNA7VAwDK+beqLhKmPy3el/lkj27/UNV0aiCX8Hp+xeV5fO1QahV
         P3UNMDfTH1JcDkK5eU645Q+ULhoyYd9oyoF8Jppfo2hwyxn8baK5a2veT0xCmSL1x9L8
         aU9GIKZ9XTKQxvnsnyWgNZoL28AnuW/bJXbioBYJobk1eEa+2J06OBwE3tFX1QZtb1iS
         Smgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3elpHbMsS1WBfSFAydPMxxw74aIS3Ok7dVe56YT36mI=;
        b=mzuTmVPdvu8V79GsZUWhnApODXIp80ghly65yhRDmCQuG4hf/dFg8yCGCvHMsuCmDV
         s8IcdCDJsoPCZ2grmZDcpEKaBRQYMqwaH8b5PGT3FaBIGPxiVHHy8Q0k9lycNLUr73Cx
         IqXlps3AyoxyZiGZvyK0zvtQe/Itgte1GJILrYR4dADLKDeNtsc1HzLaN6RnmHwS0PdP
         3mEddpJS/vxz0hz2WVJaW17dfzpwM++qYftXWWqqTpaGU3s/MzrfHPFGfIct22B1d8/d
         0PR++R7p2NxoQj/TrlOXS5CyQGt6eeJfnUjWsQwR2yyH54IaLHq1MaCoNGuE4aJ2lzMt
         PS8w==
X-Gm-Message-State: AOAM532QyHOjflthgtRQs9KzMhpcOazBrrO/dZnDFBQ4HBxsg3bJbene
        v4Uv5htAATOOz7wWDk+lcggy3hryUmSStA==
X-Google-Smtp-Source: ABdhPJxceUWRyaykxdy++Uvrkd+zBH54/yQQxXXg6sCaai/FaN6hB6xqVRaRvRtPQrktRISs7C42AQ==
X-Received: by 2002:a5d:6312:: with SMTP id i18mr3447771wru.149.1615380910219;
        Wed, 10 Mar 2021 04:55:10 -0800 (PST)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id v6sm29403398wrx.32.2021.03.10.04.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 04:55:10 -0800 (PST)
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
Subject: [PATCH v6 04/15] dt-bindings: add BCM6328 pincontroller binding documentation
Date:   Wed, 10 Mar 2021 13:54:52 +0100
Message-Id: <20210310125504.31886-5-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310125504.31886-1-noltari@gmail.com>
References: <20210310125504.31886-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the pincontrol core found in BCM6328 SoCs.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v6: add changes suggested by Rob Herring
 v5: change Documentation to dt-bindings in commit title
 v4: no changes
 v3: add new gpio node
 v2: remove interrupts

 .../pinctrl/brcm,bcm6328-pinctrl.yaml         | 174 ++++++++++++++++++
 1 file changed, 174 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
new file mode 100644
index 000000000000..471f6efa1754
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
@@ -0,0 +1,174 @@
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
+  gpio:
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
+    additionalProperties: false
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
+  - gpio
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio_cntl@10000080 {
+      compatible = "brcm,bcm6328-gpio-controller", "syscon", "simple-mfd";
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
+        pinctrl_serial_led: serial_led-pins {
+          pinctrl_serial_led_data: serial_led_data-pins {
+            function = "serial_led_data";
+            pins = "gpio6";
+          };
+
+          pinctrl_serial_led_clk: serial_led_clk-pins {
+            function = "serial_led_clk";
+            pins = "gpio7";
+          };
+        };
+
+        pinctrl_inet_act_led: inet_act_led-pins {
+          function = "inet_act_led";
+          pins = "gpio11";
+        };
+
+        pinctrl_pcie_clkreq: pcie_clkreq-pins {
+          function = "pcie_clkreq";
+          pins = "gpio16";
+        };
+
+        pinctrl_ephy0_spd_led: ephy0_spd_led-pins {
+          function = "led";
+          pins = "gpio17";
+        };
+
+        pinctrl_ephy1_spd_led: ephy1_spd_led-pins {
+          function = "led";
+          pins = "gpio18";
+        };
+
+        pinctrl_ephy2_spd_led: ephy2_spd_led-pins {
+          function = "led";
+          pins = "gpio19";
+        };
+
+        pinctrl_ephy3_spd_led: ephy3_spd_led-pins {
+          function = "led";
+          pins = "gpio20";
+        };
+
+        pinctrl_ephy0_act_led: ephy0_act_led-pins {
+          function = "ephy0_act_led";
+          pins = "gpio25";
+        };
+
+        pinctrl_ephy1_act_led: ephy1_act_led-pins {
+          function = "ephy1_act_led";
+          pins = "gpio26";
+        };
+
+        pinctrl_ephy2_act_led: ephy2_act_led-pins {
+          function = "ephy2_act_led";
+          pins = "gpio27";
+        };
+
+        pinctrl_ephy3_act_led: ephy3_act_led-pins {
+          function = "ephy3_act_led";
+          pins = "gpio28";
+        };
+
+        pinctrl_hsspi_cs1: hsspi_cs1-pins {
+          function = "hsspi_cs1";
+          pins = "hsspi_cs1";
+        };
+
+        pinctrl_usb_port1_device: usb_port1_device-pins {
+          function = "usb_device_port";
+          pins = "usb_port1";
+        };
+
+        pinctrl_usb_port1_host: usb_port1_host-pins {
+          function = "usb_host_port";
+          pins = "usb_port1";
+        };
+      };
+    };
-- 
2.20.1

