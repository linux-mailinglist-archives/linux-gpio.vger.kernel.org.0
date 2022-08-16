Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26D0559554D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Aug 2022 10:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233119AbiHPIbv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Aug 2022 04:31:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233500AbiHPIbF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Aug 2022 04:31:05 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61714130699
        for <linux-gpio@vger.kernel.org>; Mon, 15 Aug 2022 22:50:00 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id x21so12130850edd.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Aug 2022 22:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=trB9S8T+KgdYhPfdv0HfyIY4/SfNn10XdtOWdUC1yDs=;
        b=UAlp0Irs2g7qrsPqTelRHKeEmnyfl71dz1+p5NexkBBOBX2lX7ERloR80cU+Obz0r2
         0Fn6buvZZROE6Pp8NEh4b3NiF0vQhGWloZGyINKtk+tEBJmi+8l1ifOVQVMDLt/b8jnn
         rqhGgKts5Ze5i/e/wAHZ4mamcZzcnLGl8B0op1dWw3PYx944dL6/YCg0Btv1HkmJst1H
         Iisc0cdWCXulxQNXeFwFKbiHSPR5BTi+6WID35lDl2iz+S77tMjLcOBgfGzT4Xsej8in
         Go6nLNMa2m0w1zjg3EsCPtvA6RenqqfJZaFhN5BXdLuqEgkeZ0apyPge3HRfsdYATshm
         2JQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=trB9S8T+KgdYhPfdv0HfyIY4/SfNn10XdtOWdUC1yDs=;
        b=rCNci+xd71LS4HGbdGsWGEXGrv9wBoIO0kP0JNQu7tUTg+x+2IXmywrE2q+r1Ngnne
         czHvKdIxjo7IvG2uP8p/AOnOFKTBhvQJECI9V6ayL1smdWHeXTPNGBWtnrgSdUlLg/yH
         eU6Mfcs94xPFaL0umYSZqhbb3iqf9LquHILFZkzbt7cLJQgnDK8ssrNV3aAH9ljpnc1x
         bulQVXO3td+QMPzqM2uRAeGm0W5Ya4qKNRXrGjvvhPrAcYyj/axvPqpPCyNkMWcb5NT3
         ENO2bopXqKdzcUBf2ljuTKNryquyG26MJLpW4YS00WxgRmqqvsT1GYowuYMntk6k8bk+
         Jojg==
X-Gm-Message-State: ACgBeo0Wf6tgMeSpxCYYjTrfeZdGuK39mzzBndpuCHQjXTbOwijQaCSI
        zn3oUCS4eQiBv/AEt0cxlFHBSw==
X-Google-Smtp-Source: AA6agR7NS6yUIm7CAoXHFJTb+skSCz38PsVUZjCN87A1vUJVeoUMe8EHGdUJ6j4dkwQOG/sOl54vRQ==
X-Received: by 2002:a50:fd83:0:b0:43c:bca0:bdd1 with SMTP id o3-20020a50fd83000000b0043cbca0bdd1mr17150256edt.360.1660628998932;
        Mon, 15 Aug 2022 22:49:58 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-088-153-019-247.um27.pools.vodafone-ip.de. [88.153.19.247])
        by smtp.gmail.com with ESMTPSA id d20-20020aa7d5d4000000b0043c92c44c53sm7797054eds.93.2022.08.15.22.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 22:49:57 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-binding: pinctrl: Add cypress,cy8c95x0
Date:   Tue, 16 Aug 2022 07:49:14 +0200
Message-Id: <20220816054917.7893-2-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816054917.7893-1-patrick.rudolph@9elements.com>
References: <20220816054917.7893-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Added device tree binding documentation for
Cypress CY8C95x0 I2C pin-controller.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 .../bindings/pinctrl/cypress,cy8c95x0.yaml    | 134 ++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/cypress,cy8c95x0.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/cypress,cy8c95x0.yaml b/Documentation/devicetree/bindings/pinctrl/cypress,cy8c95x0.yaml
new file mode 100644
index 000000000000..915cbbcc3555
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/cypress,cy8c95x0.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/cypress,cy8c95x0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cypress CY8C95X0 I2C GPIO expander
+
+maintainers:
+  - Patrick Rudolph <patrick.rudolph@9elements.com>
+
+description: |
+  This supports the 20/40/60 pin Cypress CYC95x0 GPIO I2C expanders.
+  Pin function configuration is performed on a per-pin basis.
+
+properties:
+  compatible:
+    enum:
+      - cypress,cy8c9520
+      - cypress,cy8c9540
+      - cypress,cy8c9560
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    description:
+      The first cell is the GPIO number and the second cell specifies GPIO
+      flags, as defined in <dt-bindings/gpio/gpio.h>.
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  gpio-line-names: true
+
+  gpio-ranges:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    maxItems: 1
+
+  vdd-supply:
+    description:
+      Optional power supply.
+
+patternProperties:
+  '-pins$':
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: pincfg-node.yaml#
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          pattern: '^gp([0-7][0-7])$'
+        minItems: 1
+        maxItems: 60
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, pwm ]
+
+      bias-pull-down: true
+
+      bias-pull-up: true
+
+      bias-disable: true
+
+      output-high: true
+
+      output-low: true
+
+      drive-push-pull: true
+
+      drive-open-drain: true
+
+      drive-open-source: true
+
+    required:
+      - pins
+      - function
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+allOf:
+  - $ref: "pinctrl.yaml#"
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      pinctrl@20 {
+        compatible = "cypress,cy8c9520";
+        reg = <0x20>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        vdd-supply = <&p3v3>;
+        gpio-reserved-ranges = <5 1>;
+      };
+    };
-- 
2.37.1

