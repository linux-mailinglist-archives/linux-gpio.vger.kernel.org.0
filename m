Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1939C75F1DC
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jul 2023 12:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232739AbjGXKCa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jul 2023 06:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232481AbjGXKBr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jul 2023 06:01:47 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB17D6E8D
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jul 2023 02:55:04 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-977e0fbd742so671157166b.2
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jul 2023 02:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690192455; x=1690797255;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=94dQO8LxQMdHUG+2c49m7yEu0QyNmeaEeNnaDcdEi50=;
        b=C6upeyf13JVH1fJWFmxl5BfIVVJfySCtaefw1vI3x426/paosiVxJES5cj2CGWW2KS
         Cr/m8HDwA0yaKDzQUno8Nq8tigb2vq0EXkwst84ddXYuKmFLmzEaRwboQ6TczmL3wAVv
         UZ2GE+0c4ocQG69t1izN3t24OytyRFu5kErU9QUsF8Tdc94ZLAwmly6y6rFwbSczEVMy
         AP4yR1Xe+rvzdZ91EjcwvRQFccLWdWPr2BBk6KNL0+cl4RY1xAUR1S9oB18B8ibq4vKy
         wZgiFS7XsagNbsm/SvbcS9oHEySLYJJJXxjVOP9bxf4y5oWwItOWI2wLPuYFtIPtowp+
         MxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192455; x=1690797255;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=94dQO8LxQMdHUG+2c49m7yEu0QyNmeaEeNnaDcdEi50=;
        b=hu4xxkRCgmwFbNEF6BlfQdw60iCX3VQ8oWPO+CnmKerisyzWIUUmovXr/Ly0hZXujP
         Ukagaz/mQifLFDFxAaL9St8MD2S16tKSMuOmBDMsqOA6NyibToLvHX8Favce+kJJMDmy
         VSj+uwrRkLkpmDqK+nDyX3/7erUayj/pMicTn9yWhR2iUYWaK+106yADDnln6Fm74kIG
         HatCQ/5KVqs9w8hBrt4afOk5rEOUUFKRuFXTBh10dUqND8jydaju5yoj+FKVXkAG6KKa
         CVpf9ku4Xp/KlzYdTqfc7arprCwHIQxzB85zw4iZFZgbvcLPC/O+VWHaDWkiOEfeGi5M
         /TmQ==
X-Gm-Message-State: ABy/qLbqVd34YuwkpVVVsYjZ9YfkSHzfJ70CfM1W5bCYXCCYsqM8p712
        TJeA6aNuec5GA0lU5VUnNbnKNg==
X-Google-Smtp-Source: APBJJlFaYyJc7x+0ExqkM6W4yVmevNoyHsVyru+pCZlw6jseQKGHeO49Y942+w5FqL1ss44s207a2g==
X-Received: by 2002:a17:906:778f:b0:982:45ca:ac06 with SMTP id s15-20020a170906778f00b0098245caac06mr8953749ejm.60.1690192455496;
        Mon, 24 Jul 2023 02:54:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id e13-20020a170906248d00b0099307a5c564sm6473655ejb.55.2023.07.24.02.54.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 02:54:15 -0700 (PDT)
Message-ID: <29b62cc6-bc54-9a43-211b-b2d7579218b7@linaro.org>
Date:   Mon, 24 Jul 2023 11:54:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: Add gpio-line-names to STMPE
 GPIO
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20230724063520.182888-1-alexander.stein@ew.tq-group.com>
 <0f016242-2380-274e-c6a4-118a5872412e@linaro.org>
 <21957396.EfDdHjke4D@steina-w>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <21957396.EfDdHjke4D@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 24/07/2023 09:58, Alexander Stein wrote:
> Hi,
> 
> Am Montag, 24. Juli 2023, 09:23:09 CEST schrieb Krzysztof Kozlowski:
>> On 24/07/2023 08:35, Alexander Stein wrote:
>>> This is a gpio-controller, so gpio-line-names should be allowed as well.
>>> stmpe2403 supports up to 24 GPIOs.
>>>
>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>> ---
>>> Changes in v2:
>>> * Add min/maxItems
>>>
>>>  Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
>>> b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml index
>>> 22c0cae73425..4555f1644a4d 100644
>>> --- a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
>>> +++ b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
>>>
>>> @@ -28,6 +28,10 @@ properties:
>>>    gpio-controller: true
>>>
>>> +  gpio-line-names:
>>> +    minItems: 1
>>> +    maxItems: 24
>>> +
>>
>> I am sure there is no variant with one GPIO.
> 
> That's true. But if only one GPIO is actually connected there is no use 
> enforcing to add empty entries.
> AFAIK it is also allowed to provide an incomplete array.

Did you test it? Linux prints warning. Warning means "not allowed".

The expectation is that the rest are named "NC".

Best regards,
Krzysztof

