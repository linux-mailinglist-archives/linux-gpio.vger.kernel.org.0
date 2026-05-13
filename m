Return-Path: <linux-gpio+bounces-36782-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDnqLtG4BGplNQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36782-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:45:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50057538419
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 176A33181F8D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 17:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76BD2480DDF;
	Wed, 13 May 2026 17:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mf01HEhq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CCC4DA551;
	Wed, 13 May 2026 17:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778693001; cv=none; b=RDA8go4PrYJrHoMvfpSBsLQwXn9ruGKtdpw6Mr+UBiYu2RrW4TBhLsEz/Lapqg6i1zhtpBwUybq1K1hCW/6yh/3GSGGDT8ZjstttPv/IdRizWKxJuYf/0XDueDKoaW3O8e3OxOvgdZ6ebexg8Uv9iGimYNiLi+/ktzJ/s+RDpGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778693001; c=relaxed/simple;
	bh=e5DqDhlm5jcgbM0FWrFIsKCqiHgASHBxx/ZDVpUQ7SY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tlQcYtqCg+ev/mmbfsX91BK8XWYfen3+JYCcD9+yRaUn3beIwnblX7QuehmSfFPX+89eAM2Z9JmCaHEuwRSTnlivn3ytuH2fdpCE9Ne+i4pcGOFVgclw2j9ZwmJynxTZ+vSLOw6clwjxPEXrQhRTYnVwWFhiI5b8zsQjRLsGT/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mf01HEhq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508C3C2BCC9;
	Wed, 13 May 2026 17:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778693000;
	bh=e5DqDhlm5jcgbM0FWrFIsKCqiHgASHBxx/ZDVpUQ7SY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mf01HEhqG7GTlxcqyOcFtNCr9gjQjsQuKZz9Hz+nvXtcqqc8RB5hoCfkaY5ChT7sR
	 k28ysHswSCyq/kGEpMu5YIOOQ1EwVnSy8ultZe/pg1oIcwkIKyZfUAla0Perer4lmf
	 Ec05KgWgqg9+2x5qZZRmTGXCXXxVsBjiyKftt6hKRBcP3cyg0KJh2XaMN0CTvStvgw
	 smpUpT657d9l7Z5j0oxb/rM8aFCxk5/2NQwNcXW+ZgMl+GDn+DS6B0WFHsoHUNsGRO
	 xptdIyfD7LghBLh+1MeXtaG5OF7dDYAnnIL60X3loh0D8qXs0lCQd733oST4CFCVKV
	 Mz1G5qr4mVuRA==
Message-ID: <dcd84a44-d52b-4810-a1a8-5865f80db1ba@kernel.org>
Date: Wed, 13 May 2026 12:23:18 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl-amd: enable IRQ for WACF2200 touchscreen on
 Lenovo Yoga 7 14AGP11
Content-Language: en-US
To: Hardik Prakash <hardikprakash.official@gmail.com>,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: linus.walleij@linaro.org, wsa@kernel.org, andriy.shevchenko@intel.com,
 "Natikar, Basavaraj" <basavaraj.natikar@amd.com>
References: <20260513061338.9348-1-hardikprakash.official@gmail.com>
 <20260513061338.9348-2-hardikprakash.official@gmail.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260513061338.9348-2-hardikprakash.official@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 50057538419
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36782-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

++

On 5/13/26 01:13, Hardik Prakash wrote:
> On Lenovo Yoga 7 14AGP11 (83TD), the WACF2200 touchscreen controller
> is wired via I2C2 (AMDI0010:02) with its interrupt on GPIO pin 157
> (confirmed via ACPI _CRS GpioInt decode). After amd_gpio_irq_init()
> clears all GPIO interrupts at boot, pin 157 is never re-enabled,
> preventing the touchscreen from signalling the driver.
> 
> Windows keeps GPIO 157 INTERRUPT_ENABLE (bit 11) and INTERRUPT_MASK
> (bit 12) set after initialisation. Add a DMI quirk to restore these
> bits after amd_gpio_irq_init() on this hardware.
> 
> Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
> Assisted-by: Claude:claude-sonnet-4-6
> Assisted-by: GPT-Codex:gpt-5.2-codex
> ---
>   drivers/pinctrl/pinctrl-amd.c | 35 +++++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
> index e3128b0045d22..64315b0edf2a6 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -26,6 +26,7 @@
>   #include <linux/interrupt.h>
>   #include <linux/bitops.h>
>   #include <linux/pinctrl/pinconf.h>
> +#include <linux/dmi.h>
>   #include <linux/pinctrl/pinconf-generic.h>
>   #include <linux/pinctrl/pinmux.h>
>   #include <linux/string_choices.h>
> @@ -39,6 +40,39 @@
>   static struct amd_gpio *pinctrl_dev;
>   #endif
>   
> +static const struct dmi_system_id amd_gpio_quirk_yoga7_14agp11[] = {
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83TD"),
> +			DMI_MATCH(DMI_BOARD_NAME, "LNVNB161216"),
> +		},
> +	},
> +	{ }
> +};
> +
> +static void amd_gpio_apply_quirks(struct amd_gpio *gpio_dev)
> +{
> +	const unsigned int pin = 157; /* WACF2200 GpioInt per ACPI _CRS */
> +	unsigned long flags;
> +	u32 reg;
> +
> +	if (!dmi_check_system(amd_gpio_quirk_yoga7_14agp11))
> +		return;
> +	if (pin >= gpio_dev->gc.ngpio)
> +		return;
> +
> +	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
> +	reg = readl(gpio_dev->base + pin * 4);
> +	reg |= BIT(INTERRUPT_ENABLE_OFF) | BIT(INTERRUPT_MASK_OFF);
> +	writel(reg, gpio_dev->base + pin * 4);
> +	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
> +
> +	dev_info(&gpio_dev->pdev->dev,
> +		 "Enabled IRQ for GPIO %u (Yoga 7 14AGP11 touchscreen)\n",
> +		 pin);

I don't understand.  Our design is that the interrupt is disabled 
initially when driver loads (we don't trust state of the GPIO 
configuration pre-boot), and then when i2c-hid loads later it is 
re-enabled via amd_gpio_irq_enable().

Why isn't that flow working on this system?

> +}
> +
>   static int amd_gpio_get_direction(struct gpio_chip *gc, unsigned offset)
>   {
>   	unsigned long flags;
> @@ -1219,6 +1253,7 @@ static int amd_gpio_probe(struct platform_device *pdev)
>   
>   	/* Disable and mask interrupts */
>   	amd_gpio_irq_init(gpio_dev);
> +	amd_gpio_apply_quirks(gpio_dev);
>   
>   	girq = &gpio_dev->gc.irq;
>   	gpio_irq_chip_set_chip(girq, &amd_gpio_irqchip);


