Return-Path: <linux-gpio+bounces-25327-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A581B3E559
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 15:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F22421757CF
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 13:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53275335BDB;
	Mon,  1 Sep 2025 13:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Ekq0so1u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001843314AF;
	Mon,  1 Sep 2025 13:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756733914; cv=none; b=UzuPWghhKAUq+2ks1AcydLzeUWbwVQYbeZwaFzKNuY0x/E2crgrlBzSK0lEgQ1KGGy6KmsVd8uJOHws2fvDXcjWssRsnB6ZZkrkVFriLenM74p8/jQayiBiHiVmMcE2UYncA1PH0PYWve3b3ig20NG3qLD6HILpcUSWNaGSpXcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756733914; c=relaxed/simple;
	bh=LOMVwhCj+jjyPYlIVU2ct3Dp3VQW+O3+nR63vMu7r8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=deOPv26Ax6tixezY5zc23pPeMqS1vPXQyMRO0lc1CRw3lM1wONMRQiqXvfY0dZ6YGsgRFo2l4DiB2ggLdkxZePlmNOctUDcF5Ls/U1Wwvl2tA4QN5duMkyRcZx2XzAl6FzZGOytFyLyCWyqsQqcfbg32y5D/SsCmTjVrbuUMFfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Ekq0so1u; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6D75C20F5E;
	Mon,  1 Sep 2025 15:38:30 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sg5SsRGHO6cE; Mon,  1 Sep 2025 15:38:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1756733909; bh=LOMVwhCj+jjyPYlIVU2ct3Dp3VQW+O3+nR63vMu7r8Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ekq0so1uxYaJkKB2VLtEkIGVgZAOx1ECixTvBXUAqpzKLPDiPzlL0rXjz9bOu4isJ
	 Vtk6e6hGPg3XJkcz18y0G77gJxyZvGDk0XG94+RduGAvc0tqI+2jaL3ymfrmNsTqlZ
	 c4nYYWg7Gtr4uivMNheNfVR8fl2vJLNAeboljMeJFUW2Xae2ZLub64lTTSYnbT4/pv
	 Xe+aZoNaC2dZcFCgzN8FOU9kRfuK9UWLY/3qAgsgyDiBM2BIMwgpWKRHjYGzf8umtZ
	 s1UnP9vaG7giIwYYZoRNDiRIaZEqegfr30sRnhfYDjD592HgGcg/FzJPDOiSK9nBSA
	 WEelyH/2v9oLQ==
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
	Yao Zi <ziyao@disroot.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] dt-bindings: gpio: loongson: Document GPIO controller of 2K0300 SoC
Date: Mon,  1 Sep 2025 13:38:02 +0000
Message-ID: <20250901133804.38433-2-ziyao@disroot.org>
In-Reply-To: <20250901133804.38433-1-ziyao@disroot.org>
References: <20250901133804.38433-1-ziyao@disroot.org>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


