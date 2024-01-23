Return-Path: <linux-gpio+bounces-2442-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A47C838B28
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jan 2024 10:57:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F2AF1C229A2
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jan 2024 09:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13CA15A0F0;
	Tue, 23 Jan 2024 09:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gIIviI62"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8935A0EC
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jan 2024 09:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706003840; cv=none; b=dhB5zfsTcTMCYLKi3p4OWg+/M4cw1vcsdTIdGspEJmuURRe7NAPP/8K9sut73jwa6uvAqqaN6+gRwcCRKeS6rY2UDrWoK8VEewx/UoN+EMwjqJ2CfuU4GCgixbV0nEjkIvy2aSvubyCeZE6JfNbMRtNLOAnCSAhcL5YuxOjEhZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706003840; c=relaxed/simple;
	bh=5e3AHPmxRzCBZ2/YKeHc9fgIZIpVeb9OeyngWpKu49A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D6NofOQQ00NXQGVM5lgKKZeEMwGMS3qNurXqsbraYBUgB6R2jEDQkRCt0i2AJWbynmffRRmgcicuDeXEDWPp4nAKvHNWJOEFJ12y8I2+gReX1PlLaxSzmdK7zNafvPmegoh+gYVg2xwtYvyPvbFE1Ik5lvahyKkrsE48i72+FXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gIIviI62; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40d6b4e2945so49061195e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jan 2024 01:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706003837; x=1706608637; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vaHd8LrOOmEomX/l7KKDLe+YmjgMBhv83n5CF+7e4Fc=;
        b=gIIviI62LVoVj4UirmqpaeVQTwxZ5VGGaC04goCO72dTUvsv45Rte/gfbCkhH3SzuU
         yxxGIB1QnnWk6rGG6LTKdlGzQ9EkUmezzAlZGNuGwNNXnwmNbuEFCpoWRwP+1L89snyC
         lR5r0TaaQUE+DMy0EdzunuDZlwiDzPkw3/m90MKXIN1llvi1EyVNyr7B7uAUCASneiAh
         7iMAIuQYQQVhxUKe5io81qbd4oD0FIsBKUe+Q5iKD7kE62QO4N9RzJnp6FQuio4YoMoR
         /TVtEmGDoT8rfu+U8CE7WwqwrQuUQ4TXA6GYz2y8ikdsJa74DnWXsYwHSSMwTwX74QhE
         vAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706003837; x=1706608637;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vaHd8LrOOmEomX/l7KKDLe+YmjgMBhv83n5CF+7e4Fc=;
        b=YodPdorXp4HdNl5PBHt3sVujeh5ZzI4NjWarZTUpYKesCDM0MOt4WvT55vB5jbLOaj
         FCBoZ/MX2TIldXaqzuKzrlQyhf+VWv278J+hphcUdH3v1bZPuA7M6JEnF7ky6C5ya0e2
         x3VQvoI8builhP3e2H58DFYHJtSieJyliNz/vptL2OT++qiHiy7aip1n0v8iyiYTaP52
         Vc7yaC5Li9LBwV5i6asqMjbgEmhNFx+81a36Ei5QVoh6btnrRsJhWXLV1v868z1nrIqC
         II+JpVhA5NcwBIOZtWxQcFI8CbIn7pugk1BMrqpC5Ev5tBhaTY65a2XxfuUJbNRRKysC
         RYjA==
X-Gm-Message-State: AOJu0YxMZJyDcidad0u3lnn8WXDjB/GiEwud9r2fql32rtFBLOJBYLCh
	MpIkd5Lb0kl19AwfayGnKF0R4HMlQk2jFyZ4PXeEGa6Riuc/4zednLUyJ/bD6vGKCCkipkW3T8t
	8
X-Google-Smtp-Source: AGHT+IGZqmA3kwErgQlGHXolN3kzWIriiqo4nPzEEJThLvhcgKofE603AN4S9C8nWVyAnWs1OjG/Vw==
X-Received: by 2002:a05:600c:450a:b0:40d:5502:5834 with SMTP id t10-20020a05600c450a00b0040d55025834mr226178wmo.14.1706003837440;
        Tue, 23 Jan 2024 01:57:17 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id bg23-20020a05600c3c9700b0040d91fa270fsm42202520wmb.36.2024.01.23.01.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 01:57:17 -0800 (PST)
Message-ID: <da7bdb66-3463-4880-87b9-414c0bd31688@linaro.org>
Date: Tue, 23 Jan 2024 10:57:15 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: gpio: add adg1414
Content-Language: en-US
To: "Paller, Kim Seer" <KimSeer.Paller@analog.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240121103505.26475-1-kimseer.paller@analog.com>
 <20240121103505.26475-2-kimseer.paller@analog.com>
 <2e34faa9-a0ca-49f6-a268-1c01c31b041c@linaro.org>
 <PH0PR03MB7141D8CD02D93AB420FA535DF9742@PH0PR03MB7141.namprd03.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <PH0PR03MB7141D8CD02D93AB420FA535DF9742@PH0PR03MB7141.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/01/2024 10:55, Paller, Kim Seer wrote:
> Hi Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Monday, January 22, 2024 8:40 PM
>> To: Paller, Kim Seer <KimSeer.Paller@analog.com>; linux-gpio@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
>> Cc: Linus Walleij <linus.walleij@linaro.org>; Bartosz Golaszewski
>> <brgl@bgdev.pl>; Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>
>> Subject: Re: [PATCH 1/2] dt-bindings: gpio: add adg1414
>>
>> [External]
>>
>> On 21/01/2024 11:35, Kim Seer Paller wrote:
>>> The ADG1414 is a 9.5 Ω RON ±15 V/+12 V/±5 V iCMOS Serially-Controlled
>>> Octal SPST Switches
>>>
>>> Signed-off-by: Kim Seer Paller <kimseer.paller@analog.com>
>>> ---
>>>  .../bindings/gpio/gpio-adg1414.yaml           | 66 +++++++++++++++++++
>>>  MAINTAINERS                                   |  6 ++
>>>  2 files changed, 72 insertions(+)
>>>  create mode 100644
>>> Documentation/devicetree/bindings/gpio/gpio-adg1414.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-adg1414.yaml
>>> b/Documentation/devicetree/bindings/gpio/gpio-adg1414.yaml
>>> new file mode 100644
>>> index 000000000..24a51e79f
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/gpio/gpio-adg1414.yaml
>>
>> Filename like compatible.
> 
> I would like to clarify, is it changing the filename from gpio-adg1414.yaml
> to adg1414.yaml? 

No, because you miss vendor prefix. I doubt that it is your compatible...

> 
>>> @@ -0,0 +1,66 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>>> +---
>>> +$id:
>>> +https://urldefense.com/v3/__http://devicetree.org/schemas/gpio/gpio-a
>>> +dg1414.yaml*__;Iw!!A3Ni8CS0y2Y!_Q0zRB8J-
>> inWIIybgOjtThU0toJeUzqaT9Tveg
>>> +XTjvPWiCTh4IAJ5DkNepFdfhXXfxXLnB2wSR9_LgPnvVnFqw2bDuvBI8g$
>>> +$schema:
>>> +https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.y
>>> +aml*__;Iw!!A3Ni8CS0y2Y!_Q0zRB8J-
>> inWIIybgOjtThU0toJeUzqaT9TvegXTjvPWiC
>>> +Th4IAJ5DkNepFdfhXXfxXLnB2wSR9_LgPnvVnFqw2bEIZ1PG4$
>>> +
>>> +title: ADG1414 SPST Switch Driver
>>
>> "Driver" as Linux driver or some hardware driver?
> 
> Linux device driver. It seems I overlooked this one, it should be ADG1414 Octal SPST Switches

Then please drop it and double check if your description also has it.
The title and description should describe hardware.

Best regards,
Krzysztof


