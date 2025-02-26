Return-Path: <linux-gpio+bounces-16634-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB08A46408
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 16:05:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 998CF16DA1F
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 15:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431AE2222AB;
	Wed, 26 Feb 2025 15:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E5lR1/Rz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF237194AF9;
	Wed, 26 Feb 2025 15:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740582336; cv=none; b=EeeMXabd6GZXN1Cog1JOvBWXyho3tLyZ+Fd2aSmIOrKbGWn0+80PAPYT/LUtvyU8Sa29ZvJXBK4zGpCxtC42+cgyyPj1aO4GhrFLE+oxO3TMqDnSSrqeNpt1dZ98DdWoNK+Ch073aHZE5YbB3WHnIsizpeEu1iZDrvrr+BNPDfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740582336; c=relaxed/simple;
	bh=aKsWQB1CAlUK5Cm9Str0bXC/fuAE5a6GytVvT9WpSwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=biUOWo+n2rcrxJ25GP1LT7dk3qEL+wuFRbdCAoAa+tlZQoqK/sDs82oTa2cTYpglqtXkw0tU5pB9ei/97kxVD0RlwpZLi/pW3Lfrb5nn2xuHvMKBn30Cqmze3N6eV9L6RuPWRp0ebxV6JBIHojgKXmAQkjOiCH2pvrdsRSOD2BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E5lR1/Rz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A61D4C4CED6;
	Wed, 26 Feb 2025 15:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740582335;
	bh=aKsWQB1CAlUK5Cm9Str0bXC/fuAE5a6GytVvT9WpSwQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E5lR1/RzHzUkxREwq/zFpM6dNAJg6FBORcTq34Ngz7n5jss+MumqXyhv6zoOh6YPB
	 BvEvhistIvvVIpX5iXQxhuZ/EBzeQBHyDeYtui2LKJvXSXqHzIN/H7akmlDkuBO2IM
	 cHMKTudtb8oqdHSWQL6GSxnl1pF7+K5y2omNbl7i5ueNo/Ttn1gaRW1SjSYWKyFz6I
	 5KIMD8JX89o+0nl42BW7/pdQuHfoyWfAZTtfb61bZJFnD1vXoR+XvJXAWi5Hjqwkhx
	 p1OiiBUvNrw6Yj0o9QDlPZc68ew74TqKTQCd4zITnWpXC0sYn8xw7JmRo7veXEXyON
	 n8uTyZl1GJbrg==
Message-ID: <46fbdccb-610a-4b73-8697-d7bcf4942a41@kernel.org>
Date: Wed, 26 Feb 2025 16:05:30 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: pinctrl: stm32: Introduce HDP
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
 <20250225-hdp-upstream-v1-2-9d049c65330a@foss.st.com>
 <6fc80544-6fc3-4450-a0cc-bfc740fe97bb@kernel.org>
 <91f19306-4b31-41fe-8ad2-680b1a339204@foss.st.com>
 <00526b1d-b753-4ee5-8f83-67d27d66a43c@kernel.org>
 <264d7fb8-06c2-4ada-82bc-4d3a7cc5e184@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <264d7fb8-06c2-4ada-82bc-4d3a7cc5e184@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/02/2025 11:52, Clement LE GOFFIC wrote:
> On 2/26/25 08:21, Krzysztof Kozlowski wrote:
>> On 25/02/2025 16:51, Clement LE GOFFIC wrote:
>>> On 2/25/25 14:04, Krzysztof Kozlowski wrote:
>>>> On 25/02/2025 09:48, Clément Le Goffic wrote:
>>>>> +
>>>>> +maintainers:
>>>>> +  - Clément LE GOFFIC <clement.legoffic@foss.st.com>
>>>>> +
>>>>> +description: |
>>>>
>>>>
>>>> Do not need '|' unless you need to preserve formatting.
>>>
>>> Ok
>>>
>>>>> +  STMicroelectronics's STM32 MPUs integrate a Hardware Debug Port (HDP).
>>>>> +  It allows to output internal signals on SoC's GPIO.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: st,stm32mp-hdp
>>>>
>>>> There is a mess in STM SoCs. Sometimes you call SoC stm32, sometimes
>>>> stm32mp and sometimes stm32mpXX.
>>>>
>>>> Define for all your STM contributions what is the actual SoC. This
>>>> feedback was already given to ST.
>>>>
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  clocks:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +patternProperties:
>>>>> +  '-pins$':
>>>>> +    type: object
>>>>> +    $ref: pinmux-node.yaml#
>>>>> +
>>>>> +    properties:
>>>>> +      function:
>>>>> +        enum: [ "0", "1", "2", "3", "4", "5", "6", "7",
>>>>> +                "8", "9", "10", "11", "12", "13", "14",
>>>>> +                "15" ]
>>>>
>>>> Function which has a number is not really useful. What does it even express?
>>>
>>> As said in my previous answer, function names are very different from
>>> one platform to another. Numbers were used as string to be generic.
>>> I'll consider it in a V2.
>>
>> What does it mean "one platform to another"? This is one platform! Is
>> this some sort of continuation of SoC compatible mess?
> 
> I may used incorrectly the word platform.
> This driver is the same for the three SoC families STM32MP13, STM32MP15 

That's driver and it is fine, but we talk about hardware here. The
binding is for given specific hardware.

> and STM32MP25 because the hardware is mostly the same.
> 
> Why mostly ?
> 
> The peripheral is behaving as a mux, there are 8 HDP ports, for each 
> port there is up to 16 possible hardware signals. Numbered from 0 to 15.
> Each of this number represent a signal on the port.
> 
> But the hardware signal behind the number is not the same from one SoC 
> family to another.
> As example, in STM32MP15 family the HDP is able to output GPU hardware 
> signals because the family has a GPU but in the STM32MP13 family this 
> signal is not present.

It looks like you have clear mapping between function and port number
(your header also suggests that), so the function property should follow
that user-visible function.

Just like we do for many other architectures - it is not that very, very
different, I think. all of platform hardwares do not operate on strings
but some bits in registers (so numbers) but all (ideally) bindings
operate on strings. You created here exception on basis this is somehow
special, but the point is: it is not special.

> 
> The purpose of my helpers was to give a readable name to facilitate the 
> configuration in boards devicetree's. If needed I can get rid of that 
> and use only the number as string.

If you use "names" you do not need even that helper header.

> 
>> What are the exact functions written in datasheet?
> 
> The exact functions name written in the datasheet are the ones of my 
> helper file without the HDP prefix.

so full strings "pwr_pwrwake_sys" and these should be used.

Best regards,
Krzysztof

