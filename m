Return-Path: <linux-gpio+bounces-33841-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CRZKbcsvGnXuAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33841-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 18:04:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A46AB2CF691
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 18:04:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B1F603019393
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 16:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291A83ED5B3;
	Thu, 19 Mar 2026 16:55:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F973ED135;
	Thu, 19 Mar 2026 16:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773939318; cv=none; b=nc6HQASLQiJh+0/dx2lS5NKOZc2i6ZU7x5s8Gpml26v7kQGKh8cXx0oojLg9FXw0aZIH1FH3mzW1JF8xDcVPCyESBo1fy3pWWO8xy7teEsT3AaRI8nKj9YbUPuphEHZUr1FgM4SUJ5wHbMq7FKltJ3ZQe2z7KnQ7hX861Clz1AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773939318; c=relaxed/simple;
	bh=HMXS9XDD+syPwkXSvnD/c7SIeD/ctYHIuLlMorxbV/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BHudBBOMeq9DC6xl5EaGe3tcLxthIbXC2FKdPLE9ndnbQ70bVFBMdH+z4kOpvRN1jx+GX1rrhZMx0ivp8wMoryYtqp3sxVOWRcurx9u7eMOXsxWILFEwVYWSeXIv3kOHNdOqjfdvfLBOusbNuU+GYbGSTvJ8yvH5ctZHzLi9QLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A156216F2;
	Thu, 19 Mar 2026 09:55:09 -0700 (PDT)
Received: from [10.57.84.77] (unknown [10.57.84.77])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B6E53F7BD;
	Thu, 19 Mar 2026 09:55:13 -0700 (PDT)
Message-ID: <de634edc-0fc6-4a32-b0f9-77d87df2bbb3@arm.com>
Date: Thu, 19 Mar 2026 17:55:11 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
To: wens@kernel.org, Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Linus Walleij <linusw@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260319-rc2-boot-hang-v4-0-4372f47cb6b8@mmpsystems.pl>
 <20260319-rc2-boot-hang-v4-2-4372f47cb6b8@mmpsystems.pl>
 <CAGb2v65c7A7V05ih-GkHxs1tik892Fgt8HhT49_2xHeL91Sh_g@mail.gmail.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CAGb2v65c7A7V05ih-GkHxs1tik892Fgt8HhT49_2xHeL91Sh_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33841-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.przywara@arm.com,linux-gpio@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.259];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mmpsystems.pl:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,arm.com:mid]
X-Rspamd-Queue-Id: A46AB2CF691
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

thanks for the very quick turnaround!

On 3/19/26 17:44, Chen-Yu Tsai wrote:
> On Fri, Mar 20, 2026 at 12:10 AM Michal Piekos
> <michal.piekos@mmpsystems.pl> wrote:
>>
>> Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
>>
>> The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
>> is in unitialized state.
> 
>          ^ uninitialized
> 
>>
>> Solution is to set pinmux to GPIO INPUT in
>> sunxi_pinctrl_irq_request_resources() if it wasn't initialized
>> earlier.
>>
>> Tested on Orange Pi Zero 3.
>>
>> Fixes: 01e10d0272b9 ("pinctrl: sunxi: Implement gpiochip::get_direction()")
>> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
>> ---
>>   drivers/pinctrl/sunxi/pinctrl-sunxi.c | 19 +++++++++++++++++++
>>   drivers/pinctrl/sunxi/pinctrl-sunxi.h |  2 ++
>>   2 files changed, 21 insertions(+)
>>
>> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
>> index 685b79fc0bf8..321ee97f5745 100644
>> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
>> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
>> @@ -1092,13 +1092,32 @@ static int sunxi_pinctrl_irq_request_resources(struct irq_data *d)
>>   {
>>          struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
>>          struct sunxi_desc_function *func;
>> +       unsigned int offset;
>> +       u32 reg, shift, mask;
>> +       u8 muxval;
>>          int ret;
>> +       bool is_new_layout;
>> +       bool is_reset_mux;
>>
>>          func = sunxi_pinctrl_desc_find_function_by_pin(pctl,
>>                                          pctl->irq_array[d->hwirq], "irq");
>>          if (!func)
>>                  return -EINVAL;
>>
>> +       offset = pctl->irq_array[d->hwirq] - pctl->desc->pin_base;
>> +       sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
>> +       muxval = (readl(pctl->membase + reg) & mask) >> shift;
>> +
>> +       /* Change muxing to GPIO INPUT mode if at reset value */
>> +       is_new_layout = pctl->flags & SUNXI_PINCTRL_NEW_REG_LAYOUT;
> 
> You would want
> 
>      !!(pctl->flags & SUNXI_PINCTRL_NEW_REG_LAYOUT)
> 
> here to normalize it to a bool value. This is quite common in kernel code.

The whole expression above is a bit cumbersome (though correct). And 
since is_reset_mux isn't really needed, I'd suggest something like:

	u8 disabled_mux;
....
	if (pctl->flags & SUNXI_PINCTRL_NEW_REG_LAYOUT)
		disabled_mux = SUN4I_FUNC_DISABLED_NEW;
	else
		disabled_mux = SUN4I_FUNC_DISABLED_OLD;
	if (muxval == disabled_mux)
....

But yeah, in general this was what I had in mind.

Cheers,
Andre


	
> 
>> +       is_reset_mux = (!is_new_layout && muxval == SUN4I_FUNC_DISABLED_OLD) ||
>> +                      (is_new_layout && muxval == SUN4I_FUNC_DISABLED_NEW);
>> +
>> +       if (is_reset_mux) {
>> +               sunxi_pmx_set(pctl->pctl_dev, pctl->irq_array[d->hwirq],
>> +                             SUN4I_FUNC_INPUT);
>> +       }
> 
> Nit: the curly braces aren't needed.
> 
>> +
>>          ret = gpiochip_lock_as_irq(pctl->chip,
>>                          pctl->irq_array[d->hwirq] - pctl->desc->pin_base);
> 
> Nit: you probably want to replace this with "offset" as well.
> 
> 
> Just minor issues, otherwise
> 
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> 
>>          if (ret) {
>> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
>> index 22bffac1c3f0..0daf7600e2fb 100644
>> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
>> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
>> @@ -86,6 +86,8 @@
>>
>>   #define SUN4I_FUNC_INPUT       0
>>   #define SUN4I_FUNC_IRQ         6
>> +#define SUN4I_FUNC_DISABLED_OLD 7
>> +#define SUN4I_FUNC_DISABLED_NEW 15
>>
>>   #define SUNXI_PINCTRL_VARIANT_MASK     GENMASK(7, 0)
>>   #define SUNXI_PINCTRL_NEW_REG_LAYOUT   BIT(8)
>>
>> --
>> 2.43.0
>>
>>
> 


