Return-Path: <linux-gpio+bounces-33544-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAJUC7wVuGl/YwEAu9opvQ
	(envelope-from <linux-gpio+bounces-33544-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 15:37:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FB329B853
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 15:37:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 280F1300C390
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 14:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7A029D273;
	Mon, 16 Mar 2026 14:37:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C28C29AAFA;
	Mon, 16 Mar 2026 14:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773671859; cv=none; b=JVtyqQLaTB4W3NR5hnna1qh3c9AZ6nauI1Wcx3jMvdSZQOeLgjueOCH6+OFFPSVWSZ5vTL4pPrHnBb0Uy3r6pHICryFUyZ9sxbyhWXnnZjzNoNPHImeK4fIyoirkEBN47GQ34mep4WrqpaVuBnhgaC3I2gDK/HmiKXcoGHdPYU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773671859; c=relaxed/simple;
	bh=9BuSXxyDOarK6sqFjWjokYnMX4bEq/W5oA8BGTOTbQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lJCxueDdgQSg2qGqsQNtDSqGQIiXVDXkBOTqnlpRnSZA7UnT2tWcELXxoquD13+2fnWR+M+w43b8RGJyR5UKs80g53K3vNzuaQuZ/A5d4bKgmIxkjM9GTUgsM+3ja5UBg3fiVzUVp++vRBklhleW4doOPKK9jx3iGE5dqPi8pjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6286A1477;
	Mon, 16 Mar 2026 07:37:30 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9BB13F73B;
	Mon, 16 Mar 2026 07:37:34 -0700 (PDT)
Message-ID: <480b227c-c85b-4ff0-a825-3e82f64821f6@arm.com>
Date: Mon, 16 Mar 2026 15:37:32 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
To: Michal Piekos <michal.piekos@mmpsystems.pl>,
 Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33544-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[mmpsystems.pl,kernel.org,gmail.com,sholland.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.przywara@arm.com,linux-gpio@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.950];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 46FB329B853
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 3/14/26 09:09, Michal Piekos wrote:
> Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
> 
> The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
> is in unitialized state.
> 
> Solution is to set pinmux to GPIO INPUT in
> sunxi_pinctrl_irq_request_resources() if it wasn't initialized
> earlier.
> 
> Tested on Orange Pi Zero 3.
> 
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> Suggested-by: Chen-Yu Tsai <wens@kernel.org>
> ---
> Changes in v3:
> - Drop v2 solution which was returning input instead of error when pin
>    is not initialized.
> - Add checking pinmux configuration in
>    sunxi_pinctrl_irq_request_resources() and set pin to input if
>    uninitialized
> - Link to v2: https://lore.kernel.org/r/20260308-rc2-boot-hang-v2-1-516fdb820953@mmpsystems.pl
> 
> Changes in v2:
> - Dropped the previous faulty solution which was forcing the axp313 to
>    use r_pio as interrupt controller as pointed out by Jernej Škrabec.
> - Implemented suggestion from Andrey Skvortsov to return default
>    direction as input
> - Link to v1: https://lore.kernel.org/r/20260308-rc2-boot-hang-v1-0-d792d1a78dfd@mmpsystems.pl
> ---
>   drivers/pinctrl/sunxi/pinctrl-sunxi.c | 13 +++++++++++++
>   drivers/pinctrl/sunxi/pinctrl-sunxi.h |  1 +
>   2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index c990b6118172..7d46f7613672 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -1089,6 +1089,9 @@ static int sunxi_pinctrl_irq_request_resources(struct irq_data *d)
>   {
>   	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
>   	struct sunxi_desc_function *func;
> +	unsigned int offset;
> +	u32 reg, shift, mask;
> +	u8 muxval;
>   	int ret;
>   
>   	func = sunxi_pinctrl_desc_find_function_by_pin(pctl,
> @@ -1096,6 +1099,16 @@ static int sunxi_pinctrl_irq_request_resources(struct irq_data *d)
>   	if (!func)
>   		return -EINVAL;
>   
> +	offset = pctl->irq_array[d->hwirq] - pctl->desc->pin_base;
> +	sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
> +	muxval = (readl(pctl->membase + reg) & mask) >> shift;
> +
> +	/* Change muxing to GPIO INPUT mode if at reset value */
> +	if (muxval == SUN4I_FUNC_IO_DISABLE) {

The "high impedance"/reset value depends on the SoC generation: older 
SoCs didn't have one, so they used 0 (GPIO_INPUT), which is the closest 
to "off" you can get there. Most SoCs afterwards indeed used 0x7, as you 
set below, but newer SoCs (D1/T113, A523, ...) use 0xf now.

Would it work to do:
	if (muxval != SUN4I_FUNC_INPUT) {
or shall we just force SUN4I_FUNC_INPUT always, without even checking? 
Or can there be other settings already (for instance the IRQ function)?

Not really familiar with the call chain here, but shouldn't the mux be 
set to the IRQ function (0x6/0xe) here anyway?

> +		sunxi_pmx_set(pctl->pctl_dev, pctl->irq_array[d->hwirq],
> +			      SUN4I_FUNC_INPUT);
> +	}
> +
>   	ret = gpiochip_lock_as_irq(pctl->chip,
>   			pctl->irq_array[d->hwirq] - pctl->desc->pin_base);
>   	if (ret) {
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> index ad26e4de16a8..22c527fc6ae2 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -86,6 +86,7 @@
>   
>   #define SUN4I_FUNC_INPUT	0
>   #define SUN4I_FUNC_IRQ		6
> +#define SUN4I_FUNC_IO_DISABLE	7

As mentioned above, this cannot be a simple fixed define for all SoCs.

Cheers,
Andre

>   
>   #define SUNXI_PINCTRL_VARIANT_MASK	GENMASK(7, 0)
>   #define SUNXI_PINCTRL_NEW_REG_LAYOUT	BIT(8)
> 
> ---
> base-commit: 4ae12d8bd9a830799db335ee661d6cbc6597f838
> change-id: 20260308-rc2-boot-hang-269e8546635b
> 
> Best regards,


