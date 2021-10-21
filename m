Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8FDC436957
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Oct 2021 19:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231640AbhJURpC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Oct 2021 13:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232339AbhJURpA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Oct 2021 13:45:00 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B4E2C061225;
        Thu, 21 Oct 2021 10:42:43 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id y12so1795936eda.4;
        Thu, 21 Oct 2021 10:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x5LltJm0AHQyj+WPNUjS5e7tQDzNwCAlJ2whlsgxBts=;
        b=qzuVBqgmXZSmarIfC9EXtckDjvas0GCObPlRUyYZinOo74LNnvmxj/S5YfibPG0mVk
         Cdfy1+cu5nnasZCjg4hZhO6QDZMnwWfeTW2DCeFw5V6I8i6DCQYMsWmXYFaXxSuwQ9Jk
         56ZHDTkBjHsmsRfxf3mxMslrMRPekBB3oRHOd197hYrZ/aVDK/v7kE7lwGO2xD/8OWn9
         4Uc74ZlhYVOvgsXSQWx3q493CQefECPgPJUPvG9j+0jHtbM7DrVWkMUQJ7al25Q/E6rf
         MMuTWNIm/bUgrmDVJRboqjq/yJZPIFHnJ74Lk0Kk6Thja4cEWHKSCL9i38xmgupg6CTD
         VDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=x5LltJm0AHQyj+WPNUjS5e7tQDzNwCAlJ2whlsgxBts=;
        b=1Vf3DWSs4NQ6vWLdFmKuc9LTmnUEPmmx6Z4949S2xc7MhAyJX/PY+ZZR6x4u1NFxfi
         62LToHeI5jaOwAeWmAYSdlroVv2EaZv5sJZVu4JodYThmv9RrNFahiHXj44tsK+9u1pR
         bxXYdRSO97R0fb1AFQQNIobfl/TBu3ala7H6AQNcNNY47ACDF7tBx4lX4fHM4KrY9MD9
         9S2AEUXWown+zoH5vC62/5CSr4Dq9kIA9NXMe1tG28VIdBX5x2/RI6KfHdoPcK/GJa0O
         4fGToZ8IlDRCSWPO++l9RHXovdn/0qHQp912F+FC+hXXiGh/I306ScXXDJNdRwwNQI/2
         ms0Q==
X-Gm-Message-State: AOAM531aEyPEbwU2Oo7F0PdArJDYXkZm9VBtA7PJDtBH+CMlxokPPPAR
        vgxhrVBvo6B7KR6/jUkaKPPoOJ5xQTp68w==
X-Google-Smtp-Source: ABdhPJysKYORNZ7zZCL2ud5ZvrT3iD96H3agntQ4dKJKrS7uqqXSGW81BnZASTrSohmnX+3HRgs+HQ==
X-Received: by 2002:a17:907:16aa:: with SMTP id hc42mr8757697ejc.39.1634838162614;
        Thu, 21 Oct 2021 10:42:42 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id h7sm3144847edt.37.2021.10.21.10.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 10:42:42 -0700 (PDT)
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
Subject: [PATCH v2 08/16] dt-bindings: reset: Add Starfive JH7100 reset bindings
Date:   Thu, 21 Oct 2021 19:42:15 +0200
Message-Id: <20211021174223.43310-9-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211021174223.43310-1-kernel@esmil.dk>
References: <20211021174223.43310-1-kernel@esmil.dk>
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
index 000000000000..c6ad5d7ad100
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
+    rstgen: reset-controller@11840000 {
+        compatible = "starfive,jh7100-reset";
+        reg = <0x11840000 0x10000>;
+        #reset-cells = <1>;
+    };
+
+...
-- 
2.33.1

