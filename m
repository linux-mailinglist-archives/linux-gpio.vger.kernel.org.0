Return-Path: <linux-gpio+bounces-13927-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1501E9F3A48
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 20:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 405F97A0347
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 19:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF06620CCE9;
	Mon, 16 Dec 2024 19:53:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3797920C48E;
	Mon, 16 Dec 2024 19:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734378832; cv=none; b=SVP9t6xqF1PsQeMiUVYRmEJX2PYzwcrrgm0eX4yxdmYIBy8HHSXEA+fyvRdF811zZUqJ8D+9NN294nw5g2Ls2Qj4jqGb8Qt/E7yf7Br6dsMwPiHcWhxfgXlbV7KfNrgDlHXTTl0ZYyZTkC0F3kes6dw3gpyKjxcmioaW6cONAH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734378832; c=relaxed/simple;
	bh=IBmblwPuoL0vvjltFdrHvH4ub1EGDEoc2g7FtC0d+xA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A5Rz2BPAsvgKCTzi2WllKxH1C/twapW6astpvvNWy2RBSS2yPlJSWMZwxaU25vanblVF82fl1dtEciFc3JdNL9VWp/dO0odIUsxCW8x7jGet0huYjWW09DkKo21iwyUohKivWI4ko/ha0iVwD1MtCQNc/cK2iYQAGgg9fbEUJfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: J3FiKQ5gSPyuBdd+GSkSaw==
X-CSE-MsgGUID: Gnyd55mRTFGw+eUZISuiOA==
X-IronPort-AV: E=Sophos;i="6.12,239,1728918000"; 
   d="scan'208";a="231992156"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Dec 2024 04:53:48 +0900
Received: from localhost.localdomain (unknown [10.226.93.40])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5CE1B40638CF;
	Tue, 17 Dec 2024 04:53:35 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 2/7] dt-bindings: pinctrl: renesas: Document RZ/G3E SoC
Date: Mon, 16 Dec 2024 19:53:12 +0000
Message-ID: <20241216195325.164212-3-biju.das.jz@bp.renesas.com>
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

Add documentation for the pin controller found on the Renesas RZ/G3E
(R9A09G047) SoC. The RZ/G3E PFC is similar to the RZ/V2H SoC but has more
pins(P00-PS3).

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Dropped ack tag from Conor as there is separate file for RZG3E_P*
   definitions
v2->v3:
 * Updated the macros with hardware indices in the hardware manual.
 * The changes are trivial, so retained ack tag from Conor.
v1->v2:
 * Fixed the warnings reported by bot.
---
 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  7 +++-
 .../pinctrl/renesas,r9a09g047-pinctrl.h       | 41 +++++++++++++++++++
 2 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index a1805b6e3f63..768bb3c2b456 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -26,6 +26,7 @@ properties:
               - renesas,r9a07g043-pinctrl # RZ/G2UL{Type-1,Type-2} and RZ/Five
               - renesas,r9a07g044-pinctrl # RZ/G2{L,LC}
               - renesas,r9a08g045-pinctrl # RZ/G3S
+              - renesas,r9a09g047-pinctrl # RZ/G3E
               - renesas,r9a09g057-pinctrl # RZ/V2H(P)
 
       - items:
@@ -125,7 +126,7 @@ additionalProperties:
         drive-push-pull: true
         renesas,output-impedance:
           description:
-            Output impedance for pins on the RZ/V2H(P) SoC. The value provided by this
+            Output impedance for pins on the RZ/{G3E,V2H(P)} SoC. The value provided by this
             property corresponds to register bit values that can be set in the PFC_IOLH_mn
             register, which adjusts the drive strength value and is pin-dependent.
           $ref: /schemas/types.yaml#/definitions/uint32
@@ -142,7 +143,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,r9a09g057-pinctrl
+            enum:
+              - renesas,r9a09g047-pinctrl
+              - renesas,r9a09g057-pinctrl
     then:
       properties:
         resets:
diff --git a/include/dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h b/include/dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h
new file mode 100644
index 000000000000..b2cda1a44b0a
--- /dev/null
+++ b/include/dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides constants for Renesas RZ/G3E family pinctrl bindings.
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ *
+ */
+
+#ifndef __DT_BINDINGS_RZG3E_PINCTRL_H
+#define __DT_BINDINGS_RZG3E_PINCTRL_H
+
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+/* RZG3E_Px = Offset address of PFC_P_mn  - 0x20 */
+#define RZG3E_P0	0
+#define RZG3E_P1	1
+#define RZG3E_P2	2
+#define RZG3E_P3	3
+#define RZG3E_P4	4
+#define RZG3E_P5	5
+#define RZG3E_P6	6
+#define RZG3E_P7	7
+#define RZG3E_P8	8
+#define RZG3E_PA	10
+#define RZG3E_PB	11
+#define RZG3E_PC	12
+#define RZG3E_PD	13
+#define RZG3E_PE	14
+#define RZG3E_PF	15
+#define RZG3E_PG	16
+#define RZG3E_PH	17
+#define RZG3E_PJ	19
+#define RZG3E_PK	20
+#define RZG3E_PL	21
+#define RZG3E_PM	22
+#define RZG3E_PS	28
+
+#define RZG3E_PORT_PINMUX(b, p, f)	RZG2L_PORT_PINMUX(RZG3E_P##b, p, f)
+#define RZG3E_GPIO(port, pin)		RZG2L_GPIO(RZG3E_P##port, pin)
+
+#endif /* __DT_BINDINGS_RZG3E_PINCTRL_H */
-- 
2.43.0


