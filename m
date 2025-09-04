Return-Path: <linux-gpio+bounces-25549-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DA8B42EDE
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 03:35:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DF003ACA75
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 01:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44DDE1BD9D0;
	Thu,  4 Sep 2025 01:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="gFO/43M0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3469584A3E;
	Thu,  4 Sep 2025 01:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756949712; cv=none; b=PhgEZOIbpQrj/Tb8szfkRRdvt3WpkZuqvUQMfZQCXTWpM+f9aE8TqzpnbIfNk+cNX1O2EIzBDhLNLwFxF27sKCZxUGYypml9WPbRFDYenD6/7NWeQ7uwRQYCB8Z+LZiVZdhO2eoG0iMPRQLuLM7iQCaAJvRL2XB4TPwqOlSHJG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756949712; c=relaxed/simple;
	bh=HGeMJivM5dsvsfLphCbTOUUOtUXXZkF8ad8cC9GU4hI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fXMKD8NwwpxJiGJymV3A5+ui+LiLTCtlrjfwMHAdESgAgXdrcpWkwIixSQ0fLTy+o/MZYkP7X22zWKA8heEhElC1vu/CWjs/D3BOWd0AXZgyPF5NUEmQI8w5sJ607uBc3Y9DH0gAvgzP5frx3NVhTYnnnJPL3UlLyNYkcuw+I2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=gFO/43M0; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D4B1822FC2;
	Thu,  4 Sep 2025 03:35:08 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qUdN7d7rQUZn; Thu,  4 Sep 2025 03:35:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1756949708; bh=HGeMJivM5dsvsfLphCbTOUUOtUXXZkF8ad8cC9GU4hI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gFO/43M0f9M3/Yy0oZvEW+6YqlswQEZWGrxIJWLDxAVt8d6XD/Z7UAq9UcIpArotv
	 zIlSDESGX92iWRQhOVIFVFwui77TF/bflGBsJf6oHIKf6Z3b0UHhjJiXBaZ9SZIXa1
	 vf+ZYXo+b7yAKleFAjDtqFkML56yf10ZdO6ELlRrjwPQRA939Hs/2JrZdt3JKzfQWP
	 zll+NCz5hkE8Y8PzF5WFIS0ULHn9z8aXu+4li3PJufnTeUVnEjcmEJ5ECmmF3EYoAw
	 GAdAv4kIsMWi/OgulVWFPywC1wdW+NGrsWXkkeNNCAedHdO/8YxSdwP+AFrWdaoQjK
	 /ZzNn+BaW/Zjw==
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH v3 1/3] dt-bindings: gpio: loongson: Document GPIO controller of LS2K0300 SoC
Date: Thu,  4 Sep 2025 01:34:36 +0000
Message-ID: <20250904013438.2405-2-ziyao@disroot.org>
In-Reply-To: <20250904013438.2405-1-ziyao@disroot.org>
References: <20250904013438.2405-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Loongson-2K0300 ships a GPIO controller whose input/output control logic
is similar to previous generation of SoCs. Additionally, it acts as an
interrupt-controller supporting both level and edge interrupts and has a
distinct reset signal.

Describe its compatible in devicetree. We enlarge the maximum value of
ngpios to 128, since the controller technically supports at most 128
pins, although only 106 are routed out of the package. Properties for
interrupt-controllers and resets are introduced and limited as LS2K0300
only.

Signed-off-by: Yao Zi <ziyao@disroot.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
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


