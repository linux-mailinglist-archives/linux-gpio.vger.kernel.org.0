Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0183253BD
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Feb 2021 17:43:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233161AbhBYQnM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Feb 2021 11:43:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232787AbhBYQnE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2021 11:43:04 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49A94C061786;
        Thu, 25 Feb 2021 08:42:23 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id g11so1441995wmh.1;
        Thu, 25 Feb 2021 08:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dLlC1LtxEBko7Y+crRoY9/o8oPZpGvVfWGDAZ24Hitc=;
        b=RGe706ONP5Y8FsEhFRx0hL73moEePVthbZ+M9ZbH25yLiS5dRQXr0yc5AGSGGhsxoa
         +FB/dWT+jksz0VYOto9kRz1pz31DIPTGR0xT8v25s7zfxCKLFueAajSgeQ/PIPNg57wi
         62bcImqFIQuuV/79kn05w0Qtdr/rYqgmK3KbNdiFYuSUnMYoLhQ6eAgr5mbzXOEbhC1V
         mTxolTq+UYOBmB6TrnQHCohjj7jBrLwULD3DscpaJXOvi9Xr3+POUVv8PWtB7CSN1cIy
         dOtdVLJ5z97ClV6k7qL+Sgr/YAxMMHRrwCFLQA7ALTgl864EpY3yzoSh3G0lK6Fk0gE4
         CRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dLlC1LtxEBko7Y+crRoY9/o8oPZpGvVfWGDAZ24Hitc=;
        b=kQ1ZOU17duzvoTczGW+AUB8S5tdeI8triFFVU8JSjRgCBFJFIt2NRUFYEB0qAv/3i4
         Qri4sMHJJ2rVdh8hs1fvXi8P2z6xqhIChVdjKBou32lwURTnKTccP739MQoMHEZg+1W9
         MuBelUxdMGyj4Axs9ecmzVMNNwga+05fgNON5stcBF/rRQTce/sK5ZusmHdW67d6kaPa
         TazhMPL6DxNVKu8Z1bFequMcOd3/PLUoJmsyiY8b7Uh5zcMrxRpKB820clIOUcLd4POA
         9cnIgHJtMLkCVojmOurFQm8vO9F890O/MFCjXHKmpxhv/pbLnkljhWT0LJLiowdPv7fn
         d9zQ==
X-Gm-Message-State: AOAM531SDXqr3M2cHWmRYPpb1yc4qDF6OD8jsvcx8BZlOo1N0DXm2kIe
        fSyV5c4TkOztATiEOmJz/QZ45gdHg1NuSw==
X-Google-Smtp-Source: ABdhPJw+f7wulOXUpQN6ThVGbmdLP/cTHe5x0lHXWIMIfZ8xvlg3cg5X2u0aSikH7NFsG1EvDHsB3Q==
X-Received: by 2002:a05:600c:c3:: with SMTP id u3mr4194685wmm.64.1614271341968;
        Thu, 25 Feb 2021 08:42:21 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id u4sm372779wrm.24.2021.02.25.08.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 08:42:21 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 03/12] Documentation: add BCM6358 pincontroller binding documentation
Date:   Thu, 25 Feb 2021 17:42:07 +0100
Message-Id: <20210225164216.21124-4-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210225164216.21124-1-noltari@gmail.com>
References: <20210225164216.21124-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the pincontrol core found in BCM6358 SoCs.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 .../pinctrl/brcm,bcm6358-pinctrl.yaml         | 131 ++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml
new file mode 100644
index 000000000000..d86608173498
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/brcm,bcm6358-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6358 pin controller
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+  - Jonas Gorski <jonas.gorski@gmail.com>
+
+description: |+
+  The pin controller node should be the child of a syscon node.
+
+  Refer to the bindings described in
+  Documentation/devicetree/bindings/mfd/syscon.yaml
+
+properties:
+  compatible:
+    const: brcm,bcm6358-pinctrl
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    description:
+      Specifies the pin number and flags, as defined in
+      include/dt-bindings/gpio/gpio.h
+    const: 2
+
+  interrupts-extended:
+    description:
+      One interrupt per each of the 4 GPIO ports supported by the controller,
+      sorted by port number ascending order.
+    minItems: 6
+    maxItems: 6
+
+patternProperties:
+  '^.*$':
+    if:
+      type: object
+    then:
+      properties:
+        function:
+          $ref: "/schemas/types.yaml#/definitions/string"
+          enum: [ ebi_cs, uart1, serial_led, legacy_led, led, spi_cs, utopia,
+                  pwm_syn_clk, sys_irq ]
+
+        pins:
+          $ref: "/schemas/types.yaml#/definitions/string"
+          enum: [ ebi_cs_grp, uart1_grp, serial_led_grp, legacy_led_grp,
+                  led_grp, spi_cs_grp, utopia_grp, pwm_syn_clk, sys_irq_grp ]
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
+    gpio@fffe0080 {
+      compatible = "syscon", "simple-mfd";
+      reg = <0xfffe0080 0x80>;
+
+      pinctrl: pinctrl {
+        compatible = "brcm,bcm6358-pinctrl";
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        interrupts-extended = <&ext_intc1 0 0>,
+                              <&ext_intc1 1 0>,
+                              <&ext_intc0 0 0>,
+                              <&ext_intc0 1 0>,
+                              <&ext_intc0 2 0>,
+                              <&ext_intc0 3 0>;
+        interrupt-names = "gpio32",
+                          "gpio33",
+                          "gpio34",
+                          "gpio35",
+                          "gpio36",
+                          "gpio37";
+
+        pinctrl_ebi_cs: ebi_cs {
+          function = "ebi_cs";
+          groups = "ebi_cs_grp";
+        };
+
+        pinctrl_uart1: uart1 {
+          function = "uart1";
+          groups = "uart1_grp";
+        };
+
+        pinctrl_serial_led: serial_led {
+          function = "serial_led";
+          groups = "serial_led_grp";
+        };
+
+        pinctrl_legacy_led: legacy_led {
+          function = "legacy_led";
+          groups = "legacy_led_grp";
+        };
+
+        pinctrl_led: led {
+          function = "led";
+          groups = "led_grp";
+        };
+
+        pinctrl_spi_cs_23: spi_cs {
+          function = "spi_cs";
+          groups = "spi_cs_grp";
+        };
+
+        pinctrl_utopia: utopia {
+          function = "utopia";
+          groups = "utopia_grp";
+        };
+
+        pinctrl_pwm_syn_clk: pwm_syn_clk {
+          function = "pwm_syn_clk";
+          groups = "pwm_syn_clk_grp";
+        };
+
+        pinctrl_sys_irq: sys_irq {
+          function = "sys_irq";
+          groups = "sys_irq_grp";
+        };
+      };
+    };
-- 
2.20.1

