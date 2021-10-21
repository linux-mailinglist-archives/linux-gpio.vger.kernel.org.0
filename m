Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08B0243695F
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Oct 2021 19:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232300AbhJURo7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Oct 2021 13:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232242AbhJURo4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Oct 2021 13:44:56 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F098BC061764;
        Thu, 21 Oct 2021 10:42:39 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id g10so3943858edj.1;
        Thu, 21 Oct 2021 10:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8qbfKAJ2dJiFCQVxyKPZl47EINqXvD0LgrDBKR+z57I=;
        b=MMKdvpmdbUzEcdId3TldfQmB5i6ackBeZUU2pM8DfxqOmkDEh7hkX4mGrM5IJ9vFT8
         68vx9zOtPz0+nkEU++z6eVDJ5xmlMe7qjYX/OEWOMwMk8DU5ObyOV/OM9iWj1gIn4eQM
         lYsrn5r9YUwkNsNLadmQmKL6MjDEtvjNBfZILUJU2qxgxcSek4gSAfPWlkt5+d6cldXx
         J9i7tSITZGWCRNI0ZSjLQ3uQ4uWZNAZX+2KxUAwX2knuc8a7Ep53EDf1o/YHvgnk7FJ9
         PUP1UQZfPLEBmw1PubH5+xmPXaf1jSAje2pWDpJoMrxKuijRqXR4/chF4WSYKqhp2XiM
         y0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=8qbfKAJ2dJiFCQVxyKPZl47EINqXvD0LgrDBKR+z57I=;
        b=CNtMEf0UQeHZjnpmxILB3Dk7vTrHEezIlCVtI6PnWAfXs00EhBcq1OPvh56z95c521
         +zgYMPk+IgFsFW4cv3fAovGEAkf8pzLg6RmE8ht8C7g9iotPNgTEWS/uozQYCefyagGL
         waWEwZeyqJPeVa9dadhCFnL2ZZKaBJTLf6/GZnjb3DJdoKIHBVa4SKQWsvfkEyHLso0a
         Ac7YX2xVN4qvSRlM1EOvY3OlWwDOLn94aWfAXjou0+o9+eJEBOaJk8IB5Wvtv0c4hekV
         xe7U+exZrXyAulypk4Xi43W2DccMcOarUlJYq+KZV+CDZ1S/yBMbbuVlP1rSjFadMKMy
         qweQ==
X-Gm-Message-State: AOAM53341gt4bEuFrmKF3BfW6c/cqv6MWTaxUklZp/3T8/TGZdgE2n7W
        Mu1Roboiv7rvIS4WokChwmY=
X-Google-Smtp-Source: ABdhPJy6u37PhRWJFilRxlpWrdwnqteMlxv5etKOOWq7spmYGOekeF4GsFagzXrGF8yjyiYfACHabw==
X-Received: by 2002:a17:907:961e:: with SMTP id gb30mr9045337ejc.484.1634838158597;
        Thu, 21 Oct 2021 10:42:38 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id h7sm3144847edt.37.2021.10.21.10.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 10:42:38 -0700 (PDT)
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
        linux-kernel@vger.kernel.org,
        Emil Renner Berthing <kernel@esmil.dk>
Subject: [PATCH v2 05/16] dt-bindings: clock: starfive: Add JH7100 bindings
Date:   Thu, 21 Oct 2021 19:42:12 +0200
Message-Id: <20211021174223.43310-6-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211021174223.43310-1-kernel@esmil.dk>
References: <20211021174223.43310-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Geert Uytterhoeven <geert@linux-m68k.org>

Add device tree bindings for the StarFive JH7100 clock generator.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 .../clock/starfive,jh7100-clkgen.yaml         | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml

diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
new file mode 100644
index 000000000000..d19f94984eab
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
+    clkgen: clock-controller@11800000 {
+            compatible = "starfive,jh7100-clkgen";
+            reg = <0x11800000 0x10000>;
+            clocks = <&osc_sys>, <&osc_aud>, <&gmac_rmii_ref>, <&gmac_gr_mii_rxclk>;
+            clock-names = "osc_sys", "osc_aud", "gmac_rmii_ref", "gmac_gr_mii_rxclk";
+            #clock-cells = <1>;
+    };
-- 
2.33.1

