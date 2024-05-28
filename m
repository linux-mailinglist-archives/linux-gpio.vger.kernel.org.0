Return-Path: <linux-gpio+bounces-6718-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4F58D1693
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 10:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4769B1F22146
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 08:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C61B13C9C6;
	Tue, 28 May 2024 08:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="N8N7Yyz+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896AF13C8F2
	for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 08:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716885842; cv=none; b=GOwugIfkafzw0LiK+8MiOZIet8fkwi2HJwi49lt7g9Lr89KD0DlCvsmsLTjDPcvbWmfmmKLZv9fawjdJ0SezhV87aBstTLoxEFWl+bzousW9cIlDp0rTjtDmAhCQbcGDpkWkBZ+TbhOXqsQCmEq4EZ/L6z5XW6+b87EfLoQ2BZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716885842; c=relaxed/simple;
	bh=8HvIGKRSxVSzXwS7Na7UKkF6X7VsSrmut2KntrLmI1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HSY0iPj4u99v21co4MejSJA1+OnDJuKICCs3sEsUtwnKdqh2cioYDLAQaVGDxyN7XuAptFpALjkQufNK618ESpJ9ypp7gSKCiK9qElCxwiNM26AOaRqk5bI+bb4LtzfhXizC98zo22hiHvMJsY4MmKdTfUJ9kksVBwnjjj175o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=N8N7Yyz+; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1716885834;
 bh=GQr2PqTVIib2CwbHMvN8Y3i6rh0ebN+xNoUL7A1dzos=;
 b=N8N7Yyz+XiVCGNY/9/+kwTe/Hs4dGQZnp9pqovP0A4/X0wvlSWCA3WXoXPq7hO9GbwjliZ4Wc
 +ZAFkHevpm2adPN3/0NDo+2TNNiXhxQu79xqiaDmmdcVtXPcCwVcG0HCJzXzTV92mSt/eELqhl0
 09dYX/FGx46v84g+fzMSdJj5Nnkn2vhaPN3XIGbXQE1Fn6nKCw2jD4Ka90mrJ/WIT2DL/M1BBUI
 PqAKbOFCrn7wyD5cxzi22HwZiHCks/HBwJv30mIk9Jg6wkPf0gRqz7rg9WRPl6XKyI4WEG/kc91
 uTOMYKBRYsa2MRxTruUOl0/zjJm9/RSGfyy0lxhldv8w==
Message-ID: <82435177-1a4a-46c0-9a12-c056647d587f@kwiboo.se>
Date: Tue, 28 May 2024 10:43:43 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pinctrl: rockchip: add rk3308b SoC support
To: "=?UTF-8?Q?Heiko_St=C3=BCbner?=" <heiko@sntech.de>, Dmitry Yashin
 <dmt.yashin@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rob Herring
 <robh@kernel.org>, Jianqun Xu <jay.xu@rock-chips.com>,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240515121634.23945-1-dmt.yashin@gmail.com>
 <81aa0e4e-a3c7-41d1-8cd2-4d060730b37a@gmail.com>
 <20240517085832.365ac878@booty> <4771649.rnE6jSC6OK@diego>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <4771649.rnE6jSC6OK@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 665599456a993415841a589f

On 2024-05-28 10:17, Heiko Stübner wrote:
> Am Freitag, 17. Mai 2024, 08:58:32 CEST schrieb Luca Ceresoli:
>> Hello Dmitry,
>>
>> On Thu, 16 May 2024 17:06:46 +0500
>> Dmitry Yashin <dmt.yashin@gmail.com> wrote:
>>
>>> Hi Luca,
>>>
>>> On 15.05.24 21:29, Luca Ceresoli wrote:
>>>> I'm skeptical about this being bound to a new DT compatible. As far as I
>>>> know the RK3308 and RK3308B are mostly equivalent, so it looks as the
>>>> pinctrl implementation could be detected at runtime. This would let
>>>> products to be built with either chip version and work on any without
>>>> any DT change.  
>>>
>>>
>>> Thanks for your feedback.
>>>
>>> Indeed, these SoC's have a lot in common, but as I can see the rk3308b
>>> has more blocks, like extra PWM's (rk3308 datasheet 1.5 [0] shows only
>>> 1x PWM 4ch, when rk3308b and rk3308b-s have 3x PWM 4ch), 1-wire and
>>> CAN controller (mentioned in the TRM, but dropped from rk3308b
>>> datasheet for some reason).
>>>
>>> So, in my view, it really makes sense to add rk3308b.dtsi, where extra
>>> PWM's, pinctrl compatible and its pin functions can be moved. And if
>>> its not worth it, then I will try to adapt the entire series to runtime
>>> config based on cpuid like you suggested.
>>
>> Having a rk3308b.dtsi would probably make sense, yes, as there are
>> several differences as you described. However for the pinctrl it seems
>> probably not necessary.
>>
>> I've seen actual products being manufactured with two different RK3308
>> variants in different lots of production, but with the same DT that has
>> rockchip,rk3308-pinctrl in it. Those would need a _selective_ DT
>> upgrade in order to benefit from your changes.
>>
>> And even if a product had always used the B variant, it would need DT
>> upgrade when upgrading to a kernel with your changes. Otherwise with
>> patch 1/3 of this series the pictrl driver would lose many routes after
>> upgrading the kernel (but not the DT): can this lead to
>> previously-working devices to stop working? I think this is a
>> fundamental question to reply.
> 
> If things can be runtime-detectable, they should be detected at runtime.
> So yes, while we need to know that it is a rk3308-something before
> via the dt, if we can distinguish between the rk3308 variants at runtime
> we should definitly do so.

The GRF_CHIP_ID reg (0xFF000800) can be used to identify what model is
used at runtime:

RK3308: 0xCEA (errata: chip id value is 32'h0cea (32'd3306))
RK3308B: 0x3308
RK3308BS: 0x3308C

Vendor U-Boot make use of this reg to identify what model is running:
https://github.com/rockchip-linux/u-boot/blob/next-dev/arch/arm/include/asm/arch-rockchip/cpu.h#L68-L82

I can only validate on real hw that the reg value is 0x3308 for RK3308B.

Regards,
Jonas

> 
> Heiko
> 


