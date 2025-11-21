Return-Path: <linux-gpio+bounces-28944-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB54C78CE4
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 12:31:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8151A4ED3D0
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 11:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D4134A773;
	Fri, 21 Nov 2025 11:27:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23D2337BB4;
	Fri, 21 Nov 2025 11:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724463; cv=none; b=jxbV+bpKXdFCFWsssA1f/ddFAVBd3sTQI3w5Er+PuqiXqXSufOfBjKNYD/kHMve/2O7c7YG3b5Tar2mvWe3CdQkbT7RT8lZXalJJQJF3NQZeH3ONqVVKbL2SzNBDebALR4HdAIF37E/csuPc/g8v2SSZ5qosytcQDbNTdFWEzCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724463; c=relaxed/simple;
	bh=1Sb5tw0IuFCjN2pLAP/BYjKzrxNBpxLRvvBN92cnuOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IKigFYcmHgM+gZbRoWrzzGjx+AHiGzkN5yT2bbTkyQ7kEasHI7p/drRSZPrRMkzUgdkj3yMTEay6q4cv4ex7cH8hYNPCeJHP1IOahTj+nkRbgbfsfTXC/e5IoU/9Lx90spgDR0elwqulkhPTjq5FTgI8HnPQuWlpipjp/CxlnlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: iwVYaHpRS5efIPTyHl+BmQ==
X-CSE-MsgGUID: 2Flla5V7TBG83a5t3hqGvg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Nov 2025 20:27:30 +0900
Received: from demon-pc.localdomain (unknown [10.226.92.224])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 65694437C1A1;
	Fri, 21 Nov 2025 20:27:26 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
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
Subject: [PATCH 3/8] dt-bindings: pinctrl: renesas,r9a09g077-pinctrl: Document GPIO IRQ
Date: Fri, 21 Nov 2025 13:26:21 +0200
Message-ID: <20251121112626.1395565-4-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251121112626.1395565-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20251121112626.1395565-1-cosmin-gabriel.tanislav.xa@renesas.com>
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
 .../pinctrl/renesas,r9a09g077-pinctrl.yaml        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
index 36d665971484..1e171b443da1 100644
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
 
@@ -119,6 +130,8 @@ required:
   - gpio-controller
   - '#gpio-cells'
   - gpio-ranges
+  - interrupt-controller
+  - '#interrupt-cells'
   - clocks
   - power-domains
 
@@ -139,6 +152,8 @@ examples:
         gpio-controller;
         #gpio-cells = <2>;
         gpio-ranges = <&pinctrl 0 0 288>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
         power-domains = <&cpg>;
 
         serial0-pins {
-- 
2.52.0


