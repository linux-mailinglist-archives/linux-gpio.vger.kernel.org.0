Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20F5345D0B0
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 00:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352181AbhKXXIG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Nov 2021 18:08:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232233AbhKXXIF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Nov 2021 18:08:05 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAAA1C061574;
        Wed, 24 Nov 2021 15:04:54 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id c32so11296391lfv.4;
        Wed, 24 Nov 2021 15:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lWbqyeFKTpIICRMymi5H38k0B/Ww7jwmEeUwnVlXWRw=;
        b=BBWiwwcrrubeEEsKBJa5owoPeKRZfdluFYfF1P2knbtHA/JkxNnrKnPs0BWbU8gEPN
         FYLgYu1SnlfvtAZ6TcFeXiQsBYIh1czGq/jULOgkELbpTBDLv5RYa+MBEbdPCeA6fLET
         RBRU5RY3Q3t63NgXhTryEs/TNpI2AMN9Ti0IL84bP4zbLY9A7G986Vpi6Ivs/RKYm/S3
         DrHrpXaW+ZSEKjFJEVDvUE5uqeaFFVxJ9DHs13pC1NrazwSVZNqWF+chU12lt+bvhhrg
         RtaW4F0yIflUPD9AvdF+hw/PjQ2aHDDMyqB3xl7y01rt0DbpoyL+Vh1I/a8efmf7nYYI
         IIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lWbqyeFKTpIICRMymi5H38k0B/Ww7jwmEeUwnVlXWRw=;
        b=X1a01tuw/AKKpvS9o4XcYgCT0FefJAftnY6gONcQ3lBFzMRRpzljDKDCFi+26UZ4T1
         P8JIn7/KIRLFKjAQpp8FSmrctvXsPi3bVBsZMLGe4m336+lPhBu5f8yWy/usyco+5LhW
         fDR3Hbmm9Jy22wnjSraG1onO3frhsTctcNYr7p/hjmG1J79eY/MQ5oSMCUABMkF5AvLW
         N5NtRPlfzB0Mb+sPjxb7pkZXdumO9JzW/EDukjqM+mYwz/KIAOeeYXgQQ1AD/QIyXyxA
         pubx1B43pFybC519YG6mSwXJwR0d74N0nZLSQ0qXaont6vL0kxwjsbkaejvI7y6XUclD
         K1qA==
X-Gm-Message-State: AOAM533HJU1/6BKjOumvgExf09EBKXEz+GvP9+pSHepY5HODm7hTup+x
        aI1Re/SEfZYjdPwtUwGVX2o=
X-Google-Smtp-Source: ABdhPJzPn86hxh8E/nA0jTARqE7u4J7ABNdcZr57j9b5czRc0sWmJkNF1kqtc4K5OHdUhqRQtJQXBA==
X-Received: by 2002:a19:9157:: with SMTP id y23mr19363900lfj.277.1637795093282;
        Wed, 24 Nov 2021 15:04:53 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id t15sm106243lfp.181.2021.11.24.15.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 15:04:53 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 1/6] dt-bindings: pinctrl: support specifying pins, groups & functions
Date:   Thu, 25 Nov 2021 00:04:34 +0100
Message-Id: <20211124230439.17531-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211124230439.17531-1-zajec5@gmail.com>
References: <20211124230439.17531-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This binding change is meant to introduce a generic way of describing
pinctrl blocks details. Every pinmux block is expected to have:
1. Named pins
2. Named groups containing one or more pins
3. Named functions referencing one or more groups

It doesn't describe how hw should be programmed. That remains binding
and driver specific.

This commit describes syntax for "pins", "groups" & "functions" nodes in
a standard pinctrl binding. Every above node allows specifying its
entries and it's done using subnodes.

That design it meant to be generic and extendable (hw specific
properties can be added). Using subnodes allows storing hw specific
pin/group/function configuration.

While it would be possible to have:
groups {
    foo-pins = <0 1>;
    bar-pins = <2 3>;
};
that doesn't allow hw specific quirks.

Introduced design allows e.g.:
groups {
    foo {
        pins = <0 1>;
        vendor,magic = <0xbeaf>;
    };
};

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
Rob: this patch depends on another one I sent 2 weeks ago:
[PATCH 2/2] dt-bindings: pinctrl: use pinctrl.yaml
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20211110165720.30242-2-zajec5@gmail.com/

V2: Don't use "reg" property as explained by Tony
---
 .../devicetree/bindings/pinctrl/pinctrl.yaml  | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
index d471563119a9..25d8188fbb26 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
@@ -42,4 +42,44 @@ properties:
       This property can be set either globally for the pin controller or in
       child nodes for individual pin group control.
 
+  pins:
+    type: object
+
+    patternProperties:
+      "^.*$":
+        type: object
+
+        properties:
+          number:
+            description: Pin number
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+        additionalProperties: false
+
+  groups:
+    type: object
+
+    patternProperties:
+      "^.*$":
+        type: object
+        description: Group identified by node name
+
+        properties:
+          pins:
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            description: Array of pins belonging to this group
+
+  functions:
+    type: object
+
+    patternProperties:
+      "^.*$":
+        type: object
+        description: Function identified by node name
+
+        properties:
+          groups:
+            $ref: /schemas/types.yaml#/definitions/phandle-array
+            description: Array of pins groups used by this function
+
 additionalProperties: true
-- 
2.31.1

