Return-Path: <linux-gpio+bounces-13580-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C029E6C3E
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2024 11:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4F2016E9FC
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2024 10:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7CFF200117;
	Fri,  6 Dec 2024 10:23:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9051FF7DB;
	Fri,  6 Dec 2024 10:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733480631; cv=none; b=ABr46ynHprq2/OE9IEWWz6xBH2tkLH8zCJcIK0RpvU/tg08vH2PdhRawDElVFXb0NHmLimg30/ipaijXIZfSsTquf2HmXZgkFlh0DpcbeGc63yTtNcUZ0w+8fitf1YeOE6ByFD/I9rYMcilIOvwjAI+GHZjWvSHmw8QCzp/i8xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733480631; c=relaxed/simple;
	bh=6dTT4ybhkDUCAWDaDdaTa139IXaenrnwlJT9v01+Mh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ppejPERRvJuTBfRt9KXBB8cNpG4etjlw34jTOoczf1QmHNlPL8qUBoWxYG42XchWiY2EbJk38E8VQXJpKqRH6eyhMP6wxtLhgNwz72JdXUvkugsXOQXq1dT0U+C0YgMIoYmuQxeRZWpjAvM8yvd6s1cjkPCMTMj1SNhpATpZvDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: ZbaK5w9HQLaATiBAv0INJA==
X-CSE-MsgGUID: qDN0e/0jSSSpmpY6o/zt3g==
X-IronPort-AV: E=Sophos;i="6.12,213,1728918000"; 
   d="scan'208";a="231093082"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Dec 2024 19:23:47 +0900
Received: from localhost.localdomain (unknown [10.226.92.67])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id F13444004BBA;
	Fri,  6 Dec 2024 19:23:33 +0900 (JST)
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
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 1/4] dt-bindings: pinctrl: renesas: Document RZ/G3E SoC
Date: Fri,  6 Dec 2024 10:23:06 +0000
Message-ID: <20241206102327.8737-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241206102327.8737-1-biju.das.jz@bp.renesas.com>
References: <20241206102327.8737-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for the pin controller found on the Renesas RZ/G3E
(R9A09G047) SoC. The RZ/G3E PFC is similar to the RZ/V2H SoC but has more
pins(P00-PS3). The port number is alpha-numeric compared to the number on
the other SoCs. So add macros for alpha-numeric to number conversion.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Fixed the warnings reported by bot.
---
 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  7 ++++--
 include/dt-bindings/pinctrl/rzg2l-pinctrl.h   | 25 +++++++++++++++++++
 2 files changed, 30 insertions(+), 2 deletions(-)

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
diff --git a/include/dt-bindings/pinctrl/rzg2l-pinctrl.h b/include/dt-bindings/pinctrl/rzg2l-pinctrl.h
index c78ed5e5efb7..1b1b1114a84c 100644
--- a/include/dt-bindings/pinctrl/rzg2l-pinctrl.h
+++ b/include/dt-bindings/pinctrl/rzg2l-pinctrl.h
@@ -11,13 +11,38 @@
 
 #define RZG2L_PINS_PER_PORT	8
 
+#define RZG3E_P0		0
+#define RZG3E_P1		1
+#define RZG3E_P2		2
+#define RZG3E_P3		3
+#define RZG3E_P4		4
+#define RZG3E_P5		5
+#define RZG3E_P6		6
+#define RZG3E_P7		7
+#define RZG3E_P8		8
+#define RZG3E_PA		9
+#define RZG3E_PB		10
+#define RZG3E_PC		11
+#define RZG3E_PD		12
+#define RZG3E_PE		13
+#define RZG3E_PF		14
+#define RZG3E_PG		15
+#define RZG3E_PH		16
+#define RZG3E_PJ		17
+#define RZG3E_PK		18
+#define RZG3E_PL		19
+#define RZG3E_PM		20
+#define RZG3E_PS		21
+
 /*
  * Create the pin index from its bank and position numbers and store in
  * the upper 16 bits the alternate function identifier
  */
 #define RZG2L_PORT_PINMUX(b, p, f)	((b) * RZG2L_PINS_PER_PORT + (p) | ((f) << 16))
+#define RZG3E_PORT_PINMUX(b, p, f)	RZG2L_PORT_PINMUX(RZG3E_P##b, p, f)
 
 /* Convert a port and pin label to its global pin index */
 #define RZG2L_GPIO(port, pin)	((port) * RZG2L_PINS_PER_PORT + (pin))
+#define RZG3E_GPIO(port, pin)	RZG2L_GPIO(RZG3E_P##port, pin)
 
 #endif /* __DT_BINDINGS_RZG2L_PINCTRL_H */
-- 
2.43.0


