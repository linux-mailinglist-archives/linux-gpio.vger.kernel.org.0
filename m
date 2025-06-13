Return-Path: <linux-gpio+bounces-21495-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BECFAAD83F7
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 09:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B39B9189AA2A
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 07:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49BD2C3259;
	Fri, 13 Jun 2025 07:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="P1vjmPIW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aJDF6bH9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD65F27466E;
	Fri, 13 Jun 2025 07:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749799232; cv=none; b=VvNZYqxF3qwlGe6S7fPjXjg/Uj0iD49RbXrblMaBl0BoRMKjFiQkVKQXlEjVq7L5hsj7RLT8IDrLhnWIkofYsXXRZ/lkHOxH816u8L5dau61q/Pvk9Xl7lP3fY0DxUMbsD1ziWWOvoqplDIeJpeZ8FiLSeOjLqSmleh1n+pvX4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749799232; c=relaxed/simple;
	bh=+YjpX3ehJBzFyIlBBXVZgihirAzVPRAt2FcAqpuOgFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYVYsG+bW4a7l3TyeDppKsDb7SHJ8je5P9NapWf4I6GK8FKVpkImgAt21uacrMFHLKrhtY8IKbUItCXt3ZuOKYnlNVocosFJwod88xA+MhTvWq9/PnctfUkDun5BCpP06gTKNA7wDI3yXiOe7Zfw23vlrkwBwot5OGdVU4ARdck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=P1vjmPIW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aJDF6bH9; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 650B91140176;
	Fri, 13 Jun 2025 03:20:29 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 13 Jun 2025 03:20:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1749799229; x=1749885629; bh=jG3O/Ud05M
	Zx4jdqboGk4v0NA5OIKt/wUnoKzAyvNxg=; b=P1vjmPIW2/wAUEeA7U/tXdD8iO
	X2gFnzTYmpSLkVbC09w7bT6bPL1TULq8W2sUytLHHqJJ4aI0qfqwkpBqqo7q6w+v
	a4ZHk6WXcFmwc2WPo9lyZCkx+u8Y/b+3YOlz1U1JWnCYeqPK9rF5mGZ4mzJYVWiF
	A1c0n+byiXnzx0u/cTlX4daS5hB61IqB5DzXn0pSZ0svhFE7jSCbiy1lYy0KsGI6
	nMMcRQ/Pi3oq7K89ZwjgmxFbeMhEhTJArNSb04t9Rd0AJSAYpwRQ1tGQsvvBj18f
	JS2eTa6EAZhrLgZ/mimYfOFD3ZLrXAEAtU/b1qiCUau14sMkRX9Xz+pp3StA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749799229; x=1749885629; bh=jG3O/Ud05MZx4jdqboGk4v0NA5OIKt/wUno
	KzAyvNxg=; b=aJDF6bH96UoECz7OWyAzTsE/qMXwjlqUqMqdgelSBR4u823P+lA
	OuIyyyna2iMtA+W+U5lFIt7HQwyx2w14Ve+gORg6fMrT/3ngWMY9mTAgrv2qgmAZ
	TmyPb2cFdF7DtNdUbvw8lnK2Kd5oQ38Czjg5XXt0ZbJxebF/yAXygAk6r/243gkv
	PQq+3hfhnC98ELI/3H19HjbTUm6s5YVUvYzt6D0uBT9Hp819sEFnFUcMVrX70PZ4
	HVO36Qv2TaL+S4uiExs0XvgWXgmHSS7mQcMHpfv0dREkGJDIC07yCJM5R4AWwTOj
	hQlV0rjzXHZKIj6cGNgjNUb7+Sz0ThOR6TQ==
X-ME-Sender: <xms:OtFLaFzKONTfZkXILH3XYzZEUfG55o5HOePR8cyOYqgjQEheeXElRA>
    <xme:OtFLaFTtwv46-jgC8eQlBk675fBDJDGwFoAGiEn6nElhmiFF-pJZg4bjG7pCyUo7P
    bifV4GMC71OkTG2vzs>
X-ME-Received: <xmr:OtFLaPXcCDMRRp9eE7KY1wBc1Thy0_u1RF6WWc0Bu6CQaDc08Ls5Xz72R7GZJoSuGa2FEalZSMpX0L-OqRD2ZTaK_VLLYkpSIjk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeefgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdej
    necuhfhrohhmpeflrghnnhgvucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqne
    cuggftrfgrthhtvghrnhepgfdvffevleegudejfeefheehkeehleehfefgjefffeetudeg
    tefhuedufeehfeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopedvvddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtth
    hopeguvhhorhhkihhnsehtihgssghordgtohhmpdhrtghpthhtohepfigvlhhlshhluhht
    fiesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlih
    hnrghrohdrohhrghdprhgtphhtthhopehprghtrhhitggvrdgthhhothgrrhgusehfohhs
    shdrshhtrdgtohhmpdhrtghpthhtohepshhuphhpohhrthdrohhpvghnshhouhhrtggvse
    guihgrshgvmhhirdgtohhmpdhrtghpthhtohepsggrrhhutghhsehtkhhoshdrtghordhi
    lhdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlhi
    hsshgrsehrohhsvghniiifvghighdrihho
X-ME-Proxy: <xmx:OtFLaHieCR7i3mjNcCHPqOC39MqmdSV6LhCiKBfiFb-q64TIIB5YUQ>
    <xmx:OtFLaHANXNHonW-Il6-KF7ktKwZkTU5LCJT5a6FVkmtn9vomjsSZ3Q>
    <xmx:OtFLaAL1atxc5kXngDg_VktyWDUvEDvh4xA-SzMkDl8AkEhtXk3jhw>
    <xmx:OtFLaGCvH_4PXKngaqe3MEnUmB4JVoNxMqDElPwknNqXKyWeOim_ZA>
    <xmx:PdFLaHUFclZvZJTCtf0C2rxGbtX2fEn1ZeQ73ehog305zlAuCf063FOc>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 03:20:26 -0400 (EDT)
Date: Fri, 13 Jun 2025 09:20:24 +0200
From: Janne Grunau <j@jannau.net>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	soc@lists.linux.dev, linux-sunxi@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 10/16] pinctrl: apple: use new GPIO line value setter
 callbacks
Message-ID: <20250613072024.GE3141695@robin.jannau.net>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
 <20250612-gpiochip-set-rv-pinctrl-remaining-v1-10-556b0a530cd4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-10-556b0a530cd4@linaro.org>

On Thu, Jun 12, 2025 at 03:15:19PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/pinctrl/pinctrl-apple-gpio.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
> index 0f551d67d482d96c7a1e4c28a6db580f0db6452e..dcf3a921b4df54250194403f06a3c1fb40110eaa 100644
> --- a/drivers/pinctrl/pinctrl-apple-gpio.c
> +++ b/drivers/pinctrl/pinctrl-apple-gpio.c
> @@ -217,11 +217,13 @@ static int apple_gpio_get(struct gpio_chip *chip, unsigned offset)
>  	return !!(reg & REG_GPIOx_DATA);
>  }
>  
> -static void apple_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
> +static int apple_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
>  {
>  	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
>  
>  	apple_gpio_set_reg(pctl, offset, REG_GPIOx_DATA, value ? REG_GPIOx_DATA : 0);
> +
> +	return 0;
>  }
>  
>  static int apple_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
> @@ -376,7 +378,7 @@ static int apple_gpio_register(struct apple_gpio_pinctrl *pctl)
>  	pctl->gpio_chip.direction_input = apple_gpio_direction_input;
>  	pctl->gpio_chip.direction_output = apple_gpio_direction_output;
>  	pctl->gpio_chip.get = apple_gpio_get;
> -	pctl->gpio_chip.set = apple_gpio_set;
> +	pctl->gpio_chip.set_rv = apple_gpio_set;
>  	pctl->gpio_chip.base = -1;
>  	pctl->gpio_chip.ngpio = pctl->pinctrl_desc.npins;
>  	pctl->gpio_chip.parent = pctl->dev;

apple_gpio_set_reg() could pass the return value of regmap_update_bits()
but I suppose this change to switch to the new callback is ok on its
own.

Reviewed-by: Janne Grunau <j@jannau.net>

Janne 

