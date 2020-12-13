Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6892D8E9F
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 17:19:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391457AbgLMQSL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 11:18:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729762AbgLMQSH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 11:18:07 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8779CC0613D3;
        Sun, 13 Dec 2020 08:17:26 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id w206so7602904wma.0;
        Sun, 13 Dec 2020 08:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CeBzPvaH2BmMiS1XJWfNJWyku+o1XcRpDrN+C7/T/zw=;
        b=VAWweM3+ov0cPIIXWg4XQzEshPzG+LF65DgTY+5tiTgb6aI7RRJDBoGtJd7m+SX1f5
         YpbL8O2EhZ/o3FFobdfXZrxfo7Op/b1xHfFb88QWLAjT14SbqPyYDQOqXGLqcCYCmTjy
         0+tjSSSqXDH1P1A/5bCCccJPy3O3neWfUWqFZA4QDncGbNKN4UvzHVqb6fkPb6vkRHy7
         fjL/n/m9UXkS9lFTR/29Xg1R5snt3CwzHf8dXxzNdZ14WtiHDIhutCfUqtaNGg11kzPe
         QuUOxslf/b2sFHIDklWCrcNt7SMFIp7UWT4k98I+d4lAvWvyfHQohEMw5hZ8Sr1PMS67
         Rmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CeBzPvaH2BmMiS1XJWfNJWyku+o1XcRpDrN+C7/T/zw=;
        b=PDL804MiIt1iLhRaVjyQH+XoCQoHtbzCV1ozNjqBjngi3VarGKIA0xPgrVNghLS/kw
         wq/CDB4GJ0Uomar1BzByjSUw5YPDfBuswRZ37PvTaa13TKgmHCi7ED2UUNCR+JSA19z9
         Vv7p456Q347XDB48nEExeEWVkgiel12dYNovFMAHUcze24xJZib7n0G+3ySbRJ9SUxNV
         hk4IUBlbuXw2qhWufwray3xH+RdXcjsXYC4idEqGX4i0aX9Ek/CkimT7YPFy+ZSThbHY
         FtEm8pGG1uGDBc195bt2aODGBJkyHhQlRMgmWvb/shBvW9UTuvqPNQkyS1psxhp1YAYs
         Gw5g==
X-Gm-Message-State: AOAM532weugr1D3E1T0n/M2YtL4/NKnCNeRO6IZsAUZjvjuii2H/iXG1
        Y6ZPzmWjXS2kGP29qxVFUeQ=
X-Google-Smtp-Source: ABdhPJwCwhl2HdjA+r2aIj1VSzrGG67fSP+EeVqErQC4WLHJA2pMWwd/PpL1GDJybr0L+ekxtWaTTw==
X-Received: by 2002:a1c:8016:: with SMTP id b22mr23591015wmd.135.1607876245340;
        Sun, 13 Dec 2020 08:17:25 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id 64sm27102073wmd.12.2020.12.13.08.17.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Dec 2020 08:17:24 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, gregkh@linuxfoundation.org,
        yanaijie@huawei.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, devel@driverdev.osuosl.org
Subject: [PATCH 1/8] dt-bindings: pinctrl: rt2880: properly redo bindings
Date:   Sun, 13 Dec 2020 17:17:14 +0100
Message-Id: <20201213161721.6514-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201213161721.6514-1-sergio.paracuellos@gmail.com>
References: <20201213161721.6514-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When this bindings where applied there weren't already
reviewed and some old hacks was being used to properly
pass the schemas checks. This commits fix them up:
 - Instead of using 'if-then' clause use '-pins$'.
 - 'groups' and 'function' are included inside a new
   '^(.*-)?pinmux$' node.
 - compatible string is not an 'enum' but a 'const'.
 - 'pinctrl-0' and 'pinctrl-names' removed since they are
    used in consumer nodes.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../pinctrl/ralink,rt2880-pinmux.yaml         | 62 +++++++++----------
 1 file changed, 28 insertions(+), 34 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml
index 7dea3e26d99e..b32f2676cab5 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml
@@ -15,39 +15,38 @@ description:
 
 properties:
   compatible:
-    enum:
-      - ralink,rt2880-pinmux
+    const: ralink,rt2880-pinmux
 
-  pinctrl-0:
-    description:
-      A phandle to the node containing the subnodes containing default
-      configurations. This is for pinctrl hogs.
+patternProperties:
+  '-pins$':
+    type: object
+    patternProperties:
+      '^(.*-)?pinmux$':
+        type: object
+        description: node for pinctrl.
+        $ref: pinmux-node.yaml#
+
+        properties:
+          groups:
+            description: Name of the pin group to use for the functions.
+            enum: [i2c, spi, uart1, uart2, uart3, rgmii1, rgmii2, mdio,
+                   pcie, sdhci]
+          function:
+            description: The mux function to select
+            enum: [gpio, i2c, spi, uart1, uart2, uart3, rgmii1, rgmii2,
+                   mdio, nand1, nand2, sdhci]
+
+        required:
+          - groups
+          - function
+
+        additionalProperties: false
 
-  pinctrl-names:
-    description:
-      A pinctrl state named "default" can be defined.
-    const: default
+    additionalProperties: false
 
 required:
   - compatible
 
-patternProperties:
-  '[a-z0-9_-]+':
-    if:
-      type: object
-      description: node for pinctrl.
-      $ref: "pinmux-node.yaml"
-    then:
-      properties:
-        groups:
-          description: Name of the pin group to use for the functions.
-          enum: [i2c, spi, uart1, uart2, uart3, rgmii1, rgmii2, mdio,
-                 pcie, sdhci]
-        function:
-          description: The mux function to select
-          enum: [gpio, i2c, spi, uart1, uart2, uart3, rgmii1, rgmii2,
-                 mdio, nand1, nand2, sdhci]
-
 additionalProperties: false
 
 examples:
@@ -55,14 +54,9 @@ examples:
   - |
     pinctrl {
       compatible = "ralink,rt2880-pinmux";
-      pinctrl-names = "default";
-      pinctrl-0 = <&state_default>;
-
-      state_default: pinctrl0 {
-      };
 
-      i2c_pins: i2c0 {
-        i2c0 {
+      i2c_pins: i2c0-pins {
+        pinmux {
           groups = "i2c";
           function = "i2c";
         };
-- 
2.25.1

