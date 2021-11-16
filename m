Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 162044534F6
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 16:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237952AbhKPPHl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 10:07:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237810AbhKPPGv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 10:06:51 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E897C06121E;
        Tue, 16 Nov 2021 07:01:56 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id z5so29277200edd.3;
        Tue, 16 Nov 2021 07:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2spzz5iUsCei46qM+L/MJDySI5miFtOjpI0Cf6AGYao=;
        b=H8X/ijFN1LXeYJMJwFEeg+LbwUyJ1Ey/5k0M+qQBX2ECxMxJ7bMOc7ponkcnI3tN+m
         8CLf22Bi7d/BTAiNNKfVukb/ulcoQPA6OFUZv/LfJfwzx8lbOf7q7C62RjiNwqn2S5ZB
         GP1YOqexSAhDUhUnTlQvx/pD7xLhYx+q1oGoJ6AbOfBnokPuVAaQ/qEYGyt/Pjl1I8TP
         EvNqlT/RWhaxX7pRZpKKlYvlPNuUK9SarQCi5wmq0rw6mqeXewb9wS7T/XqeduC4eD5h
         KIDj8qvIwSiuAFvPEgnL7hstBSs2S+VTVzZns6ofY3ypTS/CjhFZ2lmcpo6+f3EOdbhQ
         BQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=2spzz5iUsCei46qM+L/MJDySI5miFtOjpI0Cf6AGYao=;
        b=YoIgAU8dpI4B55L4l+QdKwxPrOfx8WA6My2VVUGoi759NFLgOtiqu2Fkr/iw5DUgfP
         EXXhX+ZUXX9I7L8Ei6WRdi1JytB2K7CvXKxC+dZtfEARH6bZdg+oreeYT0DPCHu+NFAQ
         5vWb97JkqEP0SJQGZnFtqwSjdzLmLGz3WvYiAiix2yjzoaWrApl11Ho7n5Uz9nVjA03r
         u5XOU9EHgS6f7d3tkR5vJuiHFNofUNQFfLLjHxBiGlnzFZGLNIaVVdXM6YSEj4tONBNM
         6cwb4JsCyRNb/YOBQOq575uJjNrEHdGfhRgZJ/JsVfJixc66kHFlcbCa99PbRyrfW9wK
         DtUw==
X-Gm-Message-State: AOAM5324AGo0fSFQHZ9Cx9K27jLTueQtYsyjaKbYBHtdWs1fWLQwVy9/
        kobTrAdZcj8TnTsfyr8GO6w=
X-Google-Smtp-Source: ABdhPJw5kQuA3UdIh8QBaUmCRqiyg2uJG9y6WI9IsY/3oWCQja1smobBnDXrwkpP2Oe+uThRjXfV3g==
X-Received: by 2002:a17:906:a1c1:: with SMTP id bx1mr10445843ejb.447.1637074912542;
        Tue, 16 Nov 2021 07:01:52 -0800 (PST)
Received: from stitch.. ([2a02:aa7:4600:b4ae:a375:e7a0:9eaf:8d7b])
        by smtp.gmail.com with ESMTPSA id u16sm9414311edr.43.2021.11.16.07.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 07:01:51 -0800 (PST)
Sender: Emil Renner Berthing <emil.renner.berthing@gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
To:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
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
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Emil Renner Berthing <kernel@esmil.dk>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 05/16] dt-bindings: clock: starfive: Add JH7100 bindings
Date:   Tue, 16 Nov 2021 16:01:08 +0100
Message-Id: <20211116150119.2171-6-kernel@esmil.dk>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211116150119.2171-1-kernel@esmil.dk>
References: <20211116150119.2171-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Geert Uytterhoeven <geert@linux-m68k.org>

Add bindings for the clock generator on the JH7100 RISC-V SoC by
StarFive Ltd. This is a test chip for their upcoming JH7110 SoC.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../clock/starfive,jh7100-clkgen.yaml         | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml

diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
new file mode 100644
index 000000000000..12f17b60ecbe
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/starfive,jh7100-clkgen.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7100 Clock Generator
+
+maintainers:
+  - Geert Uytterhoeven <geert@linux-m68k.org>
+  - Emil Renner Berthing <kernel@esmil.dk>
+
+properties:
+  compatible:
+    const: starfive,jh7100-clkgen
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Main clock source (25 MHz)
+      - description: Application-specific clock source (12-27 MHz)
+      - description: RMII reference clock (50 MHz)
+      - description: RGMII RX clock (125 MHz)
+
+  clock-names:
+    items:
+      - const: osc_sys
+      - const: osc_aud
+      - const: gmac_rmii_ref
+      - const: gmac_gr_mii_rxclk
+
+  '#clock-cells':
+    const: 1
+    description:
+      See <dt-bindings/clock/starfive-jh7100.h> for valid indices.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@11800000 {
+            compatible = "starfive,jh7100-clkgen";
+            reg = <0x11800000 0x10000>;
+            clocks = <&osc_sys>, <&osc_aud>, <&gmac_rmii_ref>, <&gmac_gr_mii_rxclk>;
+            clock-names = "osc_sys", "osc_aud", "gmac_rmii_ref", "gmac_gr_mii_rxclk";
+            #clock-cells = <1>;
+    };
-- 
2.33.1

