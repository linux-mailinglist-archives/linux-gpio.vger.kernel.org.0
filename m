Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D96844CDB3
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Nov 2021 00:14:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233834AbhKJXRb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Nov 2021 18:17:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbhKJXRb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Nov 2021 18:17:31 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A67DC061766;
        Wed, 10 Nov 2021 15:14:43 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id i63so8327311lji.3;
        Wed, 10 Nov 2021 15:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PjrI5C0mkMu5yL9/OdUat6x+cciXFtGMctR0rbm0qdc=;
        b=jR/5TXc8YSXbsQLboVuAOa79PGOCsuVTS2lVN0Q52dcavPIQvFRg1XqAYCfJSYyUI3
         MPJ/EKTUJLvGH4QYm/L0tc2TfFBQ3quCfVIwdVHiW6DH8hUhdnuhdUk43UNvp4w+JcHF
         YUZAm8esjtoDPkup3WrY7L9PZUcO5VavEg6pZ8yIzgDcKawbZmxElxRijgqK77V47YlD
         /pdsg1V3zYz/gDZc11Ww7ZUPszDSIg+VoR8ELeU3PLEigXKwQ9KPNqZPK9TywSI32xAD
         a2EtO7HuSgxCghtQM4Wkx2w+yOlNSJVNrRRVmRKuZkz3T5jknAUza5CwNThTNY5Xeus6
         tD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PjrI5C0mkMu5yL9/OdUat6x+cciXFtGMctR0rbm0qdc=;
        b=2C1KR5Y8KI1nE6dWZ93aOy15gxc90wCMskfLn17wVzLH5s2xZi+tQsXbQqjj11ufpy
         FBXrMGmYNLr236MQkESQ2JMXTeL1oRURoWeKBkeOtYlUTw9veKo75Y8KDiWrI3jxM5Tk
         Jx41MhsKXMah4qPyaPEwXQGcXYmC//f8D+siAmiftlsZeXaBVXmtasVeOAGEXH5Ik9/J
         Qhz3Xd5YI4qYXsxqAKZvw6DDflCgmuccbcLj0Z9RoUkrFpSj9khaOQflr2XNdu+wjTae
         S1tGb9bkOC1p4hi9EFSWTL2Dnur+wHfZ4PyJE4D6K3W1kIMXZXQ3nROCJso2qjgGhbhp
         WjMw==
X-Gm-Message-State: AOAM532gPjS9PLLUSS75bK/enQ5iWb1wJCgP0WnD9KPjD5evGPCxlgd7
        QtpiEeJCuvM2JeV4EK6G/88=
X-Google-Smtp-Source: ABdhPJzz6BBRhstTp1QIpuPGM0eWyrcjFw6X8ngacyKSUGEvYEbiROwsOIIQFY8XrQSt3IKN8xjcBg==
X-Received: by 2002:a2e:869a:: with SMTP id l26mr2746702lji.453.1636586081560;
        Wed, 10 Nov 2021 15:14:41 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id x10sm116101lfg.102.2021.11.10.15.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 15:14:40 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH RFC] dt-bindings: pinctrl: support specifying pins
Date:   Thu, 11 Nov 2021 00:14:36 +0100
Message-Id: <20211110231436.8866-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

Add support for "pins" node with pin@ subnodes. This allows specifying
all pins (and their names) at DT level.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
While working with pinctrl in Linux I started wondering if we could
start specifying pins in DT instead of Linux drivers. When working with
DT we usually avoid hardcoding hardware description in drivers so it
isn't clear to me why it doesn't apply to pins.

Please let me know if this makes sense. If by some chance I'm correct I
think that specifying groups and functions could follow too.

FWIW: I didn't start working on Linux reading pins from DT yet.
---
 .../bindings/pinctrl/brcm,ns-pinmux.yaml      | 12 +++++++++-
 .../devicetree/bindings/pinctrl/pinctrl.yaml  | 23 +++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
index 8d1e5b1cdd5f..92a86b0822d6 100644
--- a/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
@@ -74,7 +74,7 @@ required:
   - reg
   - reg-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -83,6 +83,16 @@ examples:
         reg = <0x1800c1c0 0x24>;
         reg-names = "cru_gpio_control";
 
+        pins {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            pin@0 {
+                reg = <0>;
+                label = "spi_clk";
+            };
+        };
+
         spi-pins {
             function = "spi";
             groups = "spi_grp";
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
index d471563119a9..d2f105e9570d 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
@@ -42,4 +42,27 @@ properties:
       This property can be set either globally for the pin controller or in
       child nodes for individual pin group control.
 
+  pins:
+    type: object
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      "^pin@[0-9a-z]+$":
+        type: object
+
+        properties:
+          reg:
+            description: Pin number
+
+          label:
+            description: Pin name
+            $ref: /schemas/types.yaml#/definitions/string
+
+        additionalProperties: false
+
 additionalProperties: true
-- 
2.31.1

