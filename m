Return-Path: <linux-gpio+bounces-3579-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F174485E591
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 19:22:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 983532855D4
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 18:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C668592B;
	Wed, 21 Feb 2024 18:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NKusQvi5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9E184A45;
	Wed, 21 Feb 2024 18:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708539739; cv=none; b=o6V7nUHzMHS36ogNjLBtpv1QCP/O8PyFoVPfOzcK2IreqM3bs1Hlf94Ru1Z/00NKXhbQJ06AYXSejXx/9B50EExXdSWFbLBdQjhae6hlgH1psqs5vGhqKcY0Xc0vpW6dSeM4sgZnqv2Jf6CPTf6hteXJCh7r2opGoQ+NjWe+oPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708539739; c=relaxed/simple;
	bh=Ta0uwkMoQaUVf68ZIjlVJVYXMCn37o9xzzGO0+7BgAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VNFNLUgVC7N1XZ+lmr9oW7QLr4Qy4iOpxTZdGQHjLf/8FRlCMtAA6fNvZmnCfB23t72giaAynn3gz1UVdeJRLyKgcTucL0p5CUQvFwZGLE8Ss6tcC4N6PJC17A9JJCAtHophjixsMV35WI/lUc+DsLSLMl5c+pRBUC6Xv//Y5kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NKusQvi5; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB50F1C000D;
	Wed, 21 Feb 2024 18:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708539734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FOCBLr6BiDX7250O2XUhumlqLIiTQxaUMTYnh1sWS1o=;
	b=NKusQvi5DqjWL+U7TJMy3Pt5+ZgJDMplzdKH6gUZ5ps26DGQV2g+C2PmrVnQEnRkQTLbgC
	xi/T9oZw88oWuIAvPFow4YziUU/oBdAgAwWAz9onlATu17SYlI/IUxxySXO0qj0XlU8T3e
	0JsZj02DptY0ZgS8A5qfxPDO7RCIDdIfm4pV2/WJmGmAr3620h5whMhIiymr9Vg6upwDx9
	CxZWlY4FQq4rEdeSIlj28tYfQOgtujmGHcrRBPWPJU/ULk3hOCnOIJpzoMP4cCIBO6bY31
	Joz/l3PeZQEczr+mOVZhXy4C/tbNRloMQQNKuAKTUC9zGFxUbd3dP+IK5VuVTw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 21 Feb 2024 19:22:11 +0100
Subject: [PATCH v7 03/14] dt-bindings: clock: mobileye,eyeq5-clk: add
 bindings
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240221-mbly-clk-v7-3-31d4ce3630c3@bootlin.com>
References: <20240221-mbly-clk-v7-0-31d4ce3630c3@bootlin.com>
In-Reply-To: <20240221-mbly-clk-v7-0-31d4ce3630c3@bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-GND-Sasl: theo.lebrun@bootlin.com

Add DT schema bindings for the EyeQ5 clock controller driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 .../bindings/clock/mobileye,eyeq5-clk.yaml         | 51 ++++++++++++++++++++++
 include/dt-bindings/clock/mobileye,eyeq5-clk.h     | 22 ++++++++++
 2 files changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/mobileye,eyeq5-clk.yaml b/Documentation/devicetree/bindings/clock/mobileye,eyeq5-clk.yaml
new file mode 100644
index 000000000000..2d4f2cde1e58
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mobileye,eyeq5-clk.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/mobileye,eyeq5-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mobileye EyeQ5 clock controller
+
+description:
+  The EyeQ5 clock controller handles 10 read-only PLLs derived from the main
+  crystal clock. It also exposes one divider clock, a child of one of the PLLs.
+  Its registers live in a shared region called OLB.
+
+maintainers:
+  - Grégory Clement <gregory.clement@bootlin.com>
+  - Théo Lebrun <theo.lebrun@bootlin.com>
+  - Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
+
+properties:
+  compatible:
+    const: mobileye,eyeq5-clk
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: plls
+      - const: ospi
+
+  "#clock-cells":
+    const: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      Input parent clock to all PLLs. Expected to be the main crystal.
+
+  clock-names:
+    items:
+      - const: ref
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#clock-cells"
+  - clocks
+  - clock-names
+
+additionalProperties: false
diff --git a/include/dt-bindings/clock/mobileye,eyeq5-clk.h b/include/dt-bindings/clock/mobileye,eyeq5-clk.h
new file mode 100644
index 000000000000..26d8930335e4
--- /dev/null
+++ b/include/dt-bindings/clock/mobileye,eyeq5-clk.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2024 Mobileye Vision Technologies Ltd.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_MOBILEYE_EYEQ5_CLK_H
+#define _DT_BINDINGS_CLOCK_MOBILEYE_EYEQ5_CLK_H
+
+#define EQ5C_PLL_CPU	0
+#define EQ5C_PLL_VMP	1
+#define EQ5C_PLL_PMA	2
+#define EQ5C_PLL_VDI	3
+#define EQ5C_PLL_DDR0	4
+#define EQ5C_PLL_PCI	5
+#define EQ5C_PLL_PER	6
+#define EQ5C_PLL_PMAC	7
+#define EQ5C_PLL_MPC	8
+#define EQ5C_PLL_DDR1	9
+
+#define EQ5C_DIV_OSPI	10
+
+#endif

-- 
2.43.2


