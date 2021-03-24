Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2176347372
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 09:21:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236133AbhCXIUY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 04:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236040AbhCXITr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 04:19:47 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35DFFC061763;
        Wed, 24 Mar 2021 01:19:47 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id v11so23455254wro.7;
        Wed, 24 Mar 2021 01:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ws5C10ZF24Qx4YbPNhoGUlKXxywyyAhRwUcTOYgjdxU=;
        b=PKVPGp3TJh5u58S4rnr16lblQmDb9jDTeQsPSCviVgiQCEy5xHN0BAuAlCW8An1sNO
         3ODGrmaQW7/sLIqUkcczoxEAhHyWnNtDz07NyxV/7iCYXENBgpdVMP7HGyRRYgYjXvs7
         /wh9X5QKnD6cW9fmPZq6awhVlxiM8ckt4/cTqnkV1WRqt2mVAu3Ojb1SkeHHtn6QsNiV
         uCBS8iWpn2BPxFGkfYGuuc2cHpRevi8GGSdG9toyVV6vSmNpRLn7MU/PXiBy9Gp6pxuU
         85OxyS79iZVuc2U/G+e2ZQzEPx0bAQu4rhjEE+jidd/dUwBFebKqKw5krwdGsBWDr+Xo
         bxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ws5C10ZF24Qx4YbPNhoGUlKXxywyyAhRwUcTOYgjdxU=;
        b=UvL6WkFE+jGsZEzy/c9ig/DvKJpWHnPOQlDtH03rgn/KTAallwH6h1TApZP2tL/Cbq
         aqXXXqW0BvBBlLDN1yl8OfZE+8DeT2PHhT0YXGeO5gXMK5okm55vM3gD7BaANtn1lwtv
         G3GqtiUmTxUdD90eYWz7OL7imZgRC8VfAO+Ap62tbjcYo8I5bVeLqijnIw5uc/nP8ST6
         SjX85bOso9EjinSveZ2QnW8LkNlf+x3voFaQujNONsINF9U8L4O536EGb950UnUB21jX
         VbrZwXnBfSmH9ieIFdL/hCX6sJbdiAGE9ql3A0lOmrk3BgjX/szBqsA3ZnzJtcklhl7m
         qZRQ==
X-Gm-Message-State: AOAM5334lGUdJpoZCcGarcXrzJrcoT0xg7eO8lCKzKmwzL3MNz4K5dDS
        hFWskM5qlrlXRUl01+YqSnm32xSllNubOQ==
X-Google-Smtp-Source: ABdhPJxwnt3Uw+QR8mHzA2uz1OLtLJtcZPn+EJUVnSRYBlrvvXFQU6VXOXGbnv1fTtpNNOoiyickUg==
X-Received: by 2002:adf:82aa:: with SMTP id 39mr2214605wrc.114.1616573985940;
        Wed, 24 Mar 2021 01:19:45 -0700 (PDT)
Received: from skynet.lan (51.red-83-44-13.dynamicip.rima-tde.net. [83.44.13.51])
        by smtp.gmail.com with ESMTPSA id x25sm1498578wmj.14.2021.03.24.01.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 01:19:45 -0700 (PDT)
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
Subject: [PATCH v9 20/22] dt-bindings: add BCM6318 pincontroller binding documentation
Date:   Wed, 24 Mar 2021 09:19:21 +0100
Message-Id: <20210324081923.20379-21-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324081923.20379-1-noltari@gmail.com>
References: <20210324081923.20379-1-noltari@gmail.com>
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
 v9: drop function and pins references
 v8: add changes suggested by Rob Herring
 v7: add changes suggested by Rob Herring
 v6: add changes suggested by Rob Herring
 v5: change Documentation to dt-bindings in commit title
 v4: no changes
 v3: add new gpio node
 v2: remove interrupts

 .../pinctrl/brcm,bcm6318-pinctrl.yaml         | 143 ++++++++++++++++++
 1 file changed, 143 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yaml
new file mode 100644
index 000000000000..08995a4f854b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yaml
@@ -0,0 +1,143 @@
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
+        enum: [ ephy0_spd_led, ephy1_spd_led, ephy2_spd_led, ephy3_spd_led,
+                ephy0_act_led, ephy1_act_led, ephy2_act_led, ephy3_act_led,
+                serial_led_data, serial_led_clk, inet_act_led, inet_fail_led,
+                dsl_led, post_fail_led, wlan_wps_led, usb_pwron,
+                usb_device_led, usb_active ]
+
+      pins:
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

