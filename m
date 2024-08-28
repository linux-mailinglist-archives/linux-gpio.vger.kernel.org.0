Return-Path: <linux-gpio+bounces-9249-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49815961E53
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 07:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC2281F24E4B
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 05:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CE514D29D;
	Wed, 28 Aug 2024 05:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K/VOggvf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535071799F;
	Wed, 28 Aug 2024 05:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724823829; cv=none; b=Hm4pSDF8mGXgp1Rt4svGx7Dr3h3/n6gzrdbrUg0B9/jYtSjdRrZKM6R65rGxyYP4wIy3pSZCdUfuxZOqFZ60LZo2B5fwAQgTqw8m0OFRMHcQeTMH9RTSQjqAuIt3LVgt4+hU3db2a6gwH8JkoJnFtWGiTtuMUYJnwF3T/RY/HIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724823829; c=relaxed/simple;
	bh=e+UX0uF21Uqf4t5Gdm4xCeKbdQcHfh2viPYaR1DGi+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T7NsfGrod8iDaFw8lVeZN3FPIrIXvjXz3n4vrQgVWyklotxBajQ066/CE4bUZnT/AJXftVR5pb49lpT63lJouVYheNGcL5c6M7uJzuHRtynnzFfh66lMcJ5HiAU7p0qFOtzx69AxGLbbPSMqKS/lpuYMVauiwNIwqzjlKjLIG1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K/VOggvf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5DCC32786;
	Wed, 28 Aug 2024 05:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724823828;
	bh=e+UX0uF21Uqf4t5Gdm4xCeKbdQcHfh2viPYaR1DGi+k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K/VOggvfZWoyN1TCtyIbpDg0DAMJC59ojdeQG4+1QqETqfBWAfiNGAIxjJePrFIZM
	 voLRFLhXmU2elCHa/BSp803kwPMtQxBnIEg2nGBpEkwwoKqbvb1eqd99ztgxEJJPh4
	 jZYKeHlFv92C7FMIW+EWFTSeYf/kHB7TgXSFHb8MOW8/I4PICVGntRp/rwgbr1wmlY
	 FQahcp6StUDAJS3vDtMcR77NIX6gjRCD4wV4Jxpr1wwrm3TDcSyzqoKIqAX2D66mG1
	 OTYBjWvH0yDVENulfqVWm02wKCIb2r87PwUWsaN05I5LnScbseAJ1DLvmDlDMTn6Ch
	 e8+m7Eo3WzNzg==
Message-ID: <b5c70885-a307-40c0-8d5c-3ee5260b7a81@kernel.org>
Date: Wed, 28 Aug 2024 07:43:42 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: pinctrl: Add fsl,ls1012a-pinctrl yaml
 file
To: David Leonard <David.Leonard@digi.com>
Cc: linux-arm-kernel@lists.infradead.org, Dong Aisheng
 <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <a5c1eef7-372d-082b-066e-ecd5e001d1cf@digi.com>
 <pywfy4ypttq7y2llfkdgkwgpjfvnzk3lcgd67efp2v6qu6f2it@fdgiw5pac7uz>
 <f682476b-f7af-0d66-7105-1d064f5f1739@digi.com>
 <db12d221-d3b1-4df5-91e4-d31fb0acdb8b@kernel.org>
 <6ddcd97d-7d60-8e4f-fede-42bf7f99e2b0@digi.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <6ddcd97d-7d60-8e4f-fede-42bf7f99e2b0@digi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/08/2024 02:43, David Leonard wrote:
> On Tue, 27 Aug 2024, Krzysztof Kozlowski wrote:
> 
>> On 27/08/2024 18:51, David Leonard wrote:
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: fsl,ls1012a-pinctrl
>>>>> +
>>>>> +  reg:
>>>>> +    description: Specifies the base address of the PMUXCR0 register.
>>>>> +    maxItems: 2
>>>>
>>>> Instead list and describe the items.
>>>
>>> Changed to
>>>
>>>     reg:
>>>       items:
>>>         - description: Physical base address of the PMUXCR0 register.
>>>         - description: Size of the PMUXCR0 register (4).
>>>
>>> Is this what you meant?
>>
>> Almost, second reg is not a size. You claim there are two IO address
>> spaces. Each address space contains base address and size. Look at other
>> bindings how they do it.
> 
> Previously, dt_binding_check was giving me a warning that 'maxItems' needed
> to be supplied. Which confused me because I thought of reg as an opaque subspace

No.

> descriptor, but I was just trying to placate the checks. After tool upgrades,
> that warning doesn't appear any more.
> 
> So the neatest documentation would be:
> 
>    reg:
>      description: Specifies the address of the PMUXCR0 register.

No. Please go through example-schema. Or any other binding... If you
find any binding with above syntax, let me know.

Instead: maxItems: 1.

> 
>>>>> +  big-endian:
>>>>> +    description: If present, the PMUXCR0 register is implemented in big-endian.
>>>>
>>>> Why is this here? Either it is or it is not?
>>>
>>> You're right. Changed to
>>>
>>>     big-endian: true
>>>
>>> (This also lead to some code simplification)
>>
>> OK, but I still wonder why is it here. Without it the hardware will work
>> in little-endian?
> 
> Well, it's here firstly because I was trying to follow a perceived convention in
> dts/freescale/fsl,ls1012a.dtsi. That DT uses big-endian in child

I am confused. Are you adding new device or converting existing bindings?


> nodes of /soc that match up with memory map tables from the datasheet.
> (Not only do different and adjacent parts of the register map have
> opposing endianess, some register layouts also seem to be reversed
> bitwise, others bytewise.)
> 
> The second reason is practical/dodgy. The pinctrl driver should logically
> be a child of the scfg node, but the syscon driver doesn't populate its
> child nodes. To get the pinctrl driver to work meant making it a sibling

So fix driver...

> node with an unsatisfactory overlap with the scfg's address region
> 0x1570000+0x10000. (No driver binds to "fsl,ls1012a-scfg".)
> 

Several big-endian properties were added unnecessarily and are now being
removed. You cannot provide me answer whether this hardware is
little/big endian, so it also feels unnecessary.

Best regards,
Krzysztof


