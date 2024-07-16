Return-Path: <linux-gpio+bounces-8217-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6A693205B
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 08:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70EE9B216BE
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 06:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D721C68C;
	Tue, 16 Jul 2024 06:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="grYsf5+B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C422599;
	Tue, 16 Jul 2024 06:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721110625; cv=none; b=b6irukrYb9WJTymw97ZQNbsrtR2KuN2jEgTDVcTRnfNUhkZknEnKJEW2XJI5DOz/DlEEYM52003HfywpgN4EJ2SVy9nKHdGxUwq2ObeKRJTcLCixdRvOkcvghrmOIrBxidaBgZJUzL94+cxG4DflHDovaWvg2nPZrK3vtFTPfqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721110625; c=relaxed/simple;
	bh=3o+iFursrZ2BdMTCdh88JM9TIF5wTTuuvLbca83Te/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y53yZTuE+0MtDt9XjnHz4X9XA0owQIseUUJtyYzSU2KaJ3gST4EPRYHlXwQJigSTXzubWwP/8a+h2S5ntydXegl6umV1vCT8urrl/EwA1gh157WifIS2MQRqoipLJgEYWdQowaY+13/zhHDbwj8HCOotzBunMlnf6Rnoc36FlCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=grYsf5+B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C722C116B1;
	Tue, 16 Jul 2024 06:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721110624;
	bh=3o+iFursrZ2BdMTCdh88JM9TIF5wTTuuvLbca83Te/8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=grYsf5+ByWlEaD/OD1xZzIQOlAtfo5IsXWZPv06YzDyQo3tK8OSc2rpjSaLfnhc8K
	 zdewoA3JsLT4B17V+GrV6dniheTQhvstf+ZgCsDcjYba83NnHlPcxVepzFm+L9Sy35
	 hGdNu1bML58W0fJum/V/2JRE3r7vNdclm42l6tVco30IGcoQl/Bu7zpEkfVdLC4TzL
	 iASIUb/hmCNrvxQBxA+pNttD4f2TgovrccqjguW2Yns+dKJkJmYYVzyTQgrog/XQ1P
	 G95rKAB+k9/3qZUqsEhRVtJyP0WFbrGIUm/i3PLiXE1n4Ju+2GL25lgzkXG1UuZrE5
	 WoAPXDmAS2Flw==
Message-ID: <ac3473c4-633f-41c4-b604-cc027eb7e016@kernel.org>
Date: Tue, 16 Jul 2024 08:16:59 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: pincfg-node: Add "input-schmitt" property
To: Inochi Amaoto <inochiama@outlook.com>, Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <IA1PR20MB4953BB6E71CA3216E652E8B8BBA02@IA1PR20MB4953.namprd20.prod.outlook.com>
 <e74d1c2f-576d-4d97-89d2-5bdabe00fb58@kernel.org>
 <IA1PR20MB495302FAFD2003B831342CF4BBA12@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240715-strainer-creamlike-b1ff49b25c1f@spud>
 <IA1PR20MB4953747880CD84FCB5453608BBA22@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <IA1PR20MB4953747880CD84FCB5453608BBA22@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/07/2024 04:16, Inochi Amaoto wrote:
> On Mon, Jul 15, 2024 at 05:19:41PM GMT, Conor Dooley wrote:
>> On Mon, Jul 15, 2024 at 05:55:28PM +0800, Inochi Amaoto wrote:
>>> On Mon, Jul 15, 2024 at 11:21:25AM GMT, Krzysztof Kozlowski wrote:
>>>> On 14/07/2024 13:28, Inochi Amaoto wrote:
>>>>> On Sophgo CV18XX platform, threshold strength of schmitt trigger can
>>>>> be configured. As this standard property is already supported by the
>>>>> common pinconf code. Add "input-schmitt" property in pincfg-node.yaml
>>>>> so that other platforms requiring such feature can make use of this
>>>>> property.
>>>>>
>>>>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml | 4 ++++
>>>>>  1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
>>>>> index d0af21a564b4..e838fcac7f2a 100644
>>>>> --- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
>>>>> +++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
>>>>> @@ -88,6 +88,10 @@ properties:
>>>>>      description: disable input on pin (no effect on output, such as
>>>>>        disabling an input buffer)
>>>>>
>>>>> +  input-schmitt:
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>> +    description: threshold strength for schmitt-trigger
>>>>
>>>> Strength in which units? This should have proper property name suffix.
>>>>
>>>
>>> I think it should be mV. Using voltage may leads to decimal.
>>
>> The standard suffix for voltage is "-microvolts", so no issues with
>> decimals :) And with a standard suffix, the $ref can be dropped.
> 
> Yeah, I have seen the "-microvolts", but I does not think add standard
> suffix is a good idea, as "input-schmitt" is a standard pinconf attribute.
> 
> The only thing confused me is that the description of PIN_CONFIG_INPUT_SCHMITT 
> in include/linux/pinctrl/pinconf-generic.h says it just uses an custom

You cannot add binding based on argument "I don't want to change kernel
code", so sorry, but it does not really matter whatever pinctrl has
undocumented.

> format as argument. So I think it may keep something generic?
> 

Best regards,
Krzysztof


