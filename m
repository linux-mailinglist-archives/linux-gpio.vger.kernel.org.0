Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43CB633B16F
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 12:43:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhCOLmy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 07:42:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbhCOLm0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 07:42:26 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E97C061574;
        Mon, 15 Mar 2021 04:42:26 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id a18so8485776wrc.13;
        Mon, 15 Mar 2021 04:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GqVQqLtYyNRe5C0eLguSaXhhiH7/vsuK6Vi8nc9N5YI=;
        b=aAwUW77SRWiZCZhR3hap8t4tQU7KDLhJd20GZtcz3l7BK1ksW4NZv/5E0ff/xz+Mvu
         hcGL/BgzkpMmjIgjw3wCU0Grec8jpWWkstzY1RiTLZIIk+mJul4NcwExmaAoRF60SbUv
         mRBKB7HRwNLPUQSEKepeOSipwsxNTF6oStA/qyZNcdLrE/fZjXEMwDL2NghvyUJjrqHZ
         sPn7IhwwaObdCNL0haxXhqZ8xBr+6fRaEz2Pl3HzTq8CbwI5PsM89CLppyy106pMHjmS
         RKtGbcR3T3rFWhXtYURRCsZPYPu+eqV+ryJe/1krRWKBqgoxSoex8paxHzCKXEt0uVVQ
         uUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GqVQqLtYyNRe5C0eLguSaXhhiH7/vsuK6Vi8nc9N5YI=;
        b=t0T8EyY8PnKKijYO4iF0Bg4bFi5RCebY5BwnjRdbQSJb5mZ5/ET7y7C7nHn2zMJ+yd
         7ZgQKrbaav2dYJPno4/Mdi6zeOi4p7m9Colmj7Vx/EkXd306Ag7ppExgbeVz3+ogbjvU
         Uw7AYo+gd3A+u/plEHcaWHtglNR//lwENizJe8QX1fs054RMw5qNjQr7w/pkuX18ofBo
         2lJ9OmhotNJ27m7fk1z1OJN2yIPXlCq6REZzXOcaRFGH6ctkHU5PVA4ganj7FJP9BalG
         AsMYT7pEdwveNDLl5jwDZOgXgXQX4oeITMgB8alsurTT7zzqnUMBJ28PV3Tab7/fzTpF
         M5Bw==
X-Gm-Message-State: AOAM531qjfplbSzQ5gNQ5GDq4BDpbmglIEbcz1ShgkLTbrHse/A7otPY
        W44MVfWaKLXjhGIoGZwmpZE=
X-Google-Smtp-Source: ABdhPJxr4O1/9PFQg5FfuERrMcQighQGsby5DDmROk3YM/wuWRkANkwLPNaf1NZfWma6+2GVVpfZlw==
X-Received: by 2002:a5d:6049:: with SMTP id j9mr26573737wrt.117.1615808544955;
        Mon, 15 Mar 2021 04:42:24 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id v189sm12648187wme.39.2021.03.15.04.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 04:42:24 -0700 (PDT)
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
Subject: [PATCH v7 08/22] dt-bindings: add BCM6358 pincontroller binding documentation
Date:   Mon, 15 Mar 2021 12:42:00 +0100
Message-Id: <20210315114214.3096-9-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210315114214.3096-1-noltari@gmail.com>
References: <20210315114214.3096-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the pincontrol core found in BCM6358 SoCs.

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

 .../pinctrl/brcm,bcm6358-pinctrl.yaml         | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml
new file mode 100644
index 000000000000..65e28c8ae8ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml
@@ -0,0 +1,98 @@
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
+  reg:
+    maxItems: 1
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
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl@18 {
+      compatible = "brcm,bcm6358-pinctrl";
+      reg = <0x18 0x4>;
+
+      pinctrl_ebi_cs: ebi_cs-pins {
+        function = "ebi_cs";
+        groups = "ebi_cs_grp";
+      };
+
+      pinctrl_uart1: uart1-pins {
+        function = "uart1";
+        groups = "uart1_grp";
+      };
+
+      pinctrl_serial_led: serial_led-pins {
+        function = "serial_led";
+        groups = "serial_led_grp";
+      };
+
+      pinctrl_legacy_led: legacy_led-pins {
+        function = "legacy_led";
+        groups = "legacy_led_grp";
+      };
+
+      pinctrl_led: led-pins {
+        function = "led";
+        groups = "led_grp";
+      };
+
+      pinctrl_spi_cs_23: spi_cs-pins {
+        function = "spi_cs";
+        groups = "spi_cs_grp";
+      };
+
+      pinctrl_utopia: utopia-pins {
+        function = "utopia";
+        groups = "utopia_grp";
+      };
+
+      pinctrl_pwm_syn_clk: pwm_syn_clk-pins {
+        function = "pwm_syn_clk";
+        groups = "pwm_syn_clk_grp";
+      };
+
+      pinctrl_sys_irq: sys_irq-pins {
+        function = "sys_irq";
+        groups = "sys_irq_grp";
+      };
+    };
-- 
2.20.1

