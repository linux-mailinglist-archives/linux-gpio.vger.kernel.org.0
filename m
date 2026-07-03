Return-Path: <linux-gpio+bounces-39417-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RHk4NwDDR2qNewAAu9opvQ
	(envelope-from <linux-gpio+bounces-39417-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 16:11:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D4E703475
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 16:11:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=fZrIn5Xf;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39417-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39417-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 865433058743
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 13:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B003DA7CD;
	Fri,  3 Jul 2026 13:53:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC543D9DAD;
	Fri,  3 Jul 2026 13:52:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086782; cv=none; b=WGcAeXzxEYaYyamLD9zFWBXCVfxzmDSDes9YU4ueeHd4Z5xABUNvaS3UJHPFhpvcRg8B0XLypVr+3QvtjKriLnDIUVtFFe2zinKsMakFIH5O5GTMukfBvS9mf9ohN3Pbej8ZXlDKbErINAcn9XFv+l6kRy335J30yKVXVSFdgLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086782; c=relaxed/simple;
	bh=Me6gmkaDjGZ/schb+RcR4K/Q/82u1DCsmp9vVOmmDmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=phmS56bMPO3eGgEMPN/oWtbc5fW1Jnml/iOHkdk+/5frBmw8soEyrLwBVdaOwgXw+uAlCUOgG4L//Ni4DWDkTldrpRijH33jh/BQxozarU9GlOKki5BxfRBp3wL36UwgwIs5abGP4UAjQQ3Z5C/fMNvqD08QRMbgcxSsi9SN2Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fZrIn5Xf; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A3801570;
	Fri,  3 Jul 2026 06:52:54 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C78843F85F;
	Fri,  3 Jul 2026 06:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783086778; bh=Me6gmkaDjGZ/schb+RcR4K/Q/82u1DCsmp9vVOmmDmM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fZrIn5XfQIvAcd0b69t8CmMai85U02ASBX0X/4as/KCW8Jodcldpa/pH5V10eQgHq
	 9auHzyf8i2oM6zFGh8cV2I8qCTmcq5p4qHfBFzB7TbCG+cdRRlSNnjHTJTsDmbUhWf
	 7RPvEds2OQQYqzxgTEbpq8Efep2fU3R2hTVIuI/k=
Message-ID: <72ccedfb-742c-4af7-8439-0f37fff2853d@arm.com>
Date: Fri, 3 Jul 2026 15:52:38 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] pinctrl: sunxi: convert to GPIO_GENERIC
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Icenowy Zheng <uwu@icenowy.me>, Jerome Brunet <jbrunet@baylibre.com>
References: <20260313000652.11470-1-andre.przywara@arm.com>
 <a4cfb10e4701da0649ef648136496a962be5870d.camel@icenowy.me>
 <20260315014205.471d6834@ryzen.lan>
 <CAMRc=MeorQJvA8TBosjnDU+x-FD6GhkbXwXOjCD0nmCs16ERfQ@mail.gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CAMRc=MeorQJvA8TBosjnDU+x-FD6GhkbXwXOjCD0nmCs16ERfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39417-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,sholland.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:linusw@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:uwu@icenowy.me,m:jbrunet@baylibre.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[andre.przywara@arm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.przywara@arm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:from_mime,arm.com:email,arm.com:mid,arm.com:dkim,vger.kernel.org:from_smtp,icenowy.me:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33D4E703475

Hi Bartosz, Linus,

so I wanted to come back to this, posting a A733 v2, with this patch 
included, and was wondering what the consensus on this matter would be?

...

On 3/16/26 09:57, Bartosz Golaszewski wrote:
> On Sun, 15 Mar 2026 01:42:05 +0100, Andre Przywara
> <andre.przywara@arm.com> said:
>> On Sat, 14 Mar 2026 13:14:25 +0800
>> Icenowy Zheng <uwu@icenowy.me> wrote:
>>
>>> 在 2026-03-13五的 01:06 +0100，Andre Przywara写道：
>>>> Allwinner SoCs combine pinmuxing and GPIO control in one device/MMIO
>>>> register frame. So far we were instantiating one GPIO chip per
>>>> pinctrl
>>>> device, which covers multiple banks of up to 32 GPIO pins per bank.
>>>> The
>>>> GPIO numbers were set to match the absolute pin numbers, even across
>>>> the
>>>> typically two instances of the pinctrl device.
>>>>
>>>> Convert the GPIO part of the sunxi pinctrl over to use the
>>>> gpio_generic
>>>> framework. This alone allows to remove some sunxi specific code,
>>>> which
>>>> is replaced with the existing generic code. This will become even
>>>> more
>>>> useful with the upcoming A733 support, which adds set and clear
>>>> registers for the output.
>>>> As a side effect this also changes the GPIO device and number
>>>> allocation: Each bank is now represented by its own gpio_chip, with
>>>> only
>>>> as many pins as there are actually implemented. The numbering is left
>>>> up
>>>
>>> Ah, is this a userspace API break?

So to summarise: yes, the user visible number in /sys/class/gpio would 
change. For a start, there would be up to a dozen gpiochip's now, 
instead of the just two before. But at the moment they are somewhat 
inconsistently named: the current labels are just <addr>.pinctrl, you 
would need to know that 300b000 is the primary controller. This is of 
course SoC specific, and DOES differ between generations of Allwinner 
chips. With this patch we get the bank number appended to the label, so 
it becomes something like: 300b000.pinctrl-PD, which is grep-able even.

As for users being affected by this change: that's hard to say, there 
seem to be a lot of silent users there (not being visible in mainline 
discussions), also a lot of people using these boards in a very embedded 
way. My hunch is that still quite some people use the sysfs interface, 
because it's so convenient to use from the shell, and many compile their 
own kernels. At the same time I am sure those people could adapt to any 
new scheme.

>> Was that ever a guaranteed user space API? Or just something
>> that everyone relied on because it was always the same (until it
>> wasn't)? Similar to /dev/mmcblk0 being the SD card?


>> And ignoring the ill-fated old-style sysfs interface for now, how does
>> this work with libgpiod? Would it still use the absolute pin numbers?
>>
>> I mean looking at that warning about the forced GPIO numbering we
>> get, using base = -1 seems to be the recommended way?
>>
> 
> My view is this: for libgpiod, there are no absolute GPIO numbers and the
> ordering of GPIO chip character devices is not guaranteed.
> 
> For sysfs: userspace may rightfully expect the global numbering to stay the
> same. I don't like it but this is the kernel policy.

Does it matter anyhow that this interface is deprecated, and even hidden 
behind CONFIG_EXPERT?

> Here however, there's another thing: the fact that a single GPIO chips is now
> split into several. I don't mind it but if someone complains, it would have
> to be reverted.

Who would care, and are there other effects outside of the sysfs 
numbering? I mean we always had two GPIO chips before (because of two 
instances of pinctrl IP in most Allwinner SoCs), one with one or two 
banks, one with up to 11. Now it's at least consistently one bank per 
chip, without gaps.

So personally I am leaning towards doing the change: most users can 
typically adapt - or they don't care because they don't update their 
kernels (beyond stable revisions). And to address the naming 
ambiguities, we could push for more gpio-line-names. That would make 
finding a GPIO much safer and easier, and works either way.

But if this patch's ABI breakage is a showstopper, I would need to know, 
so that I can rebase the A733 pinctrl patches without this one being the 
first patch in the series.

Cheers,
Andre


