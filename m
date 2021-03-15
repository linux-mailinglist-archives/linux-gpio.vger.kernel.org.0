Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBD9633B188
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 12:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbhCOLnA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 07:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbhCOLmi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 07:42:38 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D66FC061574;
        Mon, 15 Mar 2021 04:42:38 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id g20so7930920wmk.3;
        Mon, 15 Mar 2021 04:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=64UAUtVrnB3eLs0Hexw/cfQ3HiK7C2gkG1UaNO+bthQ=;
        b=L9a/F92FiR8zZkoFOoUc4pRc5hnWrgvRkJQGeTKst4hSFO3D7FUj5cdD6A29hbhpGZ
         fXfrx8bcPYqMA+fGQj3oEju/TaCn0KHg6Cb/OKsB08f2vKuTF9fo82DT/sDk8ejKG/bN
         oM+9olz+qTlnQJvuDapLYGnCN4zcqC/tF+lZHBAUUp2u8D19uhVwuEvPUjyc/9oKNy+w
         THYkhBsLHDM8+sTHnXb8KCTEm+oMVkJovkaORppAZf9fMPPHMc4xqax2L3By7ML9azPW
         qMRHWe8j1sA69Slha9jpXzDwW5ILxUFElnsfmeLUZyw/YMqDfq8UqiYgge9xbrmDcYUy
         xvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=64UAUtVrnB3eLs0Hexw/cfQ3HiK7C2gkG1UaNO+bthQ=;
        b=VRJlg6UgHKDE49XDhUnFlrGUpV0sE8hSgA3ZhST/aXdAg/S43I2pk24ObIVz7sPihx
         b0mo8886aQXP1Unnd5qUbh2O5qq9VIeBTgfUEYd+0ZwOv9M6h4nuxB68B3JPtjuAFQ+E
         6rb0gKRwIiM9g3uh8Ka4HwnoJUW/fw/j/x1DN0Ja95HvB0lStQBJGm3XfU/+uzOyX0lE
         xqC/FfMmBrXAYXGh9yXlk6Xeg6X6D3S5VI+IUit2zvpYxMERGBE/nUilOscEDENsdSZA
         dV+nPVhibthnbAAtDIDxxPP3EowOUkk6MXkYxEp8TUJuyQowoPMxrsCokz5Id3qowBvX
         Petw==
X-Gm-Message-State: AOAM530l61/wnJPZZ/nDdN1eAacAaGCze9PZJNJnAh8nvfnEMN2usEu8
        vtUP29t0L0LOrJrqmowH+N8=
X-Google-Smtp-Source: ABdhPJxoasrQhsarbSg8KGaewAMtFmyNtXNzpa0FtCPoeQxF1BVLXO+/gNOPUQdMnWCehJem8FXceg==
X-Received: by 2002:a7b:cb55:: with SMTP id v21mr2698020wmj.188.1615808556950;
        Mon, 15 Mar 2021 04:42:36 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id v189sm12648187wme.39.2021.03.15.04.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 04:42:36 -0700 (PDT)
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
Subject: [PATCH v7 20/22] dt-bindings: add BCM6318 pincontroller binding documentation
Date:   Mon, 15 Mar 2021 12:42:12 +0100
Message-Id: <20210315114214.3096-21-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210315114214.3096-1-noltari@gmail.com>
References: <20210315114214.3096-1-noltari@gmail.com>
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
 v7: add changes suggested by Rob Herring
 v6: add changes suggested by Rob Herring
 v5: change Documentation to dt-bindings in commit title
 v4: no changes
 v3: add new gpio node
 v2: remove interrupts

 .../pinctrl/brcm,bcm6318-pinctrl.yaml         | 148 ++++++++++++++++++
 1 file changed, 148 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yaml
new file mode 100644
index 000000000000..3d1807041c4b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yaml
@@ -0,0 +1,148 @@
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
+  reg:
+    maxItems: 2
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

