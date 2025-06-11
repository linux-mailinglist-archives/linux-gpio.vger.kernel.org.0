Return-Path: <linux-gpio+bounces-21328-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73692AD4CFE
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 09:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 863D31668E1
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 07:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C370E233708;
	Wed, 11 Jun 2025 07:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ExHWWoEY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBB7229B38;
	Wed, 11 Jun 2025 07:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749627331; cv=none; b=NM5qqWUckzVBLtmSm3A0/ajX4tfuhyj0AbVpXzeXoNJe9ic5eSG7v6hl0UnmRiRVwxAFZPiMV5iNkPf1kpkCw/oxKQX0c4kdqNU8fUClzCeN4D6p76kCzdMLeDhINKdkjZcBARGF2TYb+CKcXSSgr+t9OBmczC5W97Zyv5jXbNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749627331; c=relaxed/simple;
	bh=NmUB89glos6asOSTmWibIDn1aNbS9flC3wOiPjY7pAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/nuLA3cJ1HSjXnQ9ZO/hssn4a39uvZT4h+YU+/4ao4y1xNJQ/U3MER+jCLOecO+xqT+D84dZs+fKJExA1/Xy8rESdLXB+7nxSKPrPsrq572zWDGaZcI1OBjjKCaxytU0MHxQtyX6rixn1zuIFLmvw1yhGo3U5olE0Unm6sSgmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ExHWWoEY; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E7773443D3;
	Wed, 11 Jun 2025 07:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749627326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KiyDyclqecsk9BIhJPotcA86DvJLdYwDNphU2h/Syvs=;
	b=ExHWWoEY7rGIzBH2hTP41+dRx7QD45h9+GCRlhMqsGjxIUva5rl/uu6M7C0UepYUk7Y9I4
	y0QCs58j7ZYuyIoZCiOsT7vAdRmdkfa4EtnvTsBT1pAMdwtmXmYU7NRLjlgz/AogBmT9gq
	2US+W4HBVTtpEw73AVkrR8bxCiZTAOQiYLy4Yt0KuNdklqu4q7Okv0y1OK+A26vcxX6zqf
	6wsxpsI6vtrPBsIEOGd0J/N5QdPcZ5QjoQqEX5Kxy9Ra7Jwt2ZmzTwU5dJMbq7HNgHQQcr
	ISRQwIoW5kmXWeccGDoDXEyzEJpJB9DPCj8MHSy8O/THILFtsRDHsDLiDWTTvg==
Date: Wed, 11 Jun 2025 09:35:21 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>, Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Lars Persson <lars.persson@axis.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Michal Simek <michal.simek@amd.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@axis.com, linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 17/17] rtc: stm32: Constify static 'pinctrl_desc'
Message-ID: <20250611073521eaf70434@mail.local>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
 <20250611-pinctrl-const-desc-v2-17-b11c1d650384@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-pinctrl-const-desc-v2-17-b11c1d650384@linaro.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduudeklecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieevfeekgeevgfegudeuuedtfffgiefffedtudeftdehkeelieettdffhffftdenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedvugdutdemkeejugehmedvsgguieemvdehjeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmedvugdutdemkeejugehmedvsgguieemvdehjeejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegledprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihskhhisehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopeeurghsrghvrghrrghjrdfpr
 ghtihhkrghrsegrmhgurdgtohhmpdhrtghpthhtohepufhhhigrmhdqshhunhgurghrrdfuqdhksegrmhgurdgtohhmpdhrtghpthhtoheprghnughrvgifsegtohguvggtohhnshhtrhhutghtrdgtohhmrdgruhdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruhdprhgtphhtthhopegrvhhifhhishhhmhgrnhejtdesghhmrghilhdrtghomhdprhgtphhtthhopehtmhgrihhmohhnjeejsehgmhgrihhlrdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com

On 11/06/2025 08:13:49+0200, Krzysztof Kozlowski wrote:
> The local static 'struct pinctrl_desc' is not modified, so can be made
> const for code safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> 
> ---
> 
> Patch depends on this series - const in pinctrl core. Please ack and
> this should go via pinctrl tree.
> ---
>  drivers/rtc/rtc-stm32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
> index ef8fb88aab48a0edad19ae5872421815aa04fe46..d4ebf3eb54aa9e91c8e9f8254f571c53794192fd 100644
> --- a/drivers/rtc/rtc-stm32.c
> +++ b/drivers/rtc/rtc-stm32.c
> @@ -393,7 +393,7 @@ static const struct pinmux_ops stm32_rtc_pinmux_ops = {
>  	.strict			= true,
>  };
>  
> -static struct pinctrl_desc stm32_rtc_pdesc = {
> +static const struct pinctrl_desc stm32_rtc_pdesc = {
>  	.name = DRIVER_NAME,
>  	.pins = stm32_rtc_pinctrl_pins,
>  	.npins = ARRAY_SIZE(stm32_rtc_pinctrl_pins),
> 
> -- 
> 2.45.2
> 

