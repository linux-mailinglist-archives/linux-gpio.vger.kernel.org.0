Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B1722173A2
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 18:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728609AbgGGQSc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 12:18:32 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:43654 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728730AbgGGQSb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 12:18:31 -0400
X-IronPort-AV: E=Sophos;i="5.75,324,1589209200"; 
   d="scan'208";a="51540102"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 08 Jul 2020 01:18:29 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id DF7D54015EC4;
        Wed,  8 Jul 2020 01:18:26 +0900 (JST)
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
Subject: [PATCH 06/14] dt-bindings: power: Add r8a774e1 SYSC power domain definitions
Date:   Tue,  7 Jul 2020 17:18:04 +0100
Message-Id: <1594138692-16816-5-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594138692-16816-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1594138692-16816-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

This patch adds power domain indices for the RZ/G2H (r8a774e1) SoC.

Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 include/dt-bindings/power/r8a774e1-sysc.h | 36 +++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 include/dt-bindings/power/r8a774e1-sysc.h

diff --git a/include/dt-bindings/power/r8a774e1-sysc.h b/include/dt-bindings/power/r8a774e1-sysc.h
new file mode 100644
index 000000000000..7edb8161db36
--- /dev/null
+++ b/include/dt-bindings/power/r8a774e1-sysc.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_POWER_R8A774E1_SYSC_H__
+#define __DT_BINDINGS_POWER_R8A774E1_SYSC_H__
+
+/*
+ * These power domain indices match the numbers of the interrupt bits
+ * representing the power areas in the various Interrupt Registers
+ * (e.g. SYSCISR, Interrupt Status Register)
+ */
+
+#define R8A774E1_PD_CA57_CPU0		 0
+#define R8A774E1_PD_CA57_CPU1		 1
+#define R8A774E1_PD_CA57_CPU2		 2
+#define R8A774E1_PD_CA57_CPU3		 3
+#define R8A774E1_PD_CA53_CPU0		 5
+#define R8A774E1_PD_CA53_CPU1		 6
+#define R8A774E1_PD_CA53_CPU2		 7
+#define R8A774E1_PD_CA53_CPU3		 8
+#define R8A774E1_PD_A3VP		 9
+#define R8A774E1_PD_CA57_SCU		12
+#define R8A774E1_PD_A3VC		14
+#define R8A774E1_PD_3DG_A		17
+#define R8A774E1_PD_3DG_B		18
+#define R8A774E1_PD_3DG_C		19
+#define R8A774E1_PD_3DG_D		20
+#define R8A774E1_PD_CA53_SCU		21
+#define R8A774E1_PD_3DG_E		22
+#define R8A774E1_PD_A2VC1		26
+
+/* Always-on power area */
+#define R8A774E1_PD_ALWAYS_ON		32
+
+#endif /* __DT_BINDINGS_POWER_R8A774E1_SYSC_H__ */
-- 
2.17.1

