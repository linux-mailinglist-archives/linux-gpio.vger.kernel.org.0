Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A62D432CF20
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 10:00:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237170AbhCDI7N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 03:59:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237056AbhCDI6j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 03:58:39 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD38BC0613DC;
        Thu,  4 Mar 2021 00:57:27 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id e23so7289827wmh.3;
        Thu, 04 Mar 2021 00:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=C94pZ3Q33M3uoec3LMBahm08Y8uZMD/oBgP/1T8rwns=;
        b=AsOC1q0s2E7hwseb/A7kHZO8GbNbPONzlarvfb7bpsnpT4/ekv/wUoU0EBYHicphEw
         3OcjPeU2PdWTBLVpjFX4+zeyzte/ATh9l5qsIP3rfOPmAxhaKuLX76zPTD/kE59NVcur
         qf967A9TdNMhsED43kf7FFPnDQG7W0Ln8VMJ63fG/rO97s/Y/bQ7cHMwjWE25dnB3gSs
         Bg0pRvNut4qD0qtfu+Q02LXNh0QOsV1fdDhdle+UuaybgvxzgO0Br6sfVmfMnJTnNlFD
         N5Sv12tNXRlD5QUSu+OVNTn+kJ6cizTsdtMYF5CvgbjmJxBaIGHKriDI8kSNCjRh6L97
         YLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C94pZ3Q33M3uoec3LMBahm08Y8uZMD/oBgP/1T8rwns=;
        b=SJfp92aEh2HHIAkf7O/TLxyA7Om4Gh+hIbWRAXwH2FN2MDmN98zpqOXW+gBFsiIxdn
         MLnQF1BKORk17rw/3xyAVjgbRDdW7t66C8U3mRKxKxj+SgZTF9Qczm5UPDIxgMdyiKRY
         8ze4aCoLoYWPjnk39/RGzyM72j5SX2sy/dycY+etk7gQmPpvzHjmQKloj30ZJFiYNBie
         hCeT0D8Dk4mqmOD2Fyjg1WKH3QOb/g1gR0/nNhg6LdNnaui9VFMf2y+Pk2cm97nq0ZDC
         ScbgAk73tmjMF+4Coqe17YjGpv1qKNcYpt8cRFaXiLQzHFiX+5uW76olyzZoVKn1W2hv
         T2pQ==
X-Gm-Message-State: AOAM532HDIN1tsraMpVnx8NbGBZZvW7S1aM+Nzn32DVXlg1fErH+TLcV
        /UjZm7h6Z5yTdnm6mS53r84=
X-Google-Smtp-Source: ABdhPJylrRU1Gn/0g+ZyEFZZw5yYemoApj/pY2NFT+yEQpurFT3gyHlGUsT0hXyVwtFt3VcAewMOAg==
X-Received: by 2002:a05:600c:2282:: with SMTP id 2mr2815286wmf.93.1614848246591;
        Thu, 04 Mar 2021 00:57:26 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id q15sm2828976wrx.56.2021.03.04.00.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 00:57:26 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 14/15] Documentation: add BCM6318 pincontroller binding documentation
Date:   Thu,  4 Mar 2021 09:57:09 +0100
Message-Id: <20210304085710.7128-15-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210304085710.7128-1-noltari@gmail.com>
References: <20210304085710.7128-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the pincontrol core found in BCM6318 SoCs.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
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

