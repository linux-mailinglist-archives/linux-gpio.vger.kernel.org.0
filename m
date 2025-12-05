Return-Path: <linux-gpio+bounces-29290-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA92CA815F
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Dec 2025 16:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BC1331BD728
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Dec 2025 15:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC2F33EAEB;
	Fri,  5 Dec 2025 15:03:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7C133E378;
	Fri,  5 Dec 2025 15:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764947027; cv=none; b=Y8FvN5VxSXBT0eG4PbQD4AaoXCO9lGy4QSvCQjVT/TsVk+b731YE6WXkPdkTJYMl0bEb+jCfUJsiSteT+BCHUVB+fRNHz4Xl+2jYuohTWTwZou/7OE7JXqQRoyCdKxRds7mRaZWuxWgPla9gYLtVN/R6ve7PpD/oMX8qvFxUdxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764947027; c=relaxed/simple;
	bh=h8k/DS8Gux03E64mIoumDEnoGPFTiylMCzLKCaNMtZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CYwiGFp9hWHew5GYx4yMAHfMtsgNegkCzqwtJyM5KvrdLWeyLFy5ni5nRb4s59to6WOYfUN8PL0p/rxgZkfPGSDj6iysX4r0YKwvUWbjHlnUUlmRQA8S6iU3irpDFA7wuw3P5bULQMj/ZMlp+i46Bc2jVhiKLkLHyb8PPHQoEMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: yAL7x8YES2y67zWN+sgRkA==
X-CSE-MsgGUID: dCgfaKj2Qn+3dQPlkRK2Fw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 06 Dec 2025 00:03:40 +0900
Received: from demon-pc.localdomain (unknown [10.226.93.202])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id EA351427BFF0;
	Sat,  6 Dec 2025 00:03:36 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH v2 3/8] dt-bindings: pinctrl: renesas,r9a09g077-pinctrl: Document GPIO IRQ
Date: Fri,  5 Dec 2025 17:02:29 +0200
Message-ID: <20251205150234.2958140-4-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Renesas RZ/T2H (R9A09G077) and Renesas RZ/N2H (R9A09G087) SoCs have
IRQ-capable pins handled by the ICU, which forwards them to the GIC.

The ICU supports 16 IRQ lines, the pins map to these lines arbitrarily,
and the mapping is not configurable.

Document the required properties to handle GPIO IRQ.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---

V2:
 * drop interrupt-controller and #interrupt-cells from required to keep
   compatibility

 .../bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
index 36d665971484..f049013a4e0c 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
@@ -49,6 +49,17 @@ properties:
   gpio-ranges:
     maxItems: 1
 
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+    description:
+      The first cell contains the global GPIO port index, constructed using the
+      RZT2H_GPIO() helper macro from <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
+      and the second cell is used to specify the flag.
+      E.g. "interrupts = <RZT2H_GPIO(8, 6) IRQ_TYPE_EDGE_FALLING>;" if P08_6 is
+      being used as an interrupt.
+
   clocks:
     maxItems: 1
 
@@ -139,6 +150,8 @@ examples:
         gpio-controller;
         #gpio-cells = <2>;
         gpio-ranges = <&pinctrl 0 0 288>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
         power-domains = <&cpg>;
 
         serial0-pins {
-- 
2.52.0

