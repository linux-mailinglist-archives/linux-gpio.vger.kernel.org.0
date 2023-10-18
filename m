Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21DC87CD3B8
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Oct 2023 07:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjJRF6U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Oct 2023 01:58:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjJRF6T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Oct 2023 01:58:19 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52C74C6
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 22:58:17 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40839807e82so3508295e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 22:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697608696; x=1698213496; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iEOeNY6xsMGDSYNt4Dz81FCMN9scYvmee4j0hqZCEi8=;
        b=MrCy4WVuQ4Ek9ojNn0LQZeDnKJtf2+eWMclEWELB17VFn0V+MokWZpDteuNyG+c5vM
         NR1lDpC1n4r/ixPAvAEmyvgRzqfLNinneiNdWVe6LUmS4VL6geyqOPRLmGn2c0OHeKnG
         iZi14VTlcvaxblsrnHpns6xFdfaTcCzLbFNrUEgcjZ7AwYjtiXRpAyTXJnY0WAewqqw+
         3qH5NHc83q+7iqyyh4wpKjtmc+PXcehgytSft4UgS3LAEcbhmMd/028qzuesSOMgJlir
         kMRLJcMt0dbxLIFjlBOXaupC0mDg1srFDZH161xrcyEaD2Uur19EtVA9F2UIe/YRwjNn
         bfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697608696; x=1698213496;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEOeNY6xsMGDSYNt4Dz81FCMN9scYvmee4j0hqZCEi8=;
        b=Ayjte2RGfcUzsJlQlzWBsCVwaJKy8zmH87TNiYDIfJ229Ojzv0cx+1bDIqnaRRC1iA
         i2f5WVGoW2SmG/ZuJRVyFmgA4iWVKdp4vP6SO+HvX5rV3DWxpvdoxCQOEhLBqNpWuiYT
         gPvPKlqPbluvtGkwnj4/DtVD3uO81pGWI4zuxqt6fJUl2rFH1Pz1dCGExulxbAcBLI6h
         L8as9fdiJUMEmsQ4ubMYvXSeIwT4p7EFsYKQmgyxPegsIpGRQlKrbYvvF4hUX9/fSEMm
         l8ikzA5E0kd4CYKNYyeTTTILHnWRgvboJvtEQpzsbcrdIG7Vy6oNyKw234q+UhevYEa1
         seag==
X-Gm-Message-State: AOJu0Yz6pNa3mBLGEP/nbcB721pg2bk6xy8McnUvoRFPTT5aI45TL8Jx
        GVwc+GKBEEc1hSi/7DaD7MivDJEvqzwuVFVxcIM=
X-Google-Smtp-Source: AGHT+IEHcgYGuQ7s9Hm5flor+0tI77dccZCxmq5rzCLsNSr78v7hny7/fcIV/1MlMpeECSiRrNvLgw==
X-Received: by 2002:a1c:4c08:0:b0:405:29ba:9b5c with SMTP id z8-20020a1c4c08000000b0040529ba9b5cmr3515425wmf.16.1697608695641;
        Tue, 17 Oct 2023 22:58:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.154])
        by smtp.gmail.com with ESMTPSA id m13-20020a7bca4d000000b00402ff8d6086sm714523wml.18.2023.10.17.22.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 22:58:15 -0700 (PDT)
Message-ID: <6c8a3ed2-879c-4423-b6e7-80f8b127a1c1@linaro.org>
Date:   Wed, 18 Oct 2023 07:58:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: pinctrl: Document nuvoton ma35d1 pin
 control
To:     Jacky Huang <ychuang570808@gmail.com>, linus.walleij@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, p.zabel@pengutronix.de, j.neuschaefer@gmx.net
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        schung@nuvoton.com, Jacky Huang <ychuang3@nuvoton.com>
References: <20231011090510.114476-1-ychuang570808@gmail.com>
 <20231011090510.114476-3-ychuang570808@gmail.com>
 <7800b2d6-33c4-4c4f-8d0c-c11ff0e47535@linaro.org>
 <17a80031-98bf-48bf-8cea-c0ca4400f142@gmail.com>
 <254837e5-a0fa-4796-8928-277db4b98bf1@linaro.org>
 <8e983479-709f-4ec8-85e2-c46a5256a2ec@gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <8e983479-709f-4ec8-85e2-c46a5256a2ec@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 18/10/2023 05:26, Jacky Huang wrote:
> Dear Krzysztof,
> 
> Thank you for the review.
> 
> 
> On 2023/10/17 上午 03:52, Krzysztof Kozlowski wrote:
>> On 16/10/2023 06:32, Jacky Huang wrote:
>>>>> +  '#size-cells':
>>>>> +    const: 1
>>>>> +
>>>>> +  nuvoton,sys:
>>>>> +    description:
>>>>> +      phandle to the syscon node
>>>> sys is quite generic. Description explains nothing except duplicating
>>>> known information. Drop duplicated info and instead explain to what this
>>>> phandle points and how it is going to be used.
>> Read comments carefully.
> 
> 
> I will update the description of 'nuvoton,sys'.

What is the full name of destination block?

> 
>>
>>>>
>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>>>> +    items:
>>>>> +      maxItems: 1
>>>> So just phandle, not phandle-array, unless it is defined like this in
>>>> some other binding.
>>> I would like to update this as:
>>>
>>>     nuvoton,sys:
>> Nothing improved.
> 
> Here just fix  the 'phandle-array' to 'phandle' and remove 'maxItems'.
> 
>>>       $ref: /schemas/types.yaml#/definitions/phandle
>>>       description:
>>>         Help pinctrl driver to access system registers by means of regmap.
>> Driver is not relevant here. Say which part of syscon are necessary for
>> pinctrl operation.
>>
> 
> I will update description as:
> 
>    nuvoton,sys:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
>        The pin function control registers are located in the system
>        control register space. This phandle provides pinctrl the
>        ability to access the pin function control registers through
>        the use of regmap.

regmap is unrelated to the bindings.

> 
>>>>> +        maximum: 7
>>>>> +
>>>>> +      input-enable: true
>>>>> +
>>>>> +      input-schmitt-enable: true
>>>>> +
>>>>> +      power-source:
>>>>> +        description:
>>>>> +          I/O voltage in millivolt.
>>>>> +        enum: [ 1800, 3300 ]
>>>> Missing units in property name. power-source also does not really
>>>> describe the property.
>>>
>>> The output voltage level of GPIO can be configured as 1.8V or 3.3V,
>>> but I cannot find any suitable output properties in 'pincfg-node.yaml.'
>> There is actually power-source, but treated as actual choice of power
>> supplies.
>>
>>> I noticed that 'xlnx,zynq-pinctrl.yaml' and 'xlnx,zynq-pinctrl.yaml' use
>>> 'power source' to specify the output voltage.  Should I follow their
>>> approach or define a vendor-specific one?
>> Maybe Rob or Linus have here some recommendation, but I would suggest to
>> go either with rtd1319d-pinctrl.yaml approach or add a generic property
>> to pincfg-node expressed in real units like "io-microvolt".
> 
> OK, I will update it as:
> 
>        power-source:
>          description: |
>            Valid arguments are described as below:
>            0: power supply of 1.8V
>            1: power supply of 3.3V
>          enum: [0, 1]
> 
> 
>> Rob, Linus, any ideas for generic property replacing register-specific
>> power-source?

I proposed io-microvolt

Best regards,
Krzysztof

