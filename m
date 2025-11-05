Return-Path: <linux-gpio+bounces-28118-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37027C35D72
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 14:29:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF0471899489
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 13:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C5531D393;
	Wed,  5 Nov 2025 13:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YL7Kibw+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBB031D371
	for <linux-gpio@vger.kernel.org>; Wed,  5 Nov 2025 13:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762349211; cv=none; b=a4q5j8IUlQC+98TFzP+11/VrRUHj2LudlhZ69V+u6v8zE0BE0Tqhr0RC2sQZAcnDf3n8Zb7iAU2f1RQhhA69qSKkUTJ+Qazyc1+ehWrFEoNr4N3iBIbJMEwy7EMjdM34f+TLw0ikA4JpMXg9607ouxWua9N/FXFlKMQ7Se3dzQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762349211; c=relaxed/simple;
	bh=IHY6rytRQpqzPhB2aiYR+C+4jwVndLV36Pc4ex8HYhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NY3VI4SWJKGugtgY/PqARcEn43j9QPXLmYcZ7ja4ixfp8Ai0TdbszqHC2ZevRa7WgY1zDK+OTOZkVhwbQu9eThoitOHeY4EQ0aEkeUDJNHo1AtXCrGN0yxLfCbkqDQtvm6gp3Qdr6dpqAcrqqVf5MXxX75VNQ0qc2CCVjNZ0hBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YL7Kibw+; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6571DC0E633;
	Wed,  5 Nov 2025 13:26:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5483860693;
	Wed,  5 Nov 2025 13:26:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AFF1C102F1EE5;
	Wed,  5 Nov 2025 14:26:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762349205; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=uifLZp4U9pUGvLsbQU1oTJDlQ22nTkkVAsDheTV04iY=;
	b=YL7Kibw+BnpbXzqfm8VIkUr1qfC80eLiaXq695de/aSgs1/ct4ycRtw8ZL2nzEMDeFLvVo
	rZrlMevg47Q4XjUAIh/ljxfQPEGosNcd/0fPzsCdnauF4qw2pf6akyxrZUVcgVi9irKG3f
	l3KrgjWDHoQ/NEUVkiKaNS75pbaDeQFTqeAnUZAeiHV7g5y9+hOKuPJ3H4WklzINbyGr1w
	RvKwbVLUrv1HDNT9YLADSKW7TRt2cCHJLTmomXl0cy3JbRbk2GSUTgtbiDZkQqOOCAeWGN
	kKL90Q7U0snJqLEh0eiNYttF9q0j+wxzR0fju2ywQqAIml3NsnP2EpbPYjgXEw==
Message-ID: <b3a4e2b3-f360-4dee-815b-cee3b9095074@bootlin.com>
Date: Wed, 5 Nov 2025 14:26:42 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] gpio: add gpio-line-mux driver
To: Jonas Jelonek <jelonek.jonas@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251105103607.393353-1-jelonek.jonas@gmail.com>
 <20251105103607.393353-3-jelonek.jonas@gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20251105103607.393353-3-jelonek.jonas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 11/5/25 11:36 AM, Jonas Jelonek wrote:
> Add a new driver which provides a 1-to-many mapping for a single real
> GPIO using a multiplexer. Each virtual GPIO corresponds to a multiplexer
> state which, if set for the multiplexer, connects the real GPIO to the
> corresponding virtual GPIO.
> 
> This can help in various usecases. One practical case is the special
> hardware design of the Realtek-based XS1930-10 switch from Zyxel. It
> features two SFP+ ports/cages whose signals are wired directly to the
> switch SoC. Although Realtek SoCs are short on GPIOs, there are usually
> enough the fit the SFP signals without any hacks.
> 
> However, Zyxel did some weird design and connected RX_LOS, MOD_ABS and
> TX_FAULT of one SFP cage onto a single GPIO line controlled by a
> multiplexer (the same for the other SFP cage). The single multiplexer
> controls the lines for both SFP and depending on the state, the
> designated 'signal GPIO lines' are connected to one of the three SFP
> signals.
> 
> Because the SFP core/driver doesn't support multiplexer but needs single
> GPIOs for each of the signals, this driver fills the gap between both.
> It registers a gpio_chip, provides multiple virtual GPIOs and sets the
> backing multiplexer accordingly.
> 
> Due to several practical issues, this is input-only and doesn't support
> IRQs.
> 
> Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
> ---
>  MAINTAINERS                  |   6 ++
>  drivers/gpio/Kconfig         |   9 +++
>  drivers/gpio/Makefile        |   1 +
>  drivers/gpio/gpio-line-mux.c | 129 +++++++++++++++++++++++++++++++++++
>  4 files changed, 145 insertions(+)
>  create mode 100644 drivers/gpio/gpio-line-mux.c
> 
Reviewed-by: Thomas Richard <thomas.richard@bootlin.com>

Best Regards,
Thomas

