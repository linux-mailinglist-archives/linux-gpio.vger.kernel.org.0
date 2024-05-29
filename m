Return-Path: <linux-gpio+bounces-6786-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDD48D2C23
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 07:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9421B1C21CCE
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 05:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9947D15CD40;
	Wed, 29 May 2024 05:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="T5l8q/Jk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E630015B579;
	Wed, 29 May 2024 05:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716959633; cv=none; b=WdYFPBY0MnEIh0KG2AnWJsNAcTHGapB7iKmNDc4C7YIV6C/J41mvhVyyAVA89/Wl5mLWxcoHWCL+HlVnJqJFWBO4bJkivy/JUzU9q23EaTVg8D7Zy8TTP0XVuaqwOVhPGXp8wJQrOZx1vlUda9TPu8QPzoKMpzEcjcPcxSxbISQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716959633; c=relaxed/simple;
	bh=pQT3j1oQNxF5pViaB6Eu0BnBEiWEkDrOna3mi9rt0oA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L91W+Ek5ztS5/EFrm3yd9ijRNiIVbDOqZZ6ymV2t38Kc0tNk6FY4n2ZbaNN2dRGERGvKOa6H3PrMgHZRqE+0DWHdFqT+bRDermze45LXOU0j+BDPmTtZDJH5lO7wI8+FRU4yxKNsxk8VrhlSoLtc5s7Yjlen0xh/Flo/BKI4a/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=T5l8q/Jk; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [127.0.1.1] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 43F322024D;
	Wed, 29 May 2024 13:13:49 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1716959629;
	bh=RM0WLi2RJAK84kDk7oeF/Th0CqQkfxxrTkSFxmoFxho=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=T5l8q/JkQhlJqQvasahZe8N9NJFmSYLuQ0yU3G9i4C5vTUCBKyMD7XHhRpPFfaIpM
	 Ts5bK7T26S0UExzICplw4oGdsJS6tlHY+dJnNPlMKpUlZdC6IrtQSaFBpyTZZvtkCR
	 aDIFiQqPBcRsGLsJqmC27MMCw2XO/6jSyeOyldx84q4IipV53vuytBBgqwE1sjFPRG
	 YVxszLFo6dYlDUmpXt+Lp0N3z90kQ3AhH+3/YqXhWBY8vVXdmguaX/KKhtDNDrHMHj
	 Jt9p+1+z8nc5vytFxAwoqp1AYpXglN59qW28cBWwFusHhQY+PB1CN9hQU6Ju+8us31
	 IL2hqk104VfAg==
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Wed, 29 May 2024 14:43:22 +0930
Subject: [PATCH 3/4] dt-bindings: gpio: aspeed,sgpio: Specify
 #interrupt-cells
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-3-91c42976833b@codeconstruct.com.au>
References: <20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-0-91c42976833b@codeconstruct.com.au>
In-Reply-To: <20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-0-91c42976833b@codeconstruct.com.au>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0

Squash warnings such as:

```
/home/andrew/src/kernel.org/linux/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: sgpio@1e780200: '#interrupt-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
```

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
index fe27b5d01e80..02c02ef97565 100644
--- a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
@@ -46,6 +46,9 @@ properties:
 
   interrupt-controller: true
 
+  '#interrupt-cells':
+    const: 2
+
   clocks:
     maxItems: 1
 
@@ -75,6 +78,7 @@ examples:
         clocks = <&syscon ASPEED_CLK_APB>;
         interrupts = <40>;
         interrupt-controller;
+        #interrupt-cells = <2>;
         gpio-controller;
         #gpio-cells = <2>;
         ngpios = <80>;

-- 
2.39.2


