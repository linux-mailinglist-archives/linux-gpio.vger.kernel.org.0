Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A129506586
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Apr 2022 09:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349217AbiDSHTx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Apr 2022 03:19:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349111AbiDSHTw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Apr 2022 03:19:52 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5247C2E684
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 00:17:10 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id g13so3270019ejb.4
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 00:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dy9Wi1RtOAP8/tD4eDEGSwF7hlJadhjXulcMtFXbd98=;
        b=OUXvfAv37HW0iMHGJM53Jxw4c+Maf4UBQLReh4ta8K5aXKLr0tj62TN7iVoX+U8ORM
         +svUdTJupvC7JgYqrZo0DkZAxD6TePj2MGS6IvwyjufIHHG1zFHRd74CG5o7ZMjDmV3/
         CpGvpcJMFbtc7xhMjivp/agCoH4ZTR7nnDZF+klEXnYwjplI0COjq0OH1EHIu/PLxGZa
         CC/x+BBMSGCIpwLvlnpOVzSRuMWf/8zt54dnHcsAz9BntV3osw2O6Ns7pUDlkC2kPmrq
         G96MJF3qwrVuPe0t8JBcii5V1C9K0aP0zqSfoPJff2xPNTD8zdB7sZfuSqt2EeA2yxU9
         kPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dy9Wi1RtOAP8/tD4eDEGSwF7hlJadhjXulcMtFXbd98=;
        b=rxhZW44o4e/9JGF7L0yvd+F+j4FwXmOELyyBFdsc9H+hCWRvEL88xlGQUfN33CGJxO
         UJddG+bvQ9p4qHgpRJEY8fvx1Q6HOtR+RbKNZPkitfV1TEHBejjIrQeu16lD0yAQjdM8
         w0lUiHsQor9vJqN2eJCfC/RiY8eq03oZcWgzfxABS77ki/0DhV6Ig2d9jm5D2pUPsIs5
         9te2g3gsdSgqC7NDXnpmzIh3Tu6hCvjnPurG16NtyWDMxA86mWK8Z+XDwIIeQD5lVBf2
         lM1U6z65nkSluqZtBcDkN5h9nMo5wEKe+lkZLNJZ8S7MDWtqHxj86HsVowffNg/RADf8
         L3Jg==
X-Gm-Message-State: AOAM5320wcC20NJV/cLj0Se4d1PbZQAY0mQnG4f+rBjWjZ1oMvyF0ao8
        6EPnMhAKXn3CQXLTCOrnkvEqMA==
X-Google-Smtp-Source: ABdhPJyMzgsZLgLXdmePdXg6sd+ItcS09xfFOT2E1R1CMzUy5KdizmjYvOPpWRI+DKg/oXL00u27lQ==
X-Received: by 2002:a17:906:3ce9:b0:6ef:a8aa:ab46 with SMTP id d9-20020a1709063ce900b006efa8aaab46mr7224722ejh.579.1650352628889;
        Tue, 19 Apr 2022 00:17:08 -0700 (PDT)
Received: from fedora.. ([185.190.49.104])
        by smtp.gmail.com with ESMTPSA id k14-20020a170906128e00b006e4b67514a1sm5411596ejb.179.2022.04.19.00.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 00:17:08 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-binding: Add cypress,cy8c95x0 binding
Date:   Tue, 19 Apr 2022 09:15:00 +0200
Message-Id: <20220419071503.1596423-2-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419071503.1596423-1-patrick.rudolph@9elements.com>
References: <20220419071503.1596423-1-patrick.rudolph@9elements.com>
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
 .../bindings/pinctrl/cypress,cy8c95x0.yaml    | 139 ++++++++++++++++++
 1 file changed, 139 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/cypress,cy8c95x0.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/cypress,cy8c95x0.yaml b/Documentation/devicetree/bindings/pinctrl/cypress,cy8c95x0.yaml
new file mode 100644
index 000000000000..41219f10bf26
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/cypress,cy8c95x0.yaml
@@ -0,0 +1,139 @@
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
+      The first cell is the pin number and the second cell is used
+      to specify optional parameters.
+    const: 2
+
+  gpio-reserved-ranges: true
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    description:
+      Specifies the pin number and flags, as defined in
+      include/dt-bindings/interrupt-controller/irq.h
+    const: 2
+
+  ngpios:
+    minimum: 1
+    maximum: 60
+
+  gpio-line-names:
+    minItems: 1
+    maxItems: 60
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
+    $ref: "/schemas/pinctrl/pincfg-node.yaml"
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gp([0-7][0-7])$"
+        minItems: 1
+        maxItems: 60
+
+      function:
+        enum: [ gpio, pwm ]
+
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
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
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c0 {
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
+        ngpios = <16>;
+        gpio-reserved-ranges = <5 1>;
+      };
+    };
-- 
2.35.1

