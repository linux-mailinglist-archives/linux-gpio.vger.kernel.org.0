Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9FB133F304
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 15:39:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbhCQOjC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 10:39:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232005AbhCQOi0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 10:38:26 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88C85C06175F;
        Wed, 17 Mar 2021 07:38:25 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id v4so2060764wrp.13;
        Wed, 17 Mar 2021 07:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/7vAITZlEaLjHUWKSkWkxXWCpuwb4dP0ys/FXFTF8gs=;
        b=DMIe+M6SW0aiz/u7NbqyPGmQS7UiN1oYFnx2SZb/aj7j1yPxtjfIn991jKPtbht77I
         OUZCMshdOz9gnO40qG6GWWVrAKLzNZM1C/pdY9spAjF2LvjG5DGqFBuzRroL3EyU2ntf
         v1O0P/V+0DfNQqPMXf3J2qOxj68tUuhjZADlLzyynqTWiiSqoI+1kD1pH5FwSqZhDsMd
         jV/Kllc8tghGV3V5VUAUHatJR5ftH3grFSANho9DoxpMru8petgJR3pWZdlFLMAcTdAO
         Z0Q/PUmEO4PParuKqpSlO8lxJqsMmc0RAMjD8d37flNGt0EWvJG/BrbR/gANoLGZaM8a
         spdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/7vAITZlEaLjHUWKSkWkxXWCpuwb4dP0ys/FXFTF8gs=;
        b=LTFpte5LcAWHMr+jiPm+I+UNrPkfbgIk/uWnugw3T6UT797zGGrwA9jfzrnhpjBRcx
         +0zaexY/J5vCM13pT7zBhwkDv+/kkvwVbnd3KleTl0UHaxfHLs6rFEveZlkpNxLUQQOu
         4X1jMAOLaiOl0cpHEqGF8Z9oiuIuwdgge6VDl4G6X+O5QoXoleWOobh7vN1RY2xDII+d
         NqQxYc2TomYNOVvACZYOigWWtzAI5PQm9/PmUNWzActov+EdIiA2REQUFTq2UJ3ClGTE
         1kfUsbwHbIxOy5OhFE2vfREeEPVe+LghfS0z2GYVS6YxyC7em8fmVfETL0cb2gXRHsH5
         4HjA==
X-Gm-Message-State: AOAM531fSYjJYRbZRvxG0vWENDdacqAm60BL1XHzom86NjlVX/awFniU
        2hT6mN2dtFJz2KRoZilQmjk=
X-Google-Smtp-Source: ABdhPJyShXjVgy3xaQ31ZbpOXBxJk5J405UgvwzCgoPU53dVaIxOitN7YSgELa3fwC9t69+W6O+XAg==
X-Received: by 2002:a05:6000:1819:: with SMTP id m25mr4706028wrh.169.1615991904247;
        Wed, 17 Mar 2021 07:38:24 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id a75sm2518948wme.10.2021.03.17.07.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:38:23 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 20/22] dt-bindings: add BCM6318 pincontroller binding documentation
Date:   Wed, 17 Mar 2021 15:38:01 +0100
Message-Id: <20210317143803.26127-21-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317143803.26127-1-noltari@gmail.com>
References: <20210317143803.26127-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the pincontrol core found in BCM6318 SoCs.

Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v8: add changes suggested by Rob Herring
 v7: add changes suggested by Rob Herring
 v6: add changes suggested by Rob Herring
 v5: change Documentation to dt-bindings in commit title
 v4: no changes
 v3: add new gpio node
 v2: remove interrupts

 .../pinctrl/brcm,bcm6318-pinctrl.yaml         | 145 ++++++++++++++++++
 1 file changed, 145 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yaml
new file mode 100644
index 000000000000..52c1490c45bf
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yaml
@@ -0,0 +1,145 @@
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
+description:
+  Bindings for Broadcom's BCM6318 memory-mapped pin controller.
+
+properties:
+  compatible:
+    const: brcm,bcm6318-pinctrl
+
+  reg:
+    maxItems: 2
+
+patternProperties:
+  '-pins$':
+    type: object
+    $ref: pinmux-node.yaml#
+
+    properties:
+      function:
+        $ref: "pinmux-node.yaml#/properties/function"
+        enum: [ ephy0_spd_led, ephy1_spd_led, ephy2_spd_led, ephy3_spd_led,
+                ephy0_act_led, ephy1_act_led, ephy2_act_led, ephy3_act_led,
+                serial_led_data, serial_led_clk, inet_act_led, inet_fail_led,
+                dsl_led, post_fail_led, wlan_wps_led, usb_pwron,
+                usb_device_led, usb_active ]
+
+      pins:
+        $ref: "pinmux-node.yaml#/properties/pins"
+        enum: [ gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7,
+                gpio8, gpio9, gpio10, gpio11, gpio12, gpio13, gpio40 ]
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
+      compatible = "brcm,bcm6318-pinctrl";
+      reg = <0x18 0x10>, <0x54 0x18>;
+
+      pinctrl_ephy0_spd_led: ephy0_spd_led-pins {
+        function = "ephy0_spd_led";
+        pins = "gpio0";
+      };
+
+      pinctrl_ephy1_spd_led: ephy1_spd_led-pins {
+        function = "ephy1_spd_led";
+        pins = "gpio1";
+      };
+
+      pinctrl_ephy2_spd_led: ephy2_spd_led-pins {
+        function = "ephy2_spd_led";
+        pins = "gpio2";
+      };
+
+      pinctrl_ephy3_spd_led: ephy3_spd_led-pins {
+        function = "ephy3_spd_led";
+        pins = "gpio3";
+      };
+
+      pinctrl_ephy0_act_led: ephy0_act_led-pins {
+        function = "ephy0_act_led";
+        pins = "gpio4";
+      };
+
+      pinctrl_ephy1_act_led: ephy1_act_led-pins {
+        function = "ephy1_act_led";
+        pins = "gpio5";
+      };
+
+      pinctrl_ephy2_act_led: ephy2_act_led-pins {
+        function = "ephy2_act_led";
+        pins = "gpio6";
+      };
+
+      pinctrl_ephy3_act_led: ephy3_act_led-pins {
+        function = "ephy3_act_led";
+        pins = "gpio7";
+      };
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
+        pins = "gpio8";
+      };
+
+      pinctrl_inet_fail_led: inet_fail_led-pins {
+        function = "inet_fail_led";
+        pins = "gpio9";
+      };
+
+      pinctrl_dsl_led: dsl_led-pins {
+        function = "dsl_led";
+        pins = "gpio10";
+      };
+
+      pinctrl_post_fail_led: post_fail_led-pins {
+        function = "post_fail_led";
+        pins = "gpio11";
+      };
+
+      pinctrl_wlan_wps_led: wlan_wps_led-pins {
+        function = "wlan_wps_led";
+        pins = "gpio12";
+      };
+
+      pinctrl_usb_pwron: usb_pwron-pins {
+        function = "usb_pwron";
+        pins = "gpio13";
+      };
+
+      pinctrl_usb_device_led: usb_device_led-pins {
+        function = "usb_device_led";
+        pins = "gpio13";
+      };
+
+      pinctrl_usb_active: usb_active-pins {
+        function = "usb_active";
+        pins = "gpio40";
+      };
+    };
-- 
2.20.1

