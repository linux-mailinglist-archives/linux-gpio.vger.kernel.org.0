Return-Path: <linux-gpio+bounces-13877-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 143EC9F13FA
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 18:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33D48168557
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 17:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 987C41E5707;
	Fri, 13 Dec 2024 17:39:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCCAE17B505;
	Fri, 13 Dec 2024 17:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734111571; cv=none; b=Di07ULobCRo+Hp0eLZ1eMY54OkeQI7ZycFAI3bmz5Ok5JLN1tl+7SA9YCbQNGZLK2Kb6vAO737RoosxgGL5DdoHYWBUpinRI80yMpGuyLqJbRmaBRWanwbJGEbFk46fXeuy1DtG3sEYWrY59DpBuS4JkJiEo0dJTwLltiRh9yPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734111571; c=relaxed/simple;
	bh=n2JhVDjflUMEtHO9FTHZxGaP8ZpXeCDSpDPSjPdaGAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/188BnA2evXrnn9mW/AueTI/svK3yotWaC9Hy3yKnql1wsUEmPZPSIMdeFlguHBvz56huqVw5Jp4+SuXv6jnD97QzXqeFxS3INWPMqwLXhG60CHdCJqzGhsSJ4IMSPKIVmNiPIO7K6QQ2roqZDZPM45Va9Vl6/fmDQgG0JXheQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: iUskIyrsTD+s2/9bP7wmoA==
X-CSE-MsgGUID: ZnxeHr2IRXOTrJoiY+AkIw==
X-IronPort-AV: E=Sophos;i="6.12,231,1728918000"; 
   d="scan'208";a="231774194"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 14 Dec 2024 02:39:27 +0900
Received: from localhost.localdomain (unknown [10.226.92.203])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0ADFF4009BE2;
	Sat, 14 Dec 2024 02:39:11 +0900 (JST)
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
Subject: [PATCH v3 2/7] dt-bindings: pinctrl: renesas: Document RZ/G3E SoC
Date: Fri, 13 Dec 2024 17:38:48 +0000
Message-ID: <20241213173901.599226-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213173901.599226-1-biju.das.jz@bp.renesas.com>
References: <20241213173901.599226-1-biju.das.jz@bp.renesas.com>
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
v2->v3:
 * Updated the macros with hardware indices in the hardware manual.
 * The changes are trivial, so retained ack tag from Conor.
v1->v2:
 * Fixed the warnings reported by bot.
---
 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  7 +++++--
 include/dt-bindings/pinctrl/rzg2l-pinctrl.h   | 19 +++++++++++++++++++
 2 files changed, 24 insertions(+), 2 deletions(-)

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
index c70308961dfa..ab6f71d9504d 100644
--- a/include/dt-bindings/pinctrl/rzg2l-pinctrl.h
+++ b/include/dt-bindings/pinctrl/rzg2l-pinctrl.h
@@ -24,16 +24,35 @@
 #define PORT_P9		9
 #define PORT_PA		10
 #define PORT_PB		11
+#define PORT_PC		12
+#define PORT_PD		13
+#define PORT_PE		14
+#define PORT_PF		15
+#define PORT_PG		16
+#define PORT_PH		17
+#define PORT_PI		18
+#define PORT_PJ		19
+#define PORT_PK		20
+#define PORT_PL		21
+#define PORT_PM		22
+#define PORT_PN		23
+#define PORT_PO		24
+#define PORT_PP		25
+#define PORT_PQ		26
+#define PORT_PR		27
+#define PORT_PS		28
 
 /*
  * Create the pin index from its bank and position numbers and store in
  * the upper 16 bits the alternate function identifier
  */
 #define RZG2L_PORT_PINMUX(b, p, f)	((b) * RZG2L_PINS_PER_PORT + (p) | ((f) << 16))
+#define RZG3E_PORT_PINMUX(b, p, f)	RZG2L_PORT_PINMUX(PORT_P##b, p, f)
 #define RZV2H_PORT_PINMUX(b, p, f)	RZG2L_PORT_PINMUX(PORT_P##b, p, f)
 
 /* Convert a port and pin label to its global pin index */
 #define RZG2L_GPIO(port, pin)	((port) * RZG2L_PINS_PER_PORT + (pin))
+#define RZG3E_GPIO(port, pin)	RZG2L_GPIO(PORT_P##port, pin)
 #define RZV2H_GPIO(port, pin)	RZG2L_GPIO(PORT_P##port, pin)
 
 #endif /* __DT_BINDINGS_RZG2L_PINCTRL_H */
-- 
2.43.0


