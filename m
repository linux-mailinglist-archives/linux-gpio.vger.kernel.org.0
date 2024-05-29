Return-Path: <linux-gpio+bounces-6785-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0F18D2C21
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 07:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AEA71C22099
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 05:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2791F15B985;
	Wed, 29 May 2024 05:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="N1gvTI6C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1DE15B577;
	Wed, 29 May 2024 05:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716959632; cv=none; b=fGKbSEWLOmqom8ejl69l5cGVPS3via/0YrKIFtGVSTg4DWzzfKPUtIRrcCJTNlaOurL8YjvlG6LFZVxzLIjhbgEKz8iJmnP+R08atjTCrWIWKFE9Y86S42EtlaIE+Czt7HPGHB/mBMN3no8dG8mc3MyyofvajKo2NRpquf7RHkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716959632; c=relaxed/simple;
	bh=q0ywzPv3N4UW0+g3oO484NorTjCE0X5hV9jtgBamYoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M0y2wT2I7Mcd4OpoOv0KHXQ77iupa4WSG64yCitjeEvVNpN8/izyKJHLmJ/hwFnRrricShh+5bln/ARvNeBqYHEBCm60elRHqJ0v9tFMX6qDZPIwIbk3tOnsBbAR0ELBmhaL/0CybJ7jzRypZaWpebzEf14mYdGdUQT/7tqGWXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=N1gvTI6C; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [127.0.1.1] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8CF14201FE;
	Wed, 29 May 2024 13:13:48 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1716959629;
	bh=mtqAhcAvlJCMsRl1w/jbIXT3+Kk1ZJpyaGl5JGCYoAo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=N1gvTI6CubZtn04shoegCi+x6OuiM4Basj1czUY0afacOBp2IlU7b2uazfXHbNGs0
	 VXy76WROR+zEEy+mcp6LSDZJ59sb2UJASKlyesXDs5jpQZNNW5e0asVfnVgltD/p7Z
	 pUGcVdv1pK+xROxyuVlkNlcLNZosTnOHH/OaUwLhNKfn2FlPPMMQD28FjF9Y8UANPK
	 QyeWS6EzueZLeogFKWi4CJpsQdu2/4eMF0CbyycF6KTxajs86wfu3OLbPaRABEHhdE
	 icKiimKaMqu8U9TC03uGxIMBHMZ/iIRwjjSnXpAD82zk0gA0+6yWI8gm0spjzH+Adq
	 A2sp6NsUAN3Gg==
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Wed, 29 May 2024 14:43:21 +0930
Subject: [PATCH 2/4] dt-bindings: gpio: aspeed,sgpio: Specify
 gpio-line-names
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-2-91c42976833b@codeconstruct.com.au>
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

Some devicetrees specify gpio-line-names in the sgpio node despite it
not being defined by the binding. It's a reasonable thing to do, so
define the property to squash warnings such as:

```
arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: sgpio@1e780200: 'gpio-line-names' does not match any of the regexes: 'pinctrl-[0-9]+'
```

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
index 6b15a3a3fb66..fe27b5d01e80 100644
--- a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
@@ -33,6 +33,11 @@ properties:
 
   gpio-controller: true
 
+  # Each SGPIO is represented as a pair of input and output GPIOs
+  gpio-line-names:
+    minItems: 160
+    maxItems: 256
+
   '#gpio-cells':
     const: 2
 

-- 
2.39.2


