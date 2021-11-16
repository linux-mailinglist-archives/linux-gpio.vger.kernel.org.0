Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50FF2453504
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 16:05:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237983AbhKPPHu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 10:07:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233265AbhKPPHQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 10:07:16 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F0F5C061746;
        Tue, 16 Nov 2021 07:02:06 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id z10so62702436edc.11;
        Tue, 16 Nov 2021 07:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kwOqS25+fnMo9GJvwogRvkSXHbo1/cDLo9u1ngNcW+o=;
        b=mLUNVMzEK4BUMCYj/cCwCmE+w1wvqXCOGEQzypxCUoFFocWcls0OeUtnDUyq6+oGKs
         tlow4gZ45rhNmRho6SkHcIMSs6mVIw1YZHvM1XdUQ0a773/plSOpbMxSAbrjb10h6pLi
         05TefkG23ckZYTCAP9mOeN37dkPStJEx7OoAFR+CWSXs7KMq47Zr0aRKrHYfvv5zt2aU
         jZV3bz8vl0zFjNJQpcsUf0KIN6i34yERP8cWapimlrb+uGz2iyFBCSCzq4B5Z/6nhhlt
         4yRVBiC7x4IyzhzIhGcu38WRCYWz0WtDsqiDu8pvna6IvAPVkyilPyuupo8qUTO367EJ
         Kkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=kwOqS25+fnMo9GJvwogRvkSXHbo1/cDLo9u1ngNcW+o=;
        b=zDp+mNkQXn1Bu2PA/Cdye9nECbEmfBxD0u5yu1ON0gDR3xhVjRHbSxmmczLlZdtbnF
         ++ACA460D3sQgLWpJxsNtoQAQbknppSUyzC36oX1KPFr+1TkfLw7eBuuopbLnbiJKA+C
         LVf7EHYJ0l1y0RwCjqcL2xV3g0w2Z5r5qwP9xYJOcqDrOtk8k8vRx9znerQWqnOp2PgX
         8YmjHK1WI/v6onrXpK781fccB9wCyPsnf4XixS1/8Z6831efA7WhGxvh1Tjch+hhAR2R
         hbVkUnhC8e8HgVa8JQCrS+Ld35ziTFPEdigmv0nuaVDJtofRmHd3g3OXdV1Jf8xtYet2
         3yXg==
X-Gm-Message-State: AOAM530mMfWq9W8qpcS4RIfIWzCLqJnQ+WqeuWu1f9RW0+ATnVls4GXE
        1qUf+ozR9acMQsz35TO5WhI=
X-Google-Smtp-Source: ABdhPJxOwmBLJRGEymtyDR/CSk/4eR8EGR3xmUs9k6uS5SqLM/PTc3h+SoBlFXWLHbHILAZQ8ndnGw==
X-Received: by 2002:a05:6402:182:: with SMTP id r2mr10743518edv.313.1637074922523;
        Tue, 16 Nov 2021 07:02:02 -0800 (PST)
Received: from stitch.. ([2a02:aa7:4600:b4ae:a375:e7a0:9eaf:8d7b])
        by smtp.gmail.com with ESMTPSA id u16sm9414311edr.43.2021.11.16.07.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 07:02:02 -0800 (PST)
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
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 08/16] dt-bindings: reset: Add Starfive JH7100 reset bindings
Date:   Tue, 16 Nov 2021 16:01:11 +0100
Message-Id: <20211116150119.2171-9-kernel@esmil.dk>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211116150119.2171-1-kernel@esmil.dk>
References: <20211116150119.2171-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add bindings for the reset controller on the JH7100 RISC-V SoC by
StarFive Ltd. This is a test chip for their upcoming JH7110 SoC.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/reset/starfive,jh7100-reset.yaml | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml b/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
new file mode 100644
index 000000000000..300359a5e14b
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
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
+    reset-controller@11840000 {
+        compatible = "starfive,jh7100-reset";
+        reg = <0x11840000 0x10000>;
+        #reset-cells = <1>;
+    };
+
+...
-- 
2.33.1

