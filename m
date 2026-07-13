Return-Path: <linux-gpio+bounces-39981-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wfhcNdLlVGrlggAAu9opvQ
	(envelope-from <linux-gpio+bounces-39981-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 15:19:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7368774B75F
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 15:19:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=nvas8LQI;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39981-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39981-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11AE73032583
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 13:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19985419300;
	Mon, 13 Jul 2026 13:11:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742294189D9;
	Mon, 13 Jul 2026 13:11:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948302; cv=none; b=f1XIFKytH1v5Y45hnXWvbNSw6C863r6Yehj0KGKJp7mIeMIOWBfpHD08ALF8i+rDdh1LmG8K+L5N84czYxnHVW/5S/0mn6sRevFm09+kVXqj/Ld6SHwBtRKQ2A7la484cBCBP1fK8jCLtKv1BIoDvXwuJ8LPZWmLX0VMx4HqNH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948302; c=relaxed/simple;
	bh=794YbEXyzIorMyKoNEFQ6cQ/F/QQjKG1DMjHHg8ga20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eaHugZe7aQbeX+om5kzLgLfj2qswgKL/uq/jMvZK6SljqgtHlR/OPCYOIqiFbRCVXwppe2ovWzMAZdx0zMfwVR6Cu6eCOfCBCqdaIXs6J2Vo+bPi8YodfB2RE6wLvn4OS720TCWj0MscoiTdYStX8pP7t1a4TCdGQVnYCYIPRHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nvas8LQI; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783948299;
	bh=794YbEXyzIorMyKoNEFQ6cQ/F/QQjKG1DMjHHg8ga20=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nvas8LQIvvJDhQizpfs1AArtRbGcWBZKnvqebRXJGr7BQPAl0DYTfd5ENLJO5pyvU
	 CU/OqUGLCIP1aGEd3AXR7wW6Dhz4O4uLvRgBYgZa3KrQYgEOovc9JTBxF6b9N+l9Yg
	 zmr0436PoWjX7UK/l0zyurnom0LzXsVPtNKQGvYCKCv7YK32yOevPz6ICGHkAfx3vA
	 rsYkuFU2jISdeVsummOH2689WSoDlW1uQn6Wgbu+V22iySHQRczPi/L6qVwmEjnpgN
	 xCx5uPXADO/d/o7rwvHWjvbauMvZIpkxGdZVM9REwO1eAi/j4G2wedNOIF87vbSdaH
	 5IFXzjbC0F5KA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 40E1D17E010F;
	Mon, 13 Jul 2026 15:11:39 +0200 (CEST)
Message-ID: <298f5835-d607-41d7-b8da-7b19b8e8abdc@collabora.com>
Date: Mon, 13 Jul 2026 15:11:38 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pinctrl: mediatek: Add driver for MT6858
To: Nikolai Burov <nikolai.burov+review@abscue.de>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, nikolai.burov@jolla.com,
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
References: <20260710-mt6858-pinctrl-v1-0-f75ab558f0df@jolla.com>
 <20260710-mt6858-pinctrl-v1-2-f75ab558f0df@jolla.com>
 <89e4eb3d-a61c-410e-8ad5-e845b07f8029@collabora.com>
 <2d34c3f6-5f66-4b60-b9a2-180163964552@abscue.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2d34c3f6-5f66-4b60-b9a2-180163964552@abscue.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39981-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[angelogioacchino.delregno@collabora.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,jolla.com,kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:nikolai.burov+review@abscue.de,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:nikolai.burov@jolla.com,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:sean.wang@kernel.org,m:nikolai.burov@abscue.de,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,review,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:from_mime,collabora.com:dkim,collabora.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7368774B75F

On 7/13/26 14:51, Nikolai Burov wrote:
> On 7/13/26 10:01 AM, AngeloGioacchino Del Regno wrote:
> [...]
>>> +    [PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt6858_pin_mode_range),
>>> +    [PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt6858_pin_dir_range),
>>> +    [PINCTRL_PIN_REG_DI] = MTK_RANGE(mt6858_pin_di_range),
>>> +    [PINCTRL_PIN_REG_DO] = MTK_RANGE(mt6858_pin_do_range),
>>> +    [PINCTRL_PIN_REG_SR] = MTK_RANGE(mt6858_pin_dir_range),
>>
>> This is Slew Rate, not Direction... And I think this is wrong.
>>
>> If you don't know where the slew rate registers are, or if that is an unsupported 
>> operation, just omit PINCTRL_PIN_REG_SR.
> 
> Thanks for noticing this! This seems to be a mistake in the downstream driver that 
> I unintentionally copied over. I will remove the slew rate.
> 

No worries, it happens.

>>
>>> +    [PINCTRL_PIN_REG_SMT] = MTK_RANGE(mt6858_pin_smt_range),
>>> +    [PINCTRL_PIN_REG_IES] = MTK_RANGE(mt6858_pin_ies_range),
>>> +    [PINCTRL_PIN_REG_PU] = MTK_RANGE(mt6858_pin_pu_range),
>>> +    [PINCTRL_PIN_REG_PD] = MTK_RANGE(mt6858_pin_pd_range),
>>> +    [PINCTRL_PIN_REG_DRV] = MTK_RANGE(mt6858_pin_drv_range),
>>> +    [PINCTRL_PIN_REG_PUPD] = MTK_RANGE(mt6858_pin_pupd_range),
>>> +    [PINCTRL_PIN_REG_R0] = MTK_RANGE(mt6858_pin_r0_range),
>>> +    [PINCTRL_PIN_REG_R1] = MTK_RANGE(mt6858_pin_r1_range),
>>> +    [PINCTRL_PIN_REG_DRV_ADV] = MTK_RANGE(mt6858_pin_drv_adv_range),
>>> +    [PINCTRL_PIN_REG_RSEL] = MTK_RANGE(mt6858_pin_rsel_range),
>>> +};
>>> +
>>> +static const char * const mt6858_pinctrl_register_base_names[] = {
>>> +    "base", "lm", "rb", "bm2", "bm", "bm1", "lt", "lt1", "rt", "rt1",
>>
>> Fix ordering:
>>
>> "base", "lm", "rb", "bm", "bm1", "bm2", "lt", "lt1", "rt", "rt1",
> 
> The bases are already in ascending address order. I don't know what the 1 and 2 
> suffixes in the names of the iocfg regions mean, they may just be a historical 
> leftover. Are the names more important than the addresses here?
> 

Eh, fair point. I guess it's fine then.

For the numbers, that's because the registers for the same region of the chip
(meaning physical region, really) are scattered all around... but bm2, bm, bm1
refer to the same physical region (again, really physical, look at the bga array).

> [...]
>>> +static const struct of_device_id mt6858_pinctrl_of_match[] = {
>>> +    { .compatible = "mediatek,mt6858-pinctrl", .data = &mt6858_data },
>>> +    { }
>>
>>      { /* sentinel */ }
> 
> Thanks!
> 
> [...]
>>> +    MTK_EINT_PIN(119, 0, 72, 0),
>>> +    MTK_EINT_PIN(120, 0, 73, 0),
>>> +    MTK_EINT_PIN(121, 0, 74, 0),
>>
>> Looks like you're missing ~70 pins here?
>>
>> If those have no EINT support, you can declare them as
>>
>>      MTK_EINT_PIN(122, EINT_INVALID_BASE, 0, 0),
>>
>> ...or you can add a macro to add a (sequential) range of pins with no EINT support.
> 
> Adding a variable number of mtk_eint_pin structs (with a different pin number 
> inside each struct) doesn't seem possible using a single macro, so I'll just 
> manually add all of them to the list.
> 
> While writing this, I was looking at the mt6878 driver, which also omits a range of 
> pins. Should that be fixed as well?
> 

If there are holes in between, yes, that wouldn't work.

Honestly though, this is starting to be a problem - as in - up until now,
practically all SoCs had EINTs for each pin, or no holes in between... but
I can see that this is changing, as MT6991, MT6993 and now MT6858 all have
those holes.

This is a note and I'm not asking you to do this but, at some point, we should
really add some logic to the mtk-eint driver so that it doesn't forcefully (and
at this point in time, even stupidly) map/expect pin data at the same array
index as the pin number.

That's probably more important than fixing mt6878, but well, I understand that
this stuff would take a bit more time than adding just a few entries in arrays
right now, and I also understand that time may be lacking, so I am definitely
not blocking the addition of 6858 for this (of course, as long as you fill up
the holes there)

Cheers,
Angelo

