Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 884AE36726F
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Apr 2021 20:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240967AbhDUSV1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Apr 2021 14:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235518AbhDUSV0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Apr 2021 14:21:26 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DABEC06174A;
        Wed, 21 Apr 2021 11:20:52 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 12so67997742lfq.13;
        Wed, 21 Apr 2021 11:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1MvOvCWVlNgN6KTtB16t9zKjKmupdN9ndBAOleCWIhs=;
        b=dyYogmV6j0Qsx2sMzON4dBfZWsIboPAnN1RG9tCC1K3jD9OgxFvzsbExmJWwop0oJ2
         bOJhFBROZk1KBWeRi9UW9l6lrL40V5bnVmIMcjhC1cEIk/TXR+N5xnXEKvDI8AqVmtIh
         uwd+QHalJ5vQuR/pDxybqkkDe65kIETBU1K2N74OR/R7EjUCVWLncal751wkRD5fLwU5
         m+Y6UB13x4jGSdOIgxaFK4k6kGC/9qZvDCeca5oI7CFqgRJaU+gxyjnpUYbZ5pdEcdjR
         3ddKELPp23smSWfQmM2kFPb3Cl7sm/N4K3eKGxwFEXAjC/2RW3WRnOjnDoM0YWgbxPj0
         Bcxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1MvOvCWVlNgN6KTtB16t9zKjKmupdN9ndBAOleCWIhs=;
        b=FK7RMdNxaz4BpPXRoJVgeX73E7xTdugNkJzxa0Mf+2XnAzE2qzNjMenPLpDHmlWEwm
         do41hPQLfhxuUR73CnfEEVj8QYZhLABsOM87k60ZUcgm3V8G5/1AQfN+8BJ/d2WpzkEF
         nhiVLWd26i+eH42dZuhcksh5wlHz1S2lHP17JQqQhWL7BFk8h3mSYxQyGMAX56tXo2h6
         E4wVyuZtXHD9nzVEc7AG/KxqKrIVat80ndJIzDbySY2FMeO03CBTIyrnXweDsa4Ajl/1
         tuyfKIDeVTG0XmtYYNKtEiiZVfjIn26E1yggE6mEV4ED6IjwrQ5e6DC3rHiHjzJI9wuM
         gAlw==
X-Gm-Message-State: AOAM531dhw9X6O6glBwvHRW+x3BBviNgDmsL6Abcnp+6cxhnxi1yEO3C
        Z+2epHZHRQQIXGiDQb3PKBA=
X-Google-Smtp-Source: ABdhPJyUzdzNt10pPuw2Kz7EJErej7ujpXrzHI6SeNSbfnzptuejT1zJK+kGcM4K5Ovs7ySR5KhMUg==
X-Received: by 2002:ac2:57db:: with SMTP id k27mr7611681lfo.304.1619029250162;
        Wed, 21 Apr 2021 11:20:50 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id s21sm30254lfs.261.2021.04.21.11.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 11:20:49 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2] dt-bindings: pinctrl: convert Broadcom Northstar to the json-schema
Date:   Wed, 21 Apr 2021 20:20:41 +0200
Message-Id: <20210421182041.22636-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210421082928.26869-1-zajec5@gmail.com>
References: <20210421082928.26869-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

Important: this change converts the binding as it is. It includes
dependency on undocumented CRU that must be refactored. CRU must get
documented and offset property has to be reworked.

Above can (and will be) be handled once every CRU MFD subdevice gets
documented properly (including the pinmux).

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Add "maxItems" to the "offset"
    Add "minItems" & "maxItems" to the "groups"
    Drop "DMU" simple-bus node from the example
    Improve commit description (mention ugly "offset" property)

CRU ("Clock and Reset Unit" or "Central Resource Unit") binding is being
worked on, for details see:
[PATCH robh dt/next] dt-bindings: mfd: add Broadcom CRU
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210415062839.11713-1-zajec5@gmail.com/
---
 .../bindings/pinctrl/brcm,bcm4708-pinmux.txt  | 55 -----------
 .../bindings/pinctrl/brcm,ns-pinmux.yaml      | 94 +++++++++++++++++++
 2 files changed, 94 insertions(+), 55 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm4708-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm4708-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/brcm,bcm4708-pinmux.txt
deleted file mode 100644
index 8ab2d468dbdb..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/brcm,bcm4708-pinmux.txt
+++ /dev/null
@@ -1,55 +0,0 @@
-Broadcom Northstar pins mux controller
-
-Some of Northstar SoCs's pins can be used for various purposes thanks to the mux
-controller. This binding allows describing mux controller and listing available
-functions. They can be referenced later by other bindings to let system
-configure controller correctly.
-
-A list of pins varies across chipsets so few bindings are available.
-
-Node of the pinmux must be nested in the CRU (Central Resource Unit) "syscon"
-noce.
-
-Required properties:
-- compatible: must be one of:
-	"brcm,bcm4708-pinmux"
-	"brcm,bcm4709-pinmux"
-	"brcm,bcm53012-pinmux"
-- offset: offset of pin registers in the CRU block
-
-Functions and their groups available for all chipsets:
-- "spi": "spi_grp"
-- "i2c": "i2c_grp"
-- "pwm": "pwm0_grp", "pwm1_grp", "pwm2_grp", "pwm3_grp"
-- "uart1": "uart1_grp"
-
-Additionally available on BCM4709 and BCM53012:
-- "mdio": "mdio_grp"
-- "uart2": "uart2_grp"
-- "sdio": "sdio_pwr_grp", "sdio_1p8v_grp"
-
-For documentation of subnodes see:
-Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
-
-Example:
-	dmu@1800c000 {
-		compatible = "simple-bus";
-		ranges = <0 0x1800c000 0x1000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		cru@100 {
-			compatible = "syscon", "simple-mfd";
-			reg = <0x100 0x1a4>;
-
-			pinctrl {
-				compatible = "brcm,bcm4708-pinmux";
-				offset = <0xc0>;
-
-				spi-pins {
-					function = "spi";
-					groups = "spi_grp";
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
new file mode 100644
index 000000000000..470aff599c27
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/brcm,ns-pinmux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom Northstar pins mux controller
+
+maintainers:
+  - Rafał Miłecki <rafal@milecki.pl>
+
+description:
+  Some of Northstar SoCs's pins can be used for various purposes thanks to the
+  mux controller. This binding allows describing mux controller and listing
+  available functions. They can be referenced later by other bindings to let
+  system configure controller correctly.
+
+  A list of pins varies across chipsets so few bindings are available.
+
+  Node of the pinmux must be nested in the CRU (Central Resource Unit) "syscon"
+  node.
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm4708-pinmux
+      - brcm,bcm4709-pinmux
+      - brcm,bcm53012-pinmux
+
+  offset:
+    description: offset of pin registers in the CRU block
+    maxItems: 1
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+patternProperties:
+  '-pins$':
+    type: object
+    description: pin node
+    $ref: pinmux-node.yaml#
+
+    properties:
+      function:
+        enum: [ spi, i2c, pwm, uart1, mdio, uart2, sdio ]
+      groups:
+        minItems: 1
+        maxItems: 4
+        items:
+          enum: [ spi_grp, i2c_grp, pwm0_grp, pwm1_grp, pwm2_grp, pwm3_grp,
+                  uart1_grp, mdio_grp, uart2_grp, sdio_pwr_grp, sdio_1p8v_grp ]
+
+    required:
+      - function
+      - groups
+
+    additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm4708-pinmux
+    then:
+      patternProperties:
+        '-pins$':
+          properties:
+            function:
+              enum: [ spi, i2c, pwm, uart1 ]
+            groups:
+              items:
+                enum: [ spi_grp, i2c_grp, pwm0_grp, pwm1_grp, pwm2_grp, pwm3_grp,
+                        uart1_grp ]
+
+required:
+  - offset
+
+additionalProperties: false
+
+examples:
+  - |
+    cru@1800c100 {
+        compatible = "syscon", "simple-mfd";
+        reg = <0x1800c100 0x1a4>;
+
+        pinctrl {
+            compatible = "brcm,bcm4708-pinmux";
+            offset = <0xc0>;
+
+            spi-pins {
+                function = "spi";
+                groups = "spi_grp";
+            };
+        };
+    };
-- 
2.26.2

