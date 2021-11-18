Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF3F2455C8D
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 14:22:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbhKRNZN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 08:25:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbhKRNZM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Nov 2021 08:25:12 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E154C061570;
        Thu, 18 Nov 2021 05:22:12 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id t26so25871711lfk.9;
        Thu, 18 Nov 2021 05:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1L/0A+EuKJ6gwcEMDegZLhyHztp3BPqMAMC2myjRsJM=;
        b=DFcM0FNX12scIGyvbPCM2H5y28UU0wv+aI2RqgNj0OtQKMyNnCcHryqHnVOa1tBer6
         W746hN0xeGdBuFwrCubyeX7hET9JE4diWo0Pu/foQHrUDW3fnBA+QvatOs9aZfK3pw6Y
         j5IVzLTYgvn0aOYg9L7lJzhMOebjCUZa09SWbs06FfNm90poA4NmINFfmp2VrK6WWlwl
         rPB5p/oMM6F3H3LYq/R5Em+P4m0i2GM1CZy1199LDuQu8TR88OcKRcLahwRmXOxuHyoL
         vJ7USf2M/lJ81zKhyrGKuodSpeJfWanJI8V5lQaDwdfg0YlJvdE2hUJoVy53rVFuBJwe
         M+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1L/0A+EuKJ6gwcEMDegZLhyHztp3BPqMAMC2myjRsJM=;
        b=LH/GdJxUbU10JlskWb/369hrI7f82AiPLgKQIAmtrjE6tIwU+DgP0gaXc6akque7PC
         CYeropsnzKMuD1a4kDJsww8QZDmASvVh3A+85m18hSnnXvuhf/GfKcVR4CB4Kc+wKSOB
         XWh7bz+2lmX6tTfR97nuS+/Au7pJrFEDg/BnpetkunMp019kkvis+ZaopGyHW9CZ2mlj
         GLipQkbn1XJCpZiUukVdHnstFkjqpqTvurfxCTQyZKpfaAgd6sjNiJ1OG0OyUX70+OYx
         MDabjCfTqNGh96E4EvBxfzTOhq3Yy/WtpLQpuEHVMMwaChRx9ewO1JnIPDyw1v9teqXB
         rCfw==
X-Gm-Message-State: AOAM530D2cdE+ytTrY8Sr5jEIN48bz8JyHhp2AAOBk/bxuiNX54CDEWN
        oWNoZm8ACHLw25DKUFqT78ZaZseXCFk=
X-Google-Smtp-Source: ABdhPJxatszYdUlQDFHsrWqVZvd2OcxvxsKkd5VxJMlO3v0Oc4JF2ibpfqSmY9htcaCbpg56QWFbTg==
X-Received: by 2002:a2e:a305:: with SMTP id l5mr16881369lje.73.1637241730772;
        Thu, 18 Nov 2021 05:22:10 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id bp36sm356550lfb.0.2021.11.18.05.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 05:22:10 -0800 (PST)
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
Subject: [PATCH 1/5] dt-bindings: pinctrl: support specifying pins, groups & functions
Date:   Thu, 18 Nov 2021 14:21:48 +0100
Message-Id: <20211118132152.15722-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211118132152.15722-1-zajec5@gmail.com>
References: <20211118132152.15722-1-zajec5@gmail.com>
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

It doesn't describe how hw should be programmed. That is still binding
specific.

This commit describes syntax for "pins", "groups" & "functions" nodes in
a standard pinctrl binding. Every above node allows specifying its
entries and it's done using subnodes because:
1. It's required with reg = <n> ("pins")
2. It's generic & extendable (hw specific properties can be added)

Pins are number based so they use reg = <n>. It's also required as
binding needs to allow gaps. It's to avoid hacks like:
pins = <"foo" "-ENODEV" "-ENODEV" "-ENODEV" "bar">;
(for hw with pins 0 and 4 present).

Subnodes also allow storing hw specific pin/group/function
configuration. While it would be possible to have:
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
 .../devicetree/bindings/pinctrl/pinctrl.yaml  | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
index d471563119a9..1a99920e94ef 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
@@ -42,4 +42,54 @@ properties:
       This property can be set either globally for the pin controller or in
       child nodes for individual pin group control.
 
+  pins:
+    type: object
+
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

