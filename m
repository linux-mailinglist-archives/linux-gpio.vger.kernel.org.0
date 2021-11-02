Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA7C1443380
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 17:44:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234916AbhKBQqy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 12:46:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234775AbhKBQqt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 12:46:49 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B847C06122B;
        Tue,  2 Nov 2021 09:12:00 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id w15so77758933edc.9;
        Tue, 02 Nov 2021 09:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S07ZlNyPM9aXYOfmi3L50ieiCZ4bZ/2J0IfM/InNuyU=;
        b=JJTA+SybBinzM+vGWoCK8Zj+OROkF68vq6cvWOXoq3PB7eP5OQDD/BBh9UoBnl4H7+
         mzldCTY/3gwMbwy2/neOvNSdYxixLqIvU0Qdrw21IdYCHaGjktwVmmVG5oN8LWhnCc5z
         OwKKgEzutOC0DfsrPTgNS7jL7rgRhB81TEKv6IfV1pZJfSNbHfOqbZUg7F+u4NiirNO2
         AOxBZVBxhUaLD49kV8yqGK7HFx+7iFzgjwYDSoRVLOeYKdUixaP/O4zAbee3fH5TY4DB
         59QiMCog5d6CZpBgOAbMhmXaL+FaMY85smJF7SEJZlSEHTKam63H1zZ2SK+DJzw8UaPg
         kw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=S07ZlNyPM9aXYOfmi3L50ieiCZ4bZ/2J0IfM/InNuyU=;
        b=DuZIT6jlkEtUy1fvaRfMMB+fmbDkoIfyFxBmjzcKSWx3/COCswyOZfSgQk7oAtLZW3
         yIv1unJ61q+9VTplCUBlixRSrSjAQTSUsmzzgK4LLsOJNp6nkBRoM6AcE8/sYkmTIrFt
         lbUinNDYXjdTNYFtx6yFUEBpE4Ssv/OjeuELHH8PUZ/Lqo3FU1TfYDiuvkiJqpeEaArS
         y1e7myNzZwtgUdMy4vEj4vk58iUBisL9povERSgWjc7OEzT51pVLF+YEUIIEHuKkIuZZ
         4kXDi58q6E8Uf+xL7elv5upDAr9z8mtLHC4PIj0rCXcYMK5vJX8Q5FFyMldHt1naXMwg
         byNw==
X-Gm-Message-State: AOAM533Wy6CfwrOetjGLO+YDenDzE9B+fgbsDbSpZl3hheoBqUU9Ja+n
        MVllF1c88h6z0xCFcb8eT4I=
X-Google-Smtp-Source: ABdhPJxvPFom9mlEjjVUIlLhKJOwt4kgVVrbP9xtfptymruWIARqgA1j1tb6QG0G6R4K61k3zlKa1A==
X-Received: by 2002:a17:906:4f95:: with SMTP id o21mr47162618eju.61.1635869517753;
        Tue, 02 Nov 2021 09:11:57 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id c7sm8451374ejd.91.2021.11.02.09.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 09:11:57 -0700 (PDT)
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
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/16] dt-bindings: reset: Add Starfive JH7100 reset bindings
Date:   Tue,  2 Nov 2021 17:11:17 +0100
Message-Id: <20211102161125.1144023-9-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102161125.1144023-1-kernel@esmil.dk>
References: <20211102161125.1144023-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add bindings for the reset controller on the JH7100 RISC-V SoC by
StarFive Ltd. This is a test chip for their upcoming JH7110 SoC.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
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

