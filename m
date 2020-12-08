Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4370D2D250C
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 08:56:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgLHH4L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 02:56:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgLHH4K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 02:56:10 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD2B0C0613D6;
        Mon,  7 Dec 2020 23:55:29 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id c1so3302770wrq.6;
        Mon, 07 Dec 2020 23:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iZBg6NYc1fDrXniV/VR86/1qE8M8HyWt002YbvqPFwA=;
        b=NR05I4W5IgbtZCAnyadH1WNM+a0Jdb5V5V1FIjmJJVoOHLm//pyynVhvfizCaUPjK0
         tCCeaCiEB8i4eIUV6SVZmOKVMrxsmKwVxJkQtD+BRWEzlbBs9SxGtvZm8eUJyAysMV41
         HeMuYpg3tCm4k1SBKEtaUVJXOeCrxQ4BXnnG5lMBXYD9W2udo3cYB773g4zsHj/IsTC3
         EwkVLp1wF32XosN1nqJLnIZGCf4czVFzPJkI420+bvjBCEOJwlHC/G7urFnxQz71BT9r
         GcECxPo0Uedxz6v1MNZz9/ZKylnMwfhLpD4oc4W7C3slmjdmZ93weTNTt3ylpw/IRd2c
         Ughw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iZBg6NYc1fDrXniV/VR86/1qE8M8HyWt002YbvqPFwA=;
        b=T4LikJuaeoPzM9gNES7MAQ42B8DM4rNHjhiY/R+ddXorHC0kwE1bVYvmp9885hahWf
         KLxvqzZuZmAxSZCuFhIcyghacpWAT999blmyEiqO9rIq9ULaVfjWxXRqKI+qZQQlQ07M
         WyDcbD3VvTo7qe4uKa76e6hVoVhMTL+pzo57Ni3GdAeNSyTv1l+ZMiXoSVB7EZiZMj1m
         1oAkVElpjOidkMkVxQge92LalAPNNuvsp6l+nwPkUA2zm4KdsPCYxwLlxQX6UIUAD7Qe
         ET4KURUCPdxLH4wmBNHEbem4Zf0VH1ZPWJ83TljhYqL+PDxefsEyyp1SCduipcJ+LqJU
         +hOw==
X-Gm-Message-State: AOAM5329BEm3Dnkavc/CLOITeABa0tCEFhMWeBts9PdAhWhL0JAQSflP
        hkhmlpNni/awHqQHDAe28yVQ82IP04o=
X-Google-Smtp-Source: ABdhPJxxbsnv9uCrap7/LBgI68S6qea6ttTGtNj92JTHuHMUhjs2jiRWobIn4D8wOMzmenDEgBrc5w==
X-Received: by 2002:a5d:610d:: with SMTP id v13mr23845962wrt.425.1607414128460;
        Mon, 07 Dec 2020 23:55:28 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id h184sm1620735wmh.23.2020.12.07.23.55.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Dec 2020 23:55:27 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, gregkh@linuxfoundation.org,
        yanaijie@huawei.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, devel@driverdev.osuosl.org
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: rt2880: add binding document
Date:   Tue,  8 Dec 2020 08:55:22 +0100
Message-Id: <20201208075523.7060-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208075523.7060-1-sergio.paracuellos@gmail.com>
References: <20201208075523.7060-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The commit adds rt2880 compatible node in binding document.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../pinctrl/ralink,rt2880-pinmux.yaml         | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml
new file mode 100644
index 000000000000..7dea3e26d99e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/ralink,rt2880-pinmux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ralink rt2880 pinmux controller
+
+maintainers:
+  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
+
+description:
+  The rt2880 pinmux can only set the muxing of pin groups. muxing indiviual pins
+  is not supported. There is no pinconf support.
+
+properties:
+  compatible:
+    enum:
+      - ralink,rt2880-pinmux
+
+  pinctrl-0:
+    description:
+      A phandle to the node containing the subnodes containing default
+      configurations. This is for pinctrl hogs.
+
+  pinctrl-names:
+    description:
+      A pinctrl state named "default" can be defined.
+    const: default
+
+required:
+  - compatible
+
+patternProperties:
+  '[a-z0-9_-]+':
+    if:
+      type: object
+      description: node for pinctrl.
+      $ref: "pinmux-node.yaml"
+    then:
+      properties:
+        groups:
+          description: Name of the pin group to use for the functions.
+          enum: [i2c, spi, uart1, uart2, uart3, rgmii1, rgmii2, mdio,
+                 pcie, sdhci]
+        function:
+          description: The mux function to select
+          enum: [gpio, i2c, spi, uart1, uart2, uart3, rgmii1, rgmii2,
+                 mdio, nand1, nand2, sdhci]
+
+additionalProperties: false
+
+examples:
+  # Pinmux controller node
+  - |
+    pinctrl {
+      compatible = "ralink,rt2880-pinmux";
+      pinctrl-names = "default";
+      pinctrl-0 = <&state_default>;
+
+      state_default: pinctrl0 {
+      };
+
+      i2c_pins: i2c0 {
+        i2c0 {
+          groups = "i2c";
+          function = "i2c";
+        };
+      };
+    };
-- 
2.25.1

