Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A637475F89B
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jul 2023 15:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbjGXNiX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jul 2023 09:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbjGXNhr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jul 2023 09:37:47 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54FD41FFE
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jul 2023 06:36:24 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-992ace062f3so772273666b.2
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jul 2023 06:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690205750; x=1690810550;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pyk4fD3in9SCwQr3Wn/ALPJfSHMbY/PKpFnttAdK8bU=;
        b=n3qNJ0MQSJmvtZbNgB9/GWd502foogaALkyarW0REA2eP6zmn/6rHdFrRRwvC2b/w6
         fjAuamGQ44MsKic3xauwZaovL5vc4P57/GX2M9lLuu2+N18CvuObku2xYaG6QYbqNvdh
         9p3HpgWGkgGvqnz3omM2dF07B3X720H9sLYj0VDcwqKdf8fbfISNHa1/z0NcASYCETfl
         RccxOvCeQUSNuJtMX9Qc9Ri6UxPwQt5xi+2OQJ8OR4Ivs4R+UH5FYu6I2oNw+rnnmQVp
         t72XpNW+Fk22HFi5bzWQ8hPTrIpScGNRbIaT1B/LFhXoEqXs23EyeL21qsHYmBx6QvuW
         nrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690205750; x=1690810550;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pyk4fD3in9SCwQr3Wn/ALPJfSHMbY/PKpFnttAdK8bU=;
        b=BMnXukyIq1/cN7raEHQuh3scvbnpzlNnns3BDSuyxsQ6XZ0cAxVQchW4gK3yGPk+v8
         SVqpYws2Oxy7RttSQHCeo1jhRrg88u6VIZt5rH+SPJxxsj3eOWLX8OA5EdELi1kDYETG
         OnQ+CaqaHP5AkYTF8LGl4N7G1+6ZsD0AhhwYCzy6/z4npjkXj2OMASfayk6TuqPXti+0
         IBkXhtzba53YXwKzQrtrX/wTtbj0eu9JL+K9R4j8DqB11Be+xKfFbR27nfq/mPxN3TGi
         LiHFNZ+VB4lA0ZL07Gz/jbM7hcenP9IAV+V9HN/gMPm8kUFc5pTF7BP7crTlVMnjyb9Q
         bwng==
X-Gm-Message-State: ABy/qLZ4OgHMqMI+xzStpJ1tsym1bVpBvtWn3sSScf80LSaBa0llLYgB
        sjh6qzeUaxKMeidbEJwDoIA946LM65Ftr+38AWo5oQ==
X-Google-Smtp-Source: APBJJlE2EuOvOzG5yoUMAQGXRsVo1OcR6VQ/NNvDt80p2QTN5TsNr21XD+vvL3eUuvYO9hJa0aUFJA==
X-Received: by 2002:a17:906:9b:b0:98d:fc51:b3dd with SMTP id 27-20020a170906009b00b0098dfc51b3ddmr10293060ejc.41.1690205749881;
        Mon, 24 Jul 2023 06:35:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id dt15-20020a170906b78f00b00991bba473e1sm6774025ejb.3.2023.07.24.06.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 06:35:49 -0700 (PDT)
Message-ID: <a19aa54a-9bbd-c67c-5ca3-cae82a4e85de@linaro.org>
Date:   Mon, 24 Jul 2023 15:35:47 +0200
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
 <21957396.EfDdHjke4D@steina-w>
 <29b62cc6-bc54-9a43-211b-b2d7579218b7@linaro.org>
 <4285919.ejJDZkT8p0@steina-w>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4285919.ejJDZkT8p0@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 24/07/2023 13:44, Alexander Stein wrote:

>>>>>  Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml | 4 ++++
>>>>>  1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
>>>>> b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml index
>>>>> 22c0cae73425..4555f1644a4d 100644
>>>>> --- a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
>>>>> +++ b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
>>>>>
>>>>> @@ -28,6 +28,10 @@ properties:
>>>>>    gpio-controller: true
>>>>>
>>>>> +  gpio-line-names:
>>>>> +    minItems: 1
>>>>> +    maxItems: 24
>>>>> +
>>>>
>>>> I am sure there is no variant with one GPIO.
>>>
>>> That's true. But if only one GPIO is actually connected there is no use
>>> enforcing to add empty entries.
>>> AFAIK it is also allowed to provide an incomplete array.
>>
>> Did you test it? Linux prints warning. Warning means "not allowed".
> 
> I did and I don't see any warnings.
> I using the following (modified) GPIO subnode on an stmpe811 chip:
> gpio {
> 	compatible = "st,stmpe-gpio";
> 	gpio-controller;
> 	#gpio-cells = <2>;
> 	interrupt-controller;
> 	#interrupt-cells = <2>;
> 	/* GPIO 5-7 used for touch */
> 	st,norequest-mask = <0xf0>;
> 	gpio-line-names = "GPIO_ADC_I2C1_1";
> };
> 
> I only see the warning "stmpe-gpio stmpe-gpio: DMA mask not set", but that's a 
> different matter.
> Only GPIO 0-3 are connected. Original property is
> gpio-line-names = "GPIO_ADC_I2C1_1",
> 	        "GPIO_ADC_I2C1_2",
> 	        "GPIO_ADC_I2C1_3",
> 	        "GPIO_ADC_I2C1_4";
> 
> Also gpioinfo shows that the gpiochip has 8 pins while only the first one is 
> named.
> 
> gpiochip7 - 8 lines:
>         line   0: "GPIO_ADC_I2C1_1" unused input active-high 
>         line   1:      unnamed       unused   input  active-high 
>         line   2:      unnamed       unused   input  active-high 
>         line   3:      unnamed       unused   input  active-high 
>         line   4:      unnamed       unused   input  active-high 
>         line   5:      unnamed       unused   input  active-high 
>         line   6:      unnamed       unused   input  active-high 
>         line   7:      unnamed       unused   input  active-high
> 
> 
> If 4 GPIOs are named the output shows names for lines 1-3 accordingly, but no 
> errors/warnings as well.
> 
>> The expectation is that the rest are named "NC".
> 
> Where does this expectation come from? Is there any pending change I am not 
> aware of?
> 

Hm, indeed, I mistaken the case for multiple gpio chips in one device
(so having an offset). Bindings are actually explicitly allowing array
for only some GPIOs.

Best regards,
Krzysztof

