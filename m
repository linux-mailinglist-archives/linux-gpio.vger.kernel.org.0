Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47E1A6226BD
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 10:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbiKIJTo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 04:19:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbiKIJTl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 04:19:41 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E6C14D14
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 01:19:40 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id u11so24817787ljk.6
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2022 01:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VyOwHIx2eFYER6svy54TwgyRrhxCzE5HFZfbjyKkFTY=;
        b=D76zlyzf8ZHfHyT+XBBZb6eqdJWPJL2LUpXnJWdG4HrxIKHrGV+vMC4KLANVtRU7Q8
         GvkKLbNz+v0geOE6AfhzelWvsNe0leMER1eq36PMH1eKUMAavWhFxVe+yR08oYHvGwy4
         HCLznAFy6/Xx6e95ZufqZq4lTH9GTHiXD0d+gmQ3nBllkBzqNf7DUWrHy/Fx6WQ2jlrA
         34T4SbQvDOfuYJiIypUaGXkXPk5w4MZWij3G+o8tk8CuW6Wkopj3laQPfvYKOisvoc+y
         4sKLPng89ZCITyS+GJFVq0s1kDXG+afP98vA6Ymtfzbv3mhGOAH1CLFisdw9j96fnteT
         2DbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VyOwHIx2eFYER6svy54TwgyRrhxCzE5HFZfbjyKkFTY=;
        b=qrLHBAT4RG1UlPx2wSTRQaapzJJJydLzOG0nKyDUpRb+SnN3mrBRtwS6w4Coany5fD
         dJTz1r4/DSw4nf3MWtoLnHuoLR2VS9G20K2hTBN3W0wOtizk6Bhd6tXiZB0oN9mqNLKS
         bZXycCqA3KdiIWRGOXMLKv3kIZfnEifYGdxciqtfq1MJLc1WWq4AIYVjCrOvJT3logs/
         OBEHBbYSdKwM/0VDzeMvY2ohvGGMuQJVuZjZSWcuMQxdSxxMch/e3J2+so4mAF/I1e8I
         sHjjCH7XVRXOZtdZJNau3AZA7mh08t8NfRpvwzxLt0NjlzHm8DOvMCLQpyn6SDGiki47
         lUFQ==
X-Gm-Message-State: ACrzQf38Cjl2VwdVN0UZrkdnlB42s30o8f393kEKrLfywUTXxeXoLGdS
        pFKTEArPu/XMHJzalmIGkfZJow==
X-Google-Smtp-Source: AMsMyM7uEpQrCQmOl2lKJhvkvbR44SkmDPc+he6Vt7mjd6PxA45ieuuzM/uNpq1Vl1tAhGRH1XAHnw==
X-Received: by 2002:a2e:80da:0:b0:277:34b:1bfe with SMTP id r26-20020a2e80da000000b00277034b1bfemr7779668ljg.8.1667985578370;
        Wed, 09 Nov 2022 01:19:38 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id i26-20020a0565123e1a00b00485caa0f5dfsm2142118lfv.44.2022.11.09.01.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 01:19:37 -0800 (PST)
Message-ID: <85a5d025-e72f-aefa-b748-8c19ff247309@linaro.org>
Date:   Wed, 9 Nov 2022 10:19:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 6/7] dt-bindings: gpio: add binding for the GPIO block
 for Apple Mac SMC
Content-Language: en-US
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>,
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
 <E1osRXi-002mwL-UB@rmk-PC.armlinux.org.uk>
 <3d51c0e2-1e59-5767-4be1-5754ca8dc902@linaro.org>
 <Y2rTmS/gEdtU66b0@shell.armlinux.org.uk>
 <aa665829-82db-74de-d802-e01fd52c998d@linaro.org>
 <Y2tu7ptiYXwB2D79@shell.armlinux.org.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y2tu7ptiYXwB2D79@shell.armlinux.org.uk>
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

On 09/11/2022 10:12, Russell King (Oracle) wrote:
> On Wed, Nov 09, 2022 at 09:36:12AM +0100, Krzysztof Kozlowski wrote:
>> On 08/11/2022 23:09, Russell King (Oracle) wrote:
>>> On Tue, Nov 08, 2022 at 09:56:40PM +0100, Krzysztof Kozlowski wrote:
>>>> On 08/11/2022 17:33, Russell King (Oracle) wrote:
>>>>> Add the DT binding for the Apple Mac System Management Controller GPIOs.
>>>>>
>>>>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>>>>> ---
>>>>>  .../bindings/gpio/apple,smc-gpio.yaml         | 37 +++++++++++++++++++
>>>>>  1 file changed, 37 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml b/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..1a415b78760b
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
>>>>> @@ -0,0 +1,37 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/gpio/gpio-macsmc.yaml#
>>>>
>>>> Does not look like you tested the bindings. Please run `make
>>>> dt_binding_check` (see
>>>> Documentation/devicetree/bindings/writing-schema.rst for instructions).
>>>
>>> Oh ffs. DT bindings are utterly impossible to get correct.
>>
>> Why? You write, you test and then you see the error. Srsly...
> 
> It's utterly impossible for me to remember the dependencies. It's
> utterly impossible for me to remember the make incantation to test
> this bloody things - especially as I need to limit it otherwise it
> takes a very long time to test.

Then this is where I can help - you can test just one, specific binding
or few of them:

make dt_binding_check DT_SCHEMA_FILES=apple,smc-gpio.yaml

make dt_binding_check DT_SCHEMA_FILES=apple,smc

So before you format patches, just do `git rebase -i HEAD~7`, change to
re-word or edit and  go one-by-one testing your bisectability. The same
we are always doing for regular kernel builds when having a big
patchset, right? Each commit must compile, not just the last one in
patchset.

Or push each of the commit to a service which can do it for you. For
example, for kernel building (not yet ready for DT binding check) I am
using something like:
https://github.com/krzk/tools/tree/master/git-build-kernel

> 
> The whole bloody thing is just too sodding difficult.
> 
> I'm not going to bother with this patch set any more. Too frustrated
> with this piecemeal approach and the crappy slow tooling and the
> idiotic incomprehensible error messages it spits out.

Best regards,
Krzysztof

