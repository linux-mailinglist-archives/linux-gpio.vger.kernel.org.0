Return-Path: <linux-gpio+bounces-13944-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B86079F46B4
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 10:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F05E3168F45
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 08:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA111DE891;
	Tue, 17 Dec 2024 08:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQNmi4A7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F92335C0;
	Tue, 17 Dec 2024 08:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734425979; cv=none; b=jK3gzj7zEUoajzAgTsHwHutn8MfuBeEtqptNM81C910s15hEOEGAJRHXLXaQH+yAMLholDr5bU7ywjz9e+vXOLdV9hyEu4+d2BOAyk0RM05FZARfl5Z6eLsEG3eAfWaIJxofZTi6Q3o+3+h+JxkWmH4nqLwaH5EWmyBf/bag4Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734425979; c=relaxed/simple;
	bh=AVXvQMU1ANoXH8Md1MxDK8KYeqh1t+5stMoOVOhDvAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rm4WZZCr1iQYtj1XEVX6N+bCbtLkOh0Z2IEkYqxTsSYVoo3VpwFxuAYRYuc6Llfm7olQpULSI/jspC6gRTw/1CkHn1ScNgibD2ESN1qs4UdpBzE0huVIisTZWO686cb0zX5DJMG47MR+E0WXkIwTUnN3zOiyz6iU0BJ6ysH9Ryg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQNmi4A7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC1C5C4CED6;
	Tue, 17 Dec 2024 08:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734425978;
	bh=AVXvQMU1ANoXH8Md1MxDK8KYeqh1t+5stMoOVOhDvAM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SQNmi4A71lgbCeCkiTBAkcvKvAoZbn6gupoqeyX0DOfIOFzippBEShUsSlF1Q4pgs
	 SLW2fmLa+DlEqpJs4odLiHy04bfVPx6j+JuTGzi4Gb1+FW+n5yVnMRDrYfnasc4hmS
	 krwdufMeH/ty5hY4JoSkg/oli6L08pzd6feCJul6ppZi+99Ji2JW15DiRV2KqpVyZA
	 ObECgb8q9Co1rq0WYd1FkI/VhzqHIf9FiP6oSIzEeEK8EZ0zGPQwcUiBNSsljeORlY
	 ZAGiEEws2BbXgqmSxfnKB039YRSMtjBbuCV/6hlnBBgUAYIHKsy6EqmJlQe2TCxLyB
	 i6kOEB4IKuTaA==
Message-ID: <78b28da5-db3f-493e-8159-8bdd565728bb@kernel.org>
Date: Tue, 17 Dec 2024 09:59:31 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Add alpha-numerical
 port support for RZ/V2H
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20241216195325.164212-1-biju.das.jz@bp.renesas.com>
 <20241216195325.164212-2-biju.das.jz@bp.renesas.com>
 <fq3q2tk3xfwd4p72b5wzo3gbfizrknxdt6zyc5ahm2cpnrtsbk@nlukbj3yy57c>
 <TY3PR01MB11346902114D33FA66F4C3BF686042@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <c57d3568-68f4-4e5a-874f-4d9f0cc1f2f3@kernel.org>
 <TY3PR01MB113469F4CE8DB86978C03E3D986042@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <TY3PR01MB113469F4CE8DB86978C03E3D986042@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/12/2024 09:49, Biju Das wrote:
> Hi Krzysztof Kozlowski,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: 17 December 2024 07:51
>> Subject: Re: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Add alpha-numerical port support for RZ/V2H
>>
>> On 17/12/2024 08:29, Biju Das wrote:
>>> Hi Krzysztof Kozlowski,
>>>
>>> Thanks for the feedback.
>>>
>>>> -----Original Message-----
>>>> From: Krzysztof Kozlowski <krzk@kernel.org>
>>>> Sent: 17 December 2024 06:32
>>>> Subject: Re: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Add
>>>> alpha-numerical port support for RZ/V2H
>>>>
>>>> On Mon, Dec 16, 2024 at 07:53:11PM +0000, Biju Das wrote:
>>>>> RZ/V2H has ports P0-P9 and PA-PB. Add support for defining
>>>>> alpha-numerical ports in DT using RZV2H_* macros.
>>>>
>>>> So this is only for DT? Not really a binding. Binding binds driver
>>>> implementation with DTS and you do not have here driver.
>>>
>>> Please see patch [1], see how this definition binds driver
>>> implementation with DTS
>>>
>>> [1]
>>> https://lore.kernel.org/all/20241216195325.164212-4-biju.das.jz@bp.ren
>>> esas.com/
>>
>> I don't know what is this patch, it is not part of these series addressed to me and commit msg says
>> "in DT". If you want to receive meaningful review, make it easier for reviewers.
> 
> The header files are part of DT bindings. So if it is wrong, why the 
> Commit "997daa8de64ccbb" "dt-bindings: clock: add ExynosAuto v920 SoC CMU bindings"
> is part of bindings?

I meant that driver patch you linked.

> 
> 
> 
>>
>>
>>>
>>>>
>>>> Calling it a binding makes it immutable and gives us, DT maintainers,
>>>> more work, so really no benefits at all.
>>>
>>>>
>>>> I guess other DT maintainers will ack it, I prefer to reduce number of headers.
>>>
>>> DT describes hardware. The port names are alpha numeric on hardware manual.
>>
>> We talk about binding, not DT.
> 
> Bu the definitions are part of bindings just like Commit "997daa8de64ccbb".

You made them part of bindings, but this is invalid as argument. How is
this anyhow related? How is "DT describes hardware" part of binding?

You said "DT describes hardware", but we do not talk here about DT, do
we? We talk about binding.


> 
>>
>>>
>>> For example, consider the case of  hardware pin PS1 mentioned in hardware manual.
>>>
>>> With current changes,
>>> pinmux = <RZG3E_PORT_PINMUX(S, 1, 0)>;
>>>
>>> With existing code
>>> pinmux = <RZG3E_PORT_PINMUX(28, 1, 0)>;
>>
>> Based on this pure code: still not a binding.
> 
> I agree. Macro converted to a number which binding care of.
> 
>>
>>>
>>> What do you prefer here? 28 is just a number derived from hardware
>>> indices
>>
>> Let me ask rhetorical question: if 28 hardware constant is suitable for binding, then why are you not
>> defining GPIO numbers, IRQ numbers and MMIO addresses as bindings as well?
> 
> On RZ/G2L all ports are in numbers not an issue. But on RZ/V2H an RZ/G3E
> hardware manual just talks about Port {0..8} {A..H}{J..M}{S}. Hardware constant 28 is just derived one.
> 
> A device user just refer, hardware manual and pinctrl list and put the definitions on binding.
> He does not need to undergo mapping for alpha numeric to hardware index conversion.

You just described something entirely else than binding, so why are you
using this as an argument?

> 
> 
>>
>>> Or actual port name PS1 as mentioned in hardware manual?
>>
>> Well, I don't know. Commit says DTS, no driver patches here in my inbox, so what do I know?
> 
> OK, It is just definitions, so you mean it has to merge with driver + dts patch. so it won't
> create any confusion and we can ignore check patch warning, "binding patch should be
> Separate patch"
> 
> What about then merging this patch with [2] and [3] similar to [4], 
> 
> [2] https://lore.kernel.org/all/20241216195325.164212-4-biju.das.jz@bp.renesas.com/
> [3] https://lore.kernel.org/all/20241216195325.164212-6-biju.das.jz@bp.renesas.com/

I am not going to keep reading all the external references you keep
bringing or discussing why someone else did something. This patch must
be logical and correct on its own, not because someone else made
something somewhere.

> 
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/include/dt-bindings?h=next-20241217&id=ecc79ab919ec54c658fb14f955c76872119829b8

Again, I did not see any driver using this, nothing in commit msg
explained this except referencing that DT will use it. Maybe your
patchset is wrongly organized? Maybe commit msg is incorrect? Not sure,
as I said, you got such review you helped me to make.


Best regards,
Krzysztof

