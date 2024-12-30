Return-Path: <linux-gpio+bounces-14346-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 895309FE3A0
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 09:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3968016216A
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 08:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B951A0718;
	Mon, 30 Dec 2024 08:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mGDo0Bk6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDF1EAD2;
	Mon, 30 Dec 2024 08:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735546591; cv=none; b=fVXcf2/c5vIP9XnzvJMXhB7WuU2MzVOfV1IaqRGTgUOkxv67dK/bSmDYsSJz73bfVVYuCZ9YurVc25d9PCBvja53yq1ky02UzWI1VGc3mME6djnRE7Z78mgk4UQ6xDwgPNuMFMB1+yU3m3CJt4E3tOg/qj9rZO4XMl7CrxMfkKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735546591; c=relaxed/simple;
	bh=AC1j63zZVQyM8qkIeO3XPkSufgkNoDUxCYl8A0p1FPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OXKYAFzUrHA6vjfqKnc76o4QdU9yxUhSPaQpGM6iYMptWFB0WPoufpUwRiXOgo4U6+eN9XU1bDWMy/t0Cj+xDT1pPbTo5dzOS/V1sHEzI+TE4MmMD29sY5rx7/meIZGeDGb81WaXiOfC3BepUJ53f54KooQFzOKPzr5bnRT+dQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mGDo0Bk6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4B6C4CED0;
	Mon, 30 Dec 2024 08:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735546590;
	bh=AC1j63zZVQyM8qkIeO3XPkSufgkNoDUxCYl8A0p1FPs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mGDo0Bk6nZ/lgAQZjItoutEt/KlBVYThgYBnWqYGnwiJRIxTDRdLAQYe2vfw+fTpk
	 sR+zwSSY3Tbn5GotCi0CsVKBfgz0TzIM5mjl6ZJCLeC1j+DtOyIg8ti1PmvF6UfsBc
	 66AqFCCNHYy0jA3/KKo1JoakvVFtXrNvehYVi9KwvLo6dYxZi6ldT4+5lHzGss/HhI
	 I4J8rPemstngywN+1Gy+g4gnqKK3kooQIo4c7stn0r+4eIGC30rbosmLQ3jvuyLsVo
	 JoqQJUt3K3go7sc52I5h0vq+dfRHrs/eSgy0MX4dZx0Whf7kjEvTul7R+54/xYXhB3
	 h93rs7ZPzWcGw==
Message-ID: <4adc7827-dc5f-41ca-b091-74e86bfdefb1@kernel.org>
Date: Mon, 30 Dec 2024 09:16:22 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: pinctrl: qcom: rename spi0 pins on
 IPQ5424
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
 linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, konradybcio@kernel.org, mturquette@baylibre.com,
 sboyd@kernel.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Cc: quic_varada@quicinc.com, quic_srichara@quicinc.com
References: <20241227072446.2545148-1-quic_mmanikan@quicinc.com>
 <20241227072446.2545148-2-quic_mmanikan@quicinc.com>
 <fbdf716d-0c4c-4f51-9f54-0f38931e26cd@kernel.org>
 <2234c9d5-f434-48cf-ba77-38e9109541eb@quicinc.com>
 <88b6e7ec-0265-4507-9ce1-a72217563e32@kernel.org>
 <ea31d59b-38da-4844-9ea5-32e51b8578fd@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <ea31d59b-38da-4844-9ea5-32e51b8578fd@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/12/2024 08:50, Manikanta Mylavarapu wrote:
> 
> 
> On 12/27/2024 3:00 PM, Krzysztof Kozlowski wrote:
>> On 27/12/2024 10:18, Manikanta Mylavarapu wrote:
>>>
>>>
>>> On 12/27/2024 1:06 PM, Krzysztof Kozlowski wrote:
>>>> On 27/12/2024 08:24, Manikanta Mylavarapu wrote:
>>>>> SPI protocol runs on serial engine 4. Hence rename
>>>>> spi0 pins to spi4 like spi0_cs to spi4_cs etc.
>>>>>
>>>>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>>>> ---
>>>>
>>>>
>>>> <form letter>
>>>> This is a friendly reminder during the review process.
>>>>
>>>> It looks like you received a tag and forgot to add it.
>>>>
>>>> If you do not know the process, here is a short explanation:
>>>> Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions
>>>> of patchset, under or above your Signed-off-by tag, unless patch changed
>>>> significantly (e.g. new properties added to the DT bindings). Tag is
>>>> "received", when provided in a message replied to you on the mailing
>>>> list. Tools like b4 can help here. However, there's no need to repost
>>>> patches *only* to add the tags. The upstream maintainer will do that for
>>>> tags received on the version they apply.
>>>>
>>>> Please read:
>>>> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
>>>>
>>>> If a tag was not added on purpose, please state why and what changed.
>>>> </form letter>
>>>>
>>>
>>> Hi Krzysztof,
>>>
>>> 	Patches #1 to #4 are newly added in V3 (to rename SPI0 to SPI4). Hence, there are no A-b/R-b
>>> 	tags associated with these patches. I mentioned this information in the cover letter.
>>> 	
>>> 	I assume you are referring to Patch #1 from the V2 series.
>>> 	Patch #1 [1] and #2 [2] from the V2 series have been merged into linux-next.
>>> 	[1] https://lore.kernel.org/linux-arm-msm/20241217091308.3253897-2-quic_mmanikan@quicinc.com/
>>> 	[2] https://lore.kernel.org/linux-arm-msm/20241217091308.3253897-3-quic_mmanikan@quicinc.com/
>>>
>>> 	Please let me know if i missed anything.
>>
>> v3 mislead me here and three different subsystems in one patchset.
>>
>> Anyway, if this is different patch then review follows - there is no ABI
>> impact explanation and this is an ABI break. What's more, entries are
>> not sorted anymore and why there is a gap? spi4, spi1 and spi10? Where
>> is spi3?
>>
>> Not sure if this renaming is useful or correct, especially considering
>> not many arguments in commit msg (e.g. datasheet?).
>>
>>
> 
> Hi Krzysztof,
> 
> 	The IPQ5424 supports two SPI instances on serial engine 4 and 5.
> 	Previously, SPI clocks, gpio pins and DTS node names were named
> 	according to protocol instances like spi0 and spi1.
> 
> 	As per the feedback received in
> 	https://lore.kernel.org/linux-arm-msm/ca0ecc07-fd45-4116-9927-8eb3e737505f@oss.qualcomm.com/,
> 	spi0 has been renamed to spi4 to align with the serial engine instance.
> 
> 	Kindly advice if it's not acceptable.

The advice was not about pins, though. My comments stands for commit
msg. Nothing about ABI, nothing about datasheet...

Best regards,
Krzysztof

