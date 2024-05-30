Return-Path: <linux-gpio+bounces-6897-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4828D430A
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 03:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC4552847F6
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 01:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205321C69C;
	Thu, 30 May 2024 01:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="RWjkJhrx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670401BF31;
	Thu, 30 May 2024 01:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717033222; cv=none; b=sOzzqA9506Sfrdxjk+eYwjwGpNJovaSWBmpGqZeFeBnID04XZR8CqIOhJEX4nFi4qRjCVDo9ihiHaFQiLBmGCVHgUrBmNpLcBD13JrJMnEGBVtwflmz1jRVJH9knpDt1UpQXHeTQwX6beY280Z7XhOGhWF2NNqFoxYXwmWfppc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717033222; c=relaxed/simple;
	bh=JO7wwmqAHXK3bLDBcSGkf4Nurx/Nkn1DnQr2vC+i37c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IEBk7b210Kh9uAGrbdZRnO3k5bC1eQVGaFpEn2X4D2Kzj+0+MphCX+Q1Pw9e53xRArc02rvz2AJbeqRprRj4sIONdRayMdNYdjv5QFJdRxq/z9FEvRVedDl4hbeQDpX3hjjtY/IUX+Q6kL+xgo9QTY35JGZxGCuamNPhT2/aRuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=RWjkJhrx; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [127.0.1.1] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AC7D12012B;
	Thu, 30 May 2024 09:40:18 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717033219;
	bh=1SCvZYb3nhOKFCGFtjKWFoOu9SXIs+4ZnQMej0UWIdI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RWjkJhrxwBcBObJ0K8kU8WL58ykxTlzxaP4Kv/nhclY8RSr0aRrt1m9cIB6vlC5Xb
	 lew55Xvs39WtfhzH/1NjMe0Bi+2fEQ0QVOMN6ybsdChDIf9rwiFcE/kQGMdGFJgspI
	 Wy5wV/47vRSPlF3y2fZpwWeUotNpqvYIBNonZ+G217GZSkX8/VFGm2SqE8kKXriv40
	 pjUvUSQ2pmlkHRkkAup7FWcqT0Gt958UTtHcY2zsM4MU570RH3ud8ZPMIVyCRw5/+v
	 ILaiFKoeKfeNjFS7f0rQNv9RckE7fU54n3yOnbHFql5x4XJYHVX8b6qTPnIrTVEFQz
	 tF8UXvIKeQRyA==
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 30 May 2024 11:09:48 +0930
Subject: [PATCH v2 1/2] dt-bindings: gpio: aspeed,sgpio: Specify
 gpio-line-names
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-dt-warnings-gpio-sgpio-interrupt-cells-v2-1-912cd16e641f@codeconstruct.com.au>
References: <20240530-dt-warnings-gpio-sgpio-interrupt-cells-v2-0-912cd16e641f@codeconstruct.com.au>
In-Reply-To: <20240530-dt-warnings-gpio-sgpio-interrupt-cells-v2-0-912cd16e641f@codeconstruct.com.au>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0

Some devicetrees specify gpio-line-names in the sgpio node despite it
not being defined by the binding. It's a reasonable thing to do, so
define the property to squash warnings such as:

    arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: sgpio@1e780200: 'gpio-line-names' does not match any of the regexes: 'pinctrl-[0-9]+'

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
index 46bb121360dc..34cdf1ad9c73 100644
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


