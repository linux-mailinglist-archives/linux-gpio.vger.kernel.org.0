Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9FE2347355
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 09:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236081AbhCXIUO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 04:20:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233311AbhCXITg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 04:19:36 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C92C0613DF;
        Wed, 24 Mar 2021 01:19:36 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id d8-20020a1c1d080000b029010f15546281so637636wmd.4;
        Wed, 24 Mar 2021 01:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2ZkcCNTUeCuf40LRFcVYnlbSCY1D8pXPdqfqnroIlZU=;
        b=gz30/z8TuOL9sIxEcYUVe0tFtVDRyKkvvdme3LwPNUw6TkNxjKIYS5z3D/aCu5lrRy
         FsiGdsTEO85EmDTCFWuMcehknPIXa5um60chcwv+gCfFtqWfPQXkgj92J1pCPow1Gt8j
         LW5TE2gtqD63+qCGDUDTmQSZx+45zuoAxT1Aes3vhVFYQdmbGURn4l4p+ymSY7OV62Td
         0LidmiI6dVAJqR7eCxKRmPHsh6iVy8BVaTHTQYU5dNQyqySgigA0HHCBTQaOHtj2boLo
         lzxyr+gQmtfE2stQmF59S+Uxnij7PcDV6Io9CFD44D8AwmnH2QzHsUJ4m/kKbZbqnwOS
         ChbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2ZkcCNTUeCuf40LRFcVYnlbSCY1D8pXPdqfqnroIlZU=;
        b=o1N4TdHE3YG1wK3izSUkw5adUqKWwCeyc5PCL7cLVXMY+GyJItEDAv5UwTbTC4oB+b
         NIVewRtUp8voaYuE1Vi4TT8t0iEAB8NaXYp+pTivnZlNxP1TTMHSwJQvghNSAz3+lHay
         daRgDSZ74uuw+TOj0dYDOgMSL7Impjd1W10QX4MvNZcFn/fIeb2/xMaVu+8h6yag+hM9
         A0EHRh5AkAbMCFtF9ND5O7MTMyblwlMRN/4AbyL2kchAKcBVVmHndt8qHZlDaFwPgoMb
         Q/rmfxKQWXWafZdG7nm9Lwjtng0difZOsAng8bH+ChkqILpIoDTbj0supsI0Wc7VhM2W
         E5iA==
X-Gm-Message-State: AOAM533/WDZ3IixR/Psrym3sBTVSvRD+KCUyRJ5VbIoS2/pFec+Y+nEO
        CQrvSSmqnqm1K7bVSqxVfsQ=
X-Google-Smtp-Source: ABdhPJypxINkOZ97CJ4/4YKSNFp1bveOxclvROolybA4Y32Lu3JzU152ikkqmHZvnmZA+hljjTUHbA==
X-Received: by 2002:a05:600c:3650:: with SMTP id y16mr1716341wmq.182.1616573974753;
        Wed, 24 Mar 2021 01:19:34 -0700 (PDT)
Received: from skynet.lan (51.red-83-44-13.dynamicip.rima-tde.net. [83.44.13.51])
        by smtp.gmail.com with ESMTPSA id x25sm1498578wmj.14.2021.03.24.01.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 01:19:34 -0700 (PDT)
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
Subject: [PATCH v9 09/22] dt-bindings: add BCM6358 GPIO sysctl binding documentation
Date:   Wed, 24 Mar 2021 09:19:10 +0100
Message-Id: <20210324081923.20379-10-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324081923.20379-1-noltari@gmail.com>
References: <20210324081923.20379-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the GPIO sysctl found in BCM6358 SoCs.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 v9: no changes
 v8: add changes suggested by Rob Herring
 v7: add changes suggested by Rob Herring

 .../mfd/brcm,bcm6358-gpio-sysctl.yaml         | 130 ++++++++++++++++++
 1 file changed, 130 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml

diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml
new file mode 100644
index 000000000000..3e44bea78b03
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/brcm,bcm6358-gpio-sysctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6358 GPIO System Controller Device Tree Bindings
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+  - Jonas Gorski <jonas.gorski@gmail.com>
+
+description:
+  Broadcom BCM6358 SoC GPIO system controller which provides a register map
+  for controlling the GPIO and pins of the SoC.
+
+properties:
+  "#address-cells": true
+
+  "#size-cells": true
+
+  compatible:
+    items:
+      - const: brcm,bcm6358-gpio-sysctl
+      - const: syscon
+      - const: simple-mfd
+
+  ranges:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  "^gpio@[0-9a-f]+$":
+    # Child node
+    type: object
+    $ref: "../gpio/brcm,bcm6345-gpio.yaml"
+    description:
+      GPIO controller for the SoC GPIOs. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml.
+
+  "^pinctrl@[0-9a-f]+$":
+    # Child node
+    type: object
+    $ref: "../pinctrl/brcm,bcm6358-pinctrl.yaml"
+    description:
+      Pin controller for the SoC pins. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml.
+
+required:
+  - "#address-cells"
+  - compatible
+  - ranges
+  - reg
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@fffe0080 {
+      #address-cells = <1>;
+      #size-cells = <1>;
+      compatible = "brcm,bcm6358-gpio-sysctl", "syscon", "simple-mfd";
+      reg = <0xfffe0080 0x80>;
+      ranges = <0 0xfffe0080 0x80>;
+
+      gpio@0 {
+        compatible = "brcm,bcm6358-gpio";
+        reg-names = "dirout", "dat";
+        reg = <0x0 0x8>, <0x8 0x8>;
+
+        gpio-controller;
+        gpio-ranges = <&pinctrl 0 0 40>;
+        #gpio-cells = <2>;
+      };
+
+      pinctrl: pinctrl@18 {
+        compatible = "brcm,bcm6358-pinctrl";
+        reg = <0x18 0x4>;
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

