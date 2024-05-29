Return-Path: <linux-gpio+bounces-6784-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F898D2C1D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 07:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C50C71F2459B
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 05:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A843A15B971;
	Wed, 29 May 2024 05:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="QYa0XjOA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB41315B576;
	Wed, 29 May 2024 05:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716959632; cv=none; b=GwJK/kROOsucA65huu9XNkaNoT2oddovBM28VLyGEyGzE4qQW+ojQeo7Z371DcqlbtAdNqbhOZ+hUq8RCSzj9gLh3UCVVadQ/hHHvdAq2thKq+/OzNlri8bPPz0fudMmmcSr0B4Kd9yuy/BLAydAAu24xvrcMckzubHJ+haw1Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716959632; c=relaxed/simple;
	bh=GM8LPBpwKXl+Vcdc3p4stBLCHkAcPevuDzjUI9Gsb8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uXVISfrPTtBYlSgxEJNV4KYnOQ7sCqktcXoB6C5pKxiEDfJXldoPbJ4d77SY0KkpSrqNRiWEF4HF/K6OlkDhcCu+pxyiMLiCv6ngk2jH0rXmGd9w/gllnUOyypIPtERWjoV77vAj9xO4LsLQYD9bUr4FtsrQltlFCZ7BU343K0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=QYa0XjOA; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [127.0.1.1] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D9B9720174;
	Wed, 29 May 2024 13:13:47 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1716959628;
	bh=/kCC/N3bNiMS05Tj8Fe/ikNvI4lWNncOVV0tIccEmmc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QYa0XjOALWVq7z6GhWeIteNJfE3k+PxHwl7GYBfn2DJ1mBhwZ+ulIvcY7QNOu3fHP
	 t3unjjg5ZFdfppIdD+oTS8knouKCNlgCyu+VSH8WOaxMqw5Ea5EMTT4WiYXK/+u8cz
	 3IAXc/3WDOD5Wl59RK/KNbnLmLlj5tzkKdr9h29WFThQsoPfO4GAmkLC5Pyi296jTf
	 hRIs7zNGKoIofzuFkSJi6ISt+gSjbcxH395uW+NM0rdNcoQUXk4+2y2kCJbSWAPS1v
	 BIUubirGDBSFCV9e7Il+Cic5NRdHKARn7dgxpE9vrFoukJMQl7DsLvy+mjvWI/sVYr
	 LqWMjLPWjqEgQ==
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Wed, 29 May 2024 14:43:20 +0930
Subject: [PATCH 1/4] dt-bindings: gpio: aspeed,sgpio: Order properties by
 DTS style
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-1-91c42976833b@codeconstruct.com.au>
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

Tidy up the list of required properties and the example node by ordering
the properties in terms of the DTS coding style.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
index 46bb121360dc..6b15a3a3fb66 100644
--- a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
@@ -51,12 +51,12 @@ properties:
 required:
   - compatible
   - reg
-  - gpio-controller
-  - '#gpio-cells'
+  - clocks
   - interrupts
   - interrupt-controller
+  - gpio-controller
+  - '#gpio-cells'
   - ngpios
-  - clocks
   - bus-frequency
 
 additionalProperties: false
@@ -65,13 +65,13 @@ examples:
   - |
     #include <dt-bindings/clock/aspeed-clock.h>
     sgpio: sgpio@1e780200 {
-        #gpio-cells = <2>;
         compatible = "aspeed,ast2500-sgpio";
-        gpio-controller;
-        interrupts = <40>;
         reg = <0x1e780200 0x0100>;
         clocks = <&syscon ASPEED_CLK_APB>;
+        interrupts = <40>;
         interrupt-controller;
+        gpio-controller;
+        #gpio-cells = <2>;
         ngpios = <80>;
         bus-frequency = <12000000>;
     };

-- 
2.39.2


