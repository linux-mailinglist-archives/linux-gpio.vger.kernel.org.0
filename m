Return-Path: <linux-gpio+bounces-11713-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A43BE9A60D0
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 11:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23A541F22A2A
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 09:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381151E3DDE;
	Mon, 21 Oct 2024 09:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MhID54Wt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68911E3DCD;
	Mon, 21 Oct 2024 09:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729504611; cv=none; b=BcwoNkaSZv7SFGsm+cnn+jkKIXn4kxVds+NSAMRTCwroAdo0IzEe71T3ZCWsIHAhD8H6SoEpBlhKsNjGV69T5FZUQ2JeMZxI1Da/hqPWNPvChkn9vVFKtXMC3jDLEKbV3ros7YSlDyUfzbwIJDjAKyWT4dEQW146NGtfGhujuQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729504611; c=relaxed/simple;
	bh=gEEMTMLHm+8gvhysDvKvAHEgkMPvLe5kysiAriDWv8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tmRISLdRjXHXnfHJCMw1CzrJvjJkVi5v5nVSs1S90S/keieyXlEw1o4axUMN/OtToakMG5LYzMEyfJNHywJCKcIwUxjQGVR4uQTVHfwNm956u32GQFwCu2g9cOyD5LpSXmcpFwJfi90VfeoHHhIhNciDU9Q7eFfifyaODIWmBww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MhID54Wt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F85FC4CEE5;
	Mon, 21 Oct 2024 09:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729504610;
	bh=gEEMTMLHm+8gvhysDvKvAHEgkMPvLe5kysiAriDWv8s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MhID54WtA8nUay0fAymDDxNVciw04tX1xE6oidaGyR/QCfgimnw9eDPN74ZOSoKYf
	 7cLHiPvmJiHF3oA29YMA+33Qb3fO4GiEnm11DSnHx8jlf/v67BiGHWFv2z/ePLNnl2
	 GJWF8Xbtj/vY0xaPHgsT1qBWQG7GtH7efPsZNrCd2aii8FvwBKXqgU8NKJv/MlP32q
	 /w0P/l2LkhXjHYBDDuiGVXosSLHrA5b/zbFz3Mx5gNzFd38lb9oA5Y+gDa4+k1/72h
	 Jhf3PXZRLLmiVf+TyZUGJasKfQtL69p/M9ZPeK4M0vXlFAwYoRFcv9bUhqoJoh5gdZ
	 miDxEyS8uCc9A==
Message-ID: <c8a03fa6-9ac5-434f-ba13-78e47ad341b8@kernel.org>
Date: Mon, 21 Oct 2024 11:56:42 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Amlogic A4
 SoCs
To: neil.armstrong@linaro.org, Jerome Brunet <jbrunet@baylibre.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
 <20241018-a4_pinctrl-v3-1-e76fd1cf01d7@amlogic.com>
 <4a79f996-9d82-48b2-8a93-d7917413ed8c@kernel.org>
 <1jttd9rein.fsf@starbuckisacylon.baylibre.com>
 <4127b448-a914-4c69-b938-29512995326f@amlogic.com>
 <1jmsj1rclh.fsf@starbuckisacylon.baylibre.com>
 <d654d2b2-977b-44c0-8b01-b26f5eb0a3fe@kernel.org>
 <5ad8f396-84a5-486d-b90d-98fbf8882d1b@linaro.org>
 <e6cd13b5-2f7a-4ab1-899c-5867bc0ea64f@kernel.org>
 <fdb4d0eb-a5e5-4061-b3cc-14958473baf3@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <fdb4d0eb-a5e5-4061-b3cc-14958473baf3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/10/2024 09:38, neil.armstrong@linaro.org wrote:
> On 18/10/2024 17:31, Krzysztof Kozlowski wrote:
>> On 18/10/2024 14:31, Neil Armstrong wrote:
>>> On 18/10/2024 12:13, Krzysztof Kozlowski wrote:
>>>> On 18/10/2024 11:20, Jerome Brunet wrote:
>>>>> On Fri 18 Oct 2024 at 17:01, Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:
>>>>>
>>>>>> Hi Jerome,
>>>>>>      Thanks for your reply.
>>>>>>
>>>>>> On 2024/10/18 16:39, Jerome Brunet wrote:
>>>>>>> [ EXTERNAL EMAIL ]
>>>>>>> On Fri 18 Oct 2024 at 10:28, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>>>>
>>>>>>>> On 18/10/2024 10:10, Xianwei Zhao via B4 Relay wrote:
>>>>>>>>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>>>>>>>
>>>>>>>>> Add the new compatible name for Amlogic A4 pin controller, and add
>>>>>>>>> a new dt-binding header file which document the detail pin names.
>>>>>>> the change does not do what is described here. At least the description
>>>>>>> needs updating.
>>>>>>>
>>>>>>
>>>>>> Will do.
>>>>>>
>>>>>>> So if the pin definition is now in the driver, does it mean that pins have
>>>>>>> to be referenced in DT directly using the made up numbers that are
>>>>>>> created in pinctrl-amlogic-a4.c at the beginning of patch #2 ?
>>>>>>>
>>>>>>
>>>>>> Yes.
>>>>>>
>>>>>>> If that's case, it does not look very easy a read.
>>>>>>>
>>>>>>
>>>>>> It does happen. The pin definition does not fall under the category of
>>>>>> binding.
>>>>>>
>>>>>> https://lore.kernel.org/all/106f4321-59e8-49b9-bad3-eeb57627c921@amlogic.com/
>>>>>
>>>>> So the expectation is that people will write something like:
>>>>>
>>>>>    reset-gpios = <&gpio 42 GPIO_ACTIVE_LOW>;
>>>>>
>>>>> And others will go in the driver to see that is maps to GPIOX_10 ? the number
>>>>> being completly made up, with no link to anything HW/Datasheet
>>>>> whatsoever ?
>>>>>
>>>>> This is how things should be done now ?
>>>>
>>>> Why would you need to do this? Why it cannot be <&gpio 10
>>>> GPIO_ACTIVE_LOW>, assuming it is GPIO 10?
>>>>
>>>> Bindings have absolutely nothing to do with it. You have GPIO 10, not
>>>> 42, right?
>>>
>>> There's no 1:1 mapping between the number and the pin on Amlogic platforms,
>>> so either a supplementary gpio phandle cell is needed to encode the gpio pin
>>> group or some bindings header is needed to map those to well known identifiers.
>>
>> So I assume this is not linear mapping (simple offset)? If so, this fits
>> the binding header with identifiers, but I have impression these were
>> not really used in earlier versions of this patchset. Instead some offsets:
>> https://lore.kernel.org/all/20241014-a4_pinctrl-v2-1-3e74a65c285e@amlogic.com/
>>
>> and pre-proccessor.
>>
>> These looked almost good:
>> https://lore.kernel.org/all/20240613170816.GA2020944-robh@kernel.org/
>>
>> but then 0 -> 0
>> 1 -> 1
>> so where is this need for IDs?
> 
> ???
> 
> Of courses the first pins maps to linear values...
> 
>>
>> See also last comment from Rob in above email.
> 
> OK so I looked and v2 was in fact correct:
> https://lore.kernel.org/all/20241014-a4_pinctrl-v2-1-3e74a65c285e@amlogic.com/
> 
> ====><=================
> +/* Standard port */
> +#define GPIOB_START	0
> +#define GPIOB_NUM	14
> +
> +#define GPIOD_START	(GPIOB_START + GPIOB_NUM)
> +#define GPIOD_NUM	16
> +
> +#define GPIOE_START	(GPIOD_START + GPIOD_NUM)
> +#define GPIOE_NUM	2
> +
> +#define GPIOT_START	(GPIOE_START + GPIOE_NUM)
> +#define GPIOT_NUM	23
> +
> +#define GPIOX_START	(GPIOT_START + GPIOT_NUM)
> +#define GPIOX_NUM	18
> +
> +#define PERIPHS_PIN_NUM	(GPIOX_START + GPIOX_NUM)
> +
> +/* Aobus port */
> +#define GPIOAO_START	0
> +#define GPIOAO_NUM	7
> +
> +/* It's a special definition, put at the end, just 1 num */
> +#define	GPIO_TEST_N	(GPIOAO_START +  GPIOAO_NUM)
> +#define	AOBUS_PIN_NUM	(GPIO_TEST_N + 1)
> +
> +#define AMLOGIC_GPIO(port, offset)	(port##_START + (offset))
> ====><=================
> 
> is exactly what rob asked for, and you nacked it.

No, this is not what was asked, at least according to my understanding.
Number of GPIOs is not an ABI. Neither is their relationship, where one
starts and other ends.

Maybe I missed something, but I could not find any users of these in the
DTS. Look:

https://lore.kernel.org/all/20241014-a4_pinctrl-v2-3-3e74a65c285e@amlogic.com/

Where is any of above defines?

Maybe they will be visible in the consumer code, but I did not imagine
such use. You expect:
reset-gpios = <&ctrl GPIOAO_START 1>???

How this is anyway close to what we have for Aspeed or Tegra? I
understand that there was no consumer DTS, but you have also cover
letter which could bring some answers in case reviewer is confused. What
did cover letter say? Let me quote:

"Add pinctrl driver support for Amloigc A4 SoC"




Best regards,
Krzysztof


