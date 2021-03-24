Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5223A347351
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 09:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236078AbhCXIUO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 04:20:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233262AbhCXITc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 04:19:32 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F23C061763;
        Wed, 24 Mar 2021 01:19:31 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id m20-20020a7bcb940000b029010cab7e5a9fso637790wmi.3;
        Wed, 24 Mar 2021 01:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z8fwIY6sndOTys9lkcLJv8A/Q1HE5OZzXehxtjGM5rI=;
        b=Kcf3w+tenJckpxp/FrELPqYpgKGZNa8ugyIoKR/KQ3tOoMGOL3cJ1PRza/6+8vTY1K
         xuDmBldIV497SQ5wNmG4Qyqy/CyjG1mujIFIBDAoicG5pd99NitbtM8Qsnw5kcA5Do6Y
         C1fAkVFpndod3N4RYneSOVCD4fMekB1YHtOhJKW9KDew4rH9jJ/k5UhV6ox4dcdHcI5E
         665LroqDVnudmy/ZW80SIWPV1FNwJWyF0M2BGywRoyMZqml6l3Gc3KaZoe97rw0NAXMt
         +VSgsppzHGdYgiHTsgDTnr9L9I6p0UdYYc0RvoEEFaWA3mX5R0HGt9FS2oMynTbB2Tv3
         dwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z8fwIY6sndOTys9lkcLJv8A/Q1HE5OZzXehxtjGM5rI=;
        b=m5evlQNLArMeL1WrY+oi3kl+5jQH3KsIvmLt4lme1c69Z7ZjhSpDSxL56dznft1FA7
         CpEIRyvtqVl5MiC/AhFvdloGHOSNGhE1XJZSo9AJftU2jM25BZD6H9ERAzwPMJpZbvii
         Jqn9WAAoePfHEN1DLm6GMyEDvsrkYm7fdsSIXSTZhueL7xGWXf5hmh60TV6hz3IP7dBc
         TmrkqHiVu9UUZQnuJ8WpfSLauO7cqcpOsZQzr995t7GrtmZTViJdnm6TN7NP/7RtZwmF
         +V5YkFwauCHfVmoTqBnxqf17bM3Ubd5lj7drO6pBWoVuVmF5snbJOiYSDa6c7qYY25fv
         JXeg==
X-Gm-Message-State: AOAM5310TJEwUNoc+QoShelExMx2DYOSvebtX2M6dPLKb/3PuIbfqg4A
        UgQP6MIEZ4KKny8rRL62uvc=
X-Google-Smtp-Source: ABdhPJw4M0NL6odTARkfddRa/94d87/xVFTPQToU/izOfSkoIMZjTBv1JwByhSrFiT8oHBn/WbFE0g==
X-Received: by 2002:a05:600c:214d:: with SMTP id v13mr1709494wml.7.1616573970588;
        Wed, 24 Mar 2021 01:19:30 -0700 (PDT)
Received: from skynet.lan (51.red-83-44-13.dynamicip.rima-tde.net. [83.44.13.51])
        by smtp.gmail.com with ESMTPSA id x25sm1498578wmj.14.2021.03.24.01.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 01:19:30 -0700 (PDT)
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
Cc:     Rob Herring <robh@kernel.org>
Subject: [PATCH v9 05/22] dt-bindings: add BCM6328 pincontroller binding documentation
Date:   Wed, 24 Mar 2021 09:19:06 +0100
Message-Id: <20210324081923.20379-6-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324081923.20379-1-noltari@gmail.com>
References: <20210324081923.20379-1-noltari@gmail.com>
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 v9: no changes
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

