Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D58F610550
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Oct 2022 00:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234492AbiJ0WG1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Oct 2022 18:06:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234434AbiJ0WG0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Oct 2022 18:06:26 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAC4C9C233
        for <linux-gpio@vger.kernel.org>; Thu, 27 Oct 2022 15:06:24 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id x15so2767660qvp.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Oct 2022 15:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=khyfMgYhWnHU1C8vhk7oesv4M67eeooFQKmFtEtxeyQ=;
        b=UBbqwAxg6b1dMM2aUxsElTtlC909JDQ56Ckv62ybPcnAU4A2b+r6Gf7vjF5yCXgG0g
         s3qFmxPp+ICNmY+qQvOgjlSVf3XBWuRAFqEXLLz6nTDf3Q/X3ZNUZhmf6VGlSzojo+SN
         g5HOfdnbdsR5bDEs3kQQWiAXcqUqOgH6MuDIyy0IqaQaCW62a+4MDe+DA2oLO5AOa/3i
         B1dmZMZPgu75VJvBvrTA3Fit2uMCh/20jLUHZdg/5hGOoMUTJ19RxbvvK31R1mQzurWC
         vNj87NT9Go/y7cSc3uMiRekLoRHM/RoItDyLgGphXceG2Ic4lXgNTJZxaFRfpn1bf89e
         6pUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=khyfMgYhWnHU1C8vhk7oesv4M67eeooFQKmFtEtxeyQ=;
        b=FCzP6GP83M+sn/I3c6XIjuBiUaMKpZDVSoSvVVF+5FPJyoVfDE4S6cxgWF0TKLTJUA
         hIXj6pnAmGlilk9miY20KSnaRYnxQcWn7o0C9ML+hHMCbE+E4rtIhpuDKjw9ei9UFssQ
         k2Ae916P+PmmIumeneFan4C/oSE5ppYlpjVfrcW2T5wY8STBpKTtGafHWSzfrbrFL7hm
         jC1D916aARV1fkv8YFuzdP53io+HtbcZ154/7YqpdDE2DziZ+MXgP9ER+7keGVOsd+nT
         rN6bgwXzK1E2ganc7IU+wndyce2RXz3wK+otqnBaJ4ECkaYG6YRED4NP6hPhER0TeakB
         Uw/Q==
X-Gm-Message-State: ACrzQf3vHuMjewO0wdS+nSZIvTXIisfgnwW47K6wp/k4GYlO9OLdrkry
        KHVo8lcG1geqwsiCcqhiF82+XA==
X-Google-Smtp-Source: AMsMyM6Vjzffkok7FANXyrYkuNc/JwlUfL3sBCQQMxhDZ11BI6Ve3WWL8iBqMxD/nwD7o0yco3CbZw==
X-Received: by 2002:a05:6214:19cc:b0:4b7:768:aca1 with SMTP id j12-20020a05621419cc00b004b70768aca1mr37024711qvc.40.1666908383889;
        Thu, 27 Oct 2022 15:06:23 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id p11-20020a05620a112b00b006cbc6e1478csm1725840qkk.57.2022.10.27.15.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 15:06:23 -0700 (PDT)
Message-ID: <c285538f-8fce-c723-7430-675d91876f6b@linaro.org>
Date:   Thu, 27 Oct 2022 18:06:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/2] dt-bindings: gpio: add binding for the GPIO block for
 Apple Mac SMC
Content-Language: en-US
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hector Martin <marcan@marcan.st>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <Y1q5jW8ff0aUdjPd@shell.armlinux.org.uk>
 <E1oo6Hw-00HYp8-Sa@rmk-PC.armlinux.org.uk>
 <35ed6e48-40e6-eb14-72de-9a0a4f5b38f8@linaro.org>
 <Y1rxdEjJox3HOqtp@shell.armlinux.org.uk>
 <2e2356f2-ded1-3cbf-4456-20054a8defda@linaro.org>
 <Y1r8zZif6FUIA73J@shell.armlinux.org.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y1r8zZif6FUIA73J@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27/10/2022 17:49, Russell King (Oracle) wrote:
> On Thu, Oct 27, 2022 at 05:31:49PM -0400, Krzysztof Kozlowski wrote:
>> On 27/10/2022 17:00, Russell King (Oracle) wrote:
>>> On Thu, Oct 27, 2022 at 03:53:25PM -0400, Krzysztof Kozlowski wrote:
>>>> On 27/10/2022 13:03, Russell King (Oracle) wrote:
>>>>> Add the DT binding for the Apple Mac System Management Controller GPIOs.
>>>>>
>>>>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>>>>> ---
>>>>>  .../devicetree/bindings/gpio/gpio-macsmc.yaml | 28 +++++++++++++++++++
>>>>>  1 file changed, 28 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..a3883d62292d
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
>>>>
>>>> Filename based on compatible, so "apple,smc-gpio.yaml"
>>>
>>> Many of the other yaml files in gpio/ are named as such.
>>
>> Poor patterns, inconsistencies or even bugs like to copy themselves and
>> it is never an argument.
>>
>> The convention for all bindings is to use vendor,device.yaml, matching
>> the compatible when applicable.
>>
>>>
>>>>> @@ -0,0 +1,28 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/gpio/gpio-macsmc.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Apple Mac System Management Controller GPIO
>>>>> +
>>>>> +maintainers:
>>>>> +  - Hector Martin <marcan@marcan.st>
>>>>> +
>>>>> +description:
>>>>> +  This describes the binding for the Apple Mac System Management Controller
>>>>
>>>> Drop "This describes the binding for"
>>>>
>>>>> +  GPIO block.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    allOf:
>>>>
>>>> That's not proper syntax. Look at other examples (e.g. Apple bindings)
>>>> doing it. Probably you wanted items here.
>>>
>>> Really? You're joking. 
>>
>> No. If you look at example-schema then answer should be obvious, so why
>> do you think I am joking?
>>
>>> I had sent an email to Rob to ask how this should
>>> be done because my first guess spat out unhelpful error messages from
>>> dt_bindings_check, and this is the best I could come up with based on
>>> other "examples".
>>>
>>> I tried "- items:" but that made no difference - dt_bindings_check spat
>>> errors, so that's clearly incorrect. Specifically, I tried:
>>>
>>> properties:
>>>   compatible:
>>>     - items:
>>>         - enum:
>>> 	    - apple,t8103-smc
>>> 	- const: apple,smc-gpio
>>>
>>> That doesn't work:
>>
>> Of course, because "-" means list, so "- items" is not correct.
>>
>> Where do you see such pattern? Anywhere following compatible? No. There
>> is no. You just invented something instead of using many, many existing
>> examples.
> 
> No, I did not "invent" something here. I tried to copy it from other
> examples, but I couldn't find something that matched exactly.
> 
> In any case, relying on examples rather than a proper description of
> how this should be done is utterly rediculous. There should be a formal
> definition of the language used to describe this - but there doesn't
> seem to be.

There is...

> 
> So, stuff like "-" means list is just not obvious, and the error

"-" is defined by YAML, so I do not understand what is here not obvious?

> messages make it totally unobvious that's what the problem was.

The error messages could indeed be improved, I agree.

> 
>>>>> +
>>>>> +additionalProperties: false
>>>>
>>>> Missing example, it's necessary to validate these.
>>>
>>> Documentation states that examples are optional according to the
>>> "writing-schema" documentation.
>>
>> Yes, but without it we cannot validate the bindings.
> 
> Please update the writing-schema documentation to state that it's now
> required to validate bindings, so that the documentation is no longer
> stating something that's different from the required process.
> 
>>> Honestly, I find this YAML stuff extremely difficult, especially given
>>> the lack of documentation on how to write it and the cryptic error
>>> messages from the tooling. It's impossible to get it right before
>>> submitting it - and I suspect from what I see above, it's impossible
>>> for reviewers to know what is correct either, since some of what you've
>>> said above appears to be wrong!
>>
>> I would say it is doable - copy example-schema or recent device specific
>> schema and customize it... But you started adding some weird stuff which
>> was never, never in other bindings.
> 
> "weird stuff"? What weird stuff? What wasn't in other bindings? You

The "allOf" in compatible is the weird stuff.

There is basically just one case with it, a special case. There are no
other bindings using such pattern.

> make no sense when you make this accusations, because they are totally
> untrue.
> 
> I started with:
> 
> properties:
>   compatible:
>     - enum:
>        - ...
>     - const: ...
> 
> and dt_bindings_check thew it out. So I looked again at
> Documentation/bindings/gpio/*.yaml. I decided maybe the - enum
> containing one entry could be confusing matters, so I tried converting
> that to a - const. Still failed.

Fourth YAML binding (counting alphabetically) in gpios has it:
Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml

> 
> So I had another look at other *.yaml files, and I then tried adding
> - items: and indenting the following. Failed.
> 
> So then I tried allOf: which passed the checks. That's the evolution
> there - trial and error.

I understand your process. I still think that easier is to start from
example-schema as it has this case exactly.

> 
> Cryptic error messages, nothing else in gpio/ that follows the pattern
> I wanted and trial and error led me to what I had in this patch. This
> is *no* way to develop bindings.
> 
> There has to be a formal definition of this schema language - and
> something better than pointing people at other bindings that may or
> may not be correct.
> 
> So, I repeat myself: writing yaml stuff is utterly horrid and a total
> hit and miss affair whether one gets it correct or not.
> 
> It seems to me that the problem of validating .dts files hasn't been
> solved - the problem has merely been moved to a whole set of different
> problems trying to write .yaml files that allow .dts files to be
> validated, some of which could be solved by a better understanding of
> the syntax, if only it were documented properly.

I repeat also myself, writing C is also difficult and horrid :)

Anyway, your feedback is of course appreciated. Happy to help if you
have some more questions.

Best regards,
Krzysztof

