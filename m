Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8FE2173BB
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 18:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728988AbgGGQSs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 12:18:48 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:44391 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728959AbgGGQSr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 12:18:47 -0400
X-IronPort-AV: E=Sophos;i="5.75,324,1589209200"; 
   d="scan'208";a="51328925"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 08 Jul 2020 01:18:46 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B0EB740164B9;
        Wed,  8 Jul 2020 01:18:43 +0900 (JST)
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
Subject: [PATCH 11/14] clk: renesas: Add r8a774e1 CPG Core Clock Definitions
Date:   Tue,  7 Jul 2020 17:18:09 +0100
Message-Id: <1594138692-16816-10-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594138692-16816-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1594138692-16816-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Add all RZ/G2H Clock Pulse Generator Core Clock Outputs, as listed in
Table 11.2 ("List of Clocks [RZ/G2H]") of the RZ/G2H Hardware User's
Manual.

Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 include/dt-bindings/clock/r8a774e1-cpg-mssr.h | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 include/dt-bindings/clock/r8a774e1-cpg-mssr.h

diff --git a/include/dt-bindings/clock/r8a774e1-cpg-mssr.h b/include/dt-bindings/clock/r8a774e1-cpg-mssr.h
new file mode 100644
index 000000000000..b2fc1d1c3c47
--- /dev/null
+++ b/include/dt-bindings/clock/r8a774e1-cpg-mssr.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_CLOCK_R8A774E1_CPG_MSSR_H__
+#define __DT_BINDINGS_CLOCK_R8A774E1_CPG_MSSR_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* R8A774E1 CPG Core Clocks */
+#define R8A774E1_CLK_Z			0
+#define R8A774E1_CLK_Z2			1
+#define R8A774E1_CLK_ZG			2
+#define R8A774E1_CLK_ZTR		3
+#define R8A774E1_CLK_ZTRD2		4
+#define R8A774E1_CLK_ZT			5
+#define R8A774E1_CLK_ZX			6
+#define R8A774E1_CLK_S0D1		7
+#define R8A774E1_CLK_S0D2		8
+#define R8A774E1_CLK_S0D3		9
+#define R8A774E1_CLK_S0D4		10
+#define R8A774E1_CLK_S0D6		11
+#define R8A774E1_CLK_S0D8		12
+#define R8A774E1_CLK_S0D12		13
+#define R8A774E1_CLK_S1D2		14
+#define R8A774E1_CLK_S1D4		15
+#define R8A774E1_CLK_S2D1		16
+#define R8A774E1_CLK_S2D2		17
+#define R8A774E1_CLK_S2D4		18
+#define R8A774E1_CLK_S3D1		19
+#define R8A774E1_CLK_S3D2		20
+#define R8A774E1_CLK_S3D4		21
+#define R8A774E1_CLK_LB			22
+#define R8A774E1_CLK_CL			23
+#define R8A774E1_CLK_ZB3		24
+#define R8A774E1_CLK_ZB3D2		25
+#define R8A774E1_CLK_ZB3D4		26
+#define R8A774E1_CLK_CR			27
+#define R8A774E1_CLK_CRD2		28
+#define R8A774E1_CLK_SD0H		29
+#define R8A774E1_CLK_SD0		30
+#define R8A774E1_CLK_SD1H		31
+#define R8A774E1_CLK_SD1		32
+#define R8A774E1_CLK_SD2H		33
+#define R8A774E1_CLK_SD2		34
+#define R8A774E1_CLK_SD3H		35
+#define R8A774E1_CLK_SD3		36
+#define R8A774E1_CLK_RPC		37
+#define R8A774E1_CLK_RPCD2		38
+#define R8A774E1_CLK_MSO		39
+#define R8A774E1_CLK_HDMI		40
+#define R8A774E1_CLK_CSI0		41
+#define R8A774E1_CLK_CP			42
+#define R8A774E1_CLK_CPEX		43
+#define R8A774E1_CLK_R			44
+#define R8A774E1_CLK_OSC		45
+#define R8A774E1_CLK_CANFD		46
+
+#endif /* __DT_BINDINGS_CLOCK_R8A774E1_CPG_MSSR_H__ */
-- 
2.17.1

