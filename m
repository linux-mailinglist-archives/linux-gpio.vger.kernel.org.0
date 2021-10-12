Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B507942A60E
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 15:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237060AbhJLNoA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 09:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237093AbhJLNny (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 09:43:54 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E2A1C061749;
        Tue, 12 Oct 2021 06:41:52 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id i24so85998345lfj.13;
        Tue, 12 Oct 2021 06:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1qcU68ibM1CGZmIx2gjYL9VUnjOg3l24qR7+bPaoLYA=;
        b=jsEb4gl5mBTiHFZfMy5RQmojSRuhVZ0oZEHInvOB0oo1oYCKFBea4SieWSW6ibdS3h
         8pYUFkgTePJoWhFJMesaTkANlEu5CoSMCsHw3FknnFcr2sjsrGtubmsNyp6NkWhRA6b3
         f4mMAlegCvFAvpa3T6p6mj20UReuRbbp99S7N8nzewStATz07PHTlRot6MebjDon+325
         uHb0YnNI4u2QRkgm7i6hdih50OzLVwoXU0PRCLFAahdvdOWtBWd0ofiuUdAnJA1nfQYc
         3IQeDkX4EVPv6cM4cMIoeBc0Ae0etCHRJNnVBaRm41y0IdLN7mNr1k43rcOoVFos4WmZ
         NSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=1qcU68ibM1CGZmIx2gjYL9VUnjOg3l24qR7+bPaoLYA=;
        b=qh9lasDADzoql/MpD+DweWo54rhYItmwGynxGYjtkyBcRzh3RUpjM1VOdDqSC2Oi9T
         oSbJI4BSk2S0BSO8NhKojj8uojuVstyV2EkQ+dttA0w5Ltb+3chRROHzWt40GgjAmmIi
         kvhHrbO4x90PxoPmj5sk6Niumg3tpGeOPlDQjnioxF2sNCP1Ph11+Q9HMATgyerZwn2f
         BEC3WpO1+ObUx2PJA9LB7oEsgjCVe/02E1pebO9UgFDB8NagVZC0Zl65Umxh5mvMKlV3
         bGnHhgxEHfm3QingkEFaQodjYpvqpUUCjvXVglcn9TUdP/gUvDQeaHINzqY3WAMtZx8c
         J0ow==
X-Gm-Message-State: AOAM530lkcCWa2bVPYIlMjG5jYfYqH7I9dnx4ToLQr6j08gqPxKMYCRs
        t4jxJOCfs03G6xaQvpIy13w=
X-Google-Smtp-Source: ABdhPJywzrqzc6BL5W86ukJVstB+WvIaDv9CMsJp8o23tor68e6mlpzBFybmpRC+v0YVIY6PMxZWPA==
X-Received: by 2002:a19:6544:: with SMTP id c4mr33937633lfj.130.1634046110722;
        Tue, 12 Oct 2021 06:41:50 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id k16sm1033761lfo.219.2021.10.12.06.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 06:41:50 -0700 (PDT)
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
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        linux-kernel@vger.kernel.org,
        Emil Renner Berthing <kernel@esmil.dk>
Subject: [PATCH v1 05/16] dt-bindings: clock: starfive: Add JH7100 bindings
Date:   Tue, 12 Oct 2021 15:40:16 +0200
Message-Id: <20211012134027.684712-6-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012134027.684712-1-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk>
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
2.33.0

