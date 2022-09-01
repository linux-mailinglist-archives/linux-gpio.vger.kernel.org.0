Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 688945A9C03
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Sep 2022 17:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234572AbiIAPqP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Sep 2022 11:46:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234627AbiIAPp5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2022 11:45:57 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89FDF74E33
        for <linux-gpio@vger.kernel.org>; Thu,  1 Sep 2022 08:45:55 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id bt10so25034559lfb.1
        for <linux-gpio@vger.kernel.org>; Thu, 01 Sep 2022 08:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=pwTnU1NRYqCTcCUVTKD8Na05COqOczxBt/998o6XYy4=;
        b=Q1Te17xgrcpyNuRzijNHlA+g+n1O1MNUqLEL/vTX0m1A0HewPL1WFOQVAPZ7KxPvu0
         VI1WDz6IZXgDc11TKe3lV95r8U7UOh1WayI+oWovAa8zJIMr1Q5oTO8vry6qdMBpY97z
         WvLAFtYLvWEUhWMzxh003OIghREZ09oA/bKjg+spidGjdDkKnuQHBm6wx1ZJ6JDkVGhD
         0nddj4YGs81ydICVPQwsMfUGI/Mbdw0Pp7v8t3d4cs4PHZPZXx8OVBQDY6kAw0qeWhqg
         ymGQ7VNYSfFYadAMeBd+d1KY9CytW5Yf3UeNXGxfpGY93CUiX/qIV/TgMA9QjiibvRuD
         dPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=pwTnU1NRYqCTcCUVTKD8Na05COqOczxBt/998o6XYy4=;
        b=Cy2tDYlfyOavYBEVdbQMHXsNhv3ot7pNy0yN8hlqGrC/xZZy/A+N32PWwTSKxRO53n
         uCvqoBg2K+Da+fkNhQk+JOAGwlBx814d5pIQWji6fClntILtpc8vIkOUzVq/xPU2vv0q
         4zKpoz7Gx5GYWhf32bMuTWMnsOJHsGji2eh1XBUyA5z0h2Cg10t8WyNhYYWjUBwu560q
         tNcrU3RoFQLQYYoLYxf5SnFmG6HpU52RrwBriZXLSGb+4oL5/BSSfmvc9Eb2//3BtxKf
         GaPZIA59q+o4cf0kEdqqETQS1thDn6SCzuPpqT0TcVl2S7NPVP8VfaIEr9eUz/vmSQUC
         JGCg==
X-Gm-Message-State: ACgBeo0T1nJBgV9MMpSMrfsqsV+HyS61eKxv9HtdAa092pFEtyCGMBvh
        Fx3+r2pzgWI7Iw0WMb0eqG2qjQ==
X-Google-Smtp-Source: AA6agR4SF8JzyLedOeOJ13W6f/aUole8ekwKb8ZCgGMPhRfJWyZZpsmdH22j41No67YEX3YkvOnzUw==
X-Received: by 2002:a05:6512:260d:b0:492:df5a:e4f9 with SMTP id bt13-20020a056512260d00b00492df5ae4f9mr10276035lfb.90.1662047153618;
        Thu, 01 Sep 2022 08:45:53 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id b1-20020a056512070100b004947fcf0c0bsm920400lfs.281.2022.09.01.08.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 08:45:53 -0700 (PDT)
Message-ID: <2fedff34-6a20-f1ce-a756-2bd8671fcd52@linaro.org>
Date:   Thu, 1 Sep 2022 18:45:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
Content-Language: en-US
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeH-003t9A-3K@rmk-PC.armlinux.org.uk>
 <426469c1-13cc-178b-4904-09439d7788e8@linaro.org>
 <YxDL+cAx9kkZRL8K@shell.armlinux.org.uk>
 <928ddeff-efac-920c-7bbf-dda35a942b93@linaro.org>
 <YxDOpCq0vIlt4VNa@shell.armlinux.org.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YxDOpCq0vIlt4VNa@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 01/09/2022 18:24, Russell King (Oracle) wrote:
> On Thu, Sep 01, 2022 at 06:15:46PM +0300, Krzysztof Kozlowski wrote:
>> On 01/09/2022 18:12, Russell King (Oracle) wrote:
>>>>> +  compatible:
>>>>> +    items:
>>>>> +      - enum:
>>>>> +        - apple,t8103-smc
>>>>
>>>> You miss two spaces of indentation on this level.
>>>
>>> Should that be picked up by the dt checker?
>>
>> I think yamllint complains about it. It is not a hard-dependency, so
>> maybe you don't have it installed.
>>
>>>
>>>>> +        - apple,t8112-smc
>>>>> +        - apple,t6000-smc
>>>>
>>>> Bring some order here - either alphabetical or by date of release (as in
>>>> other Apple schemas). I think t6000 was before t8112, so it's none of
>>>> that orders.
>>>
>>> Ok.
>>>
>>>>> +      - const: apple,smc
>>>>> +
>>>>> +  reg:
>>>>> +    description: Two regions, one for the SMC area and one for the SRAM area.
>>>>
>>>> You need constraints for size/order, so in this context list with
>>>> described items.
>>>
>>> How do I do that? I tried maxItems/minItems set to 2, but the dt checker
>>> objected to it.
>>
>> One way:
>> reg:
>>   items:
>>     - description: SMC area
>>     - description: SRAM area
>>
>> but actually this is very similar what you wrote for reg-names - kind of
>> obvious, so easier way:
>>
>> reg:
>>   maxItems: 2
> 
> Doesn't work. With maxItems: 2, the example fails, yet it correctly lists
> two regs which are 64-bit address and 64-bit size - so in total 8 32-bit
> ints.
> 
> Documentation/devicetree/bindings/mfd/apple,smc.example.dtb: smc@23e400000: reg: [[2, 1044381696], [0, 16384], [2, 1071644672], [0, 1048576]] is too long
>         From schema: /home/rmk/git/linux-rmk/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> 
> Hence, I originally had maxItems: 2, and ended up deleting it because of
> the dt checker.
> 
> With the two descriptions, it's the same failure.

Yeah, they should create same result.

> 
> I think the problem is that the checker has no knowledge in the example
> of how big each address and size element of the reg property is. So,
> it's interpreting it as four entries of 32-bit address,size pairs
> instead of two entries of 64-bit address,size pairs. Yep, that's it,
> if I increase the number of "- description" entries to four then it's
> happy.
> 
> So, what's the solution?
> 

If you open generated DTS examples (in your
kbuild-output/Documentation/devicetree/bindings/mfd/) you will see which
address/size cells are expected. By default it is I think address/size
cells=1, so you need a bus node setting it to 2.

Best regards,
Krzysztof
