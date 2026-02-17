Return-Path: <linux-gpio+bounces-31766-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6M8lCRWYlGkoFwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31766-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 17:32:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D3A14E346
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 17:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 044433017248
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 16:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866DD2DF138;
	Tue, 17 Feb 2026 16:32:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDEA356A15;
	Tue, 17 Feb 2026 16:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771345936; cv=none; b=CYytQXEAKZcNuyPEl0XMVpYCcueg9DWit9BOkf0shR9dAWiHrnOn1nfQgKjPPHGx9JF5qYUXICTjqucjGormZa+2AuG2jI57ACpu6Duli6qCFJAX4Qmc5B/BKHhDkWqZbc8Ww1r/5TrkANSY8yI/cpo7gxKBVTJoaj7Nv6LsF9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771345936; c=relaxed/simple;
	bh=UuPFoOMlGrm4G1j1+KRu8R/J7rIbx1+p1P8vTW+6IFU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oGVvbTVNoPwukYnw+qkhJSN7RANyJE3DOZGjnQ+tPT8PLAvq5CdkthJvWlNGeLiJvpdRn23rnE+kU6H3x3/If8FOQUYHIWsSxzOtELo5x7aHjLTE6gmbU21t6vULeblLRDsmhTN5XP/P5bYaKr+AiLy2ovb7l5serUOP1xytoeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C255D1477;
	Tue, 17 Feb 2026 08:32:06 -0800 (PST)
Received: from orionap.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 585743F62B;
	Tue, 17 Feb 2026 08:32:11 -0800 (PST)
Date: Tue, 17 Feb 2026 16:32:08 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland
 <samuel@sholland.org>, Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij
 <linusw@kernel.org>, James Hilliard <james.hilliard1@gmail.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sunxi: Implement gpiochip::get_direction()
Message-ID: <20260217163208.5db4cd1e@orionap.fritz.box>
In-Reply-To: <20260216160946.2977985-1-wens@kernel.org>
References: <20260216160946.2977985-1-wens@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31766-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,sholland.org,gmail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.przywara@arm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,orionap.fritz.box:mid]
X-Rspamd-Queue-Id: 95D3A14E346
X-Rspamd-Action: no action

On Tue, 17 Feb 2026 00:09:45 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

> After commit e623c4303ed1 ("gpiolib: sanitize the return value of
> gpio_chip::get_direction()"), a warning will be printed if the
> gpio driver does not implement this callback.

I am curious how this could slip through? Did the get_direction()
callback become mandatory at one point, but no one noticed that it was
missing for sunxi? It looks like the situation was even worse before that
patch, as it was dereferencing the function pointer without any check?

> Implement it for the sunxi driver. This is simply a matter of reading
> out the mux value from the registers, then checking if it is one of
> the GPIO functions and which direction it is.

Mmh, it feels a bit backwards to resort to the function name *string* for
comparison, when it's always 0 for in and 1 for out (which we actually set
in pinctrl-sunxi-dt.c now). But the mux value for IRQ is different between
SoC generations, and I guess for historic reasons function strings are a
thing in pinctrl, so this is probably the best solution after all:

> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

FWIW:
Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

P.S. Should we have some CC: stable tag here?

> ---
> This is an alternative to James's version. My version does one lookup
> instead of three.
> 
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 51 +++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index 0fb057a07dcc..27b2a3e9d78d 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -204,6 +204,32 @@ sunxi_pinctrl_desc_find_function_by_pin(struct sunxi_pinctrl *pctl,
>  	return NULL;
>  }
>  
> +static struct sunxi_desc_function *
> +sunxi_pinctrl_desc_find_function_by_pin_and_mux(struct sunxi_pinctrl *pctl,
> +						const u16 pin_num,
> +						const u8 muxval)
> +{
> +	for (unsigned int i = 0; i < pctl->desc->npins; i++) {
> +		const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
> +		struct sunxi_desc_function *func = pin->functions;
> +
> +		if (pin->pin.number != pin_num)
> +			continue;
> +
> +		if (pin->variant && !(pctl->variant & pin->variant))
> +			continue;
> +
> +		while (func->name) {
> +			if (func->muxval == muxval)
> +				return func;
> +
> +			func++;
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
>  static int sunxi_pctrl_get_groups_count(struct pinctrl_dev *pctldev)
>  {
>  	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
> @@ -930,6 +956,30 @@ static const struct pinmux_ops sunxi_pmx_ops = {
>  	.strict			= true,
>  };
>  
> +static int sunxi_pinctrl_gpio_get_direction(struct gpio_chip *chip,
> +					    unsigned int offset)
> +{
> +	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
> +	const struct sunxi_desc_function *func;
> +	u32 pin = offset + chip->base;
> +	u32 reg, shift, mask;
> +	u8 muxval;
> +
> +	sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
> +
> +	muxval = (readl(pctl->membase + reg) & mask) >> shift;
> +
> +	func = sunxi_pinctrl_desc_find_function_by_pin_and_mux(pctl, pin, muxval);
> +	if (!func)
> +		return -ENODEV;
> +
> +	if (!strcmp(func->name, "gpio_out"))
> +		return GPIO_LINE_DIRECTION_OUT;
> +	if (!strcmp(func->name, "gpio_in") || !strcmp(func->name, "irq"))
> +		return GPIO_LINE_DIRECTION_IN;
> +	return -EINVAL;
> +}
> +
>  static int sunxi_pinctrl_gpio_direction_input(struct gpio_chip *chip,
>  					unsigned offset)
>  {
> @@ -1601,6 +1651,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
>  	pctl->chip->request = gpiochip_generic_request;
>  	pctl->chip->free = gpiochip_generic_free;
>  	pctl->chip->set_config = gpiochip_generic_config;
> +	pctl->chip->get_direction = sunxi_pinctrl_gpio_get_direction;
>  	pctl->chip->direction_input = sunxi_pinctrl_gpio_direction_input;
>  	pctl->chip->direction_output = sunxi_pinctrl_gpio_direction_output;
>  	pctl->chip->get = sunxi_pinctrl_gpio_get;


