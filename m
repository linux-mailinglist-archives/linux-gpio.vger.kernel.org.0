Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 672AE470043
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 12:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237840AbhLJLqJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Dec 2021 06:46:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233311AbhLJLqI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Dec 2021 06:46:08 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77CA8C061746;
        Fri, 10 Dec 2021 03:42:33 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id l22so17509485lfg.7;
        Fri, 10 Dec 2021 03:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CmlEqelTeZa5/+/7EvCKddeNcASbx3AAXYq8cfWXM3w=;
        b=d/tDZCmkYz4kBcQ5AVD/PRKTRfH/VN/RKit55yf1mCPSo4yyE4Vg1t5EfIO7u5+Dkl
         b89+6h3tBbApts5N/MpZk9ea+bQDSBu9gy9u6nlVnICKENnn1Sn4ZYJih07z+woWVQnx
         +4ZLpzzyrV/B0YRFaRzHSupOhTFY1J6SD5ol/7XMqpBKnyU+DfXBoXoyqyMn+ZkvFN+6
         OtLlzRehekeJp3w/js6JvShObA5E1qGkKemhMp1474Hm75HimGXY3fglmq2P9qoxJXMP
         8jiocn9FH71zk2mKfSwC4Rq1LW6AIrXPe7812pgxWEOsFl363gLAxbL6FFpuiDEjhKoD
         zyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CmlEqelTeZa5/+/7EvCKddeNcASbx3AAXYq8cfWXM3w=;
        b=gxUgv2TkWE4NvUQgNssRuNPi3WNWGCmm8UJipVbJH9qoHN9r+ZxfbXWImlhE3hKYIz
         3zR6B+9CqJ+g8YuyQzJl+9gJTul2XYTw4XyOfatTA/dZ4wRIQil8f/+7JkJ8Nn1kygee
         W8+3vsX19byxChFkuNKR/SkrGuSUDnxcYrwpzoSAkTGZ7Zd8RQPgnMkH3gGZS1gHJSEK
         /Y1Nv7g4/rmrxA/1SBc4k1dIlWyziS98vBI6pfudtiSkCOuaHlHRuplxlpMhnmtJFl9q
         XlRDCm3va0KjsUJuymux6YxdFApfMTX+CQ4M0uuqZCMVY4Buf8BZuFuksVN/LTahK9PN
         pzUg==
X-Gm-Message-State: AOAM532A5qZJ4atVxd4zcQ+HXj+KU3dGkcVYAnYS030AM93tInl+yrL/
        kitDgEtABsp9eu3O+OBCLP0=
X-Google-Smtp-Source: ABdhPJyCyDDUfrqZQhdCo3chcesn2+D/GAUca/n2gxuX+hb9vVLIGTbmTOFuccVzmAO+c62mBRYMaw==
X-Received: by 2002:ac2:5c48:: with SMTP id s8mr11730573lfp.292.1639136551798;
        Fri, 10 Dec 2021 03:42:31 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id j15sm289375lfe.157.2021.12.10.03.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 03:42:31 -0800 (PST)
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
Subject: [PATCH V3 1/2] dt-bindings: pinctrl: support specifying pins, groups & functions
Date:   Fri, 10 Dec 2021 12:42:21 +0100
Message-Id: <20211210114222.26581-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210114222.26581-1-zajec5@gmail.com>
References: <20211210114222.26581-1-zajec5@gmail.com>
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

This commit describes a common syntax for "pins", "groups" & "functions"
nodes. Every node allows specifying its entries.

That design is meant to be extendable and minimalistic enough to be
generic (matching any hardware). Relations between pins, groups and
functions are expected to be the same for every hardware.

Using subnode objects allows extending this binding to cover hardware
specific needs (e.g. custom values). Example to consider:

pins {
    foo: foo {
        vendor,magic = <0xc0fe>;
    };
}

groups {
    bar {
        pins = <&foo>;
        vendor,secret = <0xbeaf>;
    };
};

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../devicetree/bindings/pinctrl/pinctrl.yaml  | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
index d471563119a9..e36662cb1f3b 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
@@ -42,4 +42,38 @@ properties:
       This property can be set either globally for the pin controller or in
       child nodes for individual pin group control.
 
+  pins:
+    type: object
+
+    patternProperties:
+      "^.*$":
+        type: object
+        description: Pin named by node name
+
+  groups:
+    type: object
+
+    patternProperties:
+      "^.*$":
+        type: object
+        description: Group named by node name
+
+        properties:
+          pins:
+            $ref: /schemas/types.yaml#/definitions/phandle-array
+            description: Array of pins belonging to this group
+
+  functions:
+    type: object
+
+    patternProperties:
+      "^.*$":
+        type: object
+        description: Function named by node name
+
+        properties:
+          groups:
+            $ref: /schemas/types.yaml#/definitions/phandle-array
+            description: Array of groups used by this function
+
 additionalProperties: true
-- 
2.31.1

