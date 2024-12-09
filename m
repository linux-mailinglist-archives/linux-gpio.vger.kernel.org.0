Return-Path: <linux-gpio+bounces-13685-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 601CE9E9FD7
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 20:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B972318868CA
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 19:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F901991AA;
	Mon,  9 Dec 2024 19:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QN+hx12R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A31819343B;
	Mon,  9 Dec 2024 19:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733773813; cv=none; b=rN73U0AHEL73+Se+pRUgQCOqATR68iRe/NDaP8LF9oc9WS0DVDg0ywt3Y06HZDZC/GVwuGdKAbc2D97z0IMpYp7lqn/9PGYqUQlPTxKRVeMOBebWkoayNZFsHpxLjgDhGFxNexd3SdvR+LDxm0WEE4/Hn+5HTiAoS9cR3LomMMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733773813; c=relaxed/simple;
	bh=WFyzCPUIdQEg7do8gqzOuZUa8ipE3gSeX/hK+rkfFkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iInDl4NJhJEdaqOY53FWFiz9Q08WtTLn9qn+y3r+gjqaIdBS1YcrpnVFhdrDQQa+U1HyXkaLRt1iFmiaeuLdztBzoU6d1RVk19CaorkPWWngLhJkdS65Bvus10whm/4TouVeREfPyGvDYeTI9FNvb9TY4CoLsTXB2uM3BbIxfwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QN+hx12R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940D0C4CED1;
	Mon,  9 Dec 2024 19:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733773812;
	bh=WFyzCPUIdQEg7do8gqzOuZUa8ipE3gSeX/hK+rkfFkg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QN+hx12RIQYDWCp3wPjsJwArcAmy8s1Q6y2UfLvZdvZADOEaY3DVg86cA5uC7m2bV
	 DlSJoCfS+i75RrTOr8nMu1lVdMHV4jp4ASPM7+ePN8sCz1UJOKtXN8ZhTBC53MNZqj
	 S3Gx/sMTPFXpCvCLRRrr2/jfuUIQcdiMJ9bU1Hr02xPyJymPyvDR1ZV6rCou/UJDS+
	 sNVsDiTo6PzyEnasklpxgqwpEHhfl798ad0QGee7KsLuv7fEymFQmNcZcU2m0B2w0w
	 C2jZ6I3NZEAz+IZT4xfj07A3VnUEb5ZXy910CsI3eLo124/4w0qmkI0sGue80Z2cqi
	 ji0qSlyBKDoig==
Message-ID: <bf80a815-a602-4bbe-a950-e8b6c1b0789a@kernel.org>
Date: Mon, 9 Dec 2024 20:50:07 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator:s5m8767 Fully convert to GPIO descriptors
To: Song Chen <chensong_2000@189.cn>, lgirdwood@gmail.com,
 broonie@kernel.org, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <20241206051358.496832-1-chensong_2000@189.cn>
 <17a4dbd7-56cb-4c20-a913-0df5c39fc3ff@kernel.org>
 <862662aa-c5a2-4e15-b97f-ca1b4757ab25@189.cn>
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
In-Reply-To: <862662aa-c5a2-4e15-b97f-ca1b4757ab25@189.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/12/2024 07:16, Song Chen wrote:
>>>   		}
>>> -		pdata->buck_gpios[i] = gpio;
>>> +
>>> +		/* SET GPIO*/
>>
>> What is a SET GPIO?
>>
>>> +		snprintf(label, sizeof(label), "%s%d", "S5M8767 SET", i + 1);
>>
>> Why using "SET" as name, not the actual name it is used for? Buck DVS?
> 
> from below snippets:
> s5m8767_pmic_probe of drivers/regulator/s5m8767.c
>          ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[0],
>                      "S5M8767 SET1");
>          if (ret)
>              return ret;
> 
>          ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[1],
>                      "S5M8767 SET2");
>          if (ret)
>              return ret;
> 
>          ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[2],
>                      "S5M8767 SET3");


Yeah, your code is fine.

> 
> and arch/arm/boot/dts/samsung/exynos5250-spring.dts
> 
>          s5m8767,pmic-buck-dvs-gpios = <&gpd1 0 GPIO_ACTIVE_LOW>, /* DVS1 */
>                            <&gpd1 1 GPIO_ACTIVE_LOW>, /* DVS2 */
>                            <&gpd1 2 GPIO_ACTIVE_LOW>; /* DVS3 */
> 
>          s5m8767,pmic-buck-ds-gpios = <&gpx2 3 GPIO_ACTIVE_LOW>, /* SET1 */
>                           <&gpx2 4 GPIO_ACTIVE_LOW>, /* SET2 */
>                           <&gpx2 5 GPIO_ACTIVE_LOW>; /* SET3 */
> 
>>
>>> +		gpiod_set_consumer_name(pdata->buck_gpios[i], label);
>>> +		gpiod_direction_output(pdata->buck_gpios[i],
>>> +					(pdata->buck_default_idx >> (2 - i)) & 0x1);
>>
>> This is not an equivalent code. You set values for GPIOs 0-1 even if
>> requesting GPIO 2 fails.
>>
>> On which board did you test it?
> 
> You are right ,it's not equivalent with original code, i will fix it. 
> but i have a question here:
> 
>          ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[0],
>                      "S5M8767 SET1");
>          if (ret)
>              return ret;
> 
>          ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[1],
>                      "S5M8767 SET2");
>          if (ret)
>              return ret;
> 
>          ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[2],
>                      "S5M8767 SET3");
>          if (ret)
>              return ret;
> 
> if it fails to request buck_gpios[2] after successfully requests 
> buck_gpios[0] and buck_gpios[1], the probe fails as well, should it call 
> gpiod_put to return gpio resource?


Aren't you using devm interface? Please read the API. You do not need to
put anything, unless you use some other interface and I missed the point
of the question.

Best regards,
Krzysztof

