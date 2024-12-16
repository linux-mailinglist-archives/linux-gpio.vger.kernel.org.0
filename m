Return-Path: <linux-gpio+bounces-13925-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C3A9F3A46
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 20:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E36EA7A1A81
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 19:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C4320CCD1;
	Mon, 16 Dec 2024 19:53:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836F520765F;
	Mon, 16 Dec 2024 19:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734378828; cv=none; b=XGsOSzigcT97KGpNYjRQD22I7/Hd4Y5sugw4a9XXahl1W92oTLTms7OmGU8mphKnqPrsTfYZwbjzxfAloQ0NEgOQSMKZvok/FyoA9600aHj2DRiutDkPR+bLVvLjBGaPbshFCHDdv9Zmdw770CeR3fCfKYQfUETLNy143bU+k+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734378828; c=relaxed/simple;
	bh=TDSQNZcr8os0qRW79wXqC62W3vnvQSRbJd0a3V8vOlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GFuaGWv8Dir5GHhAr1H5Ckb/4UGpGbI2rurGyaA1cH1Y1eGzNAbRsDL3UMDcFP/B2fCL5JS3e2Pp5N4/gI9LnNZdv3hKaOB+iaaZ9SVyy+j4iRdBU1InzphrH5Dy2jX8tYhMc77K+2E+2jBY/Y5GovPNH4w5CwxjhCtY5MOf+dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: Xfyo3feqQhmq0Py2ILNUEA==
X-CSE-MsgGUID: DKwQVNqrSbO1dkjUeCUgQg==
X-IronPort-AV: E=Sophos;i="6.12,239,1728918000"; 
   d="scan'208";a="228014620"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Dec 2024 04:53:43 +0900
Received: from localhost.localdomain (unknown [10.226.93.40])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id A6F8E406320F;
	Tue, 17 Dec 2024 04:53:31 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Add alpha-numerical port support for RZ/V2H
Date: Mon, 16 Dec 2024 19:53:11 +0000
Message-ID: <20241216195325.164212-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241216195325.164212-1-biju.das.jz@bp.renesas.com>
References: <20241216195325.164212-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RZ/V2H has ports P0-P9 and PA-PB. Add support for defining alpha-numerical
ports in DT using RZV2H_* macros.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Added new header file with separate RZV2H_P* definitions.
v3:
 * New patch.
---
 .../pinctrl/renesas,r9a09g057-pinctrl.h       | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h

diff --git a/include/dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h b/include/dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h
new file mode 100644
index 000000000000..9008a7e71609
--- /dev/null
+++ b/include/dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides constants for Renesas RZ/V2H family pinctrl bindings.
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ *
+ */
+
+#ifndef __DT_BINDINGS_RZV2H_PINCTRL_H
+#define __DT_BINDINGS_RZV2H_PINCTRL_H
+
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+/* RZV2H_Px = Offset address of PFC_P_mn  - 0x20 */
+#define RZV2H_P0	0
+#define RZV2H_P1	1
+#define RZV2H_P2	2
+#define RZV2H_P3	3
+#define RZV2H_P4	4
+#define RZV2H_P5	5
+#define RZV2H_P6	6
+#define RZV2H_P7	7
+#define RZV2H_P8	8
+#define RZV2H_P9	9
+#define RZV2H_PA	10
+#define RZV2H_PB	11
+
+#define RZV2H_PORT_PINMUX(b, p, f)	RZG2L_PORT_PINMUX(RZV2H_P##b, p, f)
+#define RZV2H_GPIO(port, pin)		RZG2L_GPIO(RZV2H_P##port, pin)
+
+#endif /* __DT_BINDINGS_RZV2H_PINCTRL_H */
-- 
2.43.0


