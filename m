Return-Path: <linux-gpio+bounces-24454-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7023B28A57
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Aug 2025 05:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A2B4AE548F
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Aug 2025 03:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898F41DE3A5;
	Sat, 16 Aug 2025 03:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="OMX6oo49"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AA51C3BFC;
	Sat, 16 Aug 2025 03:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755316263; cv=none; b=JmirZCmoNlHqAOp8leTmO7pWMLDq0cfCmr0hErMbmFDMJ1/MF9xEa+ZrobQPs0Cu6eP2ikuTw/Wb4R/QUWYvaU+Tc64bsY0Sgov5LIHUi3QkRVszrF0+AUCYGUapMa+azn+/UwU2oVX2iCoomgHAix6FBY1C0lDKC3KO1cXtjH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755316263; c=relaxed/simple;
	bh=/oFehg2j2rus3tay7rYW/IxrtFgksaibc1/CaSNrtVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FBKBgzqiqWih9m4YTYJUvyGKcqvK4A0kbzIl6R/cYabeo5bB3lSKPu3i2cIVvct9UwX9azYEvqLH+gAZiCJdOhbU/onjRTSovCaxxZdsYeqmuBLwC3nwpU2k3xA3spnY8jIAalDzyC5J1tJhx9j8eauYjApKsxwzIbJzFpjcy7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=OMX6oo49; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 524F425EA7;
	Sat, 16 Aug 2025 05:51:00 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fO7Gh72zkSNp; Sat, 16 Aug 2025 05:50:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755316259; bh=/oFehg2j2rus3tay7rYW/IxrtFgksaibc1/CaSNrtVI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OMX6oo492qxAd5tZlVCf/Wa38NvQuF9Q5HHRN4p9X+gAigr5WEQCQEGo57NxEUVQF
	 VUMWBewv8HfEt13uha2YflTchy7E8WsJTHufrik+jRoaFkkDxTCwhLqUyZJlJb38jQ
	 RthlxeQr1BctGDH55jSW4qOeXcos0QHk3Cf0plVY+v+JdYuPnJpEVHMyylsLnGjMBw
	 uILeJCslvUvNnFRamSh2Me0TsyVfEqL4diYYSmCNHdI51SLdOCpqRhiL4JurDf7325
	 sEH134GfHjR2VS6ws7PZ0njLwvTkNBDAenIyg9OYHv9P2K5bKcl/qAmMZqxFKDSIWs
	 x9oBn25LN9JXA==
From: Yao Zi <ziyao@disroot.org>
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 1/3] dt-bindings: gpio: loongson: Document GPIO controller of 2K0300 SoC
Date: Sat, 16 Aug 2025 03:50:26 +0000
Message-ID: <20250816035027.11727-3-ziyao@disroot.org>
In-Reply-To: <20250816035027.11727-2-ziyao@disroot.org>
References: <20250816035027.11727-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Loongson 2K0300 ships a GPIO controller whose input/output control logic
is similar to previous generation of SoCs. Additionally, it acts as an
interrupt-controller supporting both level and edge interrupts and has a
distinct reset signal.

Describe its compatible in devicetree. We enlarge the maximum value of
ngpios to 128, since the controller technically supports at most 128
pins, although only 106 are routed out of the package. Properties for
interrupt-controllers and resets are introduced and limited as 2K0300
only.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 .../bindings/gpio/loongson,ls-gpio.yaml       | 28 ++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml b/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
index b68159600e2b..69852444df23 100644
--- a/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - loongson,ls2k-gpio
+          - loongson,ls2k0300-gpio
           - loongson,ls2k0500-gpio0
           - loongson,ls2k0500-gpio1
           - loongson,ls2k2000-gpio0
@@ -36,7 +37,7 @@ properties:
 
   ngpios:
     minimum: 1
-    maximum: 64
+    maximum: 128
 
   "#gpio-cells":
     const: 2
@@ -49,6 +50,14 @@ properties:
     minItems: 1
     maxItems: 64
 
+  "#interrupt-cells":
+    const: 2
+
+  interrupt-controller: true
+
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -58,6 +67,23 @@ required:
   - gpio-ranges
   - interrupts
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: loongson,ls2k0300-gpio
+    then:
+      required:
+        - "#interrupt-cells"
+        - interrupt-controller
+        - resets
+    else:
+      properties:
+        "#interrupts-cells": false
+        interrupt-controller: false
+        resets: false
+
 additionalProperties: false
 
 examples:
-- 
2.50.1


