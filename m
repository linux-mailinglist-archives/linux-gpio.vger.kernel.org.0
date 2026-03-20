Return-Path: <linux-gpio+bounces-33927-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wH/VIcBQvWlr8gIAu9opvQ
	(envelope-from <linux-gpio+bounces-33927-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 14:50:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBD62DB575
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 14:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9ED4B3026C10
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 13:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230B63002D1;
	Fri, 20 Mar 2026 13:49:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CCF02E7657;
	Fri, 20 Mar 2026 13:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774014557; cv=none; b=PCIj4hTEGeke1T1SHKUA1Fvv+zklSd8irlfDfarIs2HdN2tkBQWmQxpQAFHnMnEeHp19o98ngqVF6HadHP9vYn7PTXmVnVQ5BLT3U+6Vv05M7Af9dTezb6f1/GLfJ2Y5FqMevLETOTL3nvsbhGio3N52dlFfejPTAZqNc85FGCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774014557; c=relaxed/simple;
	bh=5QNo1YCvuwTLA/rkVwGZgBUrpdMzf3F0y/xzfx9Rpyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mns1fq+3xs+35XALDHh9I7zVUENWj9KUcajY3ieLobnwk3S/kO1d4U3XYG7YxLVvlOmjRw7Le6GDee8AfWeT/iQn/l+jjv992ZUEsshsENofXBw0WQdMjuxbi8E0uQonNB31cpLup8QD3PZ1mgJzWprwJnFUQUXKQMBOWB5b3Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0F4D165C;
	Fri, 20 Mar 2026 06:49:08 -0700 (PDT)
Received: from [10.57.83.197] (unknown [10.57.83.197])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D652A3F778;
	Fri, 20 Mar 2026 06:49:12 -0700 (PDT)
Message-ID: <53a12f3e-3dfd-42e5-910c-5ed97e20e14a@arm.com>
Date: Fri, 20 Mar 2026 14:48:55 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
To: Michal Piekos <michal.piekos@mmpsystems.pl>,
 Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260319-rc2-boot-hang-v5-0-092834a882b1@mmpsystems.pl>
 <20260319-rc2-boot-hang-v5-2-092834a882b1@mmpsystems.pl>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260319-rc2-boot-hang-v5-2-092834a882b1@mmpsystems.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33927-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[mmpsystems.pl,kernel.org,gmail.com,sholland.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.przywara@arm.com,linux-gpio@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.604];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mmpsystems.pl:email]
X-Rspamd-Queue-Id: DEBD62DB575
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

On 3/19/26 18:19, Michal Piekos wrote:
> Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
> 
> The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
> is in uninitialized state.
> 
> Solution is to set pinmux to GPIO INPUT in
> sunxi_pinctrl_irq_request_resources() if it wasn't initialized
> earlier.
> 
> Tested on Orange Pi Zero 3.
> 
> Fixes: 01e10d0272b9 ("pinctrl: sunxi: Implement gpiochip::get_direction()")
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
>   drivers/pinctrl/sunxi/pinctrl-sunxi.c | 21 +++++++++++++++++++--
>   drivers/pinctrl/sunxi/pinctrl-sunxi.h |  2 ++
>   2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index 685b79fc0bf8..e3aa2b70aa7d 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -1092,15 +1092,32 @@ static int sunxi_pinctrl_irq_request_resources(struct irq_data *d)
>   {
>   	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
>   	struct sunxi_desc_function *func;
> +	unsigned int offset;
> +	u32 reg, shift, mask;
> +	u8 muxval;
>   	int ret;
> +	u8 disabled_mux;

Iff you are going to respin, maybe use the inverted Christmas tree 
style, and group the u8 variables.

>   
>   	func = sunxi_pinctrl_desc_find_function_by_pin(pctl,
>   					pctl->irq_array[d->hwirq], "irq");
>   	if (!func)
>   		return -EINVAL;
>   
> -	ret = gpiochip_lock_as_irq(pctl->chip,
> -			pctl->irq_array[d->hwirq] - pctl->desc->pin_base);
> +	offset = pctl->irq_array[d->hwirq] - pctl->desc->pin_base;
> +	sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
> +	muxval = (readl(pctl->membase + reg) & mask) >> shift;
> +
> +	/* Change muxing to GPIO INPUT mode if at reset value */
> +	if (pctl->flags & SUNXI_PINCTRL_NEW_REG_LAYOUT)
> +		disabled_mux = SUN4I_FUNC_DISABLED_NEW;
> +	else
> +		disabled_mux = SUN4I_FUNC_DISABLED_OLD;
> +	
> +	if (muxval == disabled_mux)

There is whitespace damage in three of the four lines above.
Maybe this can be fixed up while applying?

The patch still feels a bit arbitrary, and looking at the definition of 
SUN4I_FUNC_IRQ below we probably need another rework, but if that fixes 
the issues observed, we should take it now:

(with the w/s damage fixed:)
Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> +		sunxi_pmx_set(pctl->pctl_dev, pctl->irq_array[d->hwirq],
> +			      SUN4I_FUNC_INPUT);
> +
> +	ret = gpiochip_lock_as_irq(pctl->chip, offset);
>   	if (ret) {
>   		dev_err(pctl->dev, "unable to lock HW IRQ %lu for IRQ\n",
>   			irqd_to_hwirq(d));
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> index 22bffac1c3f0..0daf7600e2fb 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -86,6 +86,8 @@
>   
>   #define SUN4I_FUNC_INPUT	0
>   #define SUN4I_FUNC_IRQ		6
> +#define SUN4I_FUNC_DISABLED_OLD 7
> +#define SUN4I_FUNC_DISABLED_NEW 15
>   
>   #define SUNXI_PINCTRL_VARIANT_MASK	GENMASK(7, 0)
>   #define SUNXI_PINCTRL_NEW_REG_LAYOUT	BIT(8)
> 


