Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29881373C88
	for <lists+linux-gpio@lfdr.de>; Wed,  5 May 2021 15:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233619AbhEENlg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 May 2021 09:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbhEENlg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 May 2021 09:41:36 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6DA4C061574;
        Wed,  5 May 2021 06:40:39 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id n2so2912854ejy.7;
        Wed, 05 May 2021 06:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PdmQEr+jM7/Ixg4wXjBUQfBuoGiLAB+KdKUuiW4PeIk=;
        b=mnLZdkFgT98zViCZlPp7l5kc+wB8qDy24EqbcLSXm/bCcZlxIP80m9BBcWNCVg/TFp
         Yd6rUYpRcjghWPVcDSmETyPOLulYdoHZOC15hrMzNu7qQixTSPCSPHzkWQx1NiB1E4KT
         SV/CYk3Y5UvKMLkhc4BxMhNh6oRK7dlFsRNmCEFz/sQBClgCq4Lo+jwAm0jhR3rIKBjQ
         W/hVMf2SyLNud/oWV7k7VBkNLgwjt00/dacddg5S2lwqv3tB2jYEfSRaVJdnsGtJMGIk
         DqadC0laLPkwlkHygdcY2EOur9Qf+5mPBnDuVYVnPJuq6PSQywMF3RAkt9I7+uScQtJq
         KDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PdmQEr+jM7/Ixg4wXjBUQfBuoGiLAB+KdKUuiW4PeIk=;
        b=R6qleQ1ai1eN/PaH9QgnMawumuflbY/rhggFb/PwQm47BT5uXYKfiDsmtbul4DHURv
         wxui3U+4MOZMoJ7H+32mpPf4P/OgeJLL81g4GsIfWA/P+F8AtWfC4I/U1IaJuz+7h/F6
         rDd4IXsNj3kOXEZE9KnYCphuzTyF4/9vFADws+7luKHAaPKk9ndNdjP+wsFMwZMnAcw/
         bdBx7Ljt9K+23f8cwW4j2cKKN1OobumdVHemEkM/VB2VTxDrD9MHdRtJdvASNpdWqSHH
         xEu7MXVMoBfHa/zHmIx06yzQRpJKiqzHDjyqFnUeHjKOVQPGINl9a6J3kyYqNG8amIWk
         e9/A==
X-Gm-Message-State: AOAM532Bb26ieaf0QPmyohLK53o4Pea1gaYXzOFChNHarCqko1GwFi0c
        a+3+Ejjnc+ECoT/v6W3DfW8=
X-Google-Smtp-Source: ABdhPJwclRvCpcB2FvazL9f+m/Tpgiz3NMYp08CJJ5kYVVNaeD21m76aqh5XZswlcXagt3xwh+FvTg==
X-Received: by 2002:a17:906:b251:: with SMTP id ce17mr26865912ejb.149.1620222038452;
        Wed, 05 May 2021 06:40:38 -0700 (PDT)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id t7sm15397264eds.26.2021.05.05.06.40.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 06:40:38 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        cl@rock-chips.com, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: gpio: convert rk3328-grf-gpio.txt to YAML
Date:   Wed,  5 May 2021 15:40:25 +0200
Message-Id: <20210505134028.13431-2-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210505134028.13431-1-jbx6244@gmail.com>
References: <20210505134028.13431-1-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Current dts files with RK3328 GRF 'gpio' nodes are manually verified.
In order to automate this process rk3328-grf-gpio.txt has to be
converted to YAML.

Rename 'grf-gpio' nodename to 'gpio'.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 .../bindings/gpio/rockchip,rk3328-grf-gpio.txt     | 32 --------------
 .../bindings/gpio/rockchip,rk3328-grf-gpio.yaml    | 51 ++++++++++++++++++++++
 2 files changed, 51 insertions(+), 32 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.txt b/Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.txt
deleted file mode 100644
index f9231df17..000000000
--- a/Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-Rockchip RK3328 GRF (General Register Files) GPIO controller.
-
-In Rockchip RK3328, the output only GPIO_MUTE pin, originally for codec mute
-control, can also be used for general purpose. It is manipulated by the
-GRF_SOC_CON10 register in GRF. Aside from the GPIO_MUTE pin, the HDMI pins can
-also be set in the same way.
-
-Currently this GPIO controller only supports the mute pin. If needed in the
-future, the HDMI pins support can also be added.
-
-Required properties:
-- compatible: Should contain "rockchip,rk3328-grf-gpio".
-- gpio-controller: Marks the device node as a gpio controller.
-- #gpio-cells: Should be 2. The first cell is the pin number and
-  the second cell is used to specify the gpio polarity:
-    0 = Active high,
-    1 = Active low.
-
-Example:
-
-	grf: syscon@ff100000 {
-		compatible = "rockchip,rk3328-grf", "syscon", "simple-mfd";
-
-		grf_gpio: grf-gpio {
-			compatible = "rockchip,rk3328-grf-gpio";
-			gpio-controller;
-			#gpio-cells = <2>;
-		};
-	};
-
-Note: The grf_gpio node should be declared as the child of the GRF (General
-Register File) node. The GPIO_MUTE pin is referred to as <&grf_gpio 0>.
diff --git a/Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.yaml b/Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.yaml
new file mode 100644
index 000000000..ea169f6fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/rockchip,rk3328-grf-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK3328 General Register Files GPIO controller
+
+description:
+  The Rockchip RK3328 General Register File (GRF) outputs only the
+  GPIO_MUTE pin, originally for codec mute control, but it can also be used
+  for general purpose. It is manipulated by the GRF_SOC_CON10 register.
+  If needed in the future support for the HDMI pins can also be added.
+  The GPIO node should be declared as the child of the GRF node.
+
+  The GPIO_MUTE pin is referred to in the format
+
+  <&grf_gpio 0 GPIO_ACTIVE_LOW>
+
+  The first cell is the pin number and
+  the second cell is used to specify the GPIO polarity
+    0 = Active high
+    1 = Active low
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    const: rockchip,rk3328-grf-gpio
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+required:
+  - compatible
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    grf_gpio: gpio {
+      compatible = "rockchip,rk3328-grf-gpio";
+      gpio-controller;
+      #gpio-cells = <2>;
+    };
+
-- 
2.11.0

