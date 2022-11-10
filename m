Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95043624423
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Nov 2022 15:21:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbiKJOVk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Nov 2022 09:21:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbiKJOVk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2022 09:21:40 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6D32165AF
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 06:21:38 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id g7so3537062lfv.5
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 06:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uLhUszZ+4jL6N7pc/1LpSxkp4sUaa0747TN21Bw47oc=;
        b=d3a/rfSi1Ona7mkwOQewN5KJGRmtW9yw3YaJDq2GXeWcoyc+eHM9WHk7cJYp0qE62O
         Z5n68dvwKvDYY4G6N0JeIwD3rr4bvZue7wUz0GSmmf3FTtdNbtt3w6BYQEbJ1vw5wGJR
         tVXBW5Vrg//DkHAzj8VDfDi2qi+6JQdu41Kw66Uec1SJeRjHP3sWQ9q53yf8D/5zEdvp
         JusvJdcIp66TbsOqX1sMm7PBRdHqt2u7dib9usYg8YzRN2Nfu5nz4PxryV83fqcju5z4
         kZ5usWxLcIShJIDcscYAmbt32NTWt1AtoGjVG+MmXtkiH05Hqra/SfHyXhkFrBhX4Ds9
         Akgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uLhUszZ+4jL6N7pc/1LpSxkp4sUaa0747TN21Bw47oc=;
        b=ubINXynAq1cJHYrzskCJ4TZfg1R5mZ76Kp3lyCjIYkRmPsWA4ZLJ9Cciu3S6DttUM3
         EfQpBqb97RrxlLu3xuW9EKip8yaq44LV3yYyS5p0RAEx8SgoB5C05ILTHvjkJSOb3s4m
         w6riRVonuQc5e5yQwMjUnFhpJTGqhBwGn1NQtoTGbDtKajBRVUZNP8JVNLOjrLyiAg5N
         a7ta1ZZBtHZSHeivLYrsVN7zVaUTnfxZhITQclDcAHJO+onE44yRR5Oh+XzUNlLXvlzo
         E+1G5PpKW7id33YFXlR9cwPCPzzfNzURp9L8GlSWRFBInuiURE2rVqrIhAkuzLT847YV
         j55w==
X-Gm-Message-State: ANoB5pmYhG6mXTCeDJO7aL294KdYbtaofG6kfFYfuLX0G45Am/rwwhPH
        Rc1n2bTceGwszCTHrkdl0ZLD/Q==
X-Google-Smtp-Source: AA0mqf5Nen0/TeT9CGJ+2we5zaWPD0c8289btKMtzeBoaiaUFT7UEUU4xRcANZ16yC6jBdxZLCeqbw==
X-Received: by 2002:a05:6512:374e:b0:4b2:c8b:7a66 with SMTP id a14-20020a056512374e00b004b20c8b7a66mr8756024lfs.498.1668090097123;
        Thu, 10 Nov 2022 06:21:37 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id bt35-20020a056512262300b004b0b2212315sm2775355lfb.121.2022.11.10.06.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 06:21:36 -0800 (PST)
Message-ID: <403f372a-6fd1-b5b6-cfd9-b15147bf1caf@linaro.org>
Date:   Thu, 10 Nov 2022 15:21:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 3/7] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
Content-Language: en-US
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Lee Jones <lee@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, devicetree@vger.kernel.org,
        Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
 <E1osRXT-002mw3-JR@rmk-PC.armlinux.org.uk>
 <531d88b8-75db-1d8f-1384-b8d05594e7b3@linaro.org>
 <Y2rWp4wasbflS/0y@shell.armlinux.org.uk>
 <20221109221723.GA2948356-robh@kernel.org>
 <Y2zlA8RpOqD/7TrM@shell.armlinux.org.uk>
 <bb77e12a-b218-461b-6aa8-10f2b9a67347@linaro.org>
 <Y20HOW8t3wfFott1@shell.armlinux.org.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y20HOW8t3wfFott1@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/11/2022 15:14, Russell King (Oracle) wrote:
> On Thu, Nov 10, 2022 at 03:00:16PM +0100, Krzysztof Kozlowski wrote:
>> On 10/11/2022 12:48, Russell King (Oracle) wrote:
>>> On Wed, Nov 09, 2022 at 04:17:23PM -0600, Rob Herring wrote:
>>>> On Tue, Nov 08, 2022 at 10:22:31PM +0000, Russell King (Oracle) wrote:
>>>>> On Tue, Nov 08, 2022 at 09:55:58PM +0100, Krzysztof Kozlowski wrote:
>>>>>> On 08/11/2022 17:33, Russell King (Oracle) wrote:
>>>>>>> Add a DT binding for the Apple Mac System Management Controller.
>>>>>>
>>>>>> Drop the second, redundant "binding" from subject. It's already in prefix.
>>>>>
>>>>> Yet another thing that's been there from the start... how many more
>>>>> things are you going to pick up in subsequent versions of the patch?
>>>>> When does this stop?
>>>>>
>>>>> In any case, taking your comment literally,
>>>>>
>>>>> "dt-bindings: mfd: add for Apple Mac System Management Controller"
>>>>>
>>>>> makes no sense, so presumably you want something more than that.
>>>>>
>>>>> In any case, I see several recent cases already merged which follow
>>>>> the pattern that I've used and that you've reviewed.
>>>>>
>>>>>>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>>>>>>> ---
>>>>>>>  .../devicetree/bindings/mfd/apple,smc.yaml    | 67 +++++++++++++++++++
>>>>>>>  1 file changed, 67 insertions(+)
>>>>>>>  create mode 100644 Documentation/devicetree/bindings/mfd/apple,smc.yaml
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..014eba5a1bbc
>>>>>>> --- /dev/null
>>>>>>> +++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
>>>>>>> @@ -0,0 +1,67 @@
>>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>>> +%YAML 1.2
>>>>>>> +---
>>>>>>> +$id: http://devicetree.org/schemas/mfd/apple,smc.yaml#
>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>> +
>>>>>>> +title: Apple Mac System Management Controller
>>>>>>> +
>>>>>>> +maintainers:
>>>>>>> +  - Hector Martin <marcan@marcan.st>
>>>>>>> +
>>>>>>> +description:
>>>>>>> +  Apple Mac System Management Controller implements various functions
>>>>>>> +  such as GPIO, RTC, power, reboot.
>>>>>>> +
>>>>>>> +properties:
>>>>>>> +  compatible:
>>>>>>> +    items:
>>>>>>> +      - enum:
>>>>>>> +          - apple,t6000-smc
>>>>>>> +          - apple,t8103-smc
>>>>>>> +          - apple,t8112-smc
>>>>>>> +      - const: apple,smc
>>>>>>> +
>>>>>>> +  reg:
>>>>>>> +    items:
>>>>>>> +      - description: SMC area
>>>>>>> +      - description: SRAM area
>>>>>>> +
>>>>>>> +  reg-names:
>>>>>>> +    items:
>>>>>>> +      - const: smc
>>>>>>> +      - const: sram
>>>>>>> +
>>>>>>> +  mboxes:
>>>>>>> +    maxItems: 1
>>>>>>> +
>>>>>>> +  gpio:
>>>>>>> +    $ref: /schemas/gpio/gpio-macsmc.yaml
>>>>>>
>>>>>> So this depends on other patch, so:
>>>>>> 1. You need mention the dependency in cover letter (nothing there),
>>>>>> 2. Re-order patches.
>>>>>>
>>>>>> The GPIO cannot go separate tree and this must be explicitly communicated.
>>>>>
>>>>> Sigh, getting an order that is sensible is really bloody difficult.
>>>>
>>>> It's not. Sub-devices before the MFD. The only time that doesn't work is 
>>>> when the sub-devices put the parent MFD in their example. The solution 
>>>> there is don't do that. Just 1 complete example in the MFD schema and no 
>>>> examples in the sub-devices.
>>>
>>> Meanwhile, I was told by Krzysztof that DT schemas must always have an
>>> example. So, different person, different story.
>>
>> Hm, where do you see a message I told you to always have examples? Maybe
>> in some discussion I mentioned that examples are desired, but not
>> always. There is no point in having example in MFD child device schema
>> if it is already part of the parent MFD binding, where it is actually
>> required for complete picture.
> 
> 35ed6e48-40e6-eb14-72de-9a0a4f5b38f8@linaro.org
> 
> and

That was independent schema, no references to MFD, thus my comment. If
you post such stuff alone without indication it is part of MFD, what do
you expect from reviewers?

> 
> 2e2356f2-ded1-3cbf-4456-20054a8defda@linaro.org

Which was comment about MFD, right? It is expected to have example for
MFD. I never said it is mandatory for every schema, which you implied in
previous mailing.


> 
> For the GPIO macsec binding. So I'm getting contradictory information.
> First you say that I need an example in the gpio macsec DT binding
> yaml document.

First you split patches making reviewers life difficult. Then reviewers
don't get entire concept and they answer based what they got.

> 
> Now I'm told it should go in the parent.

After posting entire patchset with context you can get better review,
yes, that's right.

> 
> Make up your bloody minds and stop pissing me about. This is why I've
> given up trying to get this in.

I don't think it is constructive to discuss this with you anymore.

> 
> Getting a consistent message would be nice, but it seems impossible.
> 

Best regards,
Krzysztof

