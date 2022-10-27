Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37A2F610472
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Oct 2022 23:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236903AbiJ0Vby (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Oct 2022 17:31:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236379AbiJ0Vbx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Oct 2022 17:31:53 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D43056BCC4
        for <linux-gpio@vger.kernel.org>; Thu, 27 Oct 2022 14:31:52 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id x13so2662545qvn.6
        for <linux-gpio@vger.kernel.org>; Thu, 27 Oct 2022 14:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=67ZdqXDGBh+AdlzWDD7q5OsF7PMNS47/qe/JXXTfLCg=;
        b=jhzWiQc98TnnoInXY2wMWJhMHmSmnQY3MAswYYXs4JCSirOQ/WZDUef6i0bTruZZO9
         AkV4LCiweNxKfmKR6hPk4X0ORk06y2jvLH3Ybc8gMQLdCGMj1QRiokR+jv3zLpgo+ZNN
         MAwIgRuJEwt/mDkBwyhqsrP8N869WrAKl9bLSr6gDLYFedWsmCqWXB2GNTULsY8U0i4N
         lPaFgqIF7f6TaSFkKcIsw9d/l89Tt3dovlRvUgOpM7Y4dZP/JW5l9NoiSeRQ10nQbkiK
         6XQaYzbY794OrtlVrmU3Es+Gav2lkZ6KOivNpRolNnekkXkKSOHmAW5+lo6uIFiGOaSJ
         kHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=67ZdqXDGBh+AdlzWDD7q5OsF7PMNS47/qe/JXXTfLCg=;
        b=RsPwJEjA9dA85qZLlsn6WlyD7G/qovnDJlxiPfXWEERgUkf8/rxbQk5UJ91xN5AAUw
         pOdL3Iavf2RvIy3lUhANdXth7aPDWYx49NlR2Kj2CWUTVHT+LBoS0Ah4CO/S+iBp/hDM
         Pbm0vRO/ykWs2BUdDQOs7Lp+FMdAoY2aaDMpH/qX5qajvnos122B0qw+4YFBHrn/1PfX
         uaPPSu7ygJiUtGdc+JiHa9NNRfUqHcSekb9SvQUp4NeW7u6jLXUa4EQjEp/kVIFYSxQR
         6Zbc9+uB6D4NaDHJCt06j7UfQFhm0ghopnyqtWd91PDEXmpwCMWpbit0XLTHU6no4HJC
         IBwQ==
X-Gm-Message-State: ACrzQf2OhD4PiDvMD0pTO7ULchq7Sn0f6+jW3ZOL7KDceIvw/9n06HcC
        4EpynjZEBCVJTBw+Sw+WIjLM/A==
X-Google-Smtp-Source: AMsMyM7lcNb5WsEQu4LZZcSD1DMW4HBU8FNWz6qMqCV7R5gKOelCO/H2sKADacQiBm0Dh7RqffVdPA==
X-Received: by 2002:ad4:5bc5:0:b0:4bb:7e1a:9de6 with SMTP id t5-20020ad45bc5000000b004bb7e1a9de6mr17264990qvt.68.1666906311919;
        Thu, 27 Oct 2022 14:31:51 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id x29-20020a05620a0b5d00b006b615cd8c13sm1643099qkg.106.2022.10.27.14.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 14:31:50 -0700 (PDT)
Message-ID: <2e2356f2-ded1-3cbf-4456-20054a8defda@linaro.org>
Date:   Thu, 27 Oct 2022 17:31:49 -0400
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y1rxdEjJox3HOqtp@shell.armlinux.org.uk>
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

On 27/10/2022 17:00, Russell King (Oracle) wrote:
> On Thu, Oct 27, 2022 at 03:53:25PM -0400, Krzysztof Kozlowski wrote:
>> On 27/10/2022 13:03, Russell King (Oracle) wrote:
>>> Add the DT binding for the Apple Mac System Management Controller GPIOs.
>>>
>>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>>> ---
>>>  .../devicetree/bindings/gpio/gpio-macsmc.yaml | 28 +++++++++++++++++++
>>>  1 file changed, 28 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
>>> new file mode 100644
>>> index 000000000000..a3883d62292d
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
>>
>> Filename based on compatible, so "apple,smc-gpio.yaml"
> 
> Many of the other yaml files in gpio/ are named as such.

Poor patterns, inconsistencies or even bugs like to copy themselves and
it is never an argument.

The convention for all bindings is to use vendor,device.yaml, matching
the compatible when applicable.

> 
>>> @@ -0,0 +1,28 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/gpio/gpio-macsmc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Apple Mac System Management Controller GPIO
>>> +
>>> +maintainers:
>>> +  - Hector Martin <marcan@marcan.st>
>>> +
>>> +description:
>>> +  This describes the binding for the Apple Mac System Management Controller
>>
>> Drop "This describes the binding for"
>>
>>> +  GPIO block.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    allOf:
>>
>> That's not proper syntax. Look at other examples (e.g. Apple bindings)
>> doing it. Probably you wanted items here.
> 
> Really? You're joking. 

No. If you look at example-schema then answer should be obvious, so why
do you think I am joking?

> I had sent an email to Rob to ask how this should
> be done because my first guess spat out unhelpful error messages from
> dt_bindings_check, and this is the best I could come up with based on
> other "examples".
> 
> I tried "- items:" but that made no difference - dt_bindings_check spat
> errors, so that's clearly incorrect. Specifically, I tried:
> 
> properties:
>   compatible:
>     - items:
>         - enum:
> 	    - apple,t8103-smc
> 	- const: apple,smc-gpio
> 
> That doesn't work:

Of course, because "-" means list, so "- items" is not correct.

Where do you see such pattern? Anywhere following compatible? No. There
is no. You just invented something instead of using many, many existing
examples.


> 
> Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml: properties:compatible: [{'items': [{'const': 'apple,t8103-smc'}, {'const': 'apple,smc-gpio'}]}] is not of type 'object', 'boolean'  from schema $id: http://json-schema.org/draft-07/schema#
> 
>>> +      - enum:
>>> +          - apple,t8103-smc
>>> +      - const: apple,smc-gpio
>>> +
>>> +  gpio-controller: true
>>> +
>>> +  '#gpio-cells':
>>> +    const: 2
>>
>> Missing required properties. Start from new bindings or example-schema.
> 
> What's missing? All the other bindings that I see follow this pattern.

No. All other bindings have list of required properties. Only yours do
not have.

> 
>>> +
>>> +additionalProperties: false
>>
>> Missing example, it's necessary to validate these.
> 
> Documentation states that examples are optional according to the
> "writing-schema" documentation.

Yes, but without it we cannot validate the bindings.

> 
> Honestly, I find this YAML stuff extremely difficult, especially given
> the lack of documentation on how to write it and the cryptic error
> messages from the tooling. It's impossible to get it right before
> submitting it - and I suspect from what I see above, it's impossible
> for reviewers to know what is correct either, since some of what you've
> said above appears to be wrong!

I would say it is doable - copy example-schema or recent device specific
schema and customize it... But you started adding some weird stuff which
was never, never in other bindings.

I would also say that C stuff is extremely difficult... Impossible to
get it right. Wait...

Best regards,
Krzysztof

