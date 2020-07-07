Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63CF52173A5
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 18:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728720AbgGGQSf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 12:18:35 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:43654 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728816AbgGGQSe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 12:18:34 -0400
X-IronPort-AV: E=Sophos;i="5.75,324,1589209200"; 
   d="scan'208";a="51540105"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 08 Jul 2020 01:18:33 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3FD234015EE5;
        Wed,  8 Jul 2020 01:18:30 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 07/14] soc: renesas: rcar-sysc: Add r8a774e1 support
Date:   Tue,  7 Jul 2020 17:18:05 +0100
Message-Id: <1594138692-16816-6-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594138692-16816-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1594138692-16816-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Add support for RZ/G2H (R8A774E1) SoC power areas to the R-Car SYSC
driver.

Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/soc/renesas/Makefile        |  1 +
 drivers/soc/renesas/r8a774e1-sysc.c | 43 +++++++++++++++++++++++++++++
 drivers/soc/renesas/rcar-sysc.c     |  3 ++
 drivers/soc/renesas/rcar-sysc.h     |  1 +
 4 files changed, 48 insertions(+)
 create mode 100644 drivers/soc/renesas/r8a774e1-sysc.c

diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 08296d78e2ad..10a399fc486a 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_SYSC_R8A77470)	+= r8a77470-sysc.o
 obj-$(CONFIG_SYSC_R8A774A1)	+= r8a774a1-sysc.o
 obj-$(CONFIG_SYSC_R8A774B1)	+= r8a774b1-sysc.o
 obj-$(CONFIG_SYSC_R8A774C0)	+= r8a774c0-sysc.o
+obj-$(CONFIG_SYSC_R8A774E1)	+= r8a774e1-sysc.o
 obj-$(CONFIG_SYSC_R8A7779)	+= r8a7779-sysc.o
 obj-$(CONFIG_SYSC_R8A7790)	+= r8a7790-sysc.o
 obj-$(CONFIG_SYSC_R8A7791)	+= r8a7791-sysc.o
diff --git a/drivers/soc/renesas/r8a774e1-sysc.c b/drivers/soc/renesas/r8a774e1-sysc.c
new file mode 100644
index 000000000000..18449f746455
--- /dev/null
+++ b/drivers/soc/renesas/r8a774e1-sysc.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/G2H System Controller
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ *
+ * Based on Renesas R-Car H3 System Controller
+ * Copyright (C) 2016-2017 Glider bvba
+ */
+
+#include <linux/kernel.h>
+
+#include <dt-bindings/power/r8a774e1-sysc.h>
+
+#include "rcar-sysc.h"
+
+static const struct rcar_sysc_area r8a774e1_areas[] __initconst = {
+	{ "always-on",	    0, 0, R8A774E1_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
+	{ "ca57-scu",	0x1c0, 0, R8A774E1_PD_CA57_SCU, R8A774E1_PD_ALWAYS_ON, PD_SCU },
+	{ "ca57-cpu0",	 0x80, 0, R8A774E1_PD_CA57_CPU0, R8A774E1_PD_CA57_SCU, PD_CPU_NOCR },
+	{ "ca57-cpu1",	 0x80, 1, R8A774E1_PD_CA57_CPU1, R8A774E1_PD_CA57_SCU, PD_CPU_NOCR },
+	{ "ca57-cpu2",	 0x80, 2, R8A774E1_PD_CA57_CPU2, R8A774E1_PD_CA57_SCU, PD_CPU_NOCR },
+	{ "ca57-cpu3",	 0x80, 3, R8A774E1_PD_CA57_CPU3, R8A774E1_PD_CA57_SCU, PD_CPU_NOCR },
+	{ "ca53-scu",	0x140, 0, R8A774E1_PD_CA53_SCU, R8A774E1_PD_ALWAYS_ON, PD_SCU },
+	{ "ca53-cpu0",	0x200, 0, R8A774E1_PD_CA53_CPU0, R8A774E1_PD_CA53_SCU, PD_CPU_NOCR },
+	{ "ca53-cpu1",	0x200, 1, R8A774E1_PD_CA53_CPU1, R8A774E1_PD_CA53_SCU, PD_CPU_NOCR },
+	{ "ca53-cpu2",	0x200, 2, R8A774E1_PD_CA53_CPU2, R8A774E1_PD_CA53_SCU, PD_CPU_NOCR },
+	{ "ca53-cpu3",	0x200, 3, R8A774E1_PD_CA53_CPU3, R8A774E1_PD_CA53_SCU, PD_CPU_NOCR },
+	{ "a3vp",	0x340, 0, R8A774E1_PD_A3VP, R8A774E1_PD_ALWAYS_ON },
+	{ "a3vc",	0x380, 0, R8A774E1_PD_A3VC, R8A774E1_PD_ALWAYS_ON },
+	{ "a2vc1",	0x3c0, 1, R8A774E1_PD_A2VC1, R8A774E1_PD_A3VC },
+	{ "3dg-a",	0x100, 0, R8A774E1_PD_3DG_A, R8A774E1_PD_ALWAYS_ON },
+	{ "3dg-b",	0x100, 1, R8A774E1_PD_3DG_B, R8A774E1_PD_3DG_A },
+	{ "3dg-c",	0x100, 2, R8A774E1_PD_3DG_C, R8A774E1_PD_3DG_B },
+	{ "3dg-d",	0x100, 3, R8A774E1_PD_3DG_D, R8A774E1_PD_3DG_C },
+	{ "3dg-e",	0x100, 4, R8A774E1_PD_3DG_E, R8A774E1_PD_3DG_D },
+};
+
+const struct rcar_sysc_info r8a774e1_sysc_info __initconst = {
+	.areas = r8a774e1_areas,
+	.num_areas = ARRAY_SIZE(r8a774e1_areas),
+	.extmask_offs = 0x2f8,
+	.extmask_val = BIT(0),
+};
diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index 04ea87a188f1..9b235fc90027 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -296,6 +296,9 @@ static const struct of_device_id rcar_sysc_matches[] __initconst = {
 #ifdef CONFIG_SYSC_R8A774C0
 	{ .compatible = "renesas,r8a774c0-sysc", .data = &r8a774c0_sysc_info },
 #endif
+#ifdef CONFIG_SYSC_R8A774E1
+	{ .compatible = "renesas,r8a774e1-sysc", .data = &r8a774e1_sysc_info },
+#endif
 #ifdef CONFIG_SYSC_R8A7779
 	{ .compatible = "renesas,r8a7779-sysc", .data = &r8a7779_sysc_info },
 #endif
diff --git a/drivers/soc/renesas/rcar-sysc.h b/drivers/soc/renesas/rcar-sysc.h
index e417f26fe155..8d861c1cfdf7 100644
--- a/drivers/soc/renesas/rcar-sysc.h
+++ b/drivers/soc/renesas/rcar-sysc.h
@@ -56,6 +56,7 @@ extern const struct rcar_sysc_info r8a77470_sysc_info;
 extern const struct rcar_sysc_info r8a774a1_sysc_info;
 extern const struct rcar_sysc_info r8a774b1_sysc_info;
 extern const struct rcar_sysc_info r8a774c0_sysc_info;
+extern const struct rcar_sysc_info r8a774e1_sysc_info;
 extern const struct rcar_sysc_info r8a7779_sysc_info;
 extern const struct rcar_sysc_info r8a7790_sysc_info;
 extern const struct rcar_sysc_info r8a7791_sysc_info;
-- 
2.17.1

