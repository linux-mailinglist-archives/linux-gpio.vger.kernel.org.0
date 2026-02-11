Return-Path: <linux-gpio+bounces-31594-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEROAyZHjGkHkgAAu9opvQ
	(envelope-from <linux-gpio+bounces-31594-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 10:08:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3C012289E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 10:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A9FB3012C99
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 09:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 798D3352934;
	Wed, 11 Feb 2026 09:08:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF56D70808;
	Wed, 11 Feb 2026 09:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770800929; cv=none; b=nPoKOmkkHVzw777Kz2qsXO3MciJSdoTW88EeKlfc6gL6nAOoWsGJFi/YU1TXmW3ZtTjrZ0nGw6LpZk5iW6g6WglFqp1g7+9PG/L+vxQq1+DaAkTnAgEppaKUuhurYroykkant/4Q2cpVaQqUrmLJncj0hRo9odT+zfitc1QOSjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770800929; c=relaxed/simple;
	bh=9RwDd9+oeUz4TV3gMJGR+NGjSCqbSmZWAGgAC0OOggI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LWLD6wKlMRVRbW0Y3/Ia7Qu63HcuVADYMb/+HwMz/iF+14ojzUoruMMsyRKUB6mO2Ej2OLam8rQ2Wjf2jNnpN6SSCrSlHwEagUChQJ4ZTwO1SLuERZ8JQGMxJRRXSR5uKX2H14R4XdynmNBguUX/owRxbcuZOzWsSI4D7FdENsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CDAE339;
	Wed, 11 Feb 2026 01:08:40 -0800 (PST)
Received: from [192.168.178.73] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 201C83F740;
	Wed, 11 Feb 2026 01:08:44 -0800 (PST)
Message-ID: <c78bd0c3-6889-46f8-8b5a-e3490ce7b9c5@arm.com>
Date: Wed, 11 Feb 2026 10:08:43 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] pinctrl: sunxi: add GPIO get_direction callback
To: James Hilliard <james.hilliard1@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260211033249.2770281-1-james.hilliard1@gmail.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260211033249.2770281-1-james.hilliard1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31594-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.linux.dev,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.przywara@arm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:mid]
X-Rspamd-Queue-Id: 9B3C012289E
X-Rspamd-Action: no action

Hi James,

On 2/11/26 04:32, James Hilliard wrote:
> Implement sunxi_pinctrl_gpio_get_direction() and wire it into
> the sunxi gpio_chip setup.

thanks for taking care and sending a patch! I am still scratching my 
head what this warning is about exactly and why we only see this now? I 
never saw this, so what caused that? libgpiod accesses from userland?

Regardless, can we hold back this patch, please? As part of the A733 
pinctrl support (and as LinusW asked kindly about that) I was reworking 
our driver to use the generic gpio interface, and I have a feeling this 
would solve this problem automatically?
The actual pinctrl conversion is done, I just need to plug in the IRQ 
support. I ideally would have something in the next days to post, would 
that be worth waiting for?

Cheers,
Andre



> 
> The new callback reads the pin mux register and compares the mux
> value against the pin descriptor gpio_in and gpio_out functions
> to report GPIO_LINE_DIRECTION_IN or GPIO_LINE_DIRECTION_OUT.
> If the pin is muxed to irq, report it as input.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   drivers/pinctrl/sunxi/pinctrl-sunxi.c | 32 +++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index 0fb057a07dcc..424f23be27b2 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -995,6 +995,37 @@ static int sunxi_pinctrl_gpio_direction_output(struct gpio_chip *chip,
>   					    chip->base + offset, false);
>   }
>   
> +static int sunxi_pinctrl_gpio_get_direction(struct gpio_chip *chip,
> +					    unsigned int offset)
> +{
> +	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
> +	struct sunxi_desc_function *in, *out, *irq;
> +	u32 reg, shift, mask, val;
> +	u16 pin = chip->base + offset;
> +
> +	in = sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "gpio_in");
> +	out = sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "gpio_out");
> +	if (!in || !out)
> +		return -EINVAL;
> +
> +	irq = sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "irq");
> +
> +	sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
> +	val = (readl(pctl->membase + reg) & mask) >> shift;
> +
> +	if (val == in->muxval)
> +		return GPIO_LINE_DIRECTION_IN;
> +
> +	if (val == out->muxval)
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	/* IRQ function is effectively input. */
> +	if (irq && val == irq->muxval)
> +		return GPIO_LINE_DIRECTION_IN;
> +
> +	return -EINVAL;
> +}
> +
>   static int sunxi_pinctrl_gpio_of_xlate(struct gpio_chip *gc,
>   				const struct of_phandle_args *gpiospec,
>   				u32 *flags)
> @@ -1603,6 +1634,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
>   	pctl->chip->set_config = gpiochip_generic_config;
>   	pctl->chip->direction_input = sunxi_pinctrl_gpio_direction_input;
>   	pctl->chip->direction_output = sunxi_pinctrl_gpio_direction_output;
> +	pctl->chip->get_direction = sunxi_pinctrl_gpio_get_direction;
>   	pctl->chip->get = sunxi_pinctrl_gpio_get;
>   	pctl->chip->set = sunxi_pinctrl_gpio_set;
>   	pctl->chip->of_xlate = sunxi_pinctrl_gpio_of_xlate;


