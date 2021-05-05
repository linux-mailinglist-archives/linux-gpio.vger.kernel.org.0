Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 139DA373C8B
	for <lists+linux-gpio@lfdr.de>; Wed,  5 May 2021 15:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233629AbhEENll (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 May 2021 09:41:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbhEENlj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 May 2021 09:41:39 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DDE7C061574;
        Wed,  5 May 2021 06:40:42 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id g14so2073629edy.6;
        Wed, 05 May 2021 06:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tRnlF/yUDsMjkRkkI/ddiVcMxp7HdXpxWaO02FRwNHw=;
        b=mcDKOCpmOck3qAHRPXaurXhMCS9F33hxt9uUF4uzV8KZnKKCKj+VKCZiyE/TbAqVWW
         c7QDF30RdIMjpGrKBvUe7+ArZa15ScSZrU0CmR1cqerHEDdJE45RbKMzlwWv9eDQhhx/
         rb6tIBAL5RKq5XdOgUW5IACcPsdonQ/18sQI0AWYhYUQ4K9auPeAiQnnKcPYntkk0/HD
         UQFLfDoR3WGmccpE+bp3zEBqcLE9zvxLy749p/Hv+bJ+1ccgasFcSMd+x57RKnahRGhy
         jgJRo3qCnHfKZC1rxC67tLrldMQ40Ze/oTVxU2oA2TQyrr7n3jFgrIT+FF/Dz5LiIdDp
         GxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tRnlF/yUDsMjkRkkI/ddiVcMxp7HdXpxWaO02FRwNHw=;
        b=r4TxTKHw4zMwDZ9kJggpjY6V7nlA94TMjt/mADvE5jNBcqqQDEBLAudvLi8sQ+dwah
         aKsVSVxPoiaYs2AtjPK46Jqsd2ddC/gfqHAdv7m8jVn8DfPjUlxd4pewbOsLDdtn+Lkk
         ySDZPIxecRIuzeJXsE2ATvK3DDQA2GXliS6FOq2cl8PXKzs4Jmjklk+ZSQcMRk10ik7N
         z14P1mBBhyatlh0+DoNyqPBJ2ENRJubC1nbTwoNnkEHzFskS3dOBVxDoHj+yBRUSxQqM
         9pnps0+h0JWlqbfSMr0O9lr1/AD8K/8Al98pw+6KJGCscVeg5LRV+KNhDQPrExNeSTtt
         RNaQ==
X-Gm-Message-State: AOAM531ie1uLUyJ6xRpiuE2PzXRANsMlqvdaLpbCZ6Oiu8xqwikv8kxI
        DalLG7cvCJEyEHp41DA3xYo=
X-Google-Smtp-Source: ABdhPJw1NuERaFlu+orbX17quFoujjaFspC77n8HakLY5oc923LLFNHNZaAaPz2ItCp1phO2aKMRVg==
X-Received: by 2002:a05:6402:48f:: with SMTP id k15mr15241638edv.262.1620222041350;
        Wed, 05 May 2021 06:40:41 -0700 (PDT)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id t7sm15397264eds.26.2021.05.05.06.40.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 06:40:41 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        cl@rock-chips.com, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] dt-bindings: soc: rockchip: convert grf.txt to YAML
Date:   Wed,  5 May 2021 15:40:26 +0200
Message-Id: <20210505134028.13431-3-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210505134028.13431-1-jbx6244@gmail.com>
References: <20210505134028.13431-1-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Current dts files with 'grf' nodes are manually verified.
In order to automate this process grf.txt has to be
converted to YAML.

Most compatibility strings are in use with "simple-mfd" added.

Add description already in use:
"rockchip,rv1108-pmugrf", "syscon"

Add new descriptions for:
"rockchip,rk3568-grf", "syscon", "simple-mfd"
"rockchip,rk3568-pmugrf", "syscon", "simple-mfd"

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
Changed V2:
  add rockchip,rk3328-grf-gpio.yaml
  rename grf-gpio nodename
---
 .../devicetree/bindings/soc/rockchip/grf.txt       |  61 -----
 .../devicetree/bindings/soc/rockchip/grf.yaml      | 280 +++++++++++++++++++++
 2 files changed, 280 insertions(+), 61 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.txt
 create mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.yaml

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.txt b/Documentation/devicetree/bindings/soc/rockchip/grf.txt
deleted file mode 100644
index f96511aa3..000000000
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.txt
+++ /dev/null
@@ -1,61 +0,0 @@
-* Rockchip General Register Files (GRF)
-
-The general register file will be used to do static set by software, which
-is composed of many registers for system control.
-
-From RK3368 SoCs, the GRF is divided into two sections,
-- GRF, used for general non-secure system,
-- SGRF, used for general secure system,
-- PMUGRF, used for always on system
-
-On RK3328 SoCs, the GRF adds a section for USB2PHYGRF,
-
-ON RK3308 SoC, the GRF is divided into four sections:
-- GRF, used for general non-secure system,
-- SGRF, used for general secure system,
-- DETECTGRF, used for audio codec system,
-- COREGRF, used for pvtm,
-
-Required Properties:
-
-- compatible: GRF should be one of the following:
-   - "rockchip,px30-grf", "syscon": for px30
-   - "rockchip,rk3036-grf", "syscon": for rk3036
-   - "rockchip,rk3066-grf", "syscon": for rk3066
-   - "rockchip,rk3188-grf", "syscon": for rk3188
-   - "rockchip,rk3228-grf", "syscon": for rk3228
-   - "rockchip,rk3288-grf", "syscon": for rk3288
-   - "rockchip,rk3308-grf", "syscon": for rk3308
-   - "rockchip,rk3328-grf", "syscon": for rk3328
-   - "rockchip,rk3368-grf", "syscon": for rk3368
-   - "rockchip,rk3399-grf", "syscon": for rk3399
-   - "rockchip,rv1108-grf", "syscon": for rv1108
-- compatible: DETECTGRF should be one of the following:
-   - "rockchip,rk3308-detect-grf", "syscon": for rk3308
-- compatilbe: COREGRF should be one of the following:
-   - "rockchip,rk3308-core-grf", "syscon": for rk3308
-- compatible: PMUGRF should be one of the following:
-   - "rockchip,px30-pmugrf", "syscon": for px30
-   - "rockchip,rk3368-pmugrf", "syscon": for rk3368
-   - "rockchip,rk3399-pmugrf", "syscon": for rk3399
-- compatible: SGRF should be one of the following:
-   - "rockchip,rk3288-sgrf", "syscon": for rk3288
-- compatible: USB2PHYGRF should be one of the following:
-   - "rockchip,px30-usb2phy-grf", "syscon": for px30
-   - "rockchip,rk3328-usb2phy-grf", "syscon": for rk3328
-- compatible: USBGRF should be one of the following:
-   - "rockchip,rv1108-usbgrf", "syscon": for rv1108
-- reg: physical base address of the controller and length of memory mapped
-  region.
-
-Example: GRF and PMUGRF of RK3399 SoCs
-
-	pmugrf: syscon@ff320000 {
-		compatible = "rockchip,rk3399-pmugrf", "syscon";
-		reg = <0x0 0xff320000 0x0 0x1000>;
-	};
-
-	grf: syscon@ff770000 {
-		compatible = "rockchip,rk3399-grf", "syscon";
-		reg = <0x0 0xff770000 0x0 0x10000>;
-	};
diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
new file mode 100644
index 000000000..c7916beb4
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -0,0 +1,280 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip General Register Files (GRF)
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - rockchip,px30-grf
+          - rockchip,px30-pmugrf
+          - rockchip,px30-usb2phy-grf
+          - rockchip,rk3036-grf
+          - rockchip,rk3066-grf
+          - rockchip,rk3188-grf
+          - rockchip,rk3228-grf
+          - rockchip,rk3288-grf
+          - rockchip,rk3288-sgrf
+          - rockchip,rk3308-core-grf
+          - rockchip,rk3308-detect-grf
+          - rockchip,rk3308-grf
+          - rockchip,rk3328-grf
+          - rockchip,rk3328-usb2phy-grf
+          - rockchip,rk3368-grf
+          - rockchip,rk3368-pmugrf
+          - rockchip,rk3399-grf
+          - rockchip,rk3399-pmugrf
+          - rockchip,rk3568-grf
+          - rockchip,rk3568-pmugrf
+          - rockchip,rv1108-grf
+          - rockchip,rv1108-pmugrf
+          - rockchip,rv1108-usbgrf
+
+  required:
+    - compatible
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - rockchip,rk3066-grf
+              - rockchip,rk3188-grf
+              - rockchip,rk3288-sgrf
+              - rockchip,rv1108-pmugrf
+              - rockchip,rv1108-usbgrf
+          - const: syscon
+      - items:
+          - enum:
+              - rockchip,px30-grf
+              - rockchip,px30-pmugrf
+              - rockchip,px30-usb2phy-grf
+              - rockchip,rk3036-grf
+              - rockchip,rk3228-grf
+              - rockchip,rk3288-grf
+              - rockchip,rk3308-core-grf
+              - rockchip,rk3308-detect-grf
+              - rockchip,rk3308-grf
+              - rockchip,rk3328-grf
+              - rockchip,rk3328-usb2phy-grf
+              - rockchip,rk3368-grf
+              - rockchip,rk3368-pmugrf
+              - rockchip,rk3399-grf
+              - rockchip,rk3399-pmugrf
+              - rockchip,rk3568-grf
+              - rockchip,rk3568-pmugrf
+              - rockchip,rv1108-grf
+          - const: syscon
+          - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: true
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,px30-grf
+
+    then:
+      properties:
+        lvds:
+          description:
+            Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3288-grf
+
+    then:
+      properties:
+        edp-phy:
+          description:
+            Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt
+
+        usbphy:
+          description:
+            Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3328-grf
+
+    then:
+      properties:
+        gpio:
+          type: object
+
+          $ref: "/schemas/gpio/rockchip,rk3328-grf-gpio.yaml#"
+
+          unevaluatedProperties: false
+
+        power-controller:
+          type: object
+
+          $ref: "/schemas/power/rockchip,power-controller.yaml#"
+
+          unevaluatedProperties: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3399-grf
+
+    then:
+      properties:
+        mipi-dphy-rx0:
+          type: object
+
+          $ref: "/schemas/phy/rockchip-mipi-dphy-rx0.yaml#"
+
+          unevaluatedProperties: false
+
+        pcie-phy:
+          description:
+            Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt
+
+      patternProperties:
+        "phy@[0-9a-f]+$":
+          description:
+            Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,px30-pmugrf
+              - rockchip,rk3036-grf
+              - rockchip,rk3308-grf
+              - rockchip,rk3368-pmugrf
+
+    then:
+      properties:
+        reboot-mode:
+          type: object
+
+          $ref: "/schemas/power/reset/syscon-reboot-mode.yaml#"
+
+          unevaluatedProperties: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,px30-usb2phy-grf
+              - rockchip,rk3228-grf
+              - rockchip,rk3328-usb2phy-grf
+              - rockchip,rk3399-grf
+              - rockchip,rv1108-grf
+
+    then:
+      properties:
+        "#address-cells":
+          const: 1
+
+        "#size-cells":
+          const: 1
+
+      required:
+        - "#address-cells"
+        - "#size-cells"
+
+      patternProperties:
+        "usb2-phy@[0-9a-f]+$":
+          type: object
+
+          $ref: "/schemas/phy/phy-rockchip-inno-usb2.yaml#"
+
+          unevaluatedProperties: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,px30-pmugrf
+              - rockchip,px30-grf
+              - rockchip,rk3228-grf
+              - rockchip,rk3288-grf
+              - rockchip,rk3328-grf
+              - rockchip,rk3368-pmugrf
+              - rockchip,rk3368-grf
+              - rockchip,rk3399-pmugrf
+              - rockchip,rk3399-grf
+
+    then:
+      properties:
+        io-domains:
+          description:
+            Documentation/devicetree/bindings/power/rockchip-io-domain.txt
+
+          unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3399-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3399-power.h>
+    grf: syscon@ff770000 {
+      compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";
+      reg = <0xff770000 0x10000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      mipi_dphy_rx0: mipi-dphy-rx0 {
+        compatible = "rockchip,rk3399-mipi-dphy-rx0";
+        clocks = <&cru SCLK_MIPIDPHY_REF>,
+                 <&cru SCLK_DPHY_RX0_CFG>,
+                 <&cru PCLK_VIO_GRF>;
+        clock-names = "dphy-ref", "dphy-cfg", "grf";
+        power-domains = <&power RK3399_PD_VIO>;
+        #phy-cells = <0>;
+      };
+
+      u2phy0: usb2-phy@e450 {
+        compatible = "rockchip,rk3399-usb2phy";
+        reg = <0xe450 0x10>;
+        clocks = <&cru SCLK_USB2PHY0_REF>;
+        clock-names = "phyclk";
+        #clock-cells = <0>;
+        clock-output-names = "clk_usbphy0_480m";
+        #phy-cells = <0>;
+
+        u2phy0_host: host-port {
+          #phy-cells = <0>;
+          interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH 0>;
+          interrupt-names = "linestate";
+         };
+
+        u2phy0_otg: otg-port {
+          #phy-cells = <0>;
+          interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH 0>,
+                       <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH 0>,
+                       <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH 0>;
+          interrupt-names = "otg-bvalid", "otg-id",
+                            "linestate";
+        };
+      };
+    };
-- 
2.11.0

