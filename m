Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCBA042A61F
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 15:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237106AbhJLNoM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 09:44:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237119AbhJLNoE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 09:44:04 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6AC1C061768;
        Tue, 12 Oct 2021 06:42:02 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id t9so86469328lfd.1;
        Tue, 12 Oct 2021 06:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RIgiER/HaY+i343qoTHyif5IevL/+8RE1axM/mMIfVI=;
        b=kl73gPtMjrRxZrmU5nx5DvAwaNKB3OVg7UYppnYQwjW9tDRTNiWlE3idQIz/0g65e3
         qnQLZi8xjiTbMYdt1WO6+iOt0c3ta20H3JARnqLP2k/ut3p450jOKIhYJZlsVeb+Ay+z
         WNmDtvC8xouUECw/WXFeIHsSW+bHYPS8010C9485TE+lpN3v+n7AuYnePdtZv8MRCQce
         JF/UAh0u1J6+rI3noaKGlOB9WeczlgL8mwH3RxP/QJExo6ZFg1CxsyTN+wdPb35r3nOj
         FIB7qMebUMXVwEi4EA7ya0UchhTuzx1jedOJcHIzc/fvN8qrdmmh6taqWJVl+X3/qsKO
         eh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=RIgiER/HaY+i343qoTHyif5IevL/+8RE1axM/mMIfVI=;
        b=bBNMiQ7KD+R/wDBYYc9YWUfBXI+Np4yTfITcSUJ8Rplr54HlcgkNMXoSEepdk5dBKr
         Q+vp5R9ZhpR39rMiJUDFckXRcbZEWFlMDVc4YFea2q3i69h5Ve098I7LwgA+aOSlSSBr
         XBWKQjPpN7SjvV40zuQnUAtxFGHaHbqadY3xkw2AGPNMj+9F4uK/ZF8NwUhzt5xVafkF
         6kzUBWmFV3zc2IPHbx+cdOU81NQMlvEeh2weuai4/rDfKJ8keldnrihWW6GuC5FlN9qW
         jnYcXPLgnEyq2hQFvpenRjpGg5cObND965LYzhtotBNUyHmvKHajdAn+JJ/4sIif/ktQ
         clAA==
X-Gm-Message-State: AOAM530Q0+GOHf8UMEDS6sVd6BhzZ31k3r8OZr/HsHW+5xcrKf1Fv/eF
        IG+m0BmVGNzvEUwUwohkfc0=
X-Google-Smtp-Source: ABdhPJwcVh359Bl2GMKsEW0Ajbn+mt9SJ+P+kMSa/CY1v2KezJxMsLSFiG4TKN9U95b2U9BTLhl6wg==
X-Received: by 2002:a05:651c:b28:: with SMTP id b40mr30098811ljr.334.1634046119263;
        Tue, 12 Oct 2021 06:41:59 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id k16sm1033761lfo.219.2021.10.12.06.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 06:41:58 -0700 (PDT)
Sender: Emil Renner Berthing <emil.renner.berthing@gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
To:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc:     Emil Renner Berthing <kernel@esmil.dk>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 08/16] dt-bindings: reset: Add Starfive JH7100 reset bindings
Date:   Tue, 12 Oct 2021 15:40:19 +0200
Message-Id: <20211012134027.684712-9-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012134027.684712-1-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree bindings for the StarFive JH7100 reset controller.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 .../bindings/reset/starfive,jh7100-reset.yaml | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml b/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
new file mode 100644
index 000000000000..1985ccaf8605
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/starfive,jh7100-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7100 SoC Reset Controller Device Tree Bindings
+
+maintainers:
+  - Emil Renner Berthing <kernel@esmil.dk>
+
+properties:
+  compatible:
+    enum:
+      - starfive,jh7100-reset
+
+  reg:
+    maxItems: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    rstgen: reset@11840000 {
+        compatible = "starfive,jh7100-reset";
+        reg = <0x11840000 0x10000>;
+        #reset-cells = <1>;
+    };
+
+...
-- 
2.33.0

