Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BBA1333CFC
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 13:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232755AbhCJMzg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 07:55:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232633AbhCJMzN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 07:55:13 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25D29C061760;
        Wed, 10 Mar 2021 04:55:13 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id j2so23188210wrx.9;
        Wed, 10 Mar 2021 04:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pV/Tba5lRESMsvkIpxHTDVYOP0X8Hx1nnfc86bQlUA0=;
        b=QAp7bWIVIDuxhm0ZzzJRxO8SavdYrFt8jUPAzqUTIDH3aPxHs2vzNcLPpJlefDNjHb
         AdlmBgmbcqdQSPIV58BH9lC2VVisKgWnhsrnJG39BLqApk7T42n+f5aBOzEr/pBozbMA
         cbEKhdxnOjg7Wi198L7kLBBwV0MH9YCD30vRG/J7itdXxp4U8rYqBH7WgqIkfgbWxqZq
         aPjhXSo07FvVWp7TDidPrftsk6kXcb44wjZhEtH79g93vb2/nPscWyLtbZzAZ3m92HRe
         VQXjvWX8aLexkW3g91hRehbDzN6bup1Ga4KJ2n2RsbQ+Ww6HokoD/+zy0Eajw/Z0znNh
         yZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pV/Tba5lRESMsvkIpxHTDVYOP0X8Hx1nnfc86bQlUA0=;
        b=EFAd4whfLUFJt+Qwfz9u+LQNWTCC21FGGxRxnC3b6VIZo9oPAV8LNzv7n+gWgQli/0
         s2UKYMpT01cZxXiDXjPrsGK879PwrDz/+UJQHbZGAQr5if24piEkHBP+to9mPFmOqPM6
         /qFx/RQy2VdtMFWZSXZpChaG34CuBEc3D32hvnCzAUGWpYmWhXJc9qiaC3ES8rtByavT
         38Y4Wpy0RAS4rf3azYT2Jj8LApDxXl48LuCDHNNMGwc9WTu9cGGQtq9T3TOXNdGe0p43
         NBM6iYdrTf/S0yBRTB/K0XBBRMRsV97noS8PVfH9rRHiUk0xCV43Gh22qMFLhetd8TmK
         0+OQ==
X-Gm-Message-State: AOAM532Nt2rh0w/mV2dupk3w8wg8C0EalscgHRQE2K2HbMMsRSsZxdlN
        zMv3Vq7wWRCbgeVyPjo4dfQ=
X-Google-Smtp-Source: ABdhPJz7HpJUq/Sy1FHe9XKK6zPuGXaPCf2rfpIoDb82vNKrdG9WrV0yX3/jMZ1o1YKjUAD75qoHrA==
X-Received: by 2002:a5d:538d:: with SMTP id d13mr3492993wrv.92.1615380911868;
        Wed, 10 Mar 2021 04:55:11 -0800 (PST)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id v6sm29403398wrx.32.2021.03.10.04.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 04:55:11 -0800 (PST)
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
Subject: [PATCH v6 06/15] dt-bindings: add BCM6358 pincontroller binding documentation
Date:   Wed, 10 Mar 2021 13:54:54 +0100
Message-Id: <20210310125504.31886-7-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310125504.31886-1-noltari@gmail.com>
References: <20210310125504.31886-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the pincontrol core found in BCM6358 SoCs.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v6: add changes suggested by Rob Herring
 v5: change Documentation to dt-bindings in commit title
 v4: no changes
 v3: add new gpio node
 v2: remove interrupts

 .../pinctrl/brcm,bcm6358-pinctrl.yaml         | 140 ++++++++++++++++++
 1 file changed, 140 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml
new file mode 100644
index 000000000000..a04fc445c761
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml
@@ -0,0 +1,140 @@
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
+  Refer to the the bindings described in
+  Documentation/devicetree/bindings/mfd/syscon.yaml
+
+properties:
+  compatible:
+    const: brcm,bcm6358-pinctrl
+
+  gpio:
+    type: object
+    properties:
+      compatible:
+        const: brcm,bcm6358-gpio
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
+          enum: [ ebi_cs, uart1, serial_led, legacy_led, led, spi_cs, utopia,
+                  pwm_syn_clk, sys_irq ]
+
+        pins:
+          $ref: "pinmux-node.yaml#/properties/pins"
+          enum: [ ebi_cs_grp, uart1_grp, serial_led_grp, legacy_led_grp,
+                  led_grp, spi_cs_grp, utopia_grp, pwm_syn_clk, sys_irq_grp ]
+
+required:
+  - compatible
+  - gpio
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio_cntl@fffe0080 {
+      compatible = "brcm,bcm6358-gpio-controller", "syscon", "simple-mfd";
+      reg = <0xfffe0080 0x80>;
+
+      pinctrl: pinctrl {
+        compatible = "brcm,bcm6358-pinctrl";
+
+        gpio {
+          compatible = "brcm,bcm6358-gpio";
+          data = <0xc>;
+          dirout = <0x4>;
+
+          gpio-controller;
+          gpio-ranges = <&pinctrl 0 0 40>;
+          #gpio-cells = <2>;
+        };
+
+        pinctrl_ebi_cs: ebi_cs-pins {
+          function = "ebi_cs";
+          groups = "ebi_cs_grp";
+        };
+
+        pinctrl_uart1: uart1-pins {
+          function = "uart1";
+          groups = "uart1_grp";
+        };
+
+        pinctrl_serial_led: serial_led-pins {
+          function = "serial_led";
+          groups = "serial_led_grp";
+        };
+
+        pinctrl_legacy_led: legacy_led-pins {
+          function = "legacy_led";
+          groups = "legacy_led_grp";
+        };
+
+        pinctrl_led: led-pins {
+          function = "led";
+          groups = "led_grp";
+        };
+
+        pinctrl_spi_cs_23: spi_cs-pins {
+          function = "spi_cs";
+          groups = "spi_cs_grp";
+        };
+
+        pinctrl_utopia: utopia-pins {
+          function = "utopia";
+          groups = "utopia_grp";
+        };
+
+        pinctrl_pwm_syn_clk: pwm_syn_clk-pins {
+          function = "pwm_syn_clk";
+          groups = "pwm_syn_clk_grp";
+        };
+
+        pinctrl_sys_irq: sys_irq-pins {
+          function = "sys_irq";
+          groups = "sys_irq_grp";
+        };
+      };
+    };
-- 
2.20.1

