Return-Path: <linux-gpio+bounces-8358-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC68939FD4
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 13:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F5701F2297D
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 11:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96CF51514F1;
	Tue, 23 Jul 2024 11:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="njvcZ3Jv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AB21509AC;
	Tue, 23 Jul 2024 11:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721734109; cv=none; b=AF5KL1mEazwnQPKPKsX+NZ5rApllXHzdi9tU6RjOhR2hvaOPFeLKj+EoV0HUjvuOmk7gBuMK7on9MT0iwP6XC3VTeJ5CjHvROr2frJWrNIOtMp2T4B6XkZDh2oELG36UcgXiTVWLGJbC0zpFZjYHp/CtZy6H0PWsd0t2hB109NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721734109; c=relaxed/simple;
	bh=6aVvjVowW9Wu+EIEcex8bxj0klOHutOMqoPmSgWOOqw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NfT1Cy8gfxr8tXxertQXlkgvze2x/GnHyaNbCApPGeMIvYHEvStGFrn/7hO7F3cGsnAPxYQyvFVYzG04gd0Au+Wm36TV8ydN9QdmjeF/JIW31nBv35IvOG4oveQ/3gRXFO9NEGSX4M2rcHqOtNH/xxdDX2++yTrkPkgXBT77x40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=njvcZ3Jv; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721734108; x=1753270108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6aVvjVowW9Wu+EIEcex8bxj0klOHutOMqoPmSgWOOqw=;
  b=njvcZ3JveoGN0esFYNM2GgthPmWZ5wapA4wxtzZ9LkrlEb9ozEB0vQFE
   KdtojCQid7SUiDhONXIcqIW2uebeEWoe++VbjKNDVAi0kjCXoTIR2Aj8K
   xIaT846vTI575X/WlrMf6TxvzNxpWgB2SL5G02525sfvNQhRJNyXgMJx2
   ny4PCWMp97GeoY2gi9or3yB7fErAYOAEWsWcRgtc5NFOM4Xzd1FAlvSig
   ZFw4oqiX8IUkwW+rRof/Xs+swdxPZicU8iDonDCnFdFSM5mjQHn7QelYe
   A/GlFN4P5Upo78CJ7SJkM1giaoYaZMgAMVpbxa/wSZ/WGtf1C9984ivue
   A==;
X-CSE-ConnectionGUID: S6DrTYNTSQStcH62wvxgTw==
X-CSE-MsgGUID: Oc+XHPzzQEGWFtnBlzp9Bg==
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="29574953"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jul 2024 04:28:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jul 2024 04:28:09 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Jul 2024 04:28:06 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-kernel@vger.kernel.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Marc Zyngier
	<maz@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	"Rob Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Thomas Gleixner" <tglx@linutronix.de>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [RFC v7 2/6] dt-bindings: interrupt-controller: document PolarFire SoC's gpio interrupt mux
Date: Tue, 23 Jul 2024 12:27:11 +0100
Message-ID: <20240723-uncouple-enforcer-7c48e4a4fefe@wendy>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240723-supervise-drown-d5d3b303e7fd@wendy>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3570; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=6aVvjVowW9Wu+EIEcex8bxj0klOHutOMqoPmSgWOOqw=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGnzJ/fvPrujVDn3ikZUmUtEaYLhwiYpk0t3l5+crHYgY5vF kpxDHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiIOCfDX/mTgiFaXoHfTtVwTftw3f vEqgXved/r/tBkPM8pHCy7kYXhf6TmyUvzXJ2iP/0XkWHd6y55TPLv87iVNS+0r3JPO3CjgQUA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

On PolarFire SoC there are more GPIO interrupts than there are interrupt
lines available on the PLIC, and a runtime configurable mux is used to
decide which interrupts are assigned direct connections to the PLIC &
which are relegated to sharing a line.
This mux is, in our reference configuration, written by platform
firmware during boot based on the FPGA's configuration.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip,mpfs-gpio-irq-mux.yaml          | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/microchip,mpfs-gpio-irq-mux.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/microchip,mpfs-gpio-irq-mux.yaml b/Documentation/devicetree/bindings/interrupt-controller/microchip,mpfs-gpio-irq-mux.yaml
new file mode 100644
index 0000000000000..89ed3a630eef3
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/microchip,mpfs-gpio-irq-mux.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/microchip,mpfs-gpio-irq-mux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip Polarfire SoC GPIO Interrupt Mux
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+description: |
+  There are 3 GPIO controllers on this SoC, of which:
+  - GPIO controller 0 has 14 GPIOs
+  - GPIO controller 1 has 24 GPIOs
+  - GPIO controller 2 has 32 GPIOs
+
+  All GPIOs are capable of generating interrupts, for a total of 70.
+  There are only 41 IRQs available however, so a configurable mux is used to
+  ensure all GPIOs can be used for interrupt generation.
+  38 of the 41 interrupts are in what the documentation calls "direct mode",
+  as they provide an exclusive connection from a GPIO to the PLIC.
+  The 3 remaining interrupts are used to mux the interrupts which do not have
+  a exclusive connection, one for each GPIO controller.
+
+properties:
+  compatible:
+    const: microchip,mpfs-gpio-irq-mux
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+
+  interrupts:
+    description:
+      The first 38 entries must be the "direct" interrupts, for exclusive
+      connections to the PLIC. The final 3 entries must be the
+      "non-direct"/muxed connections for each of GPIO controller 0, 1 & 2
+      respectively.
+    maxItems: 41
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#interrupt-cells"
+  - interrupt-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    irqmux: interrupt-controller@20002054 {
+        compatible = "microchip,mpfs-gpio-irq-mux";
+        reg = <0x20002054 0x4>;
+        interrupt-parent = <&plic>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        status = "okay";
+        interrupts = <13>, <14>, <15>, <16>,
+                     <17>, <18>, <19>, <20>,
+                     <21>, <22>, <23>, <24>,
+                     <25>, <26>, <27>, <28>,
+                     <29>, <30>, <31>, <32>,
+                     <33>, <34>, <35>, <36>,
+                     <37>, <38>, <39>, <40>,
+                     <41>, <42>, <43>, <44>,
+                     <45>, <46>, <47>, <48>,
+                     <49>, <50>, <51>, <52>,
+                     <53>;
+    };
+...
-- 
2.43.2


