Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1173666FD
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Apr 2021 10:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234938AbhDUIaP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Apr 2021 04:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234632AbhDUIaO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Apr 2021 04:30:14 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3554C06174A;
        Wed, 21 Apr 2021 01:29:41 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id z23so255863lji.4;
        Wed, 21 Apr 2021 01:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0AoMsE4Fj3Q/kBqJbeTbNBwn81usOjzY9B8nlD0JjWU=;
        b=Nxtt0RYJDForRiEKspUm36iRxbwIGrkuEL1Abp3q5k3biNewgOzIcaiAn7Lg4OrKUP
         8myR+pJaAdDyGw12RWAsEKEG4zjaJdngmDV4RW477yt1ia/JAIxxkaT4l0MemnfpK42X
         aMGFIhQ9mJI3QascoMj5BN5irjsqUUQJ2hChWkpk/D8m/F6AdBIUC6qV/PkUIEbizGau
         g5AikZlTLChc4LUTYjQL/INJwMfWuZE5+0XOacu2jyYKREhVZ1H80ZIz+3LCZ1BuwGez
         YhTiKkOrs7Sop39rL4bRtqJ/nJYNinN71JFbaV6aWYuaTb3EJJ4OO1v6k/dsD6Rdtmg/
         M5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0AoMsE4Fj3Q/kBqJbeTbNBwn81usOjzY9B8nlD0JjWU=;
        b=erxrGedjpHiFO8cB38f1HtHbedlmddNU7DT1oBLXpk6QcEYHHLhx2VnUa9snQIUk4T
         N6iQqtjSQeh4LQwbG95AuF1wkHtYiEIliS2M8oDUyo5GDbYD680omChNHwA5Pj534qgO
         5+L6AckgdH1QSzGmuVz4tF3FTneHHPw9oyTkv3wqESdXDkjFRBkdTzTvZ4nkx/SYhyWf
         roTQlP5BQ+1sZ6TLRtFFtgmCLFHXXabC8UB+8Ok6dLbc3fCyDlzRfTai+8SCwSlJCwlp
         jjEVAfxCxjBKj6MlGGYOeoAKhTUNW4fImKG9yuYXrmsm72m/EqVBicez/CQ4gZ0/RulM
         SVEQ==
X-Gm-Message-State: AOAM531ta8XBd1h2pm+wEAS5D8+cGeM0ekzNBZ9b7j17cnCgPkyXYYAy
        Tc5WCYNucMat+QxAVPRoLSgiVJsZD5c=
X-Google-Smtp-Source: ABdhPJzF06iQM//ZLkK2HqUeFBTUKrFS2uiDeYmQ7BmKilGU5h8Ch3SN0ZxWIKyTbCJTGkpNciNjLg==
X-Received: by 2002:a2e:9ecd:: with SMTP id h13mr17540795ljk.96.1618993780297;
        Wed, 21 Apr 2021 01:29:40 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id v16sm138794ljv.8.2021.04.21.01.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 01:29:39 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: pinctrl: convert Broadcom Northstar to the json-schema
Date:   Wed, 21 Apr 2021 10:29:28 +0200
Message-Id: <20210421082928.26869-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

Important: this change converts the binding as it is. It includes
dependency on undocumented CRU that must be refactored. That will be
handled once every CRU MFD subdevice gets documented properly (including
pinmux).

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bindings/pinctrl/brcm,bcm4708-pinmux.txt  | 55 -----------
 .../bindings/pinctrl/brcm,ns-pinmux.yaml      | 98 +++++++++++++++++++
 2 files changed, 98 insertions(+), 55 deletions(-)
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
index 000000000000..1cba8f0db5c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
@@ -0,0 +1,98 @@
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
+    dmu@1800c000 {
+        compatible = "simple-bus";
+        ranges = <0 0x1800c000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        cru@100 {
+            compatible = "syscon", "simple-mfd";
+            reg = <0x100 0x1a4>;
+
+            pinctrl {
+                compatible = "brcm,bcm4708-pinmux";
+                offset = <0xc0>;
+
+                spi-pins {
+                    function = "spi";
+                    groups = "spi_grp";
+                };
+            };
+        };
+    };
-- 
2.26.2

