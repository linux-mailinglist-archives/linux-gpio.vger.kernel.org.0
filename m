Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49DC333F2D9
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 15:38:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232008AbhCQOi0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 10:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231959AbhCQOiP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 10:38:15 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8077DC06174A;
        Wed, 17 Mar 2021 07:38:14 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id t9so2062235wrn.11;
        Wed, 17 Mar 2021 07:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yHv5vsS0tzuPd/k71JUasowJ8p+7vkcmyev1yx9U/aw=;
        b=TbBJ8AvWae9p3vCfTI6flwhO/XSrwik885n+b7mBrQzENDlHLPKWG2bcJbvf9+lLi7
         zXWK/94CY92D4E8TAYg+aJyYBR/agCKgjr13w7TfpjyGBTAfSmrt0ONm6TxuwQFpYO63
         /DuRj9vagIVPNALBO12VxEap7+mzuCBRYptCcSPmVM0+4Dui/KaVpUelPJeTQAJvAMxE
         ShegVHgW+5dHI7AfDnBRGJ/6iFKjS9HgOWaKpUIk4ziA19BWI31grOnH4iSyKMrZHS7D
         18LUAjnR2VTIVGXqm4KpMPDrv1un4fyHDGhSAlo4Dy238wHb9NTRIZuUXDFh2fLqtY7a
         RKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yHv5vsS0tzuPd/k71JUasowJ8p+7vkcmyev1yx9U/aw=;
        b=EAnTHooB+at9iHqyBl4LORdJ31SjZJcuJnaMh9YnhXaD+qGclZEddFhtGMk989lq1k
         APAaqM0JhMQXNXj8ujXitISaQT+vsDV1p0ao6oxoYb3Gl2EwTj4Tp02lZhQawqjkgQqS
         XZoiDd9BJUeZ7q1H4u9bXhdFgIF6msdIhsOmvBm3U2UC6AonBLoVw8/QtrUGGsXJABbN
         9LArkTMcw+/rWncNATo+Xutt6WPnL4T4S7hmD15zL2vheY0uoMDtFZk2uJAjZHGkQ58e
         I9RQyw85IzEAxTGfsJRElWSs0EkFEndGojAgKpom7kisc6WZjXk+cNX+HxnRIDSmH8gN
         CjgQ==
X-Gm-Message-State: AOAM5322Rv9+flufBURuvZR72zhhwg6yB4mTX9tfDf0QX0O7Nm3zBvkn
        w5WA8JVJOvM/VXhFuLHr4dU=
X-Google-Smtp-Source: ABdhPJxost8hG5zvhbBiOTLfu4vm8utbkXVm+V3vDrbznGWXXMJMP7BXNHeYfamEh428JKCNOCCo0Q==
X-Received: by 2002:adf:d851:: with SMTP id k17mr4936419wrl.254.1615991893269;
        Wed, 17 Mar 2021 07:38:13 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id a75sm2518948wme.10.2021.03.17.07.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:38:13 -0700 (PDT)
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
Subject: [PATCH v8 08/22] dt-bindings: add BCM6358 pincontroller binding documentation
Date:   Wed, 17 Mar 2021 15:37:49 +0100
Message-Id: <20210317143803.26127-9-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317143803.26127-1-noltari@gmail.com>
References: <20210317143803.26127-1-noltari@gmail.com>
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
 v8: add changes suggested by Rob Herring
 v7: add changes suggested by Rob Herring
 v6: add changes suggested by Rob Herring
 v5: change Documentation to dt-bindings in commit title
 v4: no changes
 v3: add new gpio node
 v2: remove interrupts

 .../pinctrl/brcm,bcm6358-pinctrl.yaml         | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml
new file mode 100644
index 000000000000..0c3ce256aa78
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml
@@ -0,0 +1,93 @@
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
+description:
+  Bindings for Broadcom's BCM6358 memory-mapped pin controller.
+
+properties:
+  compatible:
+    const: brcm,bcm6358-pinctrl
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
+        enum: [ ebi_cs, uart1, serial_led, legacy_led, led, spi_cs, utopia,
+                pwm_syn_clk, sys_irq ]
+
+      pins:
+        enum: [ ebi_cs_grp, uart1_grp, serial_led_grp, legacy_led_grp,
+                led_grp, spi_cs_grp, utopia_grp, pwm_syn_clk, sys_irq_grp ]
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

