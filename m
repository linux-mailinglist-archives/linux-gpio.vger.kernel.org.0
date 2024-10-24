Return-Path: <linux-gpio+bounces-11953-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6C99AE677
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 15:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5C1A28AC0D
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 13:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F241F4FBB;
	Thu, 24 Oct 2024 13:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PKCWqs/a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D332E1E00BE;
	Thu, 24 Oct 2024 13:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729776349; cv=none; b=EpbPc5xv0EOEFLLtSpyNGY/uGtk1SuR2LMa6basnv2GhJrV/ScsDFNiie/grwy0PbpLeFZXg168SZo+aW/WDPyeOUnkS5ds9NWcEmY8dnpkLFDI1objq6IEEwaAIJL7oiI2PLZYD5fwZZpPoJ9zeRih2pRo4XyJFI4Ei1WeOmKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729776349; c=relaxed/simple;
	bh=/bCUgKsOIY9L86GlFHL9HXtDC1qqaWN9FN+5Tsyd+x4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hz+/YOc0L/9PP5uBUkWvHhLw19OrRwK9jOMOUbxNLVrOvJaXHE2+il9iuwN2PQuqtdJEtv0uCER6f8c1WragP8rpvByCOVgwWf3YJEINazQcPgFZ+3+xF0L0mROiuORidJg2yTQ0pCxYAWbkmGf6yru/TzgXJHoXqIcgUcnwSHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PKCWqs/a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5AF6C4CEC7;
	Thu, 24 Oct 2024 13:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729776349;
	bh=/bCUgKsOIY9L86GlFHL9HXtDC1qqaWN9FN+5Tsyd+x4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PKCWqs/a86q4KST0J+KvzF0T62MLxDhhkDHhA8wtIml5AyBV7Aglnii9Cb2Uw9Z4M
	 nL8tfDh7APEr5uUvY2vunEBYxwnI7d9mUiQ5RffzJIMDHUAT4/WyFK0oh9VXyVvGAb
	 d5P9VFwJJKpsjpdhfx7OVlK9jXETA6TFj++Hxh8vnQN3lgrArM38vhwQqARtSv+RtK
	 ch7pTQENHJAl/Fum+JrPlmbnZvBzCpNyZ48BzoOvFLSe0hNsb1yj0YpoPHJ0FDmKCu
	 ruNY26ePL2BSZ/dxNlxi97//r2avf7xd69nHlPjzSWru2O7aKKprnFS6fHsMnCsTXo
	 aCwd9Kboj7QPw==
Message-ID: <6d8015dd-f656-4c33-b906-09104cc366b5@kernel.org>
Date: Thu, 24 Oct 2024 15:25:40 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] dt-bindings: pinctrl: stm32: support for stm32mp215
 and additional packages
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Stephane Danieau <stephane.danieau@foss.st.com>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Valentin Caron <valentin.caron@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
 <20241022155658.1647350-12-antonio.borneo@foss.st.com>
 <2g65375shtjq4udjfarfspqtpg5q27oeerqskt2uzwj44pvnbb@rderpevnrzxs>
 <334845caee45ed72ef08867f23f69b5333be57c5.camel@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <334845caee45ed72ef08867f23f69b5333be57c5.camel@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/10/2024 12:08, Antonio Borneo wrote:
> On Wed, 2024-10-23 at 10:51 +0200, Krzysztof Kozlowski wrote:
>> On Tue, Oct 22, 2024 at 05:56:55PM +0200, Antonio Borneo wrote:
>>> From: Amelie Delaunay <amelie.delaunay@foss.st.com>
>>>
>>> Add support for st,stm32mp215-pinctrl and st,stm32mp215-z-pinctrl.
>>
>> So all previous patches are for this? Then they are supposed to be here.
> 
> Hi Krzysztof,
> 
> I'm not sure I fully get your point here.
> The previous patches in this series add the new features to the already upstreamed STM32MP257.
> The same features are also needed here by STM32MP215 and in next patches 12/14 and 13/14 by STM32MP235.

commit msgs could be improved here, sorry, I have no clue for what
devices are you bringing this for. Putting here new SoC clearly suggests
that it is for new Soc, so entire split is incorrect.

> 
>>
>>> Add packages AM, AN and AO (values : 0x1000, 0x2000 and 0x8000)
>>>
>>> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
>>> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
>>> ---
>>>  .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml         | 4 +++-
>>>  include/dt-bindings/pinctrl/stm32-pinfunc.h                   | 3 +++
>>>  2 files changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
>>> index 9a7ecfea6eb5b..0a2d644dbece3 100644
>>> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
>>> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
>>> @@ -27,6 +27,8 @@ properties:
>>>        - st,stm32mp135-pinctrl
>>>        - st,stm32mp157-pinctrl
>>>        - st,stm32mp157-z-pinctrl
>>> +      - st,stm32mp215-pinctrl
>>> +      - st,stm32mp215-z-pinctrl
>>>        - st,stm32mp257-pinctrl
>>>        - st,stm32mp257-z-pinctrl
>>>  
>>> @@ -59,7 +61,7 @@ properties:
>>>        Indicates the SOC package used.
>>>        More details in include/dt-bindings/pinctrl/stm32-pinfunc.h
>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>> -    enum: [0x1, 0x2, 0x4, 0x8, 0x100, 0x400, 0x800]
>>> +    enum: [0x1, 0x2, 0x4, 0x8, 0x100, 0x400, 0x800, 0x1000, 0x2000, 0x4000]
>>>  
>>>  patternProperties:
>>>    '^gpio@[0-9a-f]*$':
>>> diff --git a/include/dt-bindings/pinctrl/stm32-pinfunc.h b/include/dt-bindings/pinctrl/stm32-pinfunc.h
>>> index af3fd388329a0..01bc8be78ef72 100644
>>> --- a/include/dt-bindings/pinctrl/stm32-pinfunc.h
>>> +++ b/include/dt-bindings/pinctrl/stm32-pinfunc.h
>>> @@ -41,6 +41,9 @@
>>>  #define STM32MP_PKG_AI 0x100
>>>  #define STM32MP_PKG_AK 0x400
>>>  #define STM32MP_PKG_AL 0x800
>>> +#define STM32MP_PKG_AM 0x1000
>>> +#define STM32MP_PKG_AN 0x2000
>>> +#define STM32MP_PKG_AO 0x4000
>>
>> Why these are some random hex values but not for example 0x801, 0x802
>> and 0x803? That's an enum, so bitmask does not make sense here.
> 
> The are bitmask. You can check in patch 14/14 that adds a new package to the existing code of STM32MP257.
> Do you prefer I rewrite them all as, e.g.
> #define STM32MP_PKG_AO (1 << 14)
> ?

OK, so where is this bitmask used in DTS? These are bindings, not some
random defines for driver.

Best regards,
Krzysztof


