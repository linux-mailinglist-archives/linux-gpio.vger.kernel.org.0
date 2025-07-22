Return-Path: <linux-gpio+bounces-23657-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2636B0E698
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 00:42:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C83CF1C878AE
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 22:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135A5289340;
	Tue, 22 Jul 2025 22:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OiwP4pKb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2C728727A;
	Tue, 22 Jul 2025 22:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753224141; cv=none; b=VBYcB75dINq0DtfznHP+rdD5BCZXwAbOmAdau9YW3B8292wxHudIPeHmjbCF+tZsYGbO66rV+RQ0c47eiMiCPnyrAv8K5vh6arIiA20uDQritQTrpF1ORRU7JukZlEJhROew/b1Znf3bqm6hSeOXS9HMAaP5yjU4Tpm0auXkFJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753224141; c=relaxed/simple;
	bh=ldaHuURYnlqZqVA1+U4sCKk5t6+FG1lj5JJep03e6hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9jii7WSFCYbEM6xBBwWsGyipk6teiC3gC7v7InFA8iz8NbT5N+EWk4EL+xMv95fCtjZfSGjq4dHDIt0kgAz9tR6r/Gc5u4CXIGvKAe+Xh6Ny5O9t7Tr82A763grVKQcLzUbUSbPzDqpXWFDBo7kGvmMCzjhozsvoSAZQllctwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OiwP4pKb; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 69C9943275;
	Tue, 22 Jul 2025 22:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753224136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b5Yg+pdTXpo6t0O7UQl+RIbiB4LOKOnIdXdXoBOJyck=;
	b=OiwP4pKbiIk4mcSLaL9RdN2P/6K+rHryH62SPWAsZd52iz5Z/rFoylJzCtRSvzA2tb7on4
	Cc+C1huFf+QizyFqpxlSeHww+c27B+NZbxavUsmSYrsFLRmzmwATEOBRdHu/X4+i8rNedF
	2Rt+a/ijrDx8kZhxNeKML482g2M6o/w7sLBzT7INqvxOROp87kjKZhylh0BO0pXsSKSaAm
	8TCPBtxwgM1FWhZWQj5TMO6jTubmAUh0Ad+QSa1VcFrFdJ291BxVmw0E+cYdPHvpUTuVT3
	uHDpKLgC1+i+WXdaDsm52o61H8G7VrwA+8WYRlDT/vS+J283lNr85hBFHGxudw==
Date: Wed, 23 Jul 2025 00:42:14 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Harshit Shah <hshah@axiado.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Frank Li <Frank.Li@nxp.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, soc@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	Jan Kotas <jank@cadence.com>, linux-serial@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 06/10] dt-bindings: i3c: cdns: add Axiado AX3000 I3C
 controller
Message-ID: <20250722224214cd72ae8b@mail.local>
References: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
 <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-6-543979a60ccf@axiado.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-6-543979a60ccf@axiado.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejiedufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegsieehmegsvdhftdemkegsleekmeejledtheemrggsvgelmeduhedvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemsgeiheemsgdvfhdtmeeksgelkeemjeeltdehmegrsggvleemudehvddvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvgedprhgtphhtthhopehhshhhrghhsegrgihirgguohdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehjihhrihhsl
 hgrsgihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihgthhgrlhdrshhimhgvkhesrghmugdrtghomhdprhgtphhtthhopehpghgrjhestggruggvnhgtvgdrtghomhdprhgtphhtthhopefhrhgrnhhkrdfnihesnhigphdrtghomhdprhgtphhtthhopegssghrvgiiihhllhhonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On 22/07/2025 13:15:34-0700, Harshit Shah wrote:
> Add binding for AX3000 I3C controller. So far, no changes known,
> so it can fallback to default compatible.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Harshit Shah <hshah@axiado.com>

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>



> ---
>  Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
> index cad6d53d0e2e35ddaaad35215ec93dd182f28319..6fa3078074d0298d9786a26d7f1f2dd2c15329a7 100644
> --- a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
> @@ -14,7 +14,12 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: cdns,i3c-master
> +    oneOf:
> +      - const: cdns,i3c-master
> +      - items:
> +          - enum:
> +              - axiado,ax3000-i3c
> +          - const: cdns,i3c-master
>  
>    reg:
>      maxItems: 1
> 
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

