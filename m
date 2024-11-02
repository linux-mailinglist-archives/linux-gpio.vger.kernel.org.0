Return-Path: <linux-gpio+bounces-12480-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 403809B9DCE
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Nov 2024 08:56:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3C64282BAE
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Nov 2024 07:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F041A156228;
	Sat,  2 Nov 2024 07:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vBV3brip"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A48012FF69;
	Sat,  2 Nov 2024 07:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730534165; cv=none; b=LttiU5OtMwFWyntfzABdbZMNA+5Oxic5QKWVEpNRiBwhN24Vg0Wgnb0cZTxVgvWWvZG2VaQDEwkPMlx59040e7PazHjHVvQdRkSwU6jPY2s337GqrPOO/bSWWHbZqwflm22pzYDXwtKpdQB1eN5BHBsPxYSBoG5zN3afIDqan2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730534165; c=relaxed/simple;
	bh=fldAxtdVmighiw1Xz9hhdENpTpUPfnW8Z5fYdIp9fVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lWLI+547pbfL4DZY7vZAQ+YEcV/kaBhVQyktAt2l7U0oOewSKidlXijvMOC0sO3BnxOxsueMxyIcwYVXPyMKiEXs4gyK2jp0DtulnQA82mUxXUz8uD0x8yPIQczHarJxswjAotcxt3CIQdRNiTNxlnBD0mVzx6fwVJ9iPDjwfUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vBV3brip; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD73AC4CEC3;
	Sat,  2 Nov 2024 07:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730534165;
	bh=fldAxtdVmighiw1Xz9hhdENpTpUPfnW8Z5fYdIp9fVY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vBV3briprrVWI0BuSKrAdEfZcPUK6IZAgl83hrEEBA51E4BaKNHM/2ilMBHDFSw1q
	 gNjomm1l7FDfUo4r8BjJqzvaVcqkzjp0qZexhqfNswa3qJr7g+OKsMMctRQT3bMoDz
	 iPMtOHfTUxUHXzrKqBt6zmoLGrydRztVol39Ra9qS5QEuQe2nxdkfZ+f04RKqjdEZX
	 hifx0PjE6HScMHgRO7zOW3E2KM50BZhNlqlyK4FFRdMmah+KuPq8IpFdz12nRI/5iu
	 PlH9IuaVs8QrWL5s7yVRjFXn2ukZvln1XqFlFx07PiQ8AaC13dKFAPxKIoujKjnEgG
	 iEwzCcfZzIARg==
Message-ID: <559908e3-ca6b-4bbd-846d-940cf338e2b7@kernel.org>
Date: Sat, 2 Nov 2024 08:56:00 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: sx150xq: allow gpio line
 naming
To: hs@denx.de, linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20241031151238.67753-1-hs@denx.de>
 <20241031151238.67753-3-hs@denx.de>
 <639d6ab8-688a-437c-adb9-9dea1fbd0c51@kernel.org>
 <644ae184-1fef-fa42-06de-e1086b7b14bb@denx.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <644ae184-1fef-fa42-06de-e1086b7b14bb@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/11/2024 06:24, Heiko Schocher wrote:
>>>     reg:
>>>       maxItems: 1
>>>   
>>> +  gpio-line-names:
>>> +    minItems: 1
>>
>> I think gpio-line-names should always match the actual number of GPIOs
>> for given device. Do you have here devices with 1 gpio? This could be
>> further constrained in if:then sections.
> 
> I have the device with "sx150x_16_pins", see drivers/pinctrl/pinctrl-sx150x.c
> 
> I started with minItems, because I thought it is okay to allow
> less names... (as I did in patch 3/3) but see now, that other drivers have
> minItems = maxItems.
> 
> So I think I should add to my patch the following part:

Yes, but in top-level you keep widest constraints, so min 5 max 17.

> 
> hs@threadripper:linux  [aristainetos3-dts-v3] $ git diff
> diff --git a/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml 
> b/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
> index fd0936545bb8..0872ee1c6fa6 100644
> --- a/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
> @@ -91,6 +91,45 @@ required:
> 
>   allOf:
>     - $ref: pinctrl.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - semtech,sx1501q
> +              - semtech,sx1504q
> +              - semtech,sx1507q
> +    then:
> +       properties:
> +          gpio-line-names:
> +              minItems: 5
> +              maxItems: 5
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - semtech,sx1502q
> +              - semtech,sx1505q
> +              - semtech,sx1508q
> +    then:
> +       properties:
> +          gpio-line-names:
> +              minItems: 9
> +              maxItems: 9
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - semtech,sx1503q
> +              - semtech,sx1506q
> +              - semtech,sx1509q
> +    then:
> +       properties:
> +          gpio-line-names:
> +              minItems: 17
> +              maxItems: 17
>     - if:
>         not:
>           properties:


Best regards,
Krzysztof


