Return-Path: <linux-gpio+bounces-13875-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2249F13EF
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 18:39:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CFB6166FBA
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 17:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7001C1E5701;
	Fri, 13 Dec 2024 17:39:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E620F1E47B3;
	Fri, 13 Dec 2024 17:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734111558; cv=none; b=CnqW4WUmRbZtwHgaS3OrumsHkwb7fBWOI+vqPB/MbHaxuTOKjyvN3xSy7ykoSNz1cxi8+t8hM4eoaSo0szlrqclkuAYb5lFhGUFSz16xiiIfCqSx31hk6MsMZ2lR6/xF6BxXo4U0u1+3fyOmg0fD303jhAgjKcFuIbI8rAKxcF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734111558; c=relaxed/simple;
	bh=lhNhP45ZTLMQAi2yKYEhHH5b8qx/kJBfcFhCheu4fiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q2H2sfvRDqKrjL20XfnhKHm799a4vfUseJQ8GwAVaku/PMyYvvNeaqYh+tbD1dOqRAp9+ZsJ4+Jdk8ezgdeNqlKDNQcZlZmNI68srchF0zCLisWobvmgGeo04Z9odh6luf7nAeCnq1F75LAI6tsodzWLJZmgp2srLoa8dm1/Me8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: jEL9vfi3TbetmM6cTJYyrw==
X-CSE-MsgGUID: h9lz8ijuSTeYnLO+MqonKw==
X-IronPort-AV: E=Sophos;i="6.12,231,1728918000"; 
   d="scan'208";a="227797724"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 14 Dec 2024 02:39:14 +0900
Received: from localhost.localdomain (unknown [10.226.92.203])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 51D28400514D;
	Sat, 14 Dec 2024 02:39:08 +0900 (JST)
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
Subject: [PATCH v3 1/7] dt-bindings: pinctrl: renesas: Add alpha-numerical port support for RZ/V2H
Date: Fri, 13 Dec 2024 17:38:47 +0000
Message-ID: <20241213173901.599226-2-biju.das.jz@bp.renesas.com>
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

RZ/V2H has ports P0-P9 and PA-PB. Add support for defining alpha-numerical
ports in DT using RZV2H_* macros. Add PORT_P* macros based on PFC_P_mn
offset.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 * New patch.
---
 include/dt-bindings/pinctrl/rzg2l-pinctrl.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/dt-bindings/pinctrl/rzg2l-pinctrl.h b/include/dt-bindings/pinctrl/rzg2l-pinctrl.h
index c78ed5e5efb7..c70308961dfa 100644
--- a/include/dt-bindings/pinctrl/rzg2l-pinctrl.h
+++ b/include/dt-bindings/pinctrl/rzg2l-pinctrl.h
@@ -11,13 +11,29 @@
 
 #define RZG2L_PINS_PER_PORT	8
 
+/* PORT_Px = Offset address of PFC_P_mn  - 0x20 */
+#define PORT_P0		0
+#define PORT_P1		1
+#define PORT_P2		2
+#define PORT_P3		3
+#define PORT_P4		4
+#define PORT_P5		5
+#define PORT_P6		6
+#define PORT_P7		7
+#define PORT_P8		8
+#define PORT_P9		9
+#define PORT_PA		10
+#define PORT_PB		11
+
 /*
  * Create the pin index from its bank and position numbers and store in
  * the upper 16 bits the alternate function identifier
  */
 #define RZG2L_PORT_PINMUX(b, p, f)	((b) * RZG2L_PINS_PER_PORT + (p) | ((f) << 16))
+#define RZV2H_PORT_PINMUX(b, p, f)	RZG2L_PORT_PINMUX(PORT_P##b, p, f)
 
 /* Convert a port and pin label to its global pin index */
 #define RZG2L_GPIO(port, pin)	((port) * RZG2L_PINS_PER_PORT + (pin))
+#define RZV2H_GPIO(port, pin)	RZG2L_GPIO(PORT_P##port, pin)
 
 #endif /* __DT_BINDINGS_RZG2L_PINCTRL_H */
-- 
2.43.0


