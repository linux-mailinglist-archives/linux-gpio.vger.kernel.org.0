Return-Path: <linux-gpio+bounces-8134-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2DE92BEF7
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 17:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 657081F2317E
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 15:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9977019D8A1;
	Tue,  9 Jul 2024 15:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d02Y0aDb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5393C15C9;
	Tue,  9 Jul 2024 15:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720540698; cv=none; b=Ba30vht2TqWQeTRoqfprNCln8XpHtei3z7zmKLKMYhojVJyKtpIOPVCoetKO4NwE56UitCI0qDuj47tsWTwJwAZq/Ql8P1z8CUEdGWhXqX8CNgE4KisHqcRT4pxENndEVinVJhbB4jNuBvFJ/W6+kwPTsqRsCUdEBZva9W1m1NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720540698; c=relaxed/simple;
	bh=jZZfFhDWJGWsSF3CS99E11c1PeK4aHzAek4MCfMwkMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOevjagQugVtscO0IiQ9MCWmmURgM4O53QkGLfCfhlTalSFA6Y06Q+2OqIp2DWMFz26d71E1b5o+PugoJ5V3BIwfid6OKwFvTfxPnfhFr107Psd9HcOh6VcuZCaNlfqaf0f88nTFDA8PUC+Q2NbLEkQSePETQlzcCi8gRVvUQ0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d02Y0aDb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B585CC3277B;
	Tue,  9 Jul 2024 15:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720540697;
	bh=jZZfFhDWJGWsSF3CS99E11c1PeK4aHzAek4MCfMwkMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d02Y0aDbRlaXAbUBJh1EwfgwtWzOq1XH1M5oLg5Y7qDaHwbzMdBrufjcGzZ0veWwg
	 dQGg+tSExq3JxOZkPltLzuP5Meu8n+odhnLiVUu4FsTFJIpVwidwYm8YwRf+AXa9Yo
	 BNyOAFfSYoxuSCHFJPFXBotrK5iM9ot7cwIZ+gP4TWtJpIzH+vFh1EjWsk2hg8rT63
	 RVKhJzmKaym4eJMDRrJBTt0a+lagw5JBhSpKwSPRhvHJJZIcg29AYAfyuzWpI065vu
	 0SNfg1khrex2qrSN4JLAgosrgfxP2XvBWUG5BoxnDLbAMQHFbEBaxIIHF1UyrarExL
	 jyRBFlgo+ETgg==
Date: Tue, 9 Jul 2024 09:58:16 -0600
From: Rob Herring <robh@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, krzk+dt@kernel.org,
	conor+dt@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	arnd@arndb.de, durai.manickamkr@microchip.com,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] dt-bindings: pinctrl: Convert Atmel PIO3 pinctrl
 to json-schema
Message-ID: <20240709155816.GB3589336-robh@kernel.org>
References: <20240709092354.191643-1-manikandan.m@microchip.com>
 <20240709092354.191643-6-manikandan.m@microchip.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240709092354.191643-6-manikandan.m@microchip.com>

On Tue, Jul 09, 2024 at 02:53:54PM +0530, Manikandan Muralidharan wrote:
> Convert Atmel PIO3 pinctrl binding document to DT schema format
> json-schema.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> changes in v3:
> - Remove quotes in $ref
> - modify the gpio regex
> - Remove pinmux pinctrl subnode regex and modify it since they do not
> follow a particular order or pattern, Adding 'type:object' with this
> '^[a-z0-9-_]+$' regex does throw DTC_CHK errors for other
> pio3 pinctrl properties
> 
> changes in v2:
> - Fix bot errors by fixing issues in 4/5 
> - remove qoutes from $ref
> ---
>  .../bindings/pinctrl/atmel,at91-pinctrl.txt   | 178 -----------------
>  .../pinctrl/atmel,at91rm9200-pinctrl.yaml     | 184 ++++++++++++++++++
>  2 files changed, 184 insertions(+), 178 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.yaml

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

