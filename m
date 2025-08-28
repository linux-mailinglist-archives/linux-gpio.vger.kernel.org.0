Return-Path: <linux-gpio+bounces-25041-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8372FB3943F
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 08:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FBE217B0A1
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 06:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A853927B344;
	Thu, 28 Aug 2025 06:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cw+BzZQN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E58013957E;
	Thu, 28 Aug 2025 06:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756363929; cv=none; b=EFPoIhLXJ87XbKn3VVk4Qpp9yycUmMRLqFEAoQq31+Zr3/oJ/oH05AnRCf4AigSy8X7zfkWFZ1xxZPbi0TS/WFaPXpELbBUWnb8mfwGARZ0LbqP0bePs2APz3hg892swikxcswHeU2/I53sMf3mEEXcwOYeq1dUP0FcHlLFxLPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756363929; c=relaxed/simple;
	bh=g+2IAKRHWkhW5+oBu7TPz7qnCDH/IgzhPmrzzuSW8Go=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oGOZwjdiaCvr8qlJdaI6qxo20Njywm0Bzn2XZcRnvvUrFO8I7+vUiXmebpIkPbGuub3GIJ/WVb4XEH7ZVtbyb/ueZUJomYw0O7JezMX4GJSxwQj6OFivISKjcp517rvx4kXAIqfno5p7gpqiNvWO7AJ0K4XtHxQNzoSobKWEBH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cw+BzZQN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA2BC4CEED;
	Thu, 28 Aug 2025 06:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756363929;
	bh=g+2IAKRHWkhW5+oBu7TPz7qnCDH/IgzhPmrzzuSW8Go=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cw+BzZQNOFcvNdCBZwNsEx+hoJJXrEvLWuzAd7t45LvE6EzlpbOXlaNhgzCU9ATQP
	 o2RdKXmmHkSCz3zaaszgB9NJV2XkwTDPlcUUXP5g2OEK81BKb62O7kFdW1TyMpdvtP
	 wZpIdA5xQeqMT3GVYtDsQTgWrWzFLbnU8eEU8aDqIACNX49Hs4hnpvrCB8Rg5JsKwH
	 J2q7LDhdg0osETouSyAPtch8+2ocSbvp5CB50MTYxgaqjSHsjAMEbnMchzBxx5dwmL
	 eI7YbLk0p+UrnFUcERbailD7aH3kj3NS9DONFD9hz/4/wwWcgWxqL0cgJa/lCarKTw
	 3DD37X7LW/ezw==
Message-ID: <25283b66-4cbb-4db9-9b1e-7a4e6e3db2a1@kernel.org>
Date: Thu, 28 Aug 2025 08:52:05 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW1BBVENIIDIvM10gZHQtYmluZGluZ3M6IHBpbmN0?=
 =?UTF-8?Q?rl=3A_Add_cix=2Csky1-pinctrl?=
To: Gary Yang <gary.yang@cixtech.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
References: <20250827024222.588082-1-gary.yang@cixtech.com>
 <20250827024222.588082-3-gary.yang@cixtech.com>
 <0fa7e2cb-fa0b-4f9e-84d6-a4b2b3d8a4cf@kernel.org>
 <PUZPR06MB5887D9A879D16DC6A8C8ED58EF3BA@PUZPR06MB5887.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <PUZPR06MB5887D9A879D16DC6A8C8ED58EF3BA@PUZPR06MB5887.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/08/2025 07:37, Gary Yang wrote:
> Hi Krzysztof,
> 
> Thanks for your comments
> 
>>
>> On 27/08/2025 04:42, Gary Yang wrote:
>>> Add dt-bindings docs
>>
>> For what? Describe the hardware here in one, two sentences.
>>
> 
> OK, we will add some description for it next version
> 
>>>
>>> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
>>> ---
>>>  .../bindings/pinctrl/cix,sky1-pinctrl.yaml    |  77 +++
>>>  include/dt-bindings/pinctrl/pads-sky1.h       | 592
>> ++++++++++++++++++
>>>  2 files changed, 669 insertions(+)
>>>  create mode 100644
>>> Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
>>>  create mode 100644 include/dt-bindings/pinctrl/pads-sky1.h
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
>>> b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
>>> new file mode 100644
>>> index 000000000000..10a4a292188e
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
>>> @@ -0,0 +1,77 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/pinctrl/cix,sky1-pinctrl.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Cix Sky1 Pin Controller
>>> +
>>> +maintainers:
>>> +  - Gary Yang <gary.yang@cixtech.com>
>>> +
>>> +description:
>>> +  Please refer to pinctrl-bindings.txt in this directory for common
>>> +  binding part and usage.
>>
>> Drop description, not desired really.
>>
> 
> Ok, this yaml file comes from other yaml file. If not needed, we remove it next version
> 
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - cix,sky1-iomuxc
>>> +      - cix,sky1-iomuxc-s5
>>
>> Whats the difference between? You have entire description field to explain this
>> but instead you said something obvious there.
>>
> Cix sky1 has three power states. S0 means work state. S3 means STR state. S5 means SD state.
> 
> The pin-controller on sky1 has two power states. They are S0 and S5.


State != device. Please create bindings for devices, not states.

> 
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +# Client device subnode's properties
>>> +patternProperties:
>>> +  '-pins$':
>>> +    type: object
>>> +    description:
>>> +      Pinctrl node's client devices use subnodes for desired pin
>> configuration.
>>> +      Client device subnodes use below standard properties.
>>> +
>>> +    properties:
>>> +      cix,pins:
>>
>> No, use generic properties from pinmux schema.
>>
>> You should also reference it.
> 
> Did you suggest us to refer to Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml?
> 
> Make us support drive-strength, bias-pull-down properties?

and pinmux. There is a standard pins property.


...

>>> diff --git a/include/dt-bindings/pinctrl/pads-sky1.h
>>> b/include/dt-bindings/pinctrl/pads-sky1.h
>>> new file mode 100644
>>> index 000000000000..44550e4105b3
>>> --- /dev/null
>>> +++ b/include/dt-bindings/pinctrl/pads-sky1.h
>>
>> Bindings follow compatible naming. See writing bindings.
>>
> 
> Did you suggest rename it to pinctrl-sky1.h ?

No. I suggest to be named EXACTLY like compatible.

> 
>>> @@ -0,0 +1,592 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>> +/*
>>> + * Copyright 2024-2025 Cix Technology Group Co., Ltd.
>>> + */
>>> +
>>> +#ifndef __SKY1_PADS_H
>>> +#define __SKY1_PADS_H
>>> +
>>> +#define CIX_PAD_GPIO001_OFFSET                       0x0
>>> +#define CIX_PAD_GPIO002_OFFSET                       0x4
>>
>> Not bindings. Drop all this.
>>
> 
> Do you mean those macros not used need to delete?

Really, what is unlcear in "drop all this"? Drop means to remove.

You ask for confirmation for some really obvious comments.

BTW, if you disagree provide arguments (in terms of bindings) why these
are bindings.

