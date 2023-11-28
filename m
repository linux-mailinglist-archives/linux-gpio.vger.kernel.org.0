Return-Path: <linux-gpio+bounces-552-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EF97FB418
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 09:30:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC579B20A9B
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 08:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2942018C08;
	Tue, 28 Nov 2023 08:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="We5yqPd3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83753138;
	Tue, 28 Nov 2023 00:29:58 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1cfc985c92dso17725915ad.0;
        Tue, 28 Nov 2023 00:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701160198; x=1701764998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xf8O276TNiiPIupvpJ3W6Xn2X0DpWTNTXkKeNay5dJ0=;
        b=We5yqPd32TInpZvSxWE2V6lAv8cDDWZrWJgOfTwdSW7TP+4Xkc8qteTr6tSdgXKK/Z
         Qa0uYs68Zy4dU29ZtqO/KrA+MhzJ/sX7BfEfSxFgaDGMp4XJn1pVr8DF+HigHG6XHKy6
         hyYN2iAQKTy8a3r2CTd9CIfZv4zh0cknbBmQ27YszQaTS+bJdI5Zozxkx6RfoFMBtUR7
         UvyYmHppA86lWM8GsZ74FE+sy+7Fyqd1VM5wSonPF+GsNOG3Q1xlBkzsLUvcka9auInr
         ATjNQWzvYnz4UsE14aVKS+LDtDfFWBtC781f3ocfHLeCDVCReOcs9bIq8X90M9vrD4BA
         99gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701160198; x=1701764998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xf8O276TNiiPIupvpJ3W6Xn2X0DpWTNTXkKeNay5dJ0=;
        b=sTXrerD2Xpfg0zr7b/kTZXKmBOCHaOA1fRDGMAiJDc19DCYg3r0giw3DhleHBVpQdW
         kNkxYIaRmWSXBxqXDXUmfUc23A/m8X8gwTZ7nG4rpffH1GGmf//JxLtv2iL5YKvthFey
         kj4WUqy/1Uqi3THDaORCNC9RdX5Htz099BZdFN2tjuBcJqI+huXw9oIfQ0X/8fUewr2u
         O7zNOslxm7Cz2gXSrcwjRUvOwe0nkVE+NAJ1EB0HE9F9BXeS5cMbliDZQhYxdyWnk73v
         NVXl/lylTPSdqkRk2eLFTnm/Iyv77HvY9ksqr2u2IfGn9mGNTcZNh16ROIdKjGCVOsrN
         xv4g==
X-Gm-Message-State: AOJu0YwMIJUoV43MY6vs1sGgqp+/imNq+4DF4ZHmo9cEKJ7Ctd/oxhND
	5EouD10M9YEmFrygqr+tUzM=
X-Google-Smtp-Source: AGHT+IHV022NLbFXryQ5rzRpzumoZnFITR8IrDlzt9ozRSIjO//0M2nzZSq+xZhLpaCxEMgjvvJYBg==
X-Received: by 2002:a17:903:244e:b0:1cf:dd41:dd4 with SMTP id l14-20020a170903244e00b001cfdd410dd4mr4840095pls.27.1701160197805;
        Tue, 28 Nov 2023 00:29:57 -0800 (PST)
Received: from [172.19.1.47] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id e12-20020a17090301cc00b001c737950e4dsm8605727plh.2.2023.11.28.00.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 00:29:57 -0800 (PST)
Message-ID: <ffbaad9b-9a30-4cdd-bb78-8fb7d6ff4e9f@gmail.com>
Date: Tue, 28 Nov 2023 16:29:53 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: pinctrl: Document nuvoton ma35d1 pin
 control
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linus.walleij@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, j.neuschaefer@gmx.net
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ychuang3@nuvoton.com, schung@nuvoton.com
References: <20231128061118.575847-1-ychuang570808@gmail.com>
 <20231128061118.575847-3-ychuang570808@gmail.com>
 <7c24aaf8-8f93-4b93-b7e5-abc88e95682d@linaro.org>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <7c24aaf8-8f93-4b93-b7e5-abc88e95682d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Krzysztof,

Thanks for your review.


On 2023/11/28 下午 03:34, Krzysztof Kozlowski wrote:
> On 28/11/2023 07:11, Jacky Huang wrote:
>> From: Jacky Huang <ychuang3@nuvoton.com>
>>
>> Add documentation to describe nuvoton ma35d1 pin control and GPIO.
>>
>> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
>> ---
> Your changelog said:
>
>>    - Remove ma35d1-pinfunc.h which is unused after update definition of
> 'nuvoton,pins'.
>
> You forgot to add:
>
> " - Do not test the bindings before sending"
>
> I assume none of the driver changes compile either.

It's my mistake. I forgot to remove 'ma35d1-pinfunc.h' from my local 
copy, and as a consequence, the 'dt_binding_check' did not catch this 
error. I will fix this.
>>   .../pinctrl/nuvoton,ma35d1-pinctrl.yaml       | 189 ++++++++++++++++++
>>   1 file changed, 189 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,ma35d1-pinctrl.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,ma35d1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,ma35d1-pinctrl.yaml
>> new file mode 100644
>> index 000000000000..84287293a726
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,ma35d1-pinctrl.yaml
>> @@ -0,0 +1,189 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-pinctrl.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 pin control and GPIO
>> +
>> +maintainers:
>> +  - Shan-Chun Hung <schung@nuvoton.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - nuvoton,ma35d1-pinctrl
>> +
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 1
>> +
>> +  nuvoton,sys:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      phandle of the system-management node.
>> +
>> +  ranges: true
>> +
>> +allOf:
>> +  - $ref: pinctrl.yaml#
> allOf goes before additionalProperties.
>
>> +
>> +required:
>> +  - compatible
>> +  - nuvoton,sys
> This goes after patternProperties

I will fix the above two as:

allOf:
   - $ref: pinctrl.yaml#

required:
   - compatible
   - nuvoton,sys

additionalProperties: false

examples:



>> +
>> +patternProperties:
>> +  "^gpio@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: false
>> +    properties:
>> +      gpio-controller: true
>> +
>> +      '#gpio-cells':
>> +        const: 2
>> +
>> +      reg:
>> +        maxItems: 1
>> +
>> +      clocks:
>> +        maxItems: 1
>> +
>> +      interrupt-controller: true
>> +
>> +      '#interrupt-cells':
>> +        const: 2
>> +
>> +      interrupts:
>> +        description:
>> +          The interrupt outputs to sysirq.
>> +        maxItems: 1
>> +
>> +    required:
>> +      - gpio-controller
>> +      - '#gpio-cells'
>> +      - reg
>> +      - clocks
>> +      - interrupt-controller
>> +      - '#interrupt-cells'
>> +      - interrupts
>> +
>> +  "^pin-[a-z0-9]+$":
>> +    type: object
>> +    description:
>> +      A pinctrl node should contain at least one subnodes representing the
>> +      pinctrl groups available on the machine. Each subnode will list the
>> +      pins it needs, and how they should be configured, with regard to muxer
>> +      configuration, pullups, drive strength, input enable/disable and input
>> +      schmitt.
>> +
>> +    allOf:
> Drop allOf, just $ref

OK, I will fix it.

>> +      - $ref: pincfg-node.yaml#
>> +
>> +    properties:
>> +      bias-disable: true
> Drop this and other "true", why do you need them here?

We are following the conventions used in other pinctrl documents, such as
'realtek,rtd1315e-pinctrl.yaml' and 'xlnx,zynqmp-pinctrl.yaml'.

After comparing various pinctrl documents, I noticed that they all express
it as 'bias-disable: true'. Therefore, may I keep the current format?

>> +
>> +      bias-pull-down: true
>> +
>> +      bias-pull-up: true
>> +
>> +      power-source:
>> +        description: |
>> +          Valid arguments are described as below:
>> +          0: power supply of 1.8V
>> +          1: power supply of 3.3V
>> +        enum: [0, 1]
>> +
>> +      drive-strength-microamp:
>> +        oneOf:
>> +          - enum: [ 2900, 4400, 5800, 7300, 8600, 10100, 11500, 13000 ]
>> +            description: 1.8V I/O driving strength
>> +          - enum: [ 17100, 25600, 34100, 42800, 48000, 56000, 77000, 82000 ]
>> +            description: 3.3V I/O driving strength
>> +
>> +      input-enable: true
>> +
>> +      input-schmitt-enable: true
>> +
>> +    unevaluatedProperties: false
>
>
> Best regards,
> Krzysztof
>


Best Regards,
Jacky Huang


