Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC052624185
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Nov 2022 12:36:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbiKJLgO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Nov 2022 06:36:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbiKJLgM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2022 06:36:12 -0500
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 491F365E5E;
        Thu, 10 Nov 2022 03:36:09 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id E001042118;
        Thu, 10 Nov 2022 11:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
        t=1668080166; bh=WOf5UXqWmrE/iTU0u9/p1HHRldeA61BWkQMiReNjNM4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=DfFgYDCkl/pz6GkXaASFqMMdsyDkSJxzVvQ9rPyZDRvyS5bEOoF/4qS5WbN/YgGgv
         E3VJbN5gn5PzLll6yyobEfMZiJeHUbkJGMUIOGp5a0RkTDIwJmehg/4ucRfYvhy/Pi
         XQySwwKZK6J+gkFoow8CWIMB4iJoMbap/4zuWg1x4LE/q3XvckXbWrabcRfQ/zfTbd
         F8GHlXaje5W9E9y69WMKh4/c+b9LeJHLkhc0cJ/em5rEXwjROotPO80TrQKmxQF9n2
         U+c2lNN7eCsJGBmODyoArSmRKbdAad04i8ow4o7DOkL3HZmlpa/kp6c+efbS5WBkfM
         JRiPsSiLvGI3Q==
Message-ID: <269b4d0a-920e-fe1e-0b6d-e972e494895d@marcan.st>
Date:   Thu, 10 Nov 2022 20:35:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 3/7] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Lee Jones <lee@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, devicetree@vger.kernel.org,
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
From:   Hector Martin <marcan@marcan.st>
In-Reply-To: <20221109221723.GA2948356-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/11/2022 07.17, Rob Herring wrote:
> On Tue, Nov 08, 2022 at 10:22:31PM +0000, Russell King (Oracle) wrote:
>> On Tue, Nov 08, 2022 at 09:55:58PM +0100, Krzysztof Kozlowski wrote:
>>> On 08/11/2022 17:33, Russell King (Oracle) wrote:
>>>> Add a DT binding for the Apple Mac System Management Controller.
>>>
>>> Drop the second, redundant "binding" from subject. It's already in prefix.
>>
>> Yet another thing that's been there from the start... how many more
>> things are you going to pick up in subsequent versions of the patch?
>> When does this stop?
>>
>> In any case, taking your comment literally,
>>
>> "dt-bindings: mfd: add for Apple Mac System Management Controller"
>>
>> makes no sense, so presumably you want something more than that.
>>
>> In any case, I see several recent cases already merged which follow
>> the pattern that I've used and that you've reviewed.
>>
>>>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>>>> ---
>>>>  .../devicetree/bindings/mfd/apple,smc.yaml    | 67 +++++++++++++++++++
>>>>  1 file changed, 67 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/mfd/apple,smc.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
>>>> new file mode 100644
>>>> index 000000000000..014eba5a1bbc
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
>>>> @@ -0,0 +1,67 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/mfd/apple,smc.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Apple Mac System Management Controller
>>>> +
>>>> +maintainers:
>>>> +  - Hector Martin <marcan@marcan.st>
>>>> +
>>>> +description:
>>>> +  Apple Mac System Management Controller implements various functions
>>>> +  such as GPIO, RTC, power, reboot.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    items:
>>>> +      - enum:
>>>> +          - apple,t6000-smc
>>>> +          - apple,t8103-smc
>>>> +          - apple,t8112-smc
>>>> +      - const: apple,smc
>>>> +
>>>> +  reg:
>>>> +    items:
>>>> +      - description: SMC area
>>>> +      - description: SRAM area
>>>> +
>>>> +  reg-names:
>>>> +    items:
>>>> +      - const: smc
>>>> +      - const: sram
>>>> +
>>>> +  mboxes:
>>>> +    maxItems: 1
>>>> +
>>>> +  gpio:
>>>> +    $ref: /schemas/gpio/gpio-macsmc.yaml
>>>
>>> So this depends on other patch, so:
>>> 1. You need mention the dependency in cover letter (nothing there),
>>> 2. Re-order patches.
>>>
>>> The GPIO cannot go separate tree and this must be explicitly communicated.
>>
>> Sigh, getting an order that is sensible is really bloody difficult.
> 
> It's not. Sub-devices before the MFD. The only time that doesn't work is 
> when the sub-devices put the parent MFD in their example. The solution 
> there is don't do that. Just 1 complete example in the MFD schema and no 
> examples in the sub-devices.
> 
>> I'm quite sure Lee is only going to want to apply the mfd bits. 
> 
> Indeed. I can't seem to make Lee care... All the schemas should really 
> be applied together.
> 
>> Then
>> what do we do with the other bits? GPIO stuff via the GPIO tree, then
>> wait a cycle before the rest can be merged. Or what?
> 
> The schemas must be picked up in the same cycle. I don't care so much 
> if subsystem maintainers' trees have warnings if they don't care, but I 
> do care for linux-next. If the subsystem bits aren't picked up, then 
> I'll pick them up if it comes to that.
> 

We can take all the schemas and DT changes via asahi-soc if that works
for you. This also lets us move forward with more related DT changes
that would apply on top of things already in that branch. Then Lee only
has to take the mfd core bits (and possibly the RTKit platform part, or
we can figure something else out for that).


- Hector
