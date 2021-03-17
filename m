Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 713E433F2D1
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 15:38:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231982AbhCQOiX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 10:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231954AbhCQOiM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 10:38:12 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEACDC06175F;
        Wed, 17 Mar 2021 07:38:11 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id m20-20020a7bcb940000b029010cab7e5a9fso3507999wmi.3;
        Wed, 17 Mar 2021 07:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pksUDPbcRabmX0whsV2x4d0xxY7s/XIYYSGHgRrpuXE=;
        b=NZacURrqFV6tzDF7Xut7+Srxw/m6bA7u4au6MMb2MEWKF5SX0HJKtPxTV+WJwRAkls
         mCYOab1Y7zbHbdG3tBD8Lo14ZrLP9oBD2knRL7u+fbn+qS5YfA1dvTKhzgGr6HrfJjDr
         CZ3wSuXZKIKCJZbClRb29SmAB9VRINPYz9jXD45H8cFzRSODBPDGswQEG88RIHbOWlT+
         pqp99HbGdLj5I/JykjdS0BYojzOG3/60B1320xgPZDEqh+Mf/hUyEyB/gRa+hypS3ykP
         OplAeOSxLOhrBzFaXUAsqUEfweM8XyQPbyRk4vTwT81JOQQUZOnb2netUmzGScnSQ5j1
         8S9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pksUDPbcRabmX0whsV2x4d0xxY7s/XIYYSGHgRrpuXE=;
        b=PKsvUneOqnasq2bzggk6w6YK9LTylYOByL2Xo2IxPcuU4QlepJ9uTjN84AFnyaR3f/
         5nJLqgBIx2gXAxEA4Pet75wsBf3wJwfl8t4g1RDepmqtFLm9XyCnQnIob4dBv7FXcM+Q
         WG5uzLnJOB4j4ORNgp4cKeftz/LfnnGBFHyoymbhqCMK3/tbgcO68+eQp4F0c3XteHP6
         /O1Ee/ah/rccPzhiEF1BdpTtQ+AATBUnYIgRPqUQyCbrgW+QsC+LGi++TCeW61t9BjzH
         RDF3pS1eXpmZ/flKA0/3ZQfKJknS/mpXi6bfspBgKUdlqrcyNstC2A+lWccMwG2GslIf
         6Hzw==
X-Gm-Message-State: AOAM533ChPlUANX3uYu2t3pCwJwq5/Zd1U6zjNBZGVK3f+dbBmvNAgEU
        +rKsfRr1xldfL7pgTWmTJzk=
X-Google-Smtp-Source: ABdhPJyDPObVkDrpqnHAlemvWC2bVrwJnBqtTGMlksimzWnKL9Q8KwVwwZH7jsVv1GmvBEWrkNSuIw==
X-Received: by 2002:a05:600c:c4:: with SMTP id u4mr4042143wmm.27.1615991890585;
        Wed, 17 Mar 2021 07:38:10 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id a75sm2518948wme.10.2021.03.17.07.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:38:10 -0700 (PDT)
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
Subject: [PATCH v8 05/22] dt-bindings: add BCM6328 pincontroller binding documentation
Date:   Wed, 17 Mar 2021 15:37:46 +0100
Message-Id: <20210317143803.26127-6-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317143803.26127-1-noltari@gmail.com>
References: <20210317143803.26127-1-noltari@gmail.com>
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
 v8: add changes suggested by Rob Herring
 v7: add changes suggested by Rob Herring
 v6: add changes suggested by Rob Herring
 v5: change Documentation to dt-bindings in commit title
 v4: no changes
 v3: add new gpio node
 v2: remove interrupts

 .../pinctrl/brcm,bcm6328-pinctrl.yaml         | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
new file mode 100644
index 000000000000..0fd24f40afb1
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
@@ -0,0 +1,127 @@
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
+description:
+  Bindings for Broadcom's BCM6328 memory-mapped pin controller.
+
+properties:
+  compatible:
+    const: brcm,bcm6328-pinctrl
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '-pins$':
+    type: object
+    $ref: pinmux-node.yaml#
+
+    properties:
+      function:
+        enum: [ serial_led_data, serial_led_clk, inet_act_led, pcie_clkreq,
+                led, ephy0_act_led, ephy1_act_led, ephy2_act_led,
+                ephy3_act_led, hsspi_cs1, usb_device_port, usb_host_port ]
+
+      pins:
+        enum: [ gpio6, gpio7, gpio11, gpio16, gpio17, gpio18, gpio19,
+                gpio20, gpio25, gpio26, gpio27, gpio28, hsspi_cs1,
+                usb_port1 ]
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

