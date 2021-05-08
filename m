Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4DCF3771D2
	for <lists+linux-gpio@lfdr.de>; Sat,  8 May 2021 14:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbhEHMjG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 May 2021 08:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231262AbhEHMi5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 8 May 2021 08:38:57 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0575AC06175F;
        Sat,  8 May 2021 05:37:56 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id r9so17685387ejj.3;
        Sat, 08 May 2021 05:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iNqkCqnJS+8lE5A1JGiBhGJCy9lYCE4136JGur/Nmf0=;
        b=GrD8JRK+522fNYlkEt1wephxp+qIfWAukgz+ZtR9QQBBJmU8UMBNoII9pAhENA/Dqn
         BPYvkvHRqLuQ8M/QmCTPWlQCpJsr1YFJDP5fDkAGI9iQSJ9GTN1nhmGT7ay09F4ayHy3
         AryPHVFDs4/u0bf5Kp8p2ZUUCDvllhS9HBc3usTgCvWiJGOPqSzOVw1jFA39NpQuiHCj
         QNn0wVOaZwlunGQlRkggBg9nPVUWdVLRS7g8TiSR3U6LjVxphsf9ZVCpxok2JbeSmUeU
         mhFN268KcbNDrEPioKRemTDzNc3R0/xHg9oLfzX/6iU9hAo0IIezOihd61VksZlrq6Pc
         Hpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=iNqkCqnJS+8lE5A1JGiBhGJCy9lYCE4136JGur/Nmf0=;
        b=H52Bvm8vNE0MdswfA8Mk5fD4zrRF1rSN/k92ABIUn4Rk5wY2WlHGbaeIpEnPLnZoxu
         OgrEy2f1rJ3bSZjbfmIcjZQ/VuYuvCGABVoIt1J31FqZV5wNr5PScZqGEmqpOAlhukdk
         jG+S4nU5/LFPhwhjHy3jS0HP9vn7XcDokOoO0Jd02gYuHBVY3ssVXrwF2r68XKv6IBZr
         b9VOmO8MkxXXBvgpE3MDlROVAf59zqPgm7af6Er9MewxcoavNeXhtTenFeVdhhLtdIym
         znzX5L1Bn6wPL+KN/l126gCIpXow/ALtYpQdhS5UbLgHcIROQQJIxXSkcapW/yWJ/C+7
         IkCQ==
X-Gm-Message-State: AOAM530HtgZdPQ2r7Qf+yo5sEyOB1f2irnCJ0s7vg7cz4MOFXR88V1Ed
        clVPyNl3argt0a5+agAdlqo=
X-Google-Smtp-Source: ABdhPJyD2TlTXQs0MNwE0YD+ezkqnn74HPSMU2FvSNdSRxxEN/zVuoRIVnCbXU++Ub+gfd8txWLF2A==
X-Received: by 2002:a17:906:18e1:: with SMTP id e1mr15285777ejf.341.1620477474673;
        Sat, 08 May 2021 05:37:54 -0700 (PDT)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id q25sm6262618edt.51.2021.05.08.05.37.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 May 2021 05:37:54 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        cl@rock-chips.com, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: gpio: convert rk3328-grf-gpio.txt to YAML
Date:   Sat,  8 May 2021 14:37:40 +0200
Message-Id: <20210508123743.18128-2-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210508123743.18128-1-jbx6244@gmail.com>
References: <20210508123743.18128-1-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Current dts files with RK3328 GRF 'gpio' nodes are manually verified.
In order to automate this process rk3328-grf-gpio.txt has to be
converted to YAML.

Rename 'grf-gpio' nodename to 'gpio'.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
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

