Return-Path: <linux-gpio+bounces-33031-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLw/OBFBsGkehgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33031-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 17:04:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C342543CA
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 17:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93C833105F72
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 15:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1060318BA8;
	Tue, 10 Mar 2026 15:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="OMMdTeWM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED901225417
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 15:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773156674; cv=none; b=XuwbBgaDmP0Mwsi5TPKHEc58osH4wtXkd/WgW+yOxCNlNniU3Mm0Uup6tyE7ORWIsMBR485oLRwVwk0fGVaFc2hL9yJYJvH2AgfRFsWidEu5CXvPHMcQxB4FZpZN+flW1dIvqHcLDc83q3AiCgxlLQiXXQB0PfFQ85EKC6vD9fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773156674; c=relaxed/simple;
	bh=39ujayK9qMYbGWud2n0rJxWAYjB8VRtr/JR/aMjp+EY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=HTB34EdNkwCdA/mkLvv/tkUbUKQDq5UReMYQDX4mBknLJhrOj34GRijVRkB6huQYzawAvhsIAY4PUMO+gN6Wz1ULzz9wkTAsk3QLsMiMfJWmVV9+Z61rEWdb6TIgyA9vPU/QbCrZkTQndTWK0aT7PupwQ/0TjjRqYU5669u6YpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=OMMdTeWM; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: Cc:
 References: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1773156665;
 bh=gF9wyK5BBXJ3oTJAJwbnzvXXms8IntJorKz535sV2C8=;
 b=OMMdTeWMRXqGHPT8AqCOniiJ7behfdW5Oi6u9hAiOauJbQKxKx1JuNP+EYa18Kpu6Ojw5MY8l
 t7K80qgdKbJgDMbIPCGX4Uo+1a12mh87vh9NvHgB08UUQDhMb4W40NicT1MKkh2/BU5IblpoKjD
 Ic7D6+KLOelbEnC6DQD1753JzYTJyZaC0zFpsfQifiw9sIGbWzhHr54kW1K5OqT9AaZM5f5vi5p
 t631Tk7Dt1fngPlvI3jVgHVYc0M8BhcvnFIRlJksmUUd5IAyRaMKV2kimYQze3Oz+iUiXs7yAeM
 va7MC6FhvIjZb9j8Ue7dsM4TLRaxLHhsY7xuJEYt3Wwg==
X-Forward-Email-ID: 69b00b7ccff8521c13e86f9d
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.6.49
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <b0678a18-f6a1-467b-aa66-8807a97c2187@kwiboo.se>
Date: Tue, 10 Mar 2026 13:15:54 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/2] arm64: dts: rockchip: rk3308: Add gpio-ranges
 properties
To: Matthijs Kooijman <matthijs@stdin.nl>
References: <20260302202121.197288-1-matthijs@stdin.nl>
 <20260302202121.197288-3-matthijs@stdin.nl>
 <e439f2f7-0b25-41a5-951a-d8d3bc9f2bf2@kwiboo.se>
 <aa_cCCc7FqdSv8eX@login.tika.stderr.nl>
Content-Language: en-US
Cc: Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <aa_cCCc7FqdSv8eX@login.tika.stderr.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 76C342543CA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kwiboo.se,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kwiboo.se:s=fe-e1b5cab7be];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33031-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kwiboo.se:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonas@kwiboo.se,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kwiboo.se:dkim,kwiboo.se:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ff220000:email]
X-Rspamd-Action: no action

Hi Matthijs,

On 3/10/2026 9:53 AM, Matthijs Kooijman wrote:
> Hi Jonas,
> 
> Thanks for your review.
> 
>>> This does not immediately change functionality, because the
>>> gpio-rockchip.c driver has a workaround that defines ranges when they
>>> are not present in DT, but that relies on global gpio numbering (so
>>> AFAICS only works when the rockchip gpio banks are initialized first and
>>> in-order).
>>
>> This is strictly not correct, the driver use the gpioX alias id as
>> defined in the device tree and does not depend on the initialization
>> order.
> 
> Ah, I had not realized these aliases existed. However, it seems they are
> not actually relevant in this case. My assumption was that gpio
> numbering was based on initalizating order, but I see in the code that
> GPIO drivers decide themselves (by setting gc->base statically or maybe
> based on DT). For the gpio-rockchip driver, these base numbers are
> hardcoded to start from 0 in rockchip_pinctrl_get_soc_data(). Dynamic
> initialization-order based numbering is also done for drivers that do
> not set gc->base, but that starts at GPIO number 512 to prevent
> conflicts.
> 
> In any case, I will update my commit message to better reflect what is
> happening.
> 
> 
>>> --- a/arch/arm64/boot/dts/rockchip/rk3308.dtsi
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
>>> @@ -889,6 +889,7 @@ gpio0: gpio@ff220000 {
>>>  			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
>>>  			clocks = <&cru PCLK_GPIO0>;
>>>  			gpio-controller;
>>> +			gpio-ranges = <&pinctrl 0 0 32>;
>>
>> This matches the driver, but not the hardware according to datasheet, it
>> only lists gpio0 A0-C5 used, and not all 32 pins supported by the gpio0
>> controller.
> 
> Indeed, this seems to be the case, but I wonder if this is a problem?

The device tree should represent the hardware and not work as
configuration for a software implementation.

The SoC has X amounts of pins, however each gpio controller have support
to control up to 32 routed pins.

So to accurately describe the pincntrl <-> gpio controller relation we
should likely only include the routed pins.

> 
> Isee other rockchip devicetree definitions (rk3528, rk3562, rk356x,
> rk3576, rk3588) do not care about this and just map all 32 pins. See
> 
> 	git grep -C 20 rockchip,gpio-bank | grep gpio-ranges
> 
> I also think there is no other provision for these missing GPIOs
> anywhere - both pinctrl and gpiod seem to expose all 32 pins, even the
> one that do not exist.

Correct, and this is the issue, the pinctrl driver exposes pins that do
not exists, i.e. the software is wrong here and we should not add DT props
just to satisfy incorrect software.

> 
> Limiting the gpio-ranges definitions would prevent writing to reserved
> pinctrl registers via the userspace gpio API, which might be useful, but
> you would still be able to write to them via a custom devicetree (that
> uses non-existing pinctrl pins) and you would still be able to write to
> non-existent gpio registers via the userspace API.

Correct, the rockchip pinctrl and gpio drivers is in desperate need of a
big overhaul to fix this properly. And why I think it is better to avoid
adding incorrect gpio-ranges props. The DT is ABI and drivers must keep
backward compatibility, so adding incorrect props may make it even
harder to fix the underlying root issue in these drivers.

> 
> Given the above, do you still think it would be good to limit the
> gpio-ranges to the existing GPIOs only (I have no strong opinion)?

Yes, the DT should describe the HW, however the pinctrl driver report
too many pins so that probably need to be fixed in a backward compatible
way first.

Regards,
Jonas

> 
> Gr.
> 
> Matthijs


