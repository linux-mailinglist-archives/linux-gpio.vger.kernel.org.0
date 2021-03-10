Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF035333D0A
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 13:56:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232845AbhCJMzl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 07:55:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232712AbhCJMzU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 07:55:20 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00A7CC061760;
        Wed, 10 Mar 2021 04:55:19 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id r10-20020a05600c35cab029010c946c95easo10640054wmq.4;
        Wed, 10 Mar 2021 04:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=y8u4kFT2qxM7FYtrCCD41fyv9/nnLIXy8on97Apq5dE=;
        b=ZRkKSZnhf6UdaJSKh6/2gcPW5AiP4mmd+WzUJO4pGL01xHmK7Bj/aTAP+IalUOFdDZ
         0fvw5u77sTiT4gcUlhEf+So141VPhYHfY3/U9AUm554J2MAxnhM5Vo0rz0Oc50PrOPHe
         wGNAtmEHnOAl7omJAYm/n3gPQgpGQN3MNkmH5lUP2i1b6sDA3ntl8wBpgOyuZfnk+7RY
         rk901sHX8vlyEw1hY/ZuwrLiHs9K8lxTCUkmtAagZcMBQ2DEfO8M3HGb0EdrkdfpMIGW
         BzkCGlssxYbGuhhMhfv4ck9OezFFNOfuYvKGvyICqGv/oyiS74fq+2AV/g7seS8ubi2e
         Fg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y8u4kFT2qxM7FYtrCCD41fyv9/nnLIXy8on97Apq5dE=;
        b=XLZCCbllpzqfGWYnmo3c/yRKhsORGnGtW6UVC7Ap3YlwOfvwR/nWh8jish9NVO0Wbk
         ezWFsKx1X+mr8OrYDGnspbbN8B/HtKyah7HgQ7Ts4b77bnac8sdbTw4e3u8f4SnhQtcK
         DeVDsZSBe2dmVWvfRIc9FGBqcno03VE+fVceX/r7mufmNLuBlNNVscsKS5LrEBWMhzzU
         lNK3ZGGPSoGhSxmBxwWmIsHu+an7CX82rK8UKcYPuzFdWgEv7OO+SJs90xrnIj9yIwXV
         i2gUviEZlMPENMr4w8EkUTwiA6sp5fkyFhp6vkq6lBw5Ehh+oQ3Rxm63vyc0adBLo7n6
         tWLg==
X-Gm-Message-State: AOAM531CBUedPO2V24fJwnKM85pv3TN7Hw1FxdkNwvee1so1JpP7E48s
        OVz8z5Qz8ZZqSSBuG+DnwLo=
X-Google-Smtp-Source: ABdhPJwNW57QpphtdWVVpEGbUaIk8dFMTC6Z8su8Zzs5LouB5u15zaOSha1HeEjVd8ZBQgzfBs0Jtw==
X-Received: by 2002:a1c:c906:: with SMTP id f6mr3197968wmb.128.1615380918748;
        Wed, 10 Mar 2021 04:55:18 -0800 (PST)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id v6sm29403398wrx.32.2021.03.10.04.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 04:55:18 -0800 (PST)
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
Subject: [PATCH v6 14/15] dt-bindings: add BCM6318 pincontroller binding documentation
Date:   Wed, 10 Mar 2021 13:55:02 +0100
Message-Id: <20210310125504.31886-15-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310125504.31886-1-noltari@gmail.com>
References: <20210310125504.31886-1-noltari@gmail.com>
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
 v6: add changes suggested by Rob Herring
 v5: change Documentation to dt-bindings in commit title
 v4: no changes
 v3: add new gpio node
 v2: remove interrupts

 .../pinctrl/brcm,bcm6318-pinctrl.yaml         | 190 ++++++++++++++++++
 1 file changed, 190 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yaml
new file mode 100644
index 000000000000..6b607bd8d003
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yaml
@@ -0,0 +1,190 @@
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
+  gpio:
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
+          enum: [ ephy0_spd_led, ephy1_spd_led, ephy2_spd_led, ephy3_spd_led,
+                  ephy0_act_led, ephy1_act_led, ephy2_act_led, ephy3_act_led,
+                  serial_led_data, serial_led_clk, inet_act_led, inet_fail_led,
+                  dsl_led, post_fail_led, wlan_wps_led, usb_pwron,
+                  usb_device_led, usb_active ]
+
+        pins:
+          $ref: "pinmux-node.yaml#/properties/pins"
+          enum: [ gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7,
+                  gpio8, gpio9, gpio10, gpio11, gpio12, gpio13, gpio40 ]
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
+      compatible = "brcm,bcm6318-gpio-controller", "syscon", "simple-mfd";
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
+        pinctrl_ephy0_spd_led: ephy0_spd_led-pins {
+          function = "ephy0_spd_led";
+          pins = "gpio0";
+        };
+
+        pinctrl_ephy1_spd_led: ephy1_spd_led-pins {
+          function = "ephy1_spd_led";
+          pins = "gpio1";
+        };
+
+        pinctrl_ephy2_spd_led: ephy2_spd_led-pins {
+          function = "ephy2_spd_led";
+          pins = "gpio2";
+        };
+
+        pinctrl_ephy3_spd_led: ephy3_spd_led-pins {
+          function = "ephy3_spd_led";
+          pins = "gpio3";
+        };
+
+        pinctrl_ephy0_act_led: ephy0_act_led-pins {
+          function = "ephy0_act_led";
+          pins = "gpio4";
+        };
+
+        pinctrl_ephy1_act_led: ephy1_act_led-pins {
+          function = "ephy1_act_led";
+          pins = "gpio5";
+        };
+
+        pinctrl_ephy2_act_led: ephy2_act_led-pins {
+          function = "ephy2_act_led";
+          pins = "gpio6";
+        };
+
+        pinctrl_ephy3_act_led: ephy3_act_led-pins {
+          function = "ephy3_act_led";
+          pins = "gpio7";
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
+          pins = "gpio8";
+        };
+
+        pinctrl_inet_fail_led: inet_fail_led-pins {
+          function = "inet_fail_led";
+          pins = "gpio9";
+        };
+
+        pinctrl_dsl_led: dsl_led-pins {
+          function = "dsl_led";
+          pins = "gpio10";
+        };
+
+        pinctrl_post_fail_led: post_fail_led-pins {
+          function = "post_fail_led";
+          pins = "gpio11";
+        };
+
+        pinctrl_wlan_wps_led: wlan_wps_led-pins {
+          function = "wlan_wps_led";
+          pins = "gpio12";
+        };
+
+        pinctrl_usb_pwron: usb_pwron-pins {
+          function = "usb_pwron";
+          pins = "gpio13";
+        };
+
+        pinctrl_usb_device_led: usb_device_led-pins {
+          function = "usb_device_led";
+          pins = "gpio13";
+        };
+
+        pinctrl_usb_active: usb_active-pins {
+          function = "usb_active";
+          pins = "gpio40";
+        };
+      };
+    };
-- 
2.20.1

